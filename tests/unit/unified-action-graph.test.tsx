import { describe, expect, it } from 'vitest';
import { render, screen, fireEvent } from '@testing-library/react';
import { UnifiedActionGraph } from '../../src/components/graph/UnifiedActionGraph';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { evaluateSchemeEligibility } from '../../src/core/engine/eligibility-engine';
import { GOLDEN_PERSONAS } from '../../src/core/profile/citizen-profile';

describe('Unified Eligibility Action Graph (P9)', () => {
  const tsEpass = defaultSchemeRepository.getById('ts-epass-rtf-2026')!;
  const priya = GOLDEN_PERSONAS[0].profile;
  const eligibility = evaluateSchemeEligibility(tsEpass, priya);

  it('renders all three action stages: Rule Conditions, Documents, and Official Action', () => {
    render(
      <UnifiedActionGraph
        scheme={tsEpass}
        eligibility={eligibility}
        profile={priya}
        completedDocIds={['doc-income-meeseva']}
      />
    );

    expect(screen.getByText(/Unified Eligibility Action Graph/i)).toBeInTheDocument();
    expect(screen.getByText(/1\. Rule Conditions/i)).toBeInTheDocument();
    expect(screen.getByText(/2\. Documents/i)).toBeInTheDocument();
    expect(screen.getByText(/3\. Official Action/i)).toBeInTheDocument();
  });

  it('shows condition detail and official evidence when a node is clicked', () => {
    render(
      <UnifiedActionGraph
        scheme={tsEpass}
        eligibility={eligibility}
        profile={priya}
      />
    );

    const conditionButton = screen.getByText('Telangana Domicile');
    fireEvent.click(conditionButton);

    expect(screen.getByText(/Condition Detail/i)).toBeInTheDocument();
    expect(screen.getByText(/ePASS Eligibility Criteria Para 1/i)).toBeInTheDocument();
  });

  it('toggles to accessible linear list mode', () => {
    render(
      <UnifiedActionGraph
        scheme={tsEpass}
        eligibility={eligibility}
        profile={priya}
      />
    );

    const linearToggle = screen.getByText(/Accessible List/i);
    fireEvent.click(linearToggle);

    expect(screen.getAllByText(/\[Satisfied\]/i).length).toBeGreaterThan(0);
    expect(screen.getByText(/Latest Income Certificate from MeeSeva/i)).toBeInTheDocument();
  });
});
