import { describe, expect, it } from 'vitest';
import { GOLDEN_PERSONAS, extractProfileFromText } from '../src/core/profile/citizen-profile';
import { resolveProfileParameter, evaluatePredicate } from '../src/core/engine/eligibility-engine';
import { RulePredicate } from '../src/core/data/schema';

describe('Role-Adaptive Profile & Semantic Alias Suite', () => {
  it('extracts farmer profile from plain Telugu description', () => {
    const teluguFarmer = 'నేను నల్లగొండలో చిన్న రైతుని, నాకు 2 ఎకరాల పొలం ఉంది, తెల్ల రేషన్ కార్డు ఉంది. కుటుంబ ఆదాయం 1.1 లక్ష.';
    const { profile, extractedAttributes } = extractProfileFromText(teluguFarmer);

    expect(extractedAttributes).toContain('domicileState');
    expect(extractedAttributes).toContain('occupation');
    expect(extractedAttributes).toContain('isAgriculturalLandholder');
    expect(extractedAttributes).toContain('rationCardType');

    expect(profile.domicileState).toBe('Telangana');
    expect(profile.occupation).toBe('farmer');
    expect(profile.isAgriculturalLandholder).toBe(true);
    expect(profile.familyIncome).toBe(110000);
    expect(profile.rationCardType).toBe('white_bpl');
  });

  it('extracts street vendor profile from English natural language', () => {
    const text = 'Street vendor in Warangal running a vegetable cart, family income 90000, age 36 years.';
    const { profile, extractedAttributes } = extractProfileFromText(text);

    expect(extractedAttributes).toContain('occupation');
    expect(profile.domicileState).toBe('Telangana');
    expect(profile.occupation).toBe('street_vendor');
    expect(profile.familyIncome).toBe(90000);
    expect(profile.age).toBe(36);
  });

  it('resolves semantic aliases across central and state scheme parameters', () => {
    const farmerPersona = GOLDEN_PERSONAS.find((p) => p.name.includes('Ramesh'))!.profile;

    // 1. isLandholdingFarmer alias
    expect(resolveProfileParameter('isLandholdingFarmer', farmerPersona)).toBe(true);

    // 2. annualFamilyIncome alias
    expect(resolveProfileParameter('annualFamilyIncome', farmerPersona)).toBe(110000);

    // 3. bplStatus alias
    expect(resolveProfileParameter('bplStatus', farmerPersona)).toBe(true);

    // 4. isRuralResident alias
    expect(resolveProfileParameter('isRuralResident', farmerPersona)).toBe(true);
  });

  it('evaluates rule predicate using alias resolver correctly', () => {
    const farmerPersona = GOLDEN_PERSONAS.find((p) => p.name.includes('Ramesh'))!.profile;

    const pmKisanFarmerPredicate: RulePredicate = {
      id: 'test-pmkisan-farmer',
      parameter: 'isLandholdingFarmer',
      operator: 'EQUALS',
      expectedValue: true,
      isMandatory: true,
      conditionName: 'Cultivable Landholding in Name of Farmer',
      sourceClause: 'PM-KISAN Guidelines Para 2',
    };

    const trace = evaluatePredicate(pmKisanFarmerPredicate, farmerPersona);
    expect(trace.result).toBe('true');
    expect(trace.explanation).toContain('Condition met');
  });
});
