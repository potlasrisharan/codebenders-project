import { fireEvent, render, screen } from '@testing-library/react';
import { MemoryRouter } from 'react-router-dom';
import { describe, expect, it } from 'vitest';
import { IntakePage } from '../../src/routes/IntakePage';
import { ProfileProvider } from '../../src/core/profile/ProfileContext';
import { LanguageProvider } from '../../src/core/i18n/LanguageContext';

function renderIntake() {
  return render(
    <MemoryRouter>
      <LanguageProvider>
        <ProfileProvider>
          <IntakePage />
        </ProfileProvider>
      </LanguageProvider>
    </MemoryRouter>
  );
}

describe('IntakePage One-by-One Onboarding Wizard', () => {
  it('renders one-by-one step flow starting at question 1 with progress bar', () => {
    renderIntake();

    // 1. Heading is present
    expect(screen.getByRole('heading', { level: 1, name: /Intake/i })).toBeInTheDocument();

    // 2. Step 1 badge and question text is present
    expect(screen.getByText(/Question 1 of/i)).toBeInTheDocument();
    expect(
      screen.getByText(/Which state or union territory are you a permanent resident\/native of\?/i)
    ).toBeInTheDocument();

    // 3. Navigation controls exist
    expect(screen.getByRole('button', { name: /Previous/i })).toBeDisabled();
    expect(screen.getByRole('button', { name: /Continue/i })).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /Skip \/ Not Sure/i })).toBeInTheDocument();
  });

  it('navigates to next question on Continue click and enables Previous button', () => {
    renderIntake();

    const continueBtn = screen.getByRole('button', { name: /Continue/i });
    fireEvent.click(continueBtn);

    // Now on Question 2
    expect(screen.getByText(/Question 2 of/i)).toBeInTheDocument();
    expect(
      screen.getByText(/What is your primary occupation or current status\?/i)
    ).toBeInTheDocument();

    // Previous button is now enabled
    const prevBtn = screen.getByRole('button', { name: /Previous/i });
    expect(prevBtn).not.toBeDisabled();

    // Clicking previous returns to Question 1
    fireEvent.click(prevBtn);
    expect(screen.getByText(/Question 1 of/i)).toBeInTheDocument();
  });

  it('toggles into Review mode to display summary and allows jumping back via Edit', () => {
    renderIntake();

    const reviewToggleBtn = screen.getByRole('button', { name: /Review All Answers/i });
    fireEvent.click(reviewToggleBtn);

    // In Review mode
    expect(screen.getByText(/Review Your Active Circumstances/i)).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /Back to Step-by-Step Flow/i })).toBeInTheDocument();

    // Edit buttons exist for each attribute
    const editButtons = screen.getAllByRole('button', { name: /Edit/i });
    expect(editButtons.length).toBeGreaterThan(0);

    // Clicking edit on the first item returns to Step 1
    fireEvent.click(editButtons[0]);
    expect(screen.getByText(/Question 1 of/i)).toBeInTheDocument();
  });

  it('branches questions when selecting farmer vs student', () => {
    renderIntake();

    // Advance to Question 2 (Occupation)
    fireEvent.click(screen.getByRole('button', { name: /Continue/i }));
    expect(screen.getByText(/What is your primary occupation or current status\?/i)).toBeInTheDocument();

    // Click on Farmer option
    const farmerOption = screen.getByRole('button', { name: /Farmer \/ Agricultural Cultivator/i });
    fireEvent.click(farmerOption);

    // Switch to Review to verify active branch items
    fireEvent.click(screen.getByRole('button', { name: /Review All Answers/i }));

    // Agriculture land question should be active in the review list
    expect(
      screen.getByText(/Do you or your family own cultivable agricultural land\?/i)
    ).toBeInTheDocument();

    // Student specific questions should not be present
    expect(
      screen.queryByText(/What stream is your course\?/i)
    ).not.toBeInTheDocument();
  });

  it('branches student questions: intermediate asks groups and omits 12th percentile', () => {
    render(
      <MemoryRouter initialEntries={['/intake?fresh=1']}>
        <LanguageProvider>
          <ProfileProvider>
            <IntakePage />
          </ProfileProvider>
        </LanguageProvider>
      </MemoryRouter>
    );

    // Step 1: Domicile -> Telangana
    fireEvent.click(screen.getByRole('button', { name: /Telangana/i }));

    // Step 2: Occupation -> Student
    fireEvent.click(screen.getByRole('button', { name: /Student \(College \/ Polytechnic \/ School\)/i }));

    // Advance through age, area, ration card to reach educationLevel
    fireEvent.click(screen.getByRole('button', { name: /Continue/i })); // age
    fireEvent.click(screen.getByRole('button', { name: /Continue/i })); // area
    fireEvent.click(screen.getByRole('button', { name: /Continue/i })); // ration card

    // Step 6: Education Level -> Intermediate
    expect(screen.getByText(/What is your current level of education\?/i)).toBeInTheDocument();
    fireEvent.click(screen.getByRole('button', { name: /Intermediate \/ Class 11-12 \(\+2\)/i }));

    // Step 7: Stream question should be Intermediate groups!
    expect(
      screen.getByText(/What stream or group are you studying in Intermediate \/ \+2\?/i)
    ).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /MPC \(Mathematics, Physics, Chemistry\)/i })).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /BiPC \(Biology, Physics, Chemistry\)/i })).toBeInTheDocument();

    // Check review mode: 12th percentile should NOT be asked for intermediate students
    fireEvent.click(screen.getByRole('button', { name: /Review All Answers/i }));
    expect(
      screen.queryByText(/Did you score in the top 20th percentile \(80th percentile\+\) in Class 12 \/ Intermediate\?/i)
    ).not.toBeInTheDocument();
  });

  it('omits stream, college attendance, and 12th percentile for school students (Class 1-10)', () => {
    render(
      <MemoryRouter initialEntries={['/intake?fresh=1']}>
        <LanguageProvider>
          <ProfileProvider>
            <IntakePage />
          </ProfileProvider>
        </LanguageProvider>
      </MemoryRouter>
    );

    // Step 1: Domicile -> Telangana
    fireEvent.click(screen.getByRole('button', { name: /Telangana/i }));

    // Step 2: Occupation -> Student
    fireEvent.click(screen.getByRole('button', { name: /Student \(College \/ Polytechnic \/ School\)/i }));

    // Advance to educationLevel
    fireEvent.click(screen.getByRole('button', { name: /Continue/i })); // age
    fireEvent.click(screen.getByRole('button', { name: /Continue/i })); // area
    fireEvent.click(screen.getByRole('button', { name: /Continue/i })); // ration card

    // Step 6: Education Level -> School
    expect(screen.getByText(/What is your current level of education\?/i)).toBeInTheDocument();
    fireEvent.click(screen.getByRole('button', { name: /School \(Class 1 to 10 \/ Pre-Matric\)/i }));

    // Switch to review mode
    fireEvent.click(screen.getByRole('button', { name: /Review All Answers/i }));

    // None of the college-specific questions should be in review mode
    expect(screen.queryByText(/What stream/i)).not.toBeInTheDocument();
    expect(screen.queryByText(/attendance percentage/i)).not.toBeInTheDocument();
    expect(screen.queryByText(/top 20th percentile/i)).not.toBeInTheDocument();
  });
});
