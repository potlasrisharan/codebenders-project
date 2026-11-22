import { ButtonLink } from "../components/ui/Button";
import { Card } from "../components/ui/Card";

const steps = [
  {
    title: "Tell us about your situation",
    text: "Answer a few questions on the intake page so we can understand your situation.",
  },
  {
    title: "See possible schemes",
    text: "Look at schemes that may be worth exploring. A possible match is not a decision.",
  },
  {
    title: "Check what to prepare",
    text: "Note the details and documents you may want to gather before you approach an official source.",
  },
];

export function LandingPage() {
  return (
    <div className="landing">
      <section className="landing-hero" aria-labelledby="landing-title">
        <div className="landing-hero__inner">
          <p className="landing-eyebrow">Independent guidance</p>
          <h1 id="landing-title" className="landing-title">
            LabhSaathi
          </h1>
          <p className="landing-lead">
            LabhSaathi offers independent guidance to help you understand which government schemes may be worth
            exploring. It is not an application, an approval, or official advice.
          </p>
          <div className="landing-actions">
            <ButtonLink to="/intake" variant="primary" className="landing-cta">
              Start with intake
            </ButtonLink>
            <p className="landing-note">This is guidance to explore, not an application or approval.</p>
          </div>
        </div>
      </section>

      <section className="landing-section" aria-labelledby="landing-how-heading">
        <h2 id="landing-how-heading" className="landing-heading">
          How it works
        </h2>
        <ol className="landing-steps">
          {steps.map((step, index) => (
            <li key={step.title} className="landing-step">
              <span className="landing-step__number" aria-hidden="true">
                {index + 1}
              </span>
              <h3 className="landing-step__title">{step.title}</h3>
              <p className="landing-step__text">{step.text}</p>
            </li>
          ))}
        </ol>
      </section>

      <Card className="landing-card" aria-labelledby="landing-not-heading">
        <h2 id="landing-not-heading" className="landing-heading">
          What this is not
        </h2>
        <ul className="landing-list">
          <li>Not an application.</li>
          <li>Not an approval: a possible match is not a decision and does not guarantee any benefit.</li>
          <li>Uses sample profiles and sample schemes only.</li>
          <li>Not verified for every state.</li>
        </ul>
      </Card>

      <footer className="landing-footer">
        <p className="landing-footnote">Sample data only. Not verified for every state.</p>
      </footer>
    </div>
  );
}
