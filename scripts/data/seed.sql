-- Auto-generated Seed SQL for labhsaathi-schemes-db

-- Generated at: 2026-11-22T14:26:30.838Z



INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ts-epass-rtf-2026',
  'telangana-epass-post-matric-rtf',
  'Telangana ePASS Post-Matric Scholarship (Reimbursement of Tuition Fee - RTF)',
  'Full or sanctioned tuition fee reimbursement for eligible SC, ST, BC, EBC, and Minority students pursuing post-matric/college education in Telangana.',
  'Full or sanctioned tuition fee reimbursement for eligible SC, ST, BC, EBC, and Minority students pursuing post-matric/college education in Telangana.',
  'scholarship',
  'state',
  'Telangana',
  'BC Welfare & SC Development Departments, Govt of Telangana',
  'BC Welfare & SC Development Departments, Govt of Telangana',
  'https://telanganaepass.cgg.gov.in',
  'free_verified',
  'Official application on the ePASS portal is completely free. No official fee is charged.',
  'Telangana Domicile; Post-Matric Course Level; Minimum 75% College Attendance; Eligible Social Category; Annual Family Income <= ₹2,00,000',
  '[{"id":"ts-epass-state","parameter":"domicileState","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"ePASS Eligibility Criteria Para 1 (Native resident of Telangana state)"},{"id":"ts-epass-edu-level","parameter":"educationLevel","operator":"IN","expectedValue":["intermediate","undergraduate","postgraduate","diploma"],"isMandatory":true,"conditionName":"Post-Matric Course Level","sourceClause":"ePASS Eligibility Criteria Para 2 (Enrolled in approved post-matric diploma, degree, or PG courses)"},{"id":"ts-epass-attendance","parameter":"attendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"Minimum 75% College Attendance","sourceClause":"ePASS Mandate Para 3.4 (75% mandatory attendance at end of each quarter certified by Principal)"},{"id":"ts-epass-category","parameter":"socialCategory","operator":"IN","expectedValue":["SC","ST","BC-A","BC-B","BC-C","BC-D","BC-E","EBC","Minority"],"isMandatory":true,"conditionName":"Eligible Social Category","sourceClause":"ePASS Eligible Groups (SC, ST, BC, EBC, Minority, Disabled)"},{"id":"ts-epass-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":200000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2,00,000","sourceClause":"Govt Order G.O.Ms.66 (Income ceiling ₹2 Lakhs per annum for SC/ST and urban BC/EBC/Minorities; ₹1.5 Lakhs for rural BC)"}]',
  '[{"id":"doc-income-meeseva","name":"Latest Income Certificate from MeeSeva","description":"Digitally signed income certificate issued by Tahsildar through MeeSeva in current financial year.","requirementType":"mandatory","issuingAuthority":"Revenue Dept (Tahsildar) via MeeSeva","sourceEvidence":"ePASS Rule Clause 4.1"},{"id":"doc-caste-meeseva","name":"Integrated Community / Caste Certificate","description":"Permanent caste certificate containing MeeSeva application ID.","requirementType":"mandatory","issuingAuthority":"Revenue Dept via MeeSeva","sourceEvidence":"ePASS Rule Clause 4.2"},{"id":"doc-bonafide","name":"College Study / Bonafide Certificate","description":"Certified bonafide from the current college confirming regular attendance.","requirementType":"mandatory","issuingAuthority":"Principal of enrolled College / University","sourceEvidence":"ePASS Rule Clause 4.3"},{"id":"doc-ssc-memo","name":"SSC / Class 10 Marks Memo","description":"Copy of SSC marks memo with hall ticket number for automated ePASS database verification.","requirementType":"mandatory","issuingAuthority":"Board of Secondary Education","sourceEvidence":"ePASS Rule Clause 4.4"},{"id":"doc-bank-passbook","name":"Aadhaar-Seeded Bank Account Passbook","description":"First page of student savings account with IFSC and account number, linked to Aadhaar (NPCI mapped).","requirementType":"mandatory","issuingAuthority":"Nationalised or Scheduled Bank","sourceEvidence":"ePASS Rule Clause 4.5"},{"id":"doc-cet-allotment","name":"CET Allotment Order / Convenor Quota Slip","description":"Convenor quota admission allotment order for professional courses (e.g. TG EAPCET, ICET, ECET, PGECET).","requirementType":"conditional","conditionExplanation":"Mandatory for professional and technical courses admitted under convenor quota.","issuingAuthority":"Convenor, Admissions Committee","sourceEvidence":"ePASS Rule Clause 5.1"}]',
  '[{"stepNumber":1,"title":"Check MeeSeva Certificate Validity","description":"Ensure your Caste Certificate and latest Income Certificate (issued by Tahsildar) are active on MeeSeva database.","portalUrl":"https://ts.meeseva.telangana.gov.in","channel":"meeseva_csc"},{"stepNumber":2,"title":"Register Online on ePASS Portal","description":"Go to telanganaepass.cgg.gov.in, choose Post-Matric Scholarship (Fresh or Renewal), and fill your academic and certificate numbers.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Upload Scanned Enclosures","description":"Upload scanned copies of Bonafide, Bank Passbook, Previous Marks Memo, and CET Allotment Order in specified PDF dimensions.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":4,"title":"Submit Physical Copy to College Scholarship Counter","description":"Print the system-generated ePASS acknowledgment form, sign it, attach certified xerox copies, and submit to your college scholarship officer.","channel":"college_cell"},{"stepNumber":5,"title":"College Bio-metric Verification & District Audit","description":"Complete student biometric authentication at the college counter. The college principal verifies and forwards to the District Welfare Officer (DWO).","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ts-epass-mtf-2026',
  'telangana-epass-maintenance-fee-mtf',
  'Telangana ePASS Maintenance Fee (MTF) & Mess Allowance',
  'Monthly maintenance stipend and mess charge reimbursement for hosteller and day-scholar students sanctioned under ePASS.',
  'Monthly maintenance stipend and mess charge reimbursement for hosteller and day-scholar students sanctioned under ePASS.',
  'education_aid',
  'state',
  'Telangana',
  'Welfare Departments, Govt of Telangana',
  'Welfare Departments, Govt of Telangana',
  'https://telanganaepass.cgg.gov.in',
  'free_verified',
  'Included with ePASS registration at zero extra cost.',
  'Telangana Domicile; Post-Matric Course Enrollment; 75% Attendance Requirement; Reserved Welfare Category',
  '[{"id":"ts-mtf-state","parameter":"domicileState","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"ePASS MTF residency clause"},{"id":"ts-mtf-edu-level","parameter":"educationLevel","operator":"IN","expectedValue":["intermediate","undergraduate","postgraduate","diploma"],"isMandatory":true,"conditionName":"Post-Matric Course Enrollment","sourceClause":"Approved higher education course"},{"id":"ts-mtf-attendance","parameter":"attendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"75% Attendance Requirement","sourceClause":"Quarterly attendance verification for allowance release"},{"id":"ts-mtf-category","parameter":"socialCategory","operator":"IN","expectedValue":["SC","ST","BC-A","BC-B","BC-C","BC-D","BC-E","Minority"],"isMandatory":true,"conditionName":"Reserved Welfare Category","sourceClause":"MTF eligibility categories"}]',
  '[{"id":"doc-hostel-certificate","name":"College Attached Hostel (CAH) / Day Scholar Certificate","description":"Hostel admission receipt or Day Scholar declaration stamped by College Head.","requirementType":"mandatory","issuingAuthority":"College Hostel Warden / Principal","sourceEvidence":"ePASS MTF Guidelines Clause 3.2"},{"id":"doc-bank-seeded","name":"NPCI Seeded Bank Passbook Copy","description":"Proof of bank account mapped to NPCI Aadhaar payment bridge.","requirementType":"mandatory","issuingAuthority":"Bank Manager / Post Office Bank","sourceEvidence":"DBT DBT-Directives Clause 2"}]',
  '[{"stepNumber":1,"title":"Select Hostel / Day Scholar in ePASS Form","description":"When submitting ePASS fresh or renewal application, specify whether staying in College Hostel, Department Hostel, or as Day Scholar.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Monthly Biometric Verification","description":"Mark attendance on the college biometric system each month to release MTF credits into your bank account.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nsp-csss-2026',
  'central-sector-scheme-scholarship-college-university',
  'Central Sector Scheme of Scholarship for College and University Students (CSSS)',
  'Merit-cum-means scholarship of ₹12,000 to ₹20,000 per year for top 20th percentile 12th board students pursuing regular graduation and post-graduation.',
  'Administered by the Department of Higher Education (MoE), this scheme supports meritorious students from economically weaker sections who score above the 80th percentile in Class 12 board examinations to pursue professional and non-professional college degrees.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Education',
  'Department of Higher Education',
  'https://scholarships.gov.in',
  'free_verified',
  '₹12,000 per annum for undergraduate study (1st to 3rd year) and ₹20,000 per annum for post-graduate degree study.',
  'Scored above 80th percentile in relevant stream in Class 12 board exam, pursuing regular full-time degree, family income <= ₹4.5 Lakhs per year.',
  '[{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":450000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹4,50,000","sourceClause":"CSSS Guidelines Clause 3.1"},{"id":"rule-percentile12th-greater_than_or_equal","parameter":"percentile12th","operator":"GREATER_THAN_OR_EQUAL","expectedValue":80,"isMandatory":true,"conditionName":"Class 12 Board Percentile >= 80th","sourceClause":"CSSS Guidelines Clause 2.1"}]',
  '[{"id":"doc-csss-marksheet","name":"Class 12 Marksheet","description":"Official board certificate with roll number and marks","requirementType":"mandatory","issuingAuthority":"State Board / CBSE / CISCE","sourceEvidence":"CSSS Rule 4"},{"id":"doc-csss-income","name":"Income Certificate","description":"Income certificate from Tahsildar / Revenue officer","requirementType":"mandatory","issuingAuthority":"State Revenue Dept","sourceEvidence":"CSSS Rule 5"}]',
  '[{"stepNumber":1,"title":"NSP One-Time Registration","description":"Register on National Scholarship Portal with OTR (One Time Registration) via Aadhaar.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":2,"title":"Select CSSS Scheme","description":"Choose Central Sector Scholarship from Ministry of Education scheme list and submit.","channel":"online_portal"},{"stepNumber":3,"title":"Institute Level Verification","description":"Nodal officer at your college/university verifies admission credentials online.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-aicte-pragati-2026',
  'aicte-pragati-scholarship-girls',
  'AICTE Pragati Scholarship for Girl Students',
  '₹50,000 per annum scholarship for girl students admitted to first year or lateral entry technical degree/diploma courses in AICTE-approved institutions.',
  '₹50,000 per annum scholarship for girl students admitted to first year or lateral entry technical degree/diploma courses in AICTE-approved institutions.',
  'scholarship',
  'central',
  'All India',
  'All India Council for Technical Education (AICTE), Ministry of Education',
  'All India Council for Technical Education (AICTE), Ministry of Education',
  'https://scholarships.gov.in',
  'free_verified',
  'Official application on NSP is 100% free.',
  'Female Student; Technical Degree or Diploma in AICTE Approved Institute; Annual Family Income <= ₹8,00,000',
  '[{"id":"pragati-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Student","sourceClause":"Pragati guidelines: Scheme is exclusively for female students"},{"id":"pragati-course-stream","parameter":"courseStream","operator":"IN","expectedValue":["engineering","technology","pharmacy","technical_diploma"],"isMandatory":true,"conditionName":"Technical Degree or Diploma in AICTE Approved Institute","sourceClause":"Admitted to technical degree (B.Tech/B.E/B.Pharm) or diploma course"},{"id":"pragati-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8,00,000","sourceClause":"Total family income not exceeding ₹8 Lakhs per annum"}]',
  '[{"id":"doc-pragati-income","name":"Income Certificate (<= ₹8,00,000 per annum)","description":"Issued by Tahsildar / Revenue Authority.","requirementType":"mandatory","issuingAuthority":"Revenue Department","sourceEvidence":"AICTE Pragati Guidelines Clause 2"},{"id":"doc-family-declaration","name":"Family Declaration (Max 2 girl children per family)","description":"Self-declaration signed by parent certifying not more than two girls are claiming the scheme.","requirementType":"mandatory","issuingAuthority":"Parent / Guardian self-declaration","sourceEvidence":"AICTE Pragati Guidelines Clause 4"},{"id":"doc-aicte-allotment","name":"Centralised Admission Allotment Letter","description":"Admission allotment slip to AICTE approved degree/diploma college.","requirementType":"mandatory","issuingAuthority":"State Admissions Convenor (e.g. TG EAPCET)","sourceEvidence":"AICTE Pragati Guidelines Clause 3"}]',
  '[{"stepNumber":1,"title":"Apply on NSP Portal under AICTE Section","description":"Submit Pragati scholarship application on scholarships.gov.in entering your college AICTE approval code.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"College Online Verification","description":"Institute Nodal Officer verifies your enrollment in AICTE sanctioned intake.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-aicte-saksham-2026',
  'aicte-saksham-scholarship-disabled',
  'AICTE Saksham Scholarship for Specially-Abled Students',
  '₹50,000/year assistance for differently-abled students with 40%+ disability studying in technical courses.',
  '₹50,000/year assistance for differently-abled students with 40%+ disability studying in technical courses.',
  'scholarship',
  'central',
  'All India',
  'AICTE, Ministry of Education',
  'AICTE, Ministry of Education',
  'https://scholarships.gov.in',
  'free_verified',
  'No fee is charged for this application.',
  'Disability >= 40% certified by Medical Board; Annual Family Income <= ₹8,00,000',
  '[{"id":"saksham-disability","parameter":"hasDisability","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Disability >= 40% certified by Medical Board","sourceClause":"Disability certified with minimum 40% benchmark disability"},{"id":"saksham-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8,00,000","sourceClause":"Total family income <= ₹8 Lakhs"}]',
  '[{"id":"doc-disability-certificate","name":"Unique Disability ID (UDID) or Medical Board Certificate (40%+)","description":"Issued by District Medical Authority or UDID portal.","requirementType":"mandatory","issuingAuthority":"Competent Medical Authority / UDID","sourceEvidence":"Saksham Clause 2.1"}]',
  '[{"stepNumber":1,"title":"Apply through National Scholarship Portal","description":"Select AICTE -> Saksham Scholarship and attach UDID card details.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ts-overseas-vidyanidhi-2026',
  'telangana-ambedkar-overseas-vidyanidhi',
  'Telangana Ambedkar & Mahatma Jyotiba Phule Overseas Vidya Nidhi',
  'Financial grant of up to ₹20 Lakhs for eligible SC, ST, BC, and Minority students pursuing postgraduate or doctoral studies in accredited foreign universities.',
  'Financial grant of up to ₹20 Lakhs for eligible SC, ST, BC, and Minority students pursuing postgraduate or doctoral studies in accredited foreign universities.',
  'fellowship',
  'state',
  'Telangana',
  'BC Welfare & Scheduled Castes Development Dept, Govt of Telangana',
  'BC Welfare & Scheduled Castes Development Dept, Govt of Telangana',
  'https://telanganaepass.cgg.gov.in',
  'free_verified',
  'Application submission on ePASS is completely free.',
  'Telangana Resident; Completed Degree for Higher Studies Abroad; Family Annual Income <= ₹5,00,000',
  '[{"id":"overseas-state","parameter":"domicileState","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Resident","sourceClause":"Candidate must be native of Telangana state"},{"id":"overseas-degree","parameter":"educationLevel","operator":"IN","expectedValue":["undergraduate","postgraduate"],"isMandatory":true,"conditionName":"Completed Degree for Higher Studies Abroad","sourceClause":"Possess minimum undergraduate qualification"},{"id":"overseas-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":500000,"isMandatory":true,"conditionName":"Family Annual Income <= ₹5,00,000","sourceClause":"Family income ceiling of ₹5 Lakhs per annum"}]',
  '[{"id":"doc-gre-toefl","name":"TOEFL / IELTS / GRE Scorecard","description":"Valid scorecards showing qualification for foreign university admissions.","requirementType":"mandatory","issuingAuthority":"ETS / British Council / IDP","sourceEvidence":"Overseas Scheme Clause 3.1"},{"id":"doc-i20-offer","name":"Unconditional Admission Offer / I-20 Form","description":"Admission letter from accredited foreign university in USA, UK, Australia, Canada, etc.","requirementType":"mandatory","issuingAuthority":"Accredited Foreign Institution","sourceEvidence":"Overseas Scheme Clause 3.2"},{"id":"doc-degree-convocation","name":"Undergraduate Degree Certificate (>= 60% Marks)","description":"B.Tech/B.Sc/Degree marks memo with at least 60% aggregate.","requirementType":"mandatory","issuingAuthority":"University Exam Branch","sourceEvidence":"Overseas Scheme Clause 3.3"}]',
  '[{"stepNumber":1,"title":"Apply on Telangana ePASS Overseas Portal","description":"Upload valid passport, I-20/Offer Letter, Visa copy, and degree certificates during announced notification window.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"State Selection Committee Interview","description":"Attend document verification and interview with the Special Chief Secretary Welfare committee.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ner-ishan-uday-2026',
  'ugc-ishan-uday-scholarship-ner',
  'UGC Ishan Uday Special Scholarship Scheme for North Eastern Region',
  'Special scholarship for college students with domicile in North Eastern States (Assam, Meghalaya, etc.). Used to verify geographical jurisdiction rules.',
  'Special scholarship for college students with domicile in North Eastern States (Assam, Meghalaya, etc.). Used to verify geographical jurisdiction rules.',
  'scholarship',
  'state',
  'North Eastern States',
  'University Grants Commission (UGC)',
  'University Grants Commission (UGC)',
  'https://scholarships.gov.in',
  'free_verified',
  'Free application on NSP.',
  'Domicile of North Eastern Region',
  '[{"id":"ner-domicile-rule","parameter":"domicileState","operator":"IN","expectedValue":["Assam","Arunachal Pradesh","Manipur","Meghalaya","Mizoram","Nagaland","Sikkim","Tripura"],"isMandatory":true,"conditionName":"Domicile of North Eastern Region","sourceClause":"Applicant must have domicile of Assam or other NER states"}]',
  '[{"id":"doc-ner-domicile","name":"Permanent Resident Certificate (PRC) from NER State","description":"Issued by competent Deputy Commissioner in North Eastern state.","requirementType":"mandatory","issuingAuthority":"NER District Administration","sourceEvidence":"Ishan Uday Clause 2"}]',
  '[{"stepNumber":1,"title":"Apply through NSP Portal","description":"Select UGC Ishan Uday and submit PRC certificate.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ts-rythu-bima-2026',
  'telangana-rythu-bima-farmer-insurance',
  'Telangana Rythu Bima (Farmers Group Life Insurance)',
  '₹5 Lakh life insurance cover for landholder farmers in Telangana. Used to verify occupation/category filtering.',
  '₹5 Lakh life insurance cover for landholder farmers in Telangana. Used to verify occupation/category filtering.',
  'welfare',
  'state',
  'Telangana',
  'Agriculture and Cooperation Department',
  'Agriculture and Cooperation Department',
  'https://rythubandhu.telangana.gov.in',
  'free_verified',
  '100% government funded premium. Zero farmer contribution.',
  'Agricultural Landholder in Telangana',
  '[{"id":"farmer-landowner","parameter":"isAgriculturalLandholder","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Agricultural Landholder in Telangana","sourceClause":"Ownership of cultivated land as per Dharani portal"}]',
  '[{"id":"doc-pattadar-passbook","name":"Pattadar Passbook (Dharani Portal)","description":"Digitally verified agricultural land ownership passbook.","requirementType":"mandatory","issuingAuthority":"Revenue Dept (Dharani)","sourceEvidence":"Rythu Bima Guidelines"}]',
  '[{"stepNumber":1,"title":"Agricultural Extension Officer (AEO) Enrollment","description":"Submit Pattadar passbook and nominee form to village AEO.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-kisan',
  'pm-kisan-samman-nidhi',
  'Pradhan Mantri Kisan Samman Nidhi (PM-KISAN)',
  'Direct income support of ₹6,000 per year in three equal installments of ₹2,000 every 4 months to all eligible landholding farmer families across India.',
  'Pradhan Mantri Kisan Samman Nidhi (PM-KISAN) is a flagship Central Sector scheme with 100% funding from the Government of India. The scheme aims to augment the income of all landholding farmers families across the country to procure agricultural inputs (seeds, fertilizers, equipment) as well as fulfill domestic consumption needs. Under the scheme, financial assistance of ₹6,000 per year is transferred directly into Aadhaar-seeded bank accounts through Direct Benefit Transfer (DBT) based on land records authenticated by State/UT governments.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture & Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://pmkisan.gov.in',
  'free_verified',
  'Financial benefit of ₹6,000 per year payable in three equal four-monthly installments of ₹2,000 each (Period 1: April to July; Period 2: August to November; Period 3: December to March) directly credited via PFMS Aadhaar-based DBT.',
  'All landholding farmer families who own cultivable land registered in their name. Excluded: institutional landholders, farmer families where one or more members hold or held constitutional posts, current/former Ministers, MPs, MLAs, MLCs, Mayors, Chairpersons of District Panchayats, serving/retired officers and employees of Central/State Government ministries and PSUs (except Group D/Multi-Tasking Staff), all retired pensioners whose monthly pension is ₹10,000 or more (excluding Group D), persons who paid income tax in last assessment year, and registered professionals (doctors, engineers, lawyers, CAs, architects).',
  '[{"id":"pmkisan-farmer-status","parameter":"isLandholdingFarmer","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Cultivable Landholding in Name of Farmer","sourceClause":"PM-KISAN Operational Guidelines Para 2 (Definitions of Farmer Family)"},{"id":"pmkisan-tax-exclusion","parameter":"isIncomeTaxPayee","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Non-Income Tax Payee","sourceClause":"PM-KISAN Guidelines Para 3.b.v (Exclusion criteria: All persons who paid Income Tax in last assessment year)"},{"id":"pmkisan-aadhaar-seeding","parameter":"hasAadhaarSeededBank","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Aadhaar-Seeded NPCI Active Bank Account","sourceClause":"PM-KISAN DBT Mandate & eKYC verification circular"},{"id":"pmkisan-institutional-exclusion","parameter":"isInstitutionalLandholder","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Not an Institutional Landholder","sourceClause":"PM-KISAN Guidelines Exclusion Clause 3.a"}]',
  '[{"id":"pmkisan-doc-aadhaar","name":"Aadhaar Card of Landholder","description":"Mandatory Aadhaar card with biometric or OTP eKYC verification on PM-KISAN portal.","requirementType":"mandatory","issuingAuthority":"Unique Identification Authority of India (UIDAI)"},{"id":"pmkisan-doc-land-record","name":"Land Ownership Record / RoR / Khasra-Khatauni / Pattadar Passbook","description":"Updated mutation document or Record of Rights (RoR) demonstrating land ownership.","requirementType":"mandatory","issuingAuthority":"State Revenue / Land Records Department"},{"id":"pmkisan-doc-bank-passbook","name":"Aadhaar-Linked Bank Account Passbook","description":"Savings account details linked to Aadhaar and mapped on NPCI Bharat Aadhaar Seeding Platform.","requirementType":"mandatory","issuingAuthority":"Scheduled Commercial Bank / Post Office"}]',
  '[{"stepNumber":1,"title":"New Farmer Registration & eKYC","description":"Visit pmkisan.gov.in -> Farmers Corner -> New Farmer Registration. Enter Aadhaar number and registered mobile number to complete Aadhaar OTP eKYC.","portalUrl":"https://pmkisan.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Submit Land & Personal Credentials","description":"Select State, District, Sub-District, Block, and Village. Enter Land Registration ID, Survey/Khata/Khasra numbers, land area in hectares, and bank account IFSC.","portalUrl":"https://pmkisan.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Revenue & State Verification","description":"State revenue officials and Patwari/Tahsildar conduct digital and physical field verification of land records and family exclusion checklist.","channel":"district_office"},{"stepNumber":4,"title":"DBT Installment Disbursement","description":"Approved beneficiaries receive ₹2,000 every 4 months directly into their NPCI-mapped bank account via PFMS.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-fasal-bima',
  'pradhan-mantri-fasal-bima-yojana',
  'Pradhan Mantri Fasal Bima Yojana (PMFBY)',
  'Comprehensive crop insurance against yield losses from natural calamities, pests, and post-harvest damages at ultra-low premium rates (1.5% to 2%).',
  'Pradhan Mantri Fasal Bima Yojana (PMFBY) provides comprehensive crop insurance coverage and financial stabilization to Indian farmers. The scheme covers prevented sowing, mid-season adversity, standing crop yield losses due to non-preventable natural risks (drought, dry spells, flood, inundation, widespread pest attacks, landslides, natural fire, lightning, storm), and post-harvest losses up to 14 days after harvesting. The farmer pays a maximum premium of only 2% for Kharif food/oilseeds, 1.5% for Rabi food/oilseeds, and 5% for commercial/horticultural crops, with the remaining premium heavily subsidized equally by Central and State Governments.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture & Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://pmfby.gov.in',
  'free_verified',
  'Direct claim settlement credited to the farmer bank account based on Crop Cutting Experiments (CCEs) and satellite remote sensing. Covers up to 100% sum insured for yield losses, localized calamities (hailstorm, landslide, cloudburst), prevented sowing (25% sum insured), and post-harvest cyclone damage.',
  'All farmers growing notified crops in notified areas defined by the State Government, including sharecroppers and tenant farmers. Enrollment is voluntary for both loanee (KCC holders) and non-loanee farmers.',
  '[{"id":"pmfby-crop-notified","parameter":"growingNotifiedCrop","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Notified Crop Cultivated in Notified Insurance Unit","sourceClause":"PMFBY Revised Operational Guidelines Clause 2.1"},{"id":"pmfby-area-notified","parameter":"inNotifiedArea","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Location within Insurance Unit Notification","sourceClause":"PMFBY Operational Guidelines Section II"},{"id":"pmfby-tenancy-valid","parameter":"hasValidLandOrTenancyRecord","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Valid Land Title or Tenant/Sharecropper Agreement","sourceClause":"PMFBY Operational Guidelines Clause 3.2"}]',
  '[{"id":"pmfby-doc-aadhaar","name":"Aadhaar Card","description":"Mandatory Aadhaar identification for farmer registration and DBT claim payout.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmfby-doc-sowing-cert","name":"Crop Sowing Certificate / Self-Declaration","description":"Certificate from Village Administrative Officer (VAO) / Patwari confirming sown crop.","requirementType":"mandatory","issuingAuthority":"Village Officer / Revenue Patwari"},{"id":"pmfby-doc-land-passbook","name":"Land Record (RoR) / Khasra Khatauni / Tenant Agreement","description":"Land record extract showing survey numbers or signed tenancy agreement for non-owner farmers.","requirementType":"mandatory","issuingAuthority":"State Revenue Department"},{"id":"pmfby-doc-bank-passbook","name":"Bank Passbook / Cancelled Cheque","description":"Savings or KCC bank passbook containing IFSC and account details.","requirementType":"mandatory","issuingAuthority":"Bank Branch"}]',
  '[{"stepNumber":1,"title":"Online Application or CSC / Bank Visit","description":"Apply on pmfby.gov.in, via Crop Insurance App, or visit nearest CSC / commercial bank / Primary Agricultural Credit Society (PACS) before cut-off date (usually July 31 for Kharif, Dec 31 for Rabi).","portalUrl":"https://pmfby.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Submit Crop Details & Pay Premium","description":"Input plot survey number, notified crop name, and pay subsidized premium (1.5% to 2% of sum insured) via net banking or cash at CSC.","portalUrl":"https://pmfby.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Policy Generation & Loss Intimation","description":"Download electronic insurance policy certificate. In case of localized disaster (hail, flood, cyclone), report crop damage within 72 hours via Crop Insurance App or toll-free 14447.","channel":"online_portal"},{"stepNumber":4,"title":"Assessment & Direct Claim Settlement","description":"Insurance company and agriculture department joint survey assesses loss; claim payout transferred directly to bank account.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-kisan-maandhan',
  'pm-kisan-maandhan-yojana',
  'Pradhan Mantri Kisan Maandhan Yojana (PM-KMY)',
  'Contributory old-age pension scheme assuring ₹3,000 per month pension to small and marginal farmers on attaining 60 years of age.',
  'Pradhan Mantri Kisan Maandhan Yojana (PM-KMY) is an old-age social security pension scheme for Small and Marginal Farmers (SMFs) between 18 and 40 years of age. Under this scheme, the farmer makes a modest monthly contribution ranging from ₹55 to ₹200 (based on entry age), and the Central Government contributes an equal 50% matching amount. Upon attaining the age of 60 years, the subscriber receives a guaranteed life-long monthly pension of ₹3,000. Life Insurance Corporation of India (LIC) acts as the pension fund manager.',
  'pension',
  'central',
  'All India',
  'Ministry of Agriculture & Farmers Welfare',
  'Department of Agriculture and Farmers Welfare (with LIC of India)',
  'https://maandhan.in',
  'free_verified',
  'Guaranteed lifelong monthly pension of ₹3,000 upon reaching 60 years of age. In the event of pensioner death, 50% family pension (₹1,500/month) is provided to spouse if not already an independent beneficiary.',
  'Small and marginal farmers holding cultivable agricultural land up to 2 hectares (5 acres) as per land records of the State/UT. Entry age must be between 18 and 40 years. Excludes farmers covered under NPS, ESIC, EPFO, PM-SYM, and those paying income tax.',
  '[{"id":"pmkmy-age-rule","parameter":"age","operator":"BETWEEN","expectedValue":[18,40],"isMandatory":true,"conditionName":"Entry Age Between 18 and 40 Years","sourceClause":"PM-KMY Guidelines Clause 2.1 (Eligible Age Range)"},{"id":"pmkmy-land-limit","parameter":"cultivableLandHectares","operator":"LESS_THAN_OR_EQUAL","expectedValue":2,"isMandatory":true,"conditionName":"Cultivable Landholding Up to 2 Hectares (5 Acres)","sourceClause":"PM-KMY Guidelines Clause 2.2 (Small & Marginal Farmer Definition)"},{"id":"pmkmy-income-tax","parameter":"isIncomeTaxPayee","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Non-Income Tax Payer","sourceClause":"PM-KMY Exclusion Criteria Clause 3"},{"id":"pmkmy-epfo-exclusion","parameter":"isCoveredUnderEPFOorESIC","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Not Covered under EPFO/ESIC/NPS","sourceClause":"PM-KMY Exclusion Criteria Clause 3"}]',
  '[{"id":"pmkmy-doc-aadhaar","name":"Aadhaar Card","description":"Primary identity document for biometric enrollment.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmkmy-doc-bank-passbook","name":"Savings Bank Account Passbook","description":"Bank passbook with IFSC code for setting up monthly auto-debit mandate.","requirementType":"mandatory","issuingAuthority":"Bank / Post Office"},{"id":"pmkmy-doc-land-record","name":"Khasra / Khatauni / Pattadar Land Record Copy","description":"Document verifying total cultivable land ownership <= 2 hectares.","requirementType":"mandatory","issuingAuthority":"Revenue Department"}]',
  '[{"stepNumber":1,"title":"Visit CSC or Self-Enrollment Portal","description":"Visit the nearest Common Service Centre (CSC) or log in on maandhan.in using mobile and Aadhaar OTP.","portalUrl":"https://maandhan.in","channel":"meeseva_csc"},{"stepNumber":2,"title":"Auto-Debit Mandate & Bank Setup","description":"Provide bank account details and sign the auto-debit mandate form (monthly contribution of ₹55 to ₹200 can also be automatically debited from PM-KISAN benefits).","portalUrl":"https://maandhan.in","channel":"online_portal"},{"stepNumber":3,"title":"Kisan Pension Card Generation","description":"Upon verification and initial payment, a unique Kisan Pension Number (KPN) is assigned and digital Kisan Pension Card is downloaded instantly.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-soil-health-card',
  'soil-health-card-scheme',
  'Soil Health Card Scheme',
  'Field-specific soil health report providing crop-wise customized nutrient and fertilizer recommendations to maximize yield and lower input costs.',
  'The Soil Health Card Scheme is a national flagship initiative to promote balanced crop nutrition and sustainable soil management. Under this scheme, geo-tagged soil samples are collected across agricultural parcels and scientifically analyzed for 12 essential chemical and physical parameters: Primary macronutrients (Nitrogen, Phosphorus, Potassium), Secondary nutrient (Sulphur), Micronutrients (Zinc, Iron, Copper, Manganese, Boron), and Physical parameters (pH, Electrical Conductivity, Organic Carbon). Farmers receive custom recommendations for biofertilizers, compost, and chemical fertilizers for their target crops.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture & Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://soilhealth.dac.gov.in',
  'free_verified',
  '100% free comprehensive soil test report card issued every 2 to 3 years. Provides precise dosage calculations for nitrogen, phosphorus, potash, and micronutrients, reducing excessive fertilizer usage by 15-20% and increasing crop yields by 8-15%.',
  'All farmers cultivating agricultural land in India across all states and union territories. Both landowning farmers and registered cultivators/tenants are eligible.',
  '[{"id":"shc-farmer-cultivator","parameter":"isFarmer","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Cultivator of Agricultural Land","sourceClause":"Soil Health Card Guidelines Section 1 (Coverage of Cultivable Holdings)"}]',
  '[{"id":"shc-doc-identity","name":"Aadhaar Card / Farmer ID","description":"Farmer identity card or Aadhaar number linked to plot details.","requirementType":"mandatory","issuingAuthority":"UIDAI / Agriculture Dept"},{"id":"shc-doc-land-details","name":"Land Survey / Khasra Details","description":"Survey numbers and village boundaries where sample is drawn.","requirementType":"mandatory","issuingAuthority":"Revenue / Village Panchayat"}]',
  '[{"stepNumber":1,"title":"Soil Sample Collection by Field Staff","description":"Agriculture extension officers, Gram Krishi Sahayaks, or village youth collect GPS-referenced soil samples from farm grids (2.5 ha for irrigated, 10 ha for rainfed).","channel":"district_office"},{"stepNumber":2,"title":"Laboratory Testing for 12 Parameters","description":"Samples are tested in district Soil Testing Laboratories (STLs) or mobile testing units for 12 nutrient indicators.","channel":"district_office"},{"stepNumber":3,"title":"Soil Health Card Download & Advisory","description":"Soil Health Card is uploaded on soilhealth.dac.gov.in and delivered physically or via WhatsApp/SMS to the farmer with tailored dosage recommendations.","portalUrl":"https://soilhealth.dac.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-ab-pmjay',
  'ayushman-bharat-pradhan-mantri-jan-arogya-yojana',
  'Ayushman Bharat - Pradhan Mantri Jan Arogya Yojana (AB-PMJAY)',
  'Comprehensive health cover of ₹5,00,000 per family per year for secondary and tertiary care hospitalization across 28,000+ empanelled hospitals.',
  'Ayushman Bharat - PM-JAY is the world’s largest government-funded health assurance scheme. It provides an annual health cover of ₹5,00,000 per family for secondary and tertiary care hospitalization across more than 28,000 empanelled public and private hospitals nationwide. Beneficiaries are identified from the bottom 40% vulnerable and poor population based on SECC 2011 and state NFSA ration card databases. In 2024-2026, the scheme was universally extended to cover all Indian senior citizens aged 70 and above, regardless of income, with a distinct ₹5,00,000 Ayushman Vay Vandana card. Cashless and paperless from admission to discharge.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'National Health Authority (NHA)',
  'https://beneficiary.nha.gov.in',
  'free_verified',
  'Cashless inpatient treatment cover up to ₹5,00,000 per family per annum. Covers 1,949 medical and surgical packages including oncology, neurosurgery, cardiac care, ICU stays, implants, diagnostic tests, medicines, and pre/post hospitalization expenses (3 days pre-hospitalization and 15 days post-hospitalization).',
  'Families categorized as poor and deprived in rural areas (deprivation criteria D1 through D7, excluding specific assets) and specified occupational categories in urban areas based on SECC 2011 or NFSA Ration Card. All senior citizens aged 70 years and above are universally eligible under Ayushman Vay Vandana without income ceiling.',
  '[{"id":"pmjay-eligibility-criteria","parameter":"seccListedOrSenior70Plus","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"SECC 2011 Listed / NFSA Beneficiary or Senior Citizen Aged 70+","sourceClause":"PM-JAY National Health Authority Guidelines & Senior Citizen 70+ Expansion Notification 2024"},{"id":"pmjay-resident","parameter":"isResidentOfIndia","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident Citizen of India","sourceClause":"AB-PMJAY Beneficiary Identification System Rules"}]',
  '[{"id":"pmjay-doc-aadhaar","name":"Aadhaar Card","description":"Mandatory Aadhaar card for biometric/OTP eKYC and generation of ABHA-linked Ayushman Card.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmjay-doc-ration-card","name":"Ration Card / Family ID","description":"NFSA Ration Card or State Food Security Card proving family roster.","requirementType":"mandatory","issuingAuthority":"State Food & Civil Supplies Department"}]',
  '[{"stepNumber":1,"title":"Check Eligibility Online or on Ayushman App","description":"Visit beneficiary.nha.gov.in or download the Ayushman App. Log in with mobile number and search by Aadhaar Number, Ration Card number, or PMJAY ID.","portalUrl":"https://beneficiary.nha.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Complete Aadhaar eKYC","description":"Perform instant eKYC using Aadhaar OTP, Fingerprint, Iris, or Face Authentication on smartphone.","portalUrl":"https://beneficiary.nha.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Download Ayushman Card (Golden Card)","description":"Upon instant digital approval, download the PVC Ayushman Card or digital Ayushman Card containing unique PMJAY ID.","channel":"online_portal"},{"stepNumber":4,"title":"Cashless Admission at Hospital","description":"Present the Ayushman Card at the Pradhan Mantri Arogya Mitra (PMAM) desk in any empanelled public or private hospital for completely cashless care.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-abhim',
  'pm-ayushman-bharat-health-infrastructure-mission',
  'PM Ayushman Bharat Health Infrastructure Mission (PM-ABHIM)',
  'Pan-India healthcare infrastructure mission providing free comprehensive primary care, diagnostic tests, and critical care hospital facilities.',
  'Pradhan Mantri Ayushman Bharat Health Infrastructure Mission (PM-ABHIM) is a premier Centrally Sponsored Scheme with an outlay of ₹64,180 crore. The mission aims to establish robust public health systems capable of responding effectively to public health emergencies. It supports the operationalization of Ayushman Arogya Mandirs (Health & Wellness Centres), Integrated Public Health Laboratories in all 730+ districts, Critical Care Hospital Blocks in districts with over 5 lakh population, and Block Public Health Units across the country.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'Department of Health and Family Welfare',
  'https://abhim.mohfw.gov.in',
  'free_verified',
  'Completely free primary health consultations, 134 free essential diagnostic tests at district public health labs, 105 free essential medicines at Ayushman Arogya Mandirs, and free critical care hospital admissions for infectious diseases and medical emergencies.',
  'Universal entitlement for all Indian citizens visiting government primary, secondary, and tertiary public healthcare institutions across urban and rural India.',
  '[{"id":"abhim-citizen-rule","parameter":"isResidentOfIndia","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident Citizen of India","sourceClause":"PM-ABHIM National Operational Framework"}]',
  '[{"id":"abhim-doc-abha","name":"ABHA Card / Aadhaar Card","description":"Ayushman Bharat Health Account (ABHA 14-digit ID) or Aadhaar Card.","requirementType":"optional","issuingAuthority":"National Health Authority (NHA) / UIDAI"}]',
  '[{"stepNumber":1,"title":"Visit Nearest Ayushman Arogya Mandir / CHC","description":"Walk into any local Ayushman Arogya Mandir (Sub-Centre / PHC), Community Health Centre, or District Hospital.","channel":"district_office"},{"stepNumber":2,"title":"Generate or Link 14-Digit ABHA ID","description":"Present Aadhaar or mobile number at the registration counter to link digital health records into the national ABHA registry.","channel":"district_office"},{"stepNumber":3,"title":"Receive Free Diagnostics & Care","description":"Consult medical officers, undergo free screening for hypertension/diabetes/cancer, and receive prescribed medicines free of charge.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-jan-aushadhi-pmbjp',
  'pradhan-mantri-bhartiya-janaushadhi-pariyojana',
  'Pradhan Mantri Bhartiya Janaushadhi Pariyojana (PMBJP)',
  'Affordable generic medicine campaign providing over 2,046 high-quality medicines and 300 surgical consumables at 50% to 90% discount.',
  'Pradhan Mantri Bhartiya Janaushadhi Pariyojana (PMBJP) is a direct public health welfare initiative managed by the Pharmaceuticals & Medical Devices Bureau of India (PMBI). The scheme makes top-quality generic medicines available to everyone through more than 14,000 dedicated Pradhan Mantri Bhartiya Janaushadhi Kendras (PMBJK) across India. Generic medicines sold through Kendras are tested for quality and bio-equivalence in NABL-accredited laboratories and sourced exclusively from WHO-GMP certified manufacturers, pricing them 50% to 90% cheaper than branded equivalents.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Chemicals and Fertilizers',
  'Pharmaceuticals & Medical Devices Bureau of India (PMBI)',
  'https://janaushadhi.gov.in',
  'free_verified',
  'Massive 50% to 90% price savings on 2,046 generic medicines across chronic therapies (cardiac, diabetic, oncology, neurological), acute therapies, Suvidha biodegradable oxo-biodegradable sanitary napkins at ₹1 per pad, and 300 surgical and healthcare devices.',
  'Universal access. Open to every citizen of India without any income criteria, residence requirement, or age limitation.',
  '[{"id":"pmbjp-prescription-rule","parameter":"hasDoctorPrescription","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Valid Medical Prescription for Scheduled Drugs","sourceClause":"Drugs and Cosmetics Act & PMBJP Sales Guidelines"}]',
  '[{"id":"pmbjp-doc-prescription","name":"Doctor Prescription","description":"Prescription from registered medical practitioner (showing generic salt or brand name).","requirementType":"mandatory","issuingAuthority":"Registered Medical Practitioner / Hospital"}]',
  '[{"stepNumber":1,"title":"Locate Nearest Janaushadhi Kendra","description":"Use the official \"Jan Aushadhi Sugam\" mobile app or visit janaushadhi.gov.in to find the nearest outlet among 14,000+ Kendras.","portalUrl":"https://janaushadhi.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Show Prescription at Kendra","description":"Present doctor prescription to the certified pharmacist, who dispenses the bio-equivalent generic formulations.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Purchase at 50-90% Discounted MRP","description":"Collect medicines with official printed receipt at a fraction of open market branded prices.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nsp-pre-matric',
  'national-scholarship-portal-pre-matric-scholarship',
  'NSP Pre-Matric Scholarship Scheme for SC, ST, OBC and Minorities',
  'Annual academic allowance and maintenance scholarship for Class 9 and 10 students belonging to SC, ST, OBC, and notified Minority communities.',
  'The Pre-Matric Scholarship Scheme implemented via the National Scholarship Portal (NSP) is a Centrally Sponsored Scheme aimed at supporting children from marginalized socio-economic backgrounds (SC, ST, OBC, EBC, DNT, and notified minorities) enrolled in Classes 9 and 10 in recognized schools. The scheme aims to arrest student dropouts between elementary and secondary education stages, boost school retention, and enable students to transition into higher secondary courses without financial hardship.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice & Empowerment',
  'Department of Social Justice and Empowerment',
  'https://scholarships.gov.in',
  'free_verified',
  'Day scholars receive an academic allowance of ₹3,500 to ₹4,000 per annum; Hostellers receive ₹7,000 to ₹8,000 per annum, plus additional disability allowances of ₹1,000/year for differently-abled students directly transferred into bank accounts via PFMS DBT.',
  'Students studying in Class 9 or 10 in a government school or private school recognized by a government board. Must belong to SC, ST, OBC, or notified minority community (Muslim, Christian, Sikh, Buddhist, Jain, Parsi). Total family income from all sources must not exceed ₹2,50,000 per annum (SC/ST) or ₹1,00,000 to ₹2,50,000 per annum (OBC/Minority).',
  '[{"id":"nsp-pre-class","parameter":"educationLevel","operator":"IN","expectedValue":["class_9","class_10"],"isMandatory":true,"conditionName":"Enrolled in Class 9 or Class 10","sourceClause":"NSP Pre-Matric Operational Guidelines Clause 2"},{"id":"nsp-pre-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2,50,000","sourceClause":"NSP Financial Eligibility Criteria Clause 4"},{"id":"nsp-pre-category","parameter":"socialCategory","operator":"IN","expectedValue":["SC","ST","OBC","Minority"],"isMandatory":true,"conditionName":"Belongs to SC, ST, OBC or Notified Minority Community","sourceClause":"NSP Social Eligibility Criteria Clause 3"}]',
  '[{"id":"pre-doc-aadhaar","name":"Student Aadhaar / OTR Number","description":"NSP One-Time Registration (OTR) generated through Aadhaar eKYC.","requirementType":"mandatory","issuingAuthority":"National Scholarship Portal / UIDAI"},{"id":"pre-doc-income","name":"Income Certificate","description":"Income certificate issued by Tahsildar / competent revenue authority.","requirementType":"mandatory","issuingAuthority":"Revenue Department"},{"id":"pre-doc-caste","name":"Community / Caste Certificate","description":"Valid digital caste or community certificate.","requirementType":"mandatory","issuingAuthority":"State Revenue Authority"},{"id":"pre-doc-marksheet","name":"Previous Class Passing Marksheet","description":"Class 8 or 9 marks memo confirming regular promotion.","requirementType":"mandatory","issuingAuthority":"Headmaster / School Principal"}]',
  '[{"stepNumber":1,"title":"Register OTR on National Scholarship Portal","description":"Visit scholarships.gov.in and complete One Time Registration (OTR) using face authentication or Aadhaar OTP.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Apply for Pre-Matric Scholarship","description":"Log in with OTR, select Pre-Matric Scholarship, enter school UDISE code, academic marks, and parent income details.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"School Headmaster Verification","description":"School Nodal Officer verifies enrollment and documents on the NSP Institute portal.","channel":"college_cell"},{"stepNumber":4,"title":"Direct Benefit Transfer (DBT)","description":"Scholarship amount disbursed directly into student Aadhaar-seeded bank account via PFMS.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nsp-post-matric',
  'national-scholarship-portal-post-matric-scholarship',
  'NSP Post-Matric Scholarship for Scheduled Castes, Scheduled Tribes & OBCs',
  'Complete tuition fee reimbursement plus monthly maintenance allowance for Class 11 to PhD higher education for SC, ST, and OBC students.',
  'The Post-Matric Scholarship Scheme is the premier Centrally Sponsored higher education scholarship framework for Scheduled Castes (SC), Scheduled Tribes (ST), and Other Backward Classes (OBC). The scheme covers non-refundable compulsory course fees (tuition, laboratory, library, exam fees) and provides monthly academic maintenance allowances directly to students enrolled in post-matriculation courses ranging from Intermediate/10+2, ITI, Diploma, Undergraduate degrees (B.Tech, MBBS, BA, B.Sc) to Postgraduate and doctoral degrees. Funded jointly by Central and State Governments on a 60:40 basis.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://scholarships.gov.in',
  'free_verified',
  '100% reimbursement of non-refundable compulsory academic tuition and examination fees paid to the institution. In addition, monthly maintenance allowance is provided: Group 1 (Professional PG/Degree e.g. Engineering, Medicine) ₹13,500/year (hostellers) or ₹7,000/year (day scholars); Group 2-4 courses receive between ₹4,000 and ₹9,500/year.',
  'Students belonging to SC, ST, or OBC communities pursuing recognized post-secondary courses in government or accredited private institutions. Total annual family income from all sources must not exceed ₹2,50,000.',
  '[{"id":"post-matric-level","parameter":"educationLevel","operator":"IN","expectedValue":["class_11","class_12","iti","diploma","undergraduate","postgraduate","phd"],"isMandatory":true,"conditionName":"Enrolled in Recognized Post-Matric Course","sourceClause":"Post-Matric Scholarship Guidelines Clause 2 (Eligible Courses)"},{"id":"post-matric-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2,50,000","sourceClause":"Post-Matric Scholarship Scheme Guidelines Clause 4.1"},{"id":"post-matric-caste","parameter":"socialCategory","operator":"IN","expectedValue":["SC","ST","OBC"],"isMandatory":true,"conditionName":"Belongs to SC, ST, or OBC Community","sourceClause":"Post-Matric Scholarship Scheme Guidelines Clause 3"}]',
  '[{"id":"post-doc-aadhaar","name":"Aadhaar Card with NSP OTR","description":"Verified OTR ID mapped to Aadhaar.","requirementType":"mandatory","issuingAuthority":"UIDAI / NSP"},{"id":"post-doc-caste","name":"Caste / Community Certificate","description":"Digitally verifiable community certificate issued by Revenue Authority.","requirementType":"mandatory","issuingAuthority":"Tahsildar / Sub-Divisional Magistrate"},{"id":"post-doc-income","name":"Income Certificate (<= ₹2.5 Lakhs)","description":"Current financial year income certificate of parents.","requirementType":"mandatory","issuingAuthority":"Revenue Authority"},{"id":"post-doc-bonafide","name":"College Bonafide & Fee Receipt","description":"Admission fee breakdown and bonafide study certificate with AISHE code.","requirementType":"mandatory","issuingAuthority":"College Principal / Registrar"}]',
  '[{"stepNumber":1,"title":"OTR Registration on NSP","description":"Complete One Time Registration on scholarships.gov.in using Aadhaar eKYC.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Fill Academic Course & College Info","description":"Select Post-Matric Scholarship, select college AISHE code, course semester, and upload fee receipts.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Institutional Nodal Officer Verification","description":"College INO reviews admission validity and approves the application on NSP.","channel":"college_cell"},{"stepNumber":4,"title":"District & State Welfare Disbursal","description":"District Welfare Officer approves the file; tuition fees and maintenance grants disbursed directly to bank account via DBT.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-yasasvi',
  'pm-young-achievers-scholarship-award-scheme-yasasvi',
  'PM Young Achievers Scholarship Award Scheme for Vibrant India (PM-YASASVI)',
  'Prestigious scholarship of up to ₹1,25,000 per year for meritorious OBC, EBC, and DNT students studying in Top Class Schools and Colleges.',
  'PM-YASASVI is an umbrella scholarship scheme designed by the Ministry of Social Justice and Empowerment for Other Backward Classes (OBC), Economically Backward Classes (EBC), and De-Notified Nomadic Tribes (DNT). It offers four key components: Pre-Matric Scholarships, Post-Matric Scholarships, Top-Class School Education (supporting high-achieving students admitted to identified premier residential schools), and Top-Class College Education (covering full tuition and living expenses in premier universities like IITs, IIMs, AIIMS, and NITs).',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://yet.nta.ac.in',
  'free_verified',
  'Top Class Schooling: Class 9 and 10 students receive up to ₹75,000 per annum; Class 11 and 12 students receive up to ₹1,25,000 per annum covering full tuition, boarding, books, and uniforms. Top Class College Education: full non-refundable tuition fees up to ₹2.0 Lakhs/yr plus ₹3,000/month living allowance, ₹50,000 computer grant, and ₹5,000/year books grant.',
  'Students belonging to OBC, EBC, or DNT categories studying in identified top-class schools or designated higher education institutes across India. Total annual family income from all sources must not exceed ₹2,50,000.',
  '[{"id":"yasasvi-category","parameter":"socialCategory","operator":"IN","expectedValue":["OBC","EBC","DNT"],"isMandatory":true,"conditionName":"Belongs to OBC, EBC, or DNT Category","sourceClause":"PM-YASASVI Scheme Guidelines Clause 3.1"},{"id":"yasasvi-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2,50,000","sourceClause":"PM-YASASVI Scheme Guidelines Clause 3.2"},{"id":"yasasvi-level","parameter":"educationLevel","operator":"IN","expectedValue":["class_9","class_10","class_11","class_12","undergraduate","postgraduate"],"isMandatory":true,"conditionName":"Enrolled in Identified Top-Class School or College","sourceClause":"PM-YASASVI Institutional Scope Clause 4"}]',
  '[{"id":"yasasvi-doc-caste","name":"OBC / EBC / DNT Certificate","description":"Valid certificate issued by competent authority demonstrating beneficiary caste category.","requirementType":"mandatory","issuingAuthority":"Revenue Authority / District Magistrate"},{"id":"yasasvi-doc-income","name":"Parental Income Certificate","description":"Certified annual income proof confirming family income is within ₹2.5 Lakhs.","requirementType":"mandatory","issuingAuthority":"Tahsildar / Revenue Officer"},{"id":"yasasvi-doc-school","name":"Admission Bonafide from Empanelled Institution","description":"Bonafide certificate confirming admission in identified Top-Class School or College.","requirementType":"mandatory","issuingAuthority":"Head of Empanelled Institution"}]',
  '[{"stepNumber":1,"title":"NSP Portal Registration","description":"Create OTR profile on scholarships.gov.in and select PM-YASASVI Scheme.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Submit Academic & Merit Credentials","description":"Enter previous examination marks, roll number, category certificate number, and school details.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Institution & State Merit Verification","description":"School/College nodal officer validates credentials; merit list prepared per category quota.","channel":"college_cell"},{"stepNumber":4,"title":"Direct DBT Release","description":"Full scholarship grant disbursed directly into student bank account via PFMS DBT.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-aicte-pragati',
  'aicte-pragati-scholarship-scheme-for-girls',
  'AICTE Pragati Scholarship Scheme for Girl Students (Technical Degree/Diploma)',
  '₹50,000 per annum scholarship for girl students admitted to first year of AICTE-approved technical degree or diploma courses.',
  'AICTE Pragati Scholarship Scheme is a flagship scheme by the All India Council for Technical Education (AICTE), Ministry of Education, designed to empower young women by furthering technical education. The scheme provides financial assistance of ₹50,000 per annum for each year of study (4 years for Degree, 3 years for Diploma) towards college tuition fees, purchase of computers, books, software, and equipment. A maximum of two girl children per family are eligible to receive this benefit.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Education',
  'All India Council for Technical Education (AICTE)',
  'https://scholarships.gov.in',
  'free_verified',
  '₹50,000 per annum lump sum credited directly to the student’s bank account for each year of duration of the course (up to 4 years for Degree, 3 years for Diploma, plus lateral entry support).',
  'Female student admitted to 1st year of Degree/Diploma level technical course OR 2nd year through lateral entry in any AICTE-approved institution. Family annual income from all sources must not exceed ₹8,00,000. Maximum two female children per family.',
  '[{"id":"pragati-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Student Only","sourceClause":"AICTE Pragati Guidelines Clause 1 (Eligibility Criteria)"},{"id":"pragati-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Family Annual Income <= ₹8,00,000","sourceClause":"AICTE Pragati Guidelines Clause 3 (Income Ceiling)"},{"id":"pragati-course","parameter":"courseType","operator":"IN","expectedValue":["technical_degree","technical_diploma"],"isMandatory":true,"conditionName":"Regular Full-time AICTE Approved Technical Degree or Diploma","sourceClause":"AICTE Pragati Guidelines Clause 2"},{"id":"pragati-aicte-institute","parameter":"isAicteApprovedInstitute","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Institute Must Have Valid AICTE Approval","sourceClause":"AICTE Approval Mandate Clause 2.1"}]',
  '[{"id":"pragati-doc-allotment","name":"Centralized Admission Allotment Order","description":"Official seat allotment letter issued by state admission authority (e.g., TG EAPCET, KCET, MHT CET, JoSAA).","requirementType":"mandatory","issuingAuthority":"State / Central Admission Authority"},{"id":"pragati-doc-income","name":"Income Certificate (<= ₹8 Lakhs)","description":"Valid revenue income certificate in the name of father/mother.","requirementType":"mandatory","issuingAuthority":"Tahsildar / Competent Revenue Authority"},{"id":"pragati-doc-family-declaration","name":"Family Declaration on Non-Availment (>2 Girls)","description":"Proforma declaration signed by parents stating not more than two girls are claiming the scheme.","requirementType":"mandatory","issuingAuthority":"Notary / Self & Parent Signature"},{"id":"pragati-doc-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Savings account in student’s own name mapped with NPCI.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Register OTR on National Scholarship Portal","description":"Visit scholarships.gov.in, complete OTR eKYC, and select AICTE Pragati Scholarship.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Upload Certificates & College ID","description":"Enter AICTE permanent institute ID, entrance rank, allotment order, and parental income certificate.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Institute Verification","description":"College AICTE Nodal Officer verifies admission, regular attendance, and fee structure.","channel":"college_cell"},{"stepNumber":4,"title":"Disbursement by AICTE","description":"AICTE verifies applications and disburses ₹50,000 directly to the student’s bank account via PFMS.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-aicte-saksham',
  'aicte-saksham-scholarship-differently-abled',
  'AICTE Saksham Scholarship Scheme for Specially-Abled Students',
  '₹50,000 per annum scholarship for specially-abled students (disability >= 40%) admitted to AICTE-approved technical degree or diploma courses.',
  'AICTE Saksham Scholarship is an initiative by the All India Council for Technical Education (AICTE), Ministry of Education, to encourage and support differently-abled youth to pursue technical education. It provides ₹50,000 per annum for each year of course duration to specially-abled students possessing a minimum disability of 40%. The scholarship funds tuition fees, assistive technologies, adaptive software, computers, and books.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Education',
  'All India Council for Technical Education (AICTE)',
  'https://scholarships.gov.in',
  'free_verified',
  '₹50,000 per annum paid directly to student’s bank account for entire duration of degree (up to 4 years) or diploma (up to 3 years) course.',
  'Specially-abled student with disability of not less than 40% certified by competent medical authority, admitted to 1st year (or lateral entry 2nd year) of Degree/Diploma course in an AICTE-approved institution. Family income from all sources must not exceed ₹8,00,000 per annum.',
  '[{"id":"saksham-disability","parameter":"disabilityPercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Minimum 40% Disability Certified by Medical Board","sourceClause":"AICTE Saksham Guidelines Clause 1 (Disability Eligibility)"},{"id":"saksham-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Family Annual Income <= ₹8,00,000","sourceClause":"AICTE Saksham Guidelines Clause 3 (Income Limit)"},{"id":"saksham-course","parameter":"courseType","operator":"IN","expectedValue":["technical_degree","technical_diploma"],"isMandatory":true,"conditionName":"Enrolled in AICTE Approved Technical Degree or Diploma","sourceClause":"AICTE Saksham Guidelines Clause 2"}]',
  '[{"id":"saksham-doc-disability","name":"UDID Card / Disability Certificate","description":"Unique Disability ID (UDID) Card or Disability Certificate certifying at least 40% permanent disability.","requirementType":"mandatory","issuingAuthority":"District Medical Board / Ministry of Social Justice"},{"id":"saksham-doc-allotment","name":"AICTE College Allotment Letter","description":"Centralized counseling admission allotment order.","requirementType":"mandatory","issuingAuthority":"Admission Committee"},{"id":"saksham-doc-income","name":"Income Certificate (<= ₹8 Lakhs)","description":"Revenue income certificate.","requirementType":"mandatory","issuingAuthority":"Tahsildar"}]',
  '[{"stepNumber":1,"title":"NSP Portal Registration","description":"Apply on scholarships.gov.in under AICTE Saksham Scheme using Aadhaar OTR.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Upload Disability Certificate & Academic Proofs","description":"Input UDID number, upload medical board certificate, and select AICTE institution code.","portalUrl":"https://scholarships.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"College Nodal Verification","description":"Institutional Nodal Officer validates student physical admission and attendance.","channel":"college_cell"},{"stepNumber":4,"title":"Scholarship Disbursal","description":"₹50,000 annual grant credited via DBT directly to student’s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-svanidhi',
  'pm-street-vendors-atmanirbhar-nidhi-svanidhi',
  'PM Street Vendor''s AtmaNirbhar Nidhi (PM SVANidhi)',
  'Micro-credit facility providing collateral-free working capital loans of ₹10,000, ₹20,000, and ₹50,000 with 7% interest subsidy for street vendors.',
  'PM Street Vendor’s AtmaNirbhar Nidhi (PM SVANidhi) is a flagship Central Sector Scheme administered by the Ministry of Housing and Urban Affairs (MoHUA). It facilitates affordable collateral-free working capital loans to urban street vendors, hawkers, thelawalas, and rehris. Features a graded credit ladder: 1st tranche loan of up to ₹10,000 (1-year tenure); on timely repayment, 2nd tranche up to ₹20,000; and 3rd tranche up to ₹50,000. Beneficiaries receive a 7% per annum interest subsidy directly credited into bank accounts, and up to ₹1,200 cashback per year on digital UPI sales.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Housing and Urban Affairs',
  'Urban Livelihoods Division',
  'https://pmsvanidhi.mohua.gov.in',
  'free_verified',
  'Collateral-free working capital loan: ₹10,000 (1st Tranche), ₹20,000 (2nd Tranche), and ₹50,000 (3rd Tranche). 7% interest subsidy credited quarterly to bank account; digital cashback of up to ₹100 per month (₹1,200/year) on UPI merchant transactions.',
  'All street vendors engaged in vending in urban areas on or before the qualifying cut-off date, possessing Certificate of Vending (CoV) / Identity Card issued by Urban Local Bodies (ULBs), or identified in Town Vending Committee (TVC) surveys, or possessing Letter of Recommendation (LoR) from ULB.',
  '[{"id":"svanidhi-occupation","parameter":"occupation","operator":"EQUALS","expectedValue":"street_vendor","isMandatory":true,"conditionName":"Engaged in Street Vending / Hawkiing","sourceClause":"PM SVANidhi Scheme Guidelines Para 3 (Target Beneficiaries)"},{"id":"svanidhi-cov-lor","parameter":"hasCertificateOfVendingOrLOR","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Possesses Certificate of Vending (CoV) or Letter of Recommendation (LoR)","sourceClause":"PM SVANidhi Guidelines Para 4 (Identification of Beneficiaries)"},{"id":"svanidhi-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Age 18 Years or Above","sourceClause":"PM SVANidhi Banking Norms"}]',
  '[{"id":"svanidhi-doc-aadhaar","name":"Aadhaar Card","description":"Aadhaar card linked with active mobile number.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"svanidhi-doc-cov","name":"Certificate of Vending (CoV) / Letter of Recommendation (LoR)","description":"Vending identity card or letter issued by Urban Local Body (ULB) / Municipality.","requirementType":"mandatory","issuingAuthority":"Municipal Corporation / Town Vending Committee"},{"id":"svanidhi-doc-bank","name":"Bank Account Passbook","description":"Savings account passbook with IFSC for loan disbursement.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Online Application on Portal or App","description":"Visit pmsvanidhi.mohua.gov.in or download PM SVANidhi App. Enter mobile number linked to Aadhaar.","portalUrl":"https://pmsvanidhi.mohua.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Select Bank & Vending Details","description":"Enter CoV / LoR number, select preferred bank / NBFC / MFI, and request loan amount.","portalUrl":"https://pmsvanidhi.mohua.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Bank Sanction & Disbursal","description":"Bank reviews application within 7-10 working days; funds disbursed directly to savings account.","channel":"district_office"},{"stepNumber":4,"title":"Digital Repayment & Cashback","description":"Repay loan in monthly installments and receive 7% interest subsidy and digital cashback up to ₹100/month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-vishwakarma',
  'pradhan-mantri-vishwakarma-yojana',
  'PM Vishwakarma Scheme (Support for Traditional Artisans and Craftspeople)',
  'Holistic support offering PM Vishwakarma ID, 5-7 days skill training with ₹500/day stipend, ₹15,000 toolkit e-voucher, and collateral-free loans up to ₹3,00,000 at 5% interest.',
  'PM Vishwakarma is a Central Sector Scheme launched with a financial outlay of ₹13,000 crore to provide end-to-end holistic support to traditional artisans and craftspeople working with hands and tools across 18 designated family trades (Carpenter, Boat Maker, Armourer, Blacksmith, Hammer & Toolkit Maker, Locksmith, Sculptor, Goldsmith, Potter, Cobbler, Mason, Basket/Mat/Broom Maker, Doll & Toy Maker, Barber, Garland Maker, Washerman, Tailor, Fishing Net Maker). Features formal government certification, basic and advanced skill training with stipend, ₹15,000 toolkit voucher, collateral-free enterprise credit at 5% concessional interest, and national marketing support.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Micro, Small and Medium Enterprises (MSME)',
  'Department of MSME & Ministry of Skill Development',
  'https://pmvishwakarma.gov.in',
  'free_verified',
  'Recognition as Vishwakarma with Certificate and ID Card; Basic Skill Training (5-7 days) with ₹500 per day stipend; ₹15,000 e-voucher for modern toolkits; Collateral-free Enterprise Development Loan: 1st Tranche of ₹1,00,000 (18 months tenure) and 2nd Tranche of ₹2,00,000 (30 months tenure) at concessional interest rate of 5% (with 8% interest subvention by Government).',
  'Artisan or craftsperson working with hands and tools in one of the 18 designated family-based traditional trades. Minimum age 18 years. Must not have availed loans under similar credit schemes (PMEGP, PM MUDRA, PM SVANidhi) in the last 5 years. Limited to one member per family (husband, wife, and unmarried children). Government servants and their family members are not eligible.',
  '[{"id":"vishwakarma-trade","parameter":"occupationIn18Trades","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Engaged in One of 18 Traditional Family Trades","sourceClause":"PM Vishwakarma Guidelines Section 3 (Designated Trades)"},{"id":"vishwakarma-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"PM Vishwakarma Guidelines Section 4.1"},{"id":"vishwakarma-family-limit","parameter":"oneMemberPerFamily","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"One Beneficiary Per Family Roster","sourceClause":"PM Vishwakarma Guidelines Section 4.3"},{"id":"vishwakarma-prior-credit","parameter":"hasAvailedOtherGovtCreditIn5Years","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"No Outstanding Loan in PMEGP/Mudra in Last 5 Years","sourceClause":"PM Vishwakarma Guidelines Section 4.2"}]',
  '[{"id":"vishwakarma-doc-aadhaar","name":"Aadhaar Card","description":"Mandatory Aadhaar card for biometric authentication at CSC.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"vishwakarma-doc-ration","name":"Ration Card / Family Roster Document","description":"Ration card confirming family members for single-beneficiary check.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Department"},{"id":"vishwakarma-doc-bank","name":"Bank Account Passbook","description":"Active savings bank account details for stipend and loan credit.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"CSC Biometric Registration","description":"Visit the nearest Common Service Centre (CSC) for free biometric verification and trade selection on pmvishwakarma.gov.in.","portalUrl":"https://pmvishwakarma.gov.in","channel":"meeseva_csc"},{"stepNumber":2,"title":"Three-Stage Verification","description":"Application undergoes Stage 1 (Gram Panchayat / ULB Chairman), Stage 2 (District Implementation Committee), and Stage 3 (National Screening Committee).","channel":"district_office"},{"stepNumber":3,"title":"Skill Training & Toolkit e-Voucher","description":"Complete 5-7 days basic skill training at designated center with ₹500/day stipend, followed by ₹15,000 digital toolkit e-voucher credited via e-RUPI.","channel":"district_office"},{"stepNumber":4,"title":"Enterprise Loan Disbursement","description":"Apply for ₹1 Lakh collateral-free loan at 5% interest rate directly through partner commercial banks.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-atal-pension-yojana',
  'atal-pension-yojana-apy',
  'Atal Pension Yojana (APY)',
  'Guaranteed monthly pension of ₹1,000 to ₹5,000 after age 60 for unorganized sector workers based on low monthly contributions starting from ₹42/month.',
  'Atal Pension Yojana (APY) is a government-backed periodic pension scheme targeted at workers in the unorganized sector. Administered by PFRDA under the National Pension System (NPS) architecture, APY guarantees a lifelong minimum monthly pension of ₹1,000, ₹2,000, ₹3,000, ₹4,000, or ₹5,000 from the age of 60 years. The monthly contribution varies based on the entry age (between 18 and 40 years) and the chosen pension slab. The central government guarantees the pension benefit, meeting any shortfall through fiscal support.',
  'pension',
  'central',
  'All India',
  'Ministry of Finance',
  'Pension Fund Regulatory and Development Authority (PFRDA)',
  'https://www.npscra.nsdl.co.in',
  'free_verified',
  'Guaranteed monthly pension of ₹1,000 to ₹5,000 per month starting at age 60 until death. Upon subscriber death, the same pension is paid to spouse for life; upon death of both subscriber and spouse, the total accumulated pension wealth (corpus up to ₹8.5 Lakhs) is returned to the nominee.',
  'Any Indian citizen aged between 18 and 40 years holding a savings bank or post office account. As per revised rules effective October 1, 2022, any citizen who is or has been an income tax payer is NOT eligible to join APY.',
  '[{"id":"apy-age","parameter":"age","operator":"BETWEEN","expectedValue":[18,40],"isMandatory":true,"conditionName":"Entry Age Between 18 and 40 Years","sourceClause":"APY Scheme Notification Clause 2.1"},{"id":"apy-tax-exclusion","parameter":"isIncomeTaxPayer","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Non-Income Tax Payer","sourceClause":"Ministry of Finance Gazetted Notification dated 10 Aug 2022"},{"id":"apy-savings-bank","parameter":"hasSavingsBankAccount","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Active Savings Bank or Post Office Account","sourceClause":"APY Auto-Debit Mandate Rules"}]',
  '[{"id":"apy-doc-aadhaar","name":"Aadhaar Card","description":"Aadhaar identity card for KYC and subscriber identification.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"apy-doc-bank","name":"Savings Bank Account Passbook","description":"Passbook showing account number and IFSC for auto-debit.","requirementType":"mandatory","issuingAuthority":"Bank / Post Office"},{"id":"apy-doc-nominee","name":"Nominee Aadhaar Details","description":"Aadhaar details and relationship proof of spouse/nominee.","requirementType":"mandatory","issuingAuthority":"UIDAI"}]',
  '[{"stepNumber":1,"title":"Approach Bank or Log in to NetBanking","description":"Visit your bank branch, post office, or log in to netbanking/mobile banking app.","channel":"online_portal"},{"stepNumber":2,"title":"Fill APY Subscriber Registration Form","description":"Choose desired monthly pension amount (₹1,000 - ₹5,000) and set contribution frequency (monthly, quarterly, or half-yearly).","portalUrl":"https://www.npscra.nsdl.co.in","channel":"online_portal"},{"stepNumber":3,"title":"Receive PRAN & Confirmation","description":"Permanent Retirement Account Number (PRAN) is generated and sent via SMS.","channel":"online_portal"},{"stepNumber":4,"title":"Monthly Auto-Debit","description":"Monthly contribution is debited automatically until age 60; pension begins on the 60th birthday.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nsap-ignoaps',
  'indira-gandhi-national-old-age-pension-scheme',
  'Indira Gandhi National Old Age Pension Scheme (IGNOAPS - NSAP)',
  'Non-contributory monthly social pension for destitute and Below Poverty Line (BPL) senior citizens aged 60 years and above.',
  'Indira Gandhi National Old Age Pension Scheme (IGNOAPS) is a major component of the National Social Assistance Programme (NSAP) implemented by the Ministry of Rural Development. It provides non-contributory social security monthly pensions to elderly citizens living Below Poverty Line (BPL). The Central Government provides monthly assistance which state governments supplement, ensuring total monthly pension disbursements ranging from ₹1,00,0 to ₹3,000 per month depending on state top-up policies.',
  'pension',
  'central',
  'All India',
  'Ministry of Rural Development',
  'National Social Assistance Programme (NSAP) Division',
  'https://nsap.nic.in',
  'free_verified',
  'Monthly cash pension transferred via DBT. Central base assistance of ₹200/month for age 60-79 years (enhanced by state governments to ₹1,000-₹2,500/month); Central assistance of ₹500/month for age 80 years and above (enhanced by states up to ₹3,000/month).',
  'Individuals aged 60 years or above belonging to a household categorized as Below Poverty Line (BPL) according to the criteria prescribed by the Government of India or state BPL rosters.',
  '[{"id":"ignoaps-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":60,"isMandatory":true,"conditionName":"Age 60 Years or Above","sourceClause":"NSAP Guidelines Section 2.1 (Eligibility Age)"},{"id":"ignoaps-bpl","parameter":"isBPLFamily","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Below Poverty Line (BPL) Household","sourceClause":"NSAP Guidelines Section 2.2 (Poverty Status Verification)"}]',
  '[{"id":"ignoaps-doc-age","name":"Age Proof (Aadhaar / Voter ID / Birth Certificate)","description":"Document verifying age is 60 years or older.","requirementType":"mandatory","issuingAuthority":"UIDAI / Election Commission"},{"id":"ignoaps-doc-bpl","name":"BPL Ration Card / BPL Survey Inclusion Certificate","description":"Proof of family inclusion in BPL list or SECC deprivation roster.","requirementType":"mandatory","issuingAuthority":"District Collector / Civil Supplies Department"},{"id":"ignoaps-doc-bank","name":"Bank / Post Office Savings Passbook","description":"Aadhaar-seeded savings account passbook for monthly pension credit.","requirementType":"mandatory","issuingAuthority":"Bank / India Post"}]',
  '[{"stepNumber":1,"title":"Application Submission at Panchayat / Ward Office","description":"Submit application on prescribed NSAP form at Gram Panchayat / Block Development Office (rural) or Municipality / Ward Office (urban), or apply online at nsap.nic.in.","portalUrl":"https://nsap.nic.in","channel":"district_office"},{"stepNumber":2,"title":"Inquiry & Field Verification","description":"Village Revenue Officer / Panchayat Secretary verifies physical age and economic deprivation.","channel":"district_office"},{"stepNumber":3,"title":"Sanction Order by District Collector / SDM","description":"Sanction order issued with unique NSAP beneficiary pension ID.","channel":"district_office"},{"stepNumber":4,"title":"Monthly DBT Disbursement","description":"Pension credited directly into bank or post office account on a fixed day each month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-daksh',
  'pm-daksh-yojana',
  'Pradhan Mantri Dakshta Aur Kushalta Sampann Hitgrahi (PM-DAKSH)',
  'Free skill development training with stipend (₹1,500 to ₹3,000) and wage compensation for SC, OBC, EBC, DNT youth and sanitation workers.',
  'PM-DAKSH Yojana is implemented by the Ministry of Social Justice and Empowerment through three apex corporations (NSFDC, NBCFDC, and NSKFDC). The scheme provides high-quality market-relevant skill development training to youth belonging to SC, OBC, Economically Backward Classes (EBC), De-Notified Tribes (DNT), and Safai Karamcharis (including waste pickers). Training includes Up-skilling/Re-skilling, Short Term Training, Entrepreneurship Development Programmes (EDP), and Long Term Training, provided completely free of cost with training stipends.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://pmdaksh.dosje.gov.in',
  'free_verified',
  '100% free skill training; Stipend of ₹1,000 to ₹1,500 per month (for courses >1 month with 80%+ attendance); Wage compensation of ₹2,500 per candidate for up-skilling programs; Free assessment, industry certification, and job placement assistance.',
  'Youth aged between 18 and 45 years belonging to Scheduled Castes (SC), Other Backward Classes (OBC with family income <= ₹3 Lakh), Economically Backward Classes (EBC with family income <= ₹1 Lakh), De-Notified Tribes (DNT), or Safai Karamcharis / Sanitation workers (no income limit).',
  '[{"id":"daksh-age","parameter":"age","operator":"BETWEEN","expectedValue":[18,45],"isMandatory":true,"conditionName":"Age Between 18 and 45 Years","sourceClause":"PM-DAKSH Operational Guidelines Section 3"},{"id":"daksh-category","parameter":"targetCategory","operator":"IN","expectedValue":["SC","OBC","EBC","DNT","SafaiKaramchari"],"isMandatory":true,"conditionName":"Belongs to SC, OBC, EBC, DNT or Safai Karamchari Household","sourceClause":"PM-DAKSH Beneficiary Scope Clause 2"},{"id":"daksh-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":300000,"isMandatory":true,"conditionName":"Family Annual Income <= ₹3,00,000 (OBC) / <= ₹1,00,000 (EBC)","sourceClause":"PM-DAKSH Income Norms Clause 4"}]',
  '[{"id":"daksh-doc-caste","name":"Caste / Occupation Certificate","description":"SC / OBC / EBC / DNT certificate or Safai Karamchari identity certificate.","requirementType":"mandatory","issuingAuthority":"Tahsildar / Local Municipal Body"},{"id":"daksh-doc-income","name":"Income Certificate","description":"Revenue income certificate for OBC (<= ₹3L) or EBC (<= ₹1L).","requirementType":"conditional","issuingAuthority":"Tahsildar / Revenue Department"},{"id":"daksh-doc-aadhaar","name":"Aadhaar Card","description":"Aadhaar card for biometric authentication and stipend DBT.","requirementType":"mandatory","issuingAuthority":"UIDAI"}]',
  '[{"stepNumber":1,"title":"Register on PM-DAKSH Portal / App","description":"Visit pmdaksh.dosje.gov.in or download the PM-DAKSH mobile application, and sign up with Aadhaar number.","portalUrl":"https://pmdaksh.dosje.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Select Job Role & Training Institute","description":"Choose training stream (e.g. IT, Automotive, Healthcare, Apparel) and nearest government training center.","portalUrl":"https://pmdaksh.dosje.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Undergo Training & Assessment","description":"Complete classroom/practical sessions with biometric attendance; receive monthly stipend in bank account.","channel":"district_office"},{"stepNumber":4,"title":"Receive Certificate & Job Placement","description":"Receive government-recognized certification and participate in campus placement drives.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-mudra',
  'pradhan-mantri-mudra-yojana-pmmy',
  'Pradhan Mantri MUDRA Yojana (PMMY)',
  'Collateral-free micro-business loans up to ₹20,00,000 under Shishu, Kishore, Tarun, and Tarun Plus categories for non-corporate small enterprises.',
  'Pradhan Mantri MUDRA Yojana (PMMY) is a flagship credit initiative launched to "fund the unfunded" by bringing small micro-enterprises and entrepreneurs into the formal financial ecosystem. Loans require no collateral security and are categorized into four tiers: Shishu (loans up to ₹50,000), Kishore (loans from ₹50,001 to ₹5,00,000), Tarun (loans from ₹5,00,001 to ₹10,00,000), and the enhanced Tarun Plus category (up to ₹20,00,000 for entrepreneurs who have previously repaid Tarun loans). Available across all commercial banks, RRBs, Small Finance Banks, and MFIs.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Finance',
  'Department of Financial Services',
  'https://www.mudra.org.in',
  'free_verified',
  'Institutional collateral-free financing: Shishu (up to ₹50,000), Kishore (₹50,001 to ₹5 Lakh), Tarun (₹5 Lakh to ₹10 Lakh), Tarun Plus (up to ₹20 Lakh). No processing fee for Shishu and Kishore; competitive bank interest rates; issuance of MUDRA RuPay Debit Card for hassle-free working capital withdrawals.',
  'Any Indian citizen with a viable business plan for a non-farm income-generating micro-enterprise in manufacturing, trading, or service sector, as well as allied agricultural activities (dairy, poultry, fisheries, agro-processing).',
  '[{"id":"mudra-business-type","parameter":"isBusinessEnterpriseNonCorporateNonFarm","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Non-Corporate Small Business / Micro-Enterprise","sourceClause":"PMMY Operational Guidelines Section 2"},{"id":"mudra-loan-limit","parameter":"loanRequirementLessThanOrEqual","operator":"LESS_THAN_OR_EQUAL","expectedValue":2000000,"isMandatory":true,"conditionName":"Total Loan Requirement Up to ₹20,00,000","sourceClause":"PMMY Revision Notification Union Budget 2024-25"}]',
  '[{"id":"mudra-doc-kyc","name":"KYC Documents (Aadhaar & PAN)","description":"Identity and address proof of the promoter / proprietor.","requirementType":"mandatory","issuingAuthority":"UIDAI / Income Tax Department"},{"id":"mudra-doc-business-proof","name":"Business Registration / Udyam Certificate","description":"Udyam Aadhaar registration, trade license, or GST certificate.","requirementType":"mandatory","issuingAuthority":"Ministry of MSME / Municipal Corporation"},{"id":"mudra-doc-quotation","name":"Machinery Quotation / Project Estimate","description":"Quotation of items to be purchased or working capital estimate.","requirementType":"mandatory","issuingAuthority":"Supplier / Chartered Accountant / Self"}]',
  '[{"stepNumber":1,"title":"Apply Online via JanSamarth Portal","description":"Visit jansamarth.in or approach any commercial/Gramin bank branch. Select \"Business Activity Loan\" -> PMMY.","portalUrl":"https://www.mudra.org.in","channel":"online_portal"},{"stepNumber":2,"title":"Select Category (Shishu / Kishore / Tarun)","description":"Upload project report, quotations, Udyam certificate, and bank statements for credit scoring.","channel":"online_portal"},{"stepNumber":3,"title":"Bank Appraisal & Sanction","description":"Bank branch evaluates proposal, sanctions loan without asking for third-party guarantee or collateral.","channel":"district_office"},{"stepNumber":4,"title":"Disbursement & MUDRA Card","description":"Loan disbursed to current/savings account, and MUDRA RuPay card issued for flexible cash withdrawal.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-stand-up-india',
  'stand-up-india-scheme',
  'Stand-Up India Scheme for SC/ST and Women Entrepreneurs',
  'Bank loans between ₹10,00,000 and ₹1,00,00,000 for setting up greenfield enterprises in manufacturing, services, or trading by SC/ST or woman entrepreneurs.',
  'Stand-Up India Scheme facilitates institutional bank loans between ₹10 Lakhs and ₹1 Crore to at least one Scheduled Caste (SC) or Scheduled Tribe (ST) borrower and at least one woman borrower per bank branch of all scheduled commercial banks. The credit is meant for setting up a greenfield (first-time) enterprise in manufacturing, services, agri-allied activities, or the trading sector. Supported by Credit Guarantee Fund for Stand Up India (CGFSI) managed by NCGTC.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Finance',
  'Department of Financial Services',
  'https://www.standupmitra.in',
  'free_verified',
  'Composite loan (term loan + working capital) covering up to 85% of project cost between ₹10 Lakh and ₹1 Crore. Repayable in 7 years with an initial moratorium period up to 18 months. Concessional interest rate and collateral-free credit guarantee coverage.',
  'SC/ST individuals or Women entrepreneurs aged 18 years and above setting up a greenfield enterprise. For non-individual enterprises, at least 51% of shareholding and controlling stake must be held by SC/ST or woman entrepreneur. Borrower should not be in default to any bank or financial institution.',
  '[{"id":"standup-sc-st-woman","parameter":"isSCorSTorWoman","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Borrower is SC, ST, or Woman Entrepreneur","sourceClause":"Stand-Up India Guidelines Clause 2.1"},{"id":"standup-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Age 18 Years or Above","sourceClause":"Stand-Up India Guidelines Clause 2.2"},{"id":"standup-greenfield","parameter":"isGreenfieldProject","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"First-time Venture (Greenfield Project)","sourceClause":"Stand-Up India Guidelines Clause 2.3"},{"id":"standup-loan-range","parameter":"loanRequirementAmount","operator":"BETWEEN","expectedValue":[1000000,10000000],"isMandatory":true,"conditionName":"Loan Amount Between ₹10 Lakhs and ₹1 Crore","sourceClause":"Stand-Up India Financial Norms"}]',
  '[{"id":"standup-doc-kyc","name":"Aadhaar, PAN & Caste Certificate","description":"Identity proof and caste certificate (if applying under SC/ST category).","requirementType":"mandatory","issuingAuthority":"UIDAI / Revenue Authority"},{"id":"standup-doc-dpr","name":"Detailed Project Report (DPR)","description":"Comprehensive project business proposal showing financial viability and capital expenditure.","requirementType":"mandatory","issuingAuthority":"Chartered Accountant / Certified Consultant"},{"id":"standup-doc-lease","name":"Land / Factory Shed Lease or Title Deeds","description":"Proof of premises where greenfield unit will operate.","requirementType":"mandatory","issuingAuthority":"Sub-Registrar / Industrial Area Development Board"}]',
  '[{"stepNumber":1,"title":"Register on Stand-Up Mitra Portal","description":"Register on standupmitra.in as \"Ready Borrower\" or \"Trainee Borrower\" looking for handholding support.","portalUrl":"https://www.standupmitra.in","channel":"online_portal"},{"stepNumber":2,"title":"Select Bank Branch & Submit DPR","description":"Choose preferred scheduled commercial bank branch and upload Detailed Project Report and promoter margin proof.","portalUrl":"https://www.standupmitra.in","channel":"online_portal"},{"stepNumber":3,"title":"Credit Appraisal & Sanction","description":"Bank sanctions loan with CGFSI guarantee coverage, requiring minimum 15% borrower margin.","channel":"district_office"},{"stepNumber":4,"title":"Disbursement & Mentorship","description":"Funds disbursed in phases as per project milestones, supported by SIDBI/NABARD handholding agencies.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-sukanya-samriddhi',
  'sukanya-samriddhi-yojana-ssy',
  'Sukanya Samriddhi Yojana (SSY)',
  'High-interest (8.2% p.a.), triple tax-exempt (EEE) government savings scheme for girl children opened before age 10 for higher education and marriage.',
  'Sukanya Samriddhi Account is a sovereign-backed small savings scheme launched under the "Beti Bachao Beti Padhao" campaign to build a secure financial corpus for girl children. It currently offers one of the highest interest rates among Indian small savings instruments (8.2% per annum, compounded annually). Enjoys complete triple tax exemption (EEE status: investment deduction under Section 80C, tax-free annual interest, and tax-free maturity amount). Accounts can be opened in any post office or authorized commercial bank branch.',
  'welfare',
  'central',
  'All India',
  'Ministry of Finance / Women and Child Development',
  'Department of Economic Affairs (Small Savings)',
  'https://www.indiapost.gov.in',
  'free_verified',
  '8.2% annual compounded interest. Minimum deposit ₹250, maximum deposit ₹1,50,000 per financial year. Triple tax exemption under IT Act (EEE). Partial withdrawal up to 50% allowed for higher education after girl turns 18. Account matures after 21 years from opening date or at marriage after age 18.',
  'Resident Indian girl child aged 10 years or younger at the time of account opening. Natural parents or legal guardians can open the account. Maximum two accounts per family (one per girl child, with an exception allowing additional accounts for twins/triplets born in first or second delivery).',
  '[{"id":"ssy-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Girl Child Beneficiary","sourceClause":"Sukanya Samriddhi Account Rules 2019 Rule 3"},{"id":"ssy-age","parameter":"age","operator":"LESS_THAN_OR_EQUAL","expectedValue":10,"isMandatory":true,"conditionName":"Age Less Than or Equal to 10 Years","sourceClause":"Sukanya Samriddhi Account Rules 2019 Rule 4"},{"id":"ssy-accounts-family","parameter":"maxAccountsPerFamily","operator":"LESS_THAN_OR_EQUAL","expectedValue":2,"isMandatory":true,"conditionName":"Maximum Two Accounts Per Family","sourceClause":"Sukanya Samriddhi Account Rules 2019 Rule 3(2)"}]',
  '[{"id":"ssy-doc-birth","name":"Birth Certificate of Girl Child","description":"Official birth certificate issued by municipal authority or registrar of births.","requirementType":"mandatory","issuingAuthority":"Municipal Corporation / Registrar of Births & Deaths"},{"id":"ssy-doc-guardian-kyc","name":"Aadhaar & PAN Card of Parent/Guardian","description":"Identity and address proof of the opening parent or legal guardian.","requirementType":"mandatory","issuingAuthority":"UIDAI / Income Tax Department"},{"id":"ssy-doc-medical-twins","name":"Medical Certificate (in case of Twins/Triplets)","description":"Hospital certificate verifying birth order in case of twin/triplet girl children exceeding two.","requirementType":"conditional","issuingAuthority":"Authorized Hospital Medical Superintendent"}]',
  '[{"stepNumber":1,"title":"Visit Post Office or Bank Branch","description":"Visit any India Post office or authorized public/private commercial bank branch.","channel":"district_office"},{"stepNumber":2,"title":"Submit SSY Account Opening Form","description":"Fill Form-1 with child and guardian details, attach birth certificate and KYC proofs.","portalUrl":"https://www.indiapost.gov.in","channel":"district_office"},{"stepNumber":3,"title":"Deposit Initial Amount","description":"Deposit initial subscription (minimum ₹250) in cash, cheque, or online transfer.","channel":"district_office"},{"stepNumber":4,"title":"Collect Passbook","description":"Collect physical/digital passbook showing SSY account number, interest rate, and maturity schedule.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-matru-vandana',
  'pradhan-mantri-matru-vandana-yojana-pmmvy',
  'Pradhan Mantri Matru Vandana Yojana (PMMVY)',
  'Direct maternity cash benefit of ₹5,000 for first child and ₹6,000 for second child (if girl) for pregnant and lactating mothers.',
  'Pradhan Mantri Matru Vandana Yojana (PMMVY) is a Centrally Sponsored direct benefit transfer conditional cash scheme under the umbrella Mission Shakti. The scheme provides cash incentive as partial wage compensation for pregnant women and lactating mothers (PW&LM), encouraging early ante-natal check-ups (ANC), institutional delivery, and child vaccination. Under revamped Mission Shakti rules, mothers receive ₹5,000 in two installments for the first child, and an incentive of ₹6,000 in a single installment for the second child provided the newborn child is a girl.',
  'welfare',
  'central',
  'All India',
  'Ministry of Women and Child Development',
  'Maternal and Child Nutrition Division',
  'https://pmmvy.wcd.gov.in',
  'free_verified',
  'First Child: ₹5,000 total (Installment 1: ₹3,000 on registration of pregnancy and at least one ANC within 6 months; Installment 2: ₹2,000 on registration of child birth and completion of first cycle of immunizations). Second Child: ₹6,000 in a single installment if the second child is female, upon birth registration and full primary immunization.',
  'Pregnant women and lactating mothers who belong to socially and economically disadvantaged categories (holding BPL/NFSA ration card, e-Shram card, MGNREGA job card, PM-JAY card, SC/ST, or family income < ₹8L). Excludes mothers in regular employment with Central or State Government or Public Sector Undertakings (PSUs).',
  '[{"id":"pmmvy-maternity-status","parameter":"isPregnantOrLactatingMother","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Pregnant Woman or Lactating Mother","sourceClause":"PMMVY Guidelines Section 2 (Target Beneficiaries)"},{"id":"pmmvy-govt-emp-exclusion","parameter":"isRegularGovtEmployee","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Not a Regular Government or PSU Employee","sourceClause":"PMMVY Guidelines Section 3 (Exclusion Criteria)"},{"id":"pmmvy-social-category","parameter":"meetsSocialDisadvantagedCriteria","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Belongs to Eligible Socially/Economically Weaker Section","sourceClause":"PMMVY Mission Shakti Guidelines Clause 4.1"}]',
  '[{"id":"pmmvy-doc-mcp","name":"Mother and Child Protection (MCP) Card","description":"MCP Card containing LMP date, ANC registration stamp, and immunization records.","requirementType":"mandatory","issuingAuthority":"Public Health Centre / Anganwadi Centre"},{"id":"pmmvy-doc-aadhaar","name":"Aadhaar Card of Mother & Husband","description":"Aadhaar identification proof of the mother.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmmvy-doc-bank","name":"Aadhaar-Seeded Bank Account Passbook","description":"Bank passbook of mother with NPCI mapping.","requirementType":"mandatory","issuingAuthority":"Bank"},{"id":"pmmvy-doc-child-birth","name":"Child Birth Registration Certificate","description":"Official birth certificate for claiming installment 2 (or second child grant).","requirementType":"mandatory","issuingAuthority":"Registrar of Births / Municipal Health Office"}]',
  '[{"stepNumber":1,"title":"Register Pregnancy at Anganwadi / Health Sub-Centre","description":"Register pregnancy within 570 days of LMP at local Anganwadi Centre (AWC) to obtain Mother & Child Protection (MCP) card.","channel":"district_office"},{"stepNumber":2,"title":"Apply on PMMVY Portal (Self or through ASHA/AWW)","description":"Visit pmmvy.wcd.gov.in or submit form to Anganwadi Worker with Aadhaar and bank details.","portalUrl":"https://pmmvy.wcd.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Claim Installment 1","description":"Receive ₹3,000 via DBT upon completing early ANC registration and check-up.","channel":"online_portal"},{"stepNumber":4,"title":"Claim Installment 2 (or Second Child ₹6,000)","description":"Submit child birth certificate and proof of primary immunization (OPV, BCG, DPT/Pentavalent) to trigger final installment.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-beti-bachao-beti-padhao',
  'beti-bachao-beti-padhao-bbbp',
  'Beti Bachao Beti Padhao (BBBP)',
  'National multi-sectoral initiative preventing gender-biased sex selection, promoting girl child survival, protection, and 100% secondary school completion.',
  'Beti Bachao Beti Padhao (BBBP) is a flagship joint initiative coordinated by the Ministry of Women and Child Development, Ministry of Health and Family Welfare, and Ministry of Education. Operating nationwide across all 765+ districts, BBBP addresses the declining Child Sex Ratio (CSR) and works to eliminate gender-biased sex selection (enforcing PC-PNDT Act), promote institutional deliveries, ensure 100% girl child secondary education retention, provide career counseling in STEM, and eradicate child marriage.',
  'welfare',
  'central',
  'All India',
  'Ministry of Women and Child Development',
  'Joint Initiative with Health & Education Ministries',
  'https://wcd.nic.in/bbbp-schemes',
  'free_verified',
  'Comprehensive institutional benefits including admission fee waivers, provision of free textbooks/uniforms and sanitary hygiene kits in government schools, admission facilitation in Kasturba Gandhi Balika Vidyalayas (KGBVs), self-defense training, and career counseling.',
  'Universal coverage for all girl children, adolescent girls, and parents of girl children across all states and districts in India.',
  '[{"id":"bbbp-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Girl Child / Adolescent Female","sourceClause":"BBBP Operational Framework Guidelines Section 1"},{"id":"bbbp-resident","parameter":"isResidentOfIndia","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident Citizen of India","sourceClause":"BBBP Scheme Scope"}]',
  '[{"id":"bbbp-doc-birth","name":"Birth Certificate / Institutional Birth Slip","description":"Birth registration certificate.","requirementType":"mandatory","issuingAuthority":"Municipal Registrar / Hospital"},{"id":"bbbp-doc-school","name":"School Enrollment Certificate","description":"Bonafide certificate confirming admission in recognized school.","requirementType":"mandatory","issuingAuthority":"Headmaster / Principal"}]',
  '[{"stepNumber":1,"title":"Institutional Birth & Local Anganwadi Enrollment","description":"Register newborn girl child at local Anganwadi Centre / Primary Health Centre.","channel":"district_office"},{"stepNumber":2,"title":"School Enrollment & BBBP Benefit Linkage","description":"Enroll in local government school or KGBV with free uniforms, books, and hygiene kits provided under Samagra Shiksha convergence.","channel":"college_cell"},{"stepNumber":3,"title":"Participate in Mentorship & Skill Drives","description":"Access school-level STEM mentorship, self-defense workshops, and career readiness camps organized by district task forces.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmay-urban-2',
  'pradhan-mantri-awas-yojana-urban-2',
  'Pradhan Mantri Awas Yojana - Urban 2.0 (PMAY-U 2.0)',
  'Housing for All mission providing financial subsidy of ₹2.50 Lakhs to ₹3.00 Lakhs for constructing or purchasing pucca houses for 1 crore urban poor and middle-class families.',
  'Pradhan Mantri Awas Yojana - Urban 2.0 (PMAY-U 2.0) is a major national urban housing initiative with a central outlay of ₹10 lakh crore to fulfill the housing needs of 1 crore urban poor and middle-class families over 5 years. It operates through four distinct verticals: Beneficiary-Led Construction (BLC), Affordable Housing in Partnership (AHP), Affordable Rental Housing Complexes (ARHC), and the Interest Subsidy Scheme (ISS) for home loans up to ₹25 Lakhs (property value up to ₹35 Lakhs) for EWS, LIG, and Middle Income Group (MIG) families.',
  'housing',
  'central',
  'All India',
  'Ministry of Housing and Urban Affairs',
  'Housing for All (HFA) Division',
  'https://pmay-urban.gov.in',
  'free_verified',
  'Financial subsidy of ₹2.50 Lakhs (under BLC and AHP verticals paid in milestone-based installments). Under Interest Subsidy Scheme (ISS), 4% interest subsidy on home loans up to ₹25 Lakhs (maximum total subsidy benefit of ₹1.80 Lakhs) credited upfront into the home loan account, significantly reducing EMIs.',
  'Families comprising husband, wife, and unmarried children living in statutory urban towns. Beneficiary family must not own a pucca house in their name anywhere in India. Income categories: Economically Weaker Section (EWS, annual income up to ₹3 Lakh), Low Income Group (LIG, annual income ₹3 to 6 Lakh), Middle Income Group (MIG, annual income ₹6 to 9 Lakh). Mandatory female ownership or co-ownership of house.',
  '[{"id":"pmayu-pucca-house","parameter":"ownsPuccaHouseAnywhereInIndia","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Does Not Own Any Pucca House in India","sourceClause":"PMAY-U 2.0 Operational Guidelines Clause 3.1"},{"id":"pmayu-urban-resident","parameter":"residentInUrbanArea","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident of Statutory Urban Town / Planning Area","sourceClause":"PMAY-U 2.0 Guidelines Clause 2"},{"id":"pmayu-income","parameter":"familyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":900000,"isMandatory":true,"conditionName":"Family Annual Income <= ₹9,00,000 (EWS/LIG/MIG)","sourceClause":"PMAY-U 2.0 Income Classification Matrix"}]',
  '[{"id":"pmayu-doc-aadhaar","name":"Aadhaar Cards of All Family Members","description":"Aadhaar identification proof of applicant, spouse, and dependents.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmayu-doc-income","name":"Income Certificate / Salary Slips / ITR","description":"Document verifying annual household income under ₹9 Lakhs.","requirementType":"mandatory","issuingAuthority":"Tahsildar / Employer / IT Dept"},{"id":"pmayu-doc-land","name":"Land Ownership Document / Sale Deed (for BLC)","description":"Registered title deed or patta proving ownership of land for house construction.","requirementType":"conditional","issuingAuthority":"Revenue / Sub-Registrar Office"},{"id":"pmayu-doc-affidavit","name":"Notarized Affidavit (No Pucca House)","description":"Affidavit declaring that no family member owns a pucca house in India.","requirementType":"mandatory","issuingAuthority":"Notary Public"}]',
  '[{"stepNumber":1,"title":"Online Application or Citizen CSC","description":"Visit pmay-urban.gov.in or visit nearest Municipal Corporation / CSC to submit application.","portalUrl":"https://pmay-urban.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Select Component Vertical","description":"Choose Beneficiary Led Construction (BLC) if building on own plot, or ISS if availing home loan from bank.","portalUrl":"https://pmay-urban.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Municipal Scrutiny & Geo-Tagging","description":"Municipal engineers conduct geo-tagging of plot and verify building plan approval.","channel":"district_office"},{"stepNumber":4,"title":"Direct Subsidy Release","description":"Subsidy credited directly into bank account in construction stages (plinth, roof, completion) or upfront into home loan account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmay-gramin',
  'pradhan-mantri-awas-yojana-gramin-pmay-g',
  'Pradhan Mantri Awas Yojana - Gramin (PMAY-G)',
  'Financial assistance of ₹1,20,000 (plains) or ₹1,30,000 (hills) plus 90-95 days MGNREGA wages and ₹12,000 toilet aid for constructing a 25 sq.m pucca house.',
  'Pradhan Mantri Awas Yojana - Gramin (PMAY-G) is a premier rural housing scheme implemented by the Ministry of Rural Development. It aims to achieve "Housing for All" in rural areas by providing direct financial assistance to all houseless families and those living in dilapidated/kutcha houses. Beneficiaries build a minimum 25 sq. meter pucca house with a hygienic cooking space. Eligible households are identified strictly from SECC 2011 and updated Awaas+ survey lists verified by local Gram Sabhas.',
  'housing',
  'central',
  'All India',
  'Ministry of Rural Development',
  'Rural Housing Division',
  'https://pmayg.nic.in',
  'free_verified',
  'Direct unit financial assistance of ₹1,20,000 in plain areas and ₹1,30,000 in hilly/difficult/NE states and IAP districts. Additionally, 90 to 95 person-days of unskilled labor support under MGNREGA (approx ₹20,000 to ₹25,000), ₹12,000 financial aid for toilet construction under Swachh Bharat Mission (Grameen), and free LPG connection under PM Ujjwala Yojana.',
  'Rural families living in kutcha/dilapidated houses or without shelter, identified in the SECC 2011 Permanent Waitlist or Awaas+ survey and approved by Gram Sabha. Excludes families owning motorized 2/3/4 wheelers, mechanized agricultural equipment, Kisan Credit Card with credit limit >= ₹50,000, or family members working in government.',
  '[{"id":"pmayg-rural","parameter":"isRuralResident","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident of Rural Gram Panchayat","sourceClause":"PMAY-G Framework for Implementation Section 2"},{"id":"pmayg-houseless-kutcha","parameter":"livesInKutchaHouseOrHouseless","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Houseless or Living in Kutcha/Dilapidated House","sourceClause":"PMAY-G Guidelines Clause 2.1 (Housing Deprivation)"},{"id":"pmayg-awaas-list","parameter":"inSeccAwaasPlusList","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Included in SECC 2011 / Awaas+ Priority List","sourceClause":"PMAY-G Priority Ranking Clause 3"},{"id":"pmayg-vehicle-exclusion","parameter":"ownsMotorizedVehicleOrTractor","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Does Not Own Motorized Vehicle / Tractor","sourceClause":"PMAY-G 13-Point Exclusion Criteria"}]',
  '[{"id":"pmayg-doc-aadhaar","name":"Aadhaar Card of All Adult Members","description":"Mandatory Aadhaar credentials for family authentication.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmayg-doc-job-card","name":"MGNREGA Job Card","description":"Job card number to link 90-95 days unskilled labor wage payout.","requirementType":"mandatory","issuingAuthority":"Gram Panchayat"},{"id":"pmayg-doc-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Bank passbook where construction installments are credited via FTO.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Gram Sabha Verification & Prioritization","description":"Gram Sabha scrutinizes and publishes the annual priority list from Awaas+ database.","channel":"district_office"},{"stepNumber":2,"title":"Geo-Tagging of Old Site via AwaasApp","description":"Block/Panchayat officials photograph and geo-tag the existing kutcha structure.","channel":"district_office"},{"stepNumber":3,"title":"First Installment Release","description":"Sanction letter issued; 1st installment (approx ₹40,000) credited via Fund Transfer Order (FTO) directly into bank account.","portalUrl":"https://pmayg.nic.in","channel":"online_portal"},{"stepNumber":4,"title":"Milestone Geo-Tagging & Subsequent Installments","description":"Geo-tagging at plinth level and lintel/roof level unlocks 2nd and 3rd installments, alongside MGNREGA wages and SBM toilet grant.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-mgnrega',
  'mahatma-gandhi-national-rural-employment-guarantee-act',
  'Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA)',
  'Legal guarantee of 100 days of wage employment per financial year to rural households whose adult members volunteer for unskilled manual work.',
  'The Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA) is an Indian social welfare legal enactment that guarantees the "right to work". It legally mandates the provision of at least 100 days of guaranteed wage employment in every financial year to every rural household whose adult members volunteer to do unskilled manual work. If employment is not provided within 15 days of applying, the applicant is entitled to a statutory unemployment allowance. Wages are notified by the Ministry of Rural Development and disbursed directly via Aadhaar Based Payment System (ABPS).',
  'livelihood',
  'central',
  'All India',
  'Ministry of Rural Development',
  'MGNREGA Division',
  'https://nrega.nic.in',
  'free_verified',
  'Statutory guarantee of 100 days of wage employment per rural household per year (extended up to 150 days in natural calamity notified areas). Wages disbursed directly into bank accounts via ABPS within 15 days of work muster roll closure. Statutory state-notified daily wages range from ₹234 to ₹374 per day.',
  'Adult members (aged 18+) of any rural household residing in the Gram Panchayat who volunteer to do unskilled manual labor. Men and women receive equal wages.',
  '[{"id":"nrega-rural","parameter":"isRuralResident","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident of Local Gram Panchayat","sourceClause":"MGNREGA Operational Guidelines Section 2.1"},{"id":"nrega-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"MGNREGA Act Section 3(1)"},{"id":"nrega-unskilled","parameter":"willingToDoUnskilledManualWork","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Willing to Undertake Unskilled Manual Work","sourceClause":"MGNREGA Act Schedule II"}]',
  '[{"id":"nrega-doc-aadhaar","name":"Aadhaar Card","description":"Aadhaar card linked with bank account for ABPS payments.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"nrega-doc-photo","name":"Passport Sized Photographs","description":"Photographs of all adult members seeking job card enrollment.","requirementType":"mandatory","issuingAuthority":"Self"},{"id":"nrega-doc-bank","name":"Savings Bank / Post Office Account Passbook","description":"Passbook showing NPCI-mapped account details.","requirementType":"mandatory","issuingAuthority":"Bank / Post Office"}]',
  '[{"stepNumber":1,"title":"Apply for Job Card at Gram Panchayat","description":"Submit written or oral application to Gram Panchayat office with Aadhaar and family details.","channel":"district_office"},{"stepNumber":2,"title":"Free Job Card Issuance within 15 Days","description":"Panchayat verifies details and issues free laminated Job Card containing unique household ID.","channel":"district_office"},{"stepNumber":3,"title":"Submit Work Demand (Form 1)","description":"Submit application for work specifying dates. Panchayat must allocate work within 5 km of village within 15 days.","channel":"district_office"},{"stepNumber":4,"title":"Work Execution & ABPS Wage Credit","description":"Work recorded on digital muster roll using National Mobile Monitoring System (NMMS); wages credited weekly via DBT.","portalUrl":"https://nrega.nic.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-day-nrlm',
  'deendayal-antyodaya-yojana-national-rural-livelihoods-mission',
  'Deendayal Antyodaya Yojana - National Rural Livelihoods Mission (DAY-NRLM / Lakhpati Didi)',
  'Mobilizing rural women into Self-Help Groups (SHGs) with Revolving Funds, Community Investment Funds, and subsidized bank linkage, targeting 3 crore Lakhpati Didis.',
  'Deendayal Antyodaya Yojana - National Rural Livelihoods Mission (DAY-NRLM) is a flagship poverty alleviation programme implemented by the Ministry of Rural Development. It mobilizes rural poor women into Self-Help Groups (SHGs) and federations, building financial autonomy and sustainable livelihood micro-enterprises. Under the national "Lakhpati Didi" initiative, DAY-NRLM provides technical training, market linkages, and credit access to enable SHG women to earn a sustainable annual income of at least ₹1,00,000. Provides Revolving Funds, Community Investment Funds, and collateral-free bank loans up to ₹20 Lakhs with interest subvention down to 7%.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Rural Development',
  'Rural Livelihoods Division',
  'https://nrlm.gov.in',
  'free_verified',
  'Revolving Fund (RF) of ₹20,000 to ₹30,000 per SHG; Community Investment Fund (CIF) up to ₹1,50,000; Collateral-free bank loans up to ₹10 Lakhs (and up to ₹20 Lakhs under SHG Bank Linkage); Interest subvention reducing effective interest rate to 7% (and 4% for prompt repayment on loans up to ₹3 Lakhs); Specialized training in drone piloting (Drone Didi), agro-enterprises, and dairy value chains.',
  'Rural women, especially from poor, ultra-poor, SC/ST, and vulnerable households participating actively in an affinity Self-Help Group (SHG) practicing "Panchasutra" (regular meetings, regular savings, regular internal lending, timely repayment, and up-to-date book-keeping).',
  '[{"id":"nrlm-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Member","sourceClause":"DAY-NRLM Framework Section 3"},{"id":"nrlm-rural","parameter":"isRuralResident","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident in Rural Gram Panchayat","sourceClause":"DAY-NRLM Guidelines Section 2"},{"id":"nrlm-shg-member","parameter":"isMemberOfRegisteredSHG","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Active Member of Registered Women SHG","sourceClause":"DAY-NRLM Panchasutra Compliance Rules"}]',
  '[{"id":"nrlm-doc-aadhaar","name":"Aadhaar Card","description":"Aadhaar card of the woman SHG member.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"nrlm-doc-shg-res","name":"SHG Resolution & Passbook Copy","description":"Resolution signed by group office bearers with SHG bank passbook.","requirementType":"mandatory","issuingAuthority":"Self-Help Group / Bank"}]',
  '[{"stepNumber":1,"title":"Join or Form Women SHG in Village","description":"Join an existing Village Organization (VO) or form a group of 10-20 women guided by Community Resource Persons (CRPs).","channel":"district_office"},{"stepNumber":2,"title":"Open Group Bank Account & Practice Panchasutra","description":"Open a joint savings account in local bank; practice weekly thrift savings and internal loan rotation.","channel":"district_office"},{"stepNumber":3,"title":"Receive Revolving Fund & Community Investment Fund","description":"Panchayat Level Federation / NRLM evaluates grading and releases RF (₹20,000-₹30,000) and CIF (up to ₹1.5 Lakhs).","portalUrl":"https://nrlm.gov.in","channel":"online_portal"},{"stepNumber":4,"title":"Avail Subsidized Bank Credit & Lakhpati Training","description":"Formulate Micro-Investment Plan (MIP) to access collateral-free bank credit up to ₹10-20 Lakhs and undergo enterprise skilling.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-surya-ghar',
  'pm-surya-ghar-muft-bijli-yojana',
  'PM Surya Ghar: Muft Bijli Yojana (Rooftop Solar Scheme)',
  'Direct central capital subsidy up to ₹78,000 for installing residential rooftop solar systems, providing up to 300 units of free electricity per month.',
  'PM Surya Ghar: Muft Bijli Yojana is a flagship national initiative with an outlay of ₹75,021 crore aimed at lighting up 1 crore residential households by installing rooftop solar plants. The scheme delivers substantial financial assistance directly into bank accounts: ₹30,000 for 1 kW systems, ₹60,000 for 2 kW systems, and ₹78,000 for 3 kW and higher systems. It provides households with up to 300 units of free electricity every month, reduces power bills to zero, allows selling surplus electricity back to the grid via net-metering, and offers collateral-free bank loans at just 7% interest.',
  'welfare',
  'central',
  'All India',
  'Ministry of New and Renewable Energy (MNRE)',
  'Grid Connected Solar Rooftop Division',
  'https://pmsuryaghar.gov.in',
  'free_verified',
  'Direct Benefit Transfer (DBT) capital subsidy: ₹30,000 for 1 kW capacity; ₹60,000 for 2 kW capacity; ₹78,000 for 3 kW capacity and above (for residential consumers). Free electricity up to 300 units/month; net-metering income from export of surplus units; collateral-free low-interest bank loans up to ₹2 Lakhs at 7% p.a.',
  'Any residential household in India with a valid domestic grid electricity connection (consumer number) and suitable unshaded rooftop space or ground area within the premises. Open to all income categories.',
  '[{"id":"suryaghar-connection","parameter":"hasResidentialElectricityConnection","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Active Domestic Electricity Connection","sourceClause":"PM Surya Ghar Operational Guidelines Section 2"},{"id":"suryaghar-roof","parameter":"hasSuitableRoofSpace","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Adequate Unshaded Rooftop / Terrace Space","sourceClause":"MNRE Technical Feasibility Norms"},{"id":"suryaghar-citizen","parameter":"isResidentOfIndia","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident Citizen of India","sourceClause":"PM Surya Ghar Scheme Rules"}]',
  '[{"id":"suryaghar-doc-bill","name":"Recent Electricity Bill","description":"Latest electricity bill showing domestic consumer CA number and sanctioned load.","requirementType":"mandatory","issuingAuthority":"State Electricity Distribution Company (DISCOM)"},{"id":"suryaghar-doc-aadhaar","name":"Aadhaar Card of Electricity Account Holder","description":"Aadhaar card matching name on the electricity bill.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"suryaghar-doc-bank","name":"Bank Passbook / Cancelled Cheque","description":"Account details of electricity subscriber for DBT subsidy credit.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Register on National Portal","description":"Visit pmsuryaghar.gov.in, select State and Electricity Distribution Company (DISCOM), and enter Consumer Account Number.","portalUrl":"https://pmsuryaghar.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Apply for Rooftop Solar & Feasibility Approval","description":"Submit proposed solar capacity (kW) and receive technical feasibility approval from DISCOM online.","portalUrl":"https://pmsuryaghar.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Installation through Registered Vendor","description":"Select registered vendor; get solar panels installed using ALMM-compliant domestic solar cells/modules.","channel":"meeseva_csc"},{"stepNumber":4,"title":"Net Meter Commissioning & DBT Subsidy","description":"DISCOM inspects plant and installs net meter; submit bank account details to receive up to ₹78,000 DBT subsidy within 30 days.","portalUrl":"https://pmsuryaghar.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-ujjwala-2',
  'pradhan-mantri-ujjwala-yojana-2',
  'Pradhan Mantri Ujjwala Yojana 2.0 (PMUY 2.0)',
  'Deposit-free LPG connection along with first cylinder refill and gas stove completely free of cost, plus ₹300 per refill targeted subsidy for poor women.',
  'Pradhan Mantri Ujjwala Yojana 2.0 (PMUY 2.0) is a premier social welfare initiative by the Ministry of Petroleum and Natural Gas. The scheme aims to safeguard the health of women and children by providing clean cooking fuel (LPG) to rural and deprived households to replace hazardous firewood and biomass. Ujjwala 2.0 provides a deposit-free LPG connection, free first cylinder refill, and a free two-burner hotplate (stove). In addition, beneficiaries receive an ongoing targeted subsidy of ₹300 per 14.2 kg cylinder for up to 12 refills per year credited directly to their bank account. Migrant families can apply using self-declaration for proof of address.',
  'welfare',
  'central',
  'All India',
  'Ministry of Petroleum and Natural Gas',
  'LPG Marketing Division',
  'https://www.pmuy.gov.in',
  'free_verified',
  '100% deposit-free new LPG connection (security deposit of cylinder and regulator waived). First 14.2 kg LPG cylinder refill and two-burner gas stove provided totally free of cost. Ongoing targeted subsidy of ₹300 per 14.2 kg refill (up to 12 refills per annum) directly credited into bank account.',
  'Adult woman (18 years and above) belonging to a poor household (SC, ST, PMAY Gramin beneficiary, Antyodaya Anna Yojana, Forest dwellers, Most Backward Classes, Tea garden tribes, River islands, or declared poor under 14-point declaration). Must not have any existing LPG connection in the same household.',
  '[{"id":"pmuy-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Adult Woman Applicant","sourceClause":"PMUY 2.0 Guidelines Clause 2.1"},{"id":"pmuy-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"PMUY 2.0 Guidelines Clause 2.2"},{"id":"pmuy-no-existing-lpg","parameter":"hasExistingLPGInHousehold","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"No Existing LPG Connection in Household","sourceClause":"PMUY 2.0 De-duplication Clause 3"},{"id":"pmuy-poor-household","parameter":"isPoorHousehold","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Belongs to Eligible BPL / SC-ST / Deprived Category","sourceClause":"PMUY 2.0 Beneficiary Categories"}]',
  '[{"id":"pmuy-doc-aadhaar","name":"Aadhaar Card of Applicant & Adult Family Members","description":"Mandatory Aadhaar card for KYC verification.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmuy-doc-ration","name":"Ration Card / Family Composition Document","description":"Ration card or Annexure-I declaration proving family roster.","requirementType":"mandatory","issuingAuthority":"Food & Civil Supplies Department"},{"id":"pmuy-doc-bank","name":"Aadhaar-Linked Bank Account Passbook","description":"Savings account passbook with IFSC for receiving ₹300 refill subsidy.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Apply Online or Visit Local LPG Agency","description":"Apply on pmuy.gov.in or visit nearest LPG distributor (Indane, Bharatgas, or HP Gas).","portalUrl":"https://www.pmuy.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Submit eKYC & Family Details","description":"Perform biometric Aadhaar eKYC and enter family roster to clear de-duplication check.","channel":"district_office"},{"stepNumber":3,"title":"Receive Deposit-Free Connection, Stove & Cylinder","description":"LPG distributor issues blue book/subscription voucher and delivers free filled gas cylinder, regulator, and stove.","channel":"district_office"},{"stepNumber":4,"title":"Avail ₹300 Refill Subsidy","description":"Book refills via phone/app; ₹300 per cylinder DBT subsidy credited to bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmkvy-4',
  'pradhan-mantri-kaushal-vikas-yojana-pmkvy-4',
  'Pradhan Mantri Kaushal Vikas Yojana 4.0 (PMKVY 4.0)',
  'Free industry-relevant skill training in future-ready technologies (AI, Robotics, 3D Printing, Drones, IoT) and traditional crafts with government certification and placement.',
  'Pradhan Mantri Kaushal Vikas Yojana 4.0 (PMKVY 4.0) is the flagship skill certification scheme of the Ministry of Skill Development and Entrepreneurship (MSDE), delivered via the Skill India Digital Hub (SIDH). The fourth iteration places heavy focus on Industry 4.0 courses, future skills (Artificial Intelligence, Robotics, Mechatronics, 3D Printing, Drone Piloting and Maintenance, Internet of Things), green skills, and specialized crafts. Offers Short Term Training (STT), Recognition of Prior Learning (RPL), and Special Projects. All training, assessment, and certification costs are 100% sponsored by the Government of India.',
  'education_aid',
  'central',
  'All India',
  'Ministry of Skill Development and Entrepreneurship (MSDE)',
  'National Skill Development Corporation (NSDC)',
  'https://www.skillindiadigital.gov.in',
  'free_verified',
  '100% free NSQF-aligned training courses; free assessment and QR-coded digital Skill Certificate by Sector Skill Councils; accidental insurance coverage; post-training placement support and Rozgar Melas; on-the-job training (OJT) stipends and transit allowances.',
  'Indian citizens aged between 15 and 45 years who are school/college dropouts or unemployed youth seeking to acquire industry-ready technical skills.',
  '[{"id":"pmkvy-age","parameter":"age","operator":"BETWEEN","expectedValue":[15,45],"isMandatory":true,"conditionName":"Age Between 15 and 45 Years","sourceClause":"PMKVY 4.0 Guidelines Section 3.1"},{"id":"pmkvy-citizen","parameter":"isResidentOfIndia","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Resident Citizen of India","sourceClause":"PMKVY 4.0 Scheme Scope"}]',
  '[{"id":"pmkvy-doc-aadhaar","name":"Aadhaar Card","description":"Mandatory Aadhaar card for biometric daily attendance on AEBAS.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"pmkvy-doc-edu","name":"Educational Marksheet / School Leaving Certificate","description":"Proof of highest educational qualification (Class 5th, 8th, 10th, 12th, or ITI/Degree).","requirementType":"mandatory","issuingAuthority":"School / College / Board"},{"id":"pmkvy-doc-bank","name":"Bank Account Passbook","description":"Passbook copy for direct credit of conveyance allowance or stipend.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Sign Up on Skill India Digital Hub (SIDH)","description":"Visit skillindiadigital.gov.in and create a digital candidate profile using Aadhaar eKYC.","portalUrl":"https://www.skillindiadigital.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Find Job Role & Accredited Training Center","description":"Search courses by sector (e.g., Electronics, Drones, Green Jobs, IT) and select a nearby Pradhan Mantri Kaushal Kendra (PMKK).","portalUrl":"https://www.skillindiadigital.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Undergo Training & Biometric Attendance","description":"Attend practical and theoretical modules with biometric daily punch-in; complete on-the-job internship.","channel":"district_office"},{"stepNumber":4,"title":"Assessment & Skill Credential","description":"Pass third-party assessment to receive NSQF Skill Certificate and participate in placement drives.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-naps-2',
  'national-apprenticeship-promotion-scheme-naps-2',
  'National Apprenticeship Promotion Scheme (NAPS-2)',
  'Practical shop-floor apprenticeship with stipend where Government pays 25% of monthly stipend (up to ₹1,500/month) directly to apprentice bank account via DBT.',
  'National Apprenticeship Promotion Scheme (NAPS-2) is implemented by the Ministry of Skill Development and Entrepreneurship (MSDE) under the Apprentices Act, 1961. The scheme promotes industry apprenticeships by sharing the financial stipend burden with employers. The Central Government transfers 25% of the prescribed monthly stipend (up to a maximum of ₹1,500 per month per apprentice) directly into the bank accounts of apprentices via Direct Benefit Transfer (DBT). Upon completion, apprentices undergo assessment to receive the globally recognized National Apprenticeship Certificate (NAC).',
  'livelihood',
  'central',
  'All India',
  'Ministry of Skill Development and Entrepreneurship (MSDE)',
  'Directorate General of Training (DGT)',
  'https://www.apprenticeshipindia.gov.in',
  'free_verified',
  'Hands-on industrial training in registered companies; guaranteed monthly stipend (ranging from ₹7,000 to ₹12,000/month depending on educational qualification) with ₹1,500/month paid directly by Central Government through DBT; National Apprenticeship Certificate (NAC) recognized across public and private sectors globally.',
  'Candidates aged 14 years and above (18+ for hazardous occupations), possessing minimum educational qualifications prescribed for the trade (ranging from Class 5th pass, 8th, 10th, 12th, to ITI, Diploma, or Graduate degree). Candidate must not have previously completed apprenticeship in the same trade.',
  '[{"id":"naps-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":14,"isMandatory":true,"conditionName":"Minimum Age 14 Years","sourceClause":"Apprentices Act 1961 Section 3"},{"id":"naps-prior-apprentice","parameter":"priorApprenticeshipCompleted","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"Has Not Completed Prior Apprenticeship in Same Trade","sourceClause":"NAPS-2 Guidelines Clause 4.2"},{"id":"naps-min-edu","parameter":"hasMinimumEducation5thClass","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Minimum 5th Class or Trade Required Education","sourceClause":"NAPS-2 Minimum Qualification Matrix"}]',
  '[{"id":"naps-doc-aadhaar","name":"Aadhaar Card","description":"Mandatory Aadhaar card for eKYC and DBT stipend receipt.","requirementType":"mandatory","issuingAuthority":"UIDAI"},{"id":"naps-doc-edu","name":"Educational Certificates & Marksheets","description":"Class 10th / 12th / ITI / Diploma / Degree marks memo.","requirementType":"mandatory","issuingAuthority":"Board / NCVT / SCVT / University"},{"id":"naps-doc-bank","name":"Aadhaar-Mapped Bank Passbook","description":"Savings account linked to NPCI mapper for receiving government DBT stipend.","requirementType":"mandatory","issuingAuthority":"Bank"}]',
  '[{"stepNumber":1,"title":"Register on Apprenticeship India Portal","description":"Visit apprenticeshipindia.gov.in, complete candidate registration and 100% profile with Aadhaar eKYC.","portalUrl":"https://www.apprenticeshipindia.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Search & Apply for Industry Opportunities","description":"Browse apprenticeship opportunities by trade, location, and stipend; submit application directly to companies.","portalUrl":"https://www.apprenticeshipindia.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Sign Digital Apprenticeship Contract","description":"Company issues online apprenticeship contract; sign digitally through portal OTP.","channel":"online_portal"},{"stepNumber":4,"title":"Workplace Training & DBT Stipend","description":"Undergo industry training; company pays monthly stipend and Government directly deposits up to ₹1,500 DBT monthly into bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmrf-fellowship',
  'prime-ministers-research-fellowship-pmrf',
  'Prime Minister''s Research Fellowship (PMRF)',
  'Prestigious doctoral fellowship providing up to ₹80,000/month plus ₹2 Lakh annual research contingency grant for top PhD scholars in science and technology.',
  'The Prime Minister''s Research Fellowship (PMRF) is India''s most prestigious doctoral fellowship designed to attract the best talent into research in frontier science and technology domains at premier institutions like IITs, IISc, and IISERs. Fellows receive monthly financial assistance of ₹70,000-80,000 and ₹2 Lakh annual research grant.',
  'fellowship',
  'central',
  'All India',
  'Ministry of Education',
  'Department of Higher Education',
  'https://www.pmrf.in',
  'free_verified',
  '₹70,000/month for Year 1-2, ₹75,000/month for Year 3, ₹80,000/month for Year 4-5, plus ₹2,00,000 annual contingency grant for 5 years.',
  'Completed or pursuing B.Tech/M.Tech/M.Sc with CGPA >= 8.0 from eligible NIRF top institutions or GATE score >= 650 with admission to PhD in PMRF granting institutions.',
  '[{"id":"rule-degreeLevel-equals","parameter":"degreeLevel","operator":"EQUALS","expectedValue":"phd","isMandatory":true,"conditionName":"Doctoral Program Enrolment","sourceClause":"PMRF Guidelines Section 2"},{"id":"rule-minCgpa-greater_than_or_equal","parameter":"minCgpa","operator":"GREATER_THAN_OR_EQUAL","expectedValue":8,"isMandatory":true,"conditionName":"Minimum Academic CGPA (8.0)","sourceClause":"PMRF Academic Criteria 3.1"}]',
  '[{"id":"doc-pmrf-proposal","name":"Research Proposal","description":"Detailed technical statement of purpose & doctoral proposal","requirementType":"mandatory","issuingAuthority":"PMRF Portal","sourceEvidence":"PMRF Annexure A"},{"id":"doc-pmrf-transcripts","name":"Official Academic Transcripts","description":"Degree certificates with CGPA verification","requirementType":"mandatory","issuingAuthority":"University / IIT","sourceEvidence":"PMRF Annexure B"}]',
  '[{"stepNumber":1,"title":"PhD Enrolment","description":"Secure regular PhD admission in a designated PMRF granting institute (IISc/IITs/IISERs/NITs).","channel":"college_cell"},{"stepNumber":2,"title":"Nomination & Portal Submission","description":"Submit research proposal and referee recommendations through the nodal PMRF portal.","channel":"online_portal","portalUrl":"https://www.pmrf.in"},{"stepNumber":3,"title":"National Review Selection","description":"Review by National Discipline-wise Review Panel and final award announcement.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-inspire-fellowship',
  'dst-inspire-fellowship-doctoral',
  'Innovation in Science Pursuit for Inspired Research (INSPIRE) Fellowship',
  'Doctoral research fellowship by DST providing monthly JRF/SRF stipend with HRA and contingency grant for basic and applied science research.',
  'INSPIRE Fellowship is a flagship scheme of the Department of Science & Technology (DST) offering contractual financial fellowship equivalent to NET-JRF/SRF to university 1st rank holders and INSPIRE Scholars to pursue PhD in Basic & Applied Sciences, Medicine, and Agriculture.',
  'fellowship',
  'central',
  'All India',
  'Ministry of Science and Technology',
  'Department of Science and Technology (DST)',
  'https://online-inspire.gov.in',
  'free_verified',
  '₹37,000/month (JRF) for first two years, ₹42,000/month (SRF) for remaining three years, plus applicable HRA and ₹20,000 annual research contingency.',
  'University 1st rank holder in Post-Graduate science stream or INSPIRE Scholar with minimum 70% marks pursuing full-time PhD.',
  '[{"id":"rule-courseType-equals","parameter":"courseType","operator":"EQUALS","expectedValue":"phd_science","isMandatory":true,"conditionName":"Full-time PhD in Sciences","sourceClause":"DST INSPIRE Guidelines Clause 4.1"},{"id":"rule-universityRank-equals","parameter":"universityRank","operator":"EQUALS","expectedValue":1,"isMandatory":false,"conditionName":"University Gold Medal / 1st Rank","sourceClause":"DST INSPIRE Eligibility 2.2"}]',
  '[{"id":"doc-inspire-rank","name":"University 1st Rank Certificate","description":"Issued by Registrar/Controller of Examination","requirementType":"mandatory","issuingAuthority":"University Registrar","sourceEvidence":"DST Form IV"},{"id":"doc-inspire-admission","name":"PhD Admission Endorsement Letter","description":"Signed by Head of Department and Research Supervisor","requirementType":"mandatory","issuingAuthority":"University / Research Institute","sourceEvidence":"DST Form II"}]',
  '[{"stepNumber":1,"title":"Online Registration","description":"Register on the INSPIRE Web Portal during the national call for applications.","channel":"online_portal","portalUrl":"https://online-inspire.gov.in"},{"stepNumber":2,"title":"Document Upload & Endorsement","description":"Upload rank certificate, joining report, and research outline endorsed by supervisor.","channel":"online_portal"},{"stepNumber":3,"title":"DBT Fellowship Sanction","description":"Direct monthly credit of fellowship to beneficiary''s Aadhaar-linked bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-national-overseas-scholarship',
  'national-overseas-scholarship-sc-st',
  'National Overseas Scholarship for SC / ST / De-notified Nomadic Tribes',
  'Full overseas tuition fee plus annual living allowance (up to $15,400 / £9,900) for pursuing Master''s and PhD in top 500 QS world ranked universities.',
  'The National Overseas Scholarship Scheme provides complete financial coverage for meritorious students belonging to Scheduled Castes, De-notified Nomadic and Semi-Nomadic Tribes, Landless Agricultural Labourers and Traditional Artisans to acquire Master degree or Ph.D. abroad.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://nosmsje.gov.in',
  'free_verified',
  'Complete tuition fees, contingency allowance, visa fees, health insurance, and annual living allowance of $15,400 (USA/other countries) or £9,900 (UK).',
  'Community certificate of SC/DNT/Landless Labourer; secured admission in top 500 QS-ranked foreign university; family income <= ₹8 Lakhs per annum.',
  '[{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["SC","DNT","Traditional_Artisan"],"isMandatory":true,"conditionName":"Eligible Community","sourceClause":"NOS Guidelines Section 3"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Family Income <= ₹8 Lakhs","sourceClause":"NOS Guidelines Section 4"},{"id":"rule-qsRank-less_than_or_equal","parameter":"qsRank","operator":"LESS_THAN_OR_EQUAL","expectedValue":500,"isMandatory":true,"conditionName":"Foreign University QS World Ranking <= 500","sourceClause":"NOS Guidelines 2026 update"}]',
  '[{"id":"doc-nos-offer","name":"Unconditional Foreign University Offer Letter","description":"Admission confirmation from top 500 QS university","requirementType":"mandatory","issuingAuthority":"Foreign University","sourceEvidence":"NOS Rule 6"},{"id":"doc-nos-caste","name":"Caste / Tribe Certificate","description":"Authorized community certificate","requirementType":"mandatory","issuingAuthority":"Revenue Authority","sourceEvidence":"NOS Rule 7"}]',
  '[{"stepNumber":1,"title":"Check QS Ranking","description":"Ensure target foreign university is ranked within top 500 in latest QS World Rankings.","channel":"online_portal"},{"stepNumber":2,"title":"Apply on NOS Portal","description":"Complete online application with passport details, unconditional admission letter, and income proof.","channel":"online_portal","portalUrl":"https://nosmsje.gov.in"},{"stepNumber":3,"title":"Selection Committee Evaluation","description":"National selection committee assesses applications and releases official award letter.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nmms-scholarship',
  'national-means-cum-merit-scholarship-scheme-nmmss',
  'National Means-cum-Merit Scholarship Scheme (NMMSS)',
  'Scholarship of ₹12,000 per annum (₹1,000/month) for meritorious Class 8 pass students from economically weaker sections from Class 9 to 12.',
  'Centrally Sponsored Scheme to arrest dropout rates at Class 8 and encourage meritorious students of economically weaker sections to continue their secondary and higher secondary education in government, local body, and government-aided schools.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Education',
  'Department of School Education and Literacy',
  'https://scholarships.gov.in',
  'free_verified',
  '₹12,000 per year credited directly into student''s Aadhaar-linked bank account across Classes 9, 10, 11, and 12.',
  'Studying in Govt/Aided school with >= 55% marks in Class 7/8 and selected via state NMMSS exam; parental income <= ₹3.5 Lakhs.',
  '[{"id":"rule-schoolType-in","parameter":"schoolType","operator":"IN","expectedValue":["government","local_body","government_aided"],"isMandatory":true,"conditionName":"Govt / Local Body School Enrollment","sourceClause":"NMMSS Clause 3"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":350000,"isMandatory":true,"conditionName":"Parental Annual Income <= ₹3,50,000","sourceClause":"NMMSS Clause 4"}]',
  '[{"id":"doc-nmms-admit","name":"NMMSS Selection Result / Admit Card","description":"State level NMMS examination result","requirementType":"mandatory","issuingAuthority":"State SCERT / DSEL","sourceEvidence":"NMMSS Clause 5"},{"id":"doc-nmms-bank","name":"Bank Passbook seeded with Aadhaar","description":"Single account in student''s name","requirementType":"mandatory","issuingAuthority":"Commercial Bank / Post Office","sourceEvidence":"NMMSS Clause 6"}]',
  '[{"stepNumber":1,"title":"Appear for State NMMS Exam","description":"Register through school in Class 8 for the state NMMS aptitude & mental ability test.","channel":"college_cell"},{"stepNumber":2,"title":"Apply on NSP","description":"Qualified candidates enter roll number on National Scholarship Portal to claim scholarship.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":3,"title":"Annual Renewal","description":"Renew annually on NSP by verifying promotion to next higher class with >= 55% marks.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-aicte-swanath',
  'aicte-swanath-scholarship-scheme',
  'AICTE Swanath Scholarship Scheme for Orphans, COVID-Affected & Armed Forces Wards',
  '₹50,000 per annum scholarship for orphans, wards of parents who died of COVID-19, or wards of martyred Armed Forces/CAPF personnel pursuing AICTE approved degrees/diplomas.',
  'AICTE Swanath Scholarship Scheme provides financial aid and social security to students pursuing technical degrees or diplomas who are orphans, whose parents died due to COVID-19, or whose parents are martyred armed forces or central paramilitary personnel.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Education',
  'All India Council for Technical Education (AICTE)',
  'https://www.aicte-india.org/schemes/students-development-schemes/Swanath-Scholarship-Scheme',
  'free_verified',
  '₹50,000 per annum lump sum towards college fees, hostel accommodation, computer equipment, and books.',
  'Enrolled in 1st year of AICTE approved degree/diploma; must be an orphan, COVID-19 orphan, or ward of martyred soldier; family income <= ₹8 Lakhs.',
  '[{"id":"rule-institutionType-equals","parameter":"institutionType","operator":"EQUALS","expectedValue":"aicte_approved","isMandatory":true,"conditionName":"Enrolled in AICTE Approved Institute","sourceClause":"Swanath Guidelines Clause 2"},{"id":"rule-specialCategory-in","parameter":"specialCategory","operator":"IN","expectedValue":["orphan","covid_deceased_parents","armed_forces_martyr_ward"],"isMandatory":true,"conditionName":"Vulnerable / Martyr Background","sourceClause":"Swanath Guidelines Clause 3"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8,00,000","sourceClause":"Swanath Guidelines Clause 4"}]',
  '[{"id":"doc-swanath-death","name":"Death Certificate / Martyr Certificate","description":"Official proof of demise / Armed forces martyr certificate","requirementType":"mandatory","issuingAuthority":"Municipal Authority / Zila Sainik Board","sourceEvidence":"Swanath Annexure I"},{"id":"doc-swanath-admission","name":"AICTE College Admission Proof","description":"Bonafide student certificate","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"Swanath Annexure II"}]',
  '[{"stepNumber":1,"title":"Apply on National Scholarship Portal","description":"Select AICTE Swanath Scheme on NSP and complete profile.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":2,"title":"Upload Category Certificate","description":"Submit death certificate or martyr documents along with bonafide enrollment.","channel":"online_portal"},{"stepNumber":3,"title":"Direct Bank Disbursement","description":"DBT credit of ₹50,000 annually till completion of degree/diploma.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-begum-hazrat-mahal',
  'begum-hazrat-mahal-national-scholarship',
  'Begum Hazrat Mahal National Scholarship for Meritorious Minority Girls',
  'Financial assistance of ₹5,000 to ₹6,000 per year for girl students belonging to 6 notified minority communities studying in Classes 9 to 12.',
  'Implemented by the Maulana Azad Education Foundation (MAEF) under Ministry of Minority Affairs to support meritorious girl students from Muslim, Christian, Sikh, Buddhist, Jain, and Parsi communities studying in Classes IX, X, XI, and XII.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Minority Affairs',
  'Maulana Azad Education Foundation',
  'https://scholarships.gov.in',
  'free_verified',
  '₹5,000 per year for Classes 9 & 10; ₹6,000 per year for Classes 11 & 12 towards admission and course fees.',
  'Girl student belonging to minority community studying in Class 9-12 with >= 50% marks in previous class; parental annual income <= ₹2 Lakhs.',
  '[{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Students Only","sourceClause":"BHMNS Scheme Clause 1"},{"id":"rule-minorityCommunity-in","parameter":"minorityCommunity","operator":"IN","expectedValue":["muslim","christian","sikh","buddhist","jain","parsi"],"isMandatory":true,"conditionName":"Notified Minority Community","sourceClause":"BHMNS Scheme Clause 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":200000,"isMandatory":true,"conditionName":"Parental Income <= ₹2 Lakhs","sourceClause":"BHMNS Scheme Clause 3"}]',
  '[{"id":"doc-bhmns-minority","name":"Minority Community Certificate / Self-Declaration","description":"Community declaration endorsed by parent","requirementType":"mandatory","issuingAuthority":"Revenue Authority / Self-attestation","sourceEvidence":"BHMNS Clause 5"},{"id":"doc-bhmns-marks","name":"Previous Year Marksheet","description":"Proof of minimum 50% marks","requirementType":"mandatory","issuingAuthority":"School Principal","sourceEvidence":"BHMNS Clause 6"}]',
  '[{"stepNumber":1,"title":"Register on NSP","description":"Create applicant ID on National Scholarship Portal with Aadhaar and school U-DISE code.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":2,"title":"Upload Documents","description":"Attach marksheet, income certificate, and school bonafide verification.","channel":"online_portal"},{"stepNumber":3,"title":"Direct Fund Transfer","description":"Scholarship credited straight to the girl student''s Aadhaar-seeded bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-usha',
  'pradhan-mantri-uchchatar-shiksha-abhiyan-pm-usha',
  'Pradhan Mantri Uchchatar Shiksha Abhiyan (PM-USHA)',
  'Central transformation grant providing up to ₹100 Crore per state university for infrastructure, quality enhancement, and equity initiatives.',
  'PM-USHA (revamped RUSA) is the flagship central scheme for state higher educational institutions focusing on equity, inclusion, employability, and technology upgradation across underserved and aspirational districts in India.',
  'education_aid',
  'central',
  'All India',
  'Ministry of Education',
  'Department of Higher Education',
  'https://pmusha.education.gov.in',
  'free_verified',
  'Institutional grants ranging from ₹20 Crore to ₹100 Crore per state university and college for digital classrooms, laboratories, and student welfare facilities.',
  'Accredited State Public Universities and Government / Aided Colleges with NAAC accreditation participating under State Higher Education Plans.',
  '[{"id":"rule-institutionType-in","parameter":"institutionType","operator":"IN","expectedValue":["state_university","government_college"],"isMandatory":true,"conditionName":"State Higher Education Institution","sourceClause":"PM-USHA Guidelines 2.1"}]',
  '[{"id":"doc-usha-dpr","name":"Institutional Detailed Project Report (IDP)","description":"Multi-year infrastructure and modernization proposal","requirementType":"mandatory","issuingAuthority":"University Vice Chancellor","sourceEvidence":"PM-USHA Framework"}]',
  '[{"stepNumber":1,"title":"State Plan Inclusion","description":"State Higher Education Council prioritizes eligible institutions.","channel":"district_office"},{"stepNumber":2,"title":"Online Submission","description":"University submits proposal on PM-USHA portal for National Project Approval Board.","channel":"online_portal","portalUrl":"https://pmusha.education.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-emrs-tribal',
  'eklavya-model-residential-schools-emrs',
  'Eklavya Model Residential Schools (EMRS) Tribal Education Scheme',
  'Completely free CBSE boarding school education (Classes 6 to 12) including uniform, books, meals, and sports training for Scheduled Tribe children.',
  'EMRS is a premier Central Sector initiative under the Ministry of Tribal Affairs establishing quality residential schools across remote tribal blocks, offering completely free quality education, skill training, and career preparation.',
  'education_aid',
  'central',
  'All India',
  'Ministry of Tribal Affairs',
  'National Education Society for Tribal Students (NESTS)',
  'https://emrs.tribal.gov.in',
  'free_verified',
  '100% free residential schooling, lodging, boarding, uniforms, textbooks, computer labs, and national level sports training.',
  'Scheduled Tribe (ST) boys and girls seeking admission into Class 6 selected via national / state level entrance test.',
  '[{"id":"rule-casteCategory-equals","parameter":"casteCategory","operator":"EQUALS","expectedValue":"ST","isMandatory":true,"conditionName":"Scheduled Tribe Community","sourceClause":"EMRS Admission Policy Section 2"},{"id":"rule-admissionClass-equals","parameter":"admissionClass","operator":"EQUALS","expectedValue":6,"isMandatory":true,"conditionName":"Admission into Class 6","sourceClause":"EMRS Admission Policy Section 3"}]',
  '[{"id":"doc-emrs-st","name":"ST Caste Certificate","description":"Official Scheduled Tribe verification certificate","requirementType":"mandatory","issuingAuthority":"Tahsildar / RDO","sourceEvidence":"EMRS Rule 4"},{"id":"doc-emrs-transfer","name":"Class 5 School Leaving / Transfer Certificate","description":"School attendance certificate","requirementType":"mandatory","issuingAuthority":"Headmaster","sourceEvidence":"EMRS Rule 5"}]',
  '[{"stepNumber":1,"title":"Entrance Exam Application","description":"Submit application on state/NESTS portal for EMRS Selection Test (EMRSST).","channel":"online_portal","portalUrl":"https://emrs.tribal.gov.in"},{"stepNumber":2,"title":"Appear for Entrance Test","description":"Appear for bilingual mental ability, mathematics, and language test.","channel":"college_cell"},{"stepNumber":3,"title":"Admission & Allotment","description":"Counseling and joining allotted EMRS residential campus.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-kusum',
  'pradhan-mantri-kisan-urja-suraksha-evam-utthaan-mahabhiyan-pm-kusum',
  'PM-KUSUM (Kisan Urja Suraksha evam Utthaan Mahabhiyan)',
  'Up to 60% capital subsidy to install standalone solar water pumps and solarize existing grid-connected agricultural pumps for farmers.',
  'PM-KUSUM enables farmers to generate clean energy, replace diesel irrigation pumps with highly subsidized solar water pumps (Component B), and sell surplus solar power back to state DISCOMs for supplementary agricultural income (Component C).',
  'agriculture',
  'central',
  'All India',
  'Ministry of New and Renewable Energy',
  'Renewable Energy Department',
  'https://pmkusum.mnre.gov.in',
  'free_verified',
  '30% Central Financial Assistance (CFA) + 30% State Govt subsidy (up to 60% total subsidy). Farmer pays only 10% upfront, remaining 30% via bank loan.',
  'Individual farmers, Water User Associations, Primary Agriculture Credit Societies (PACS), and Farmer Producer Organizations (FPOs) having agricultural land requiring irrigation.',
  '[{"id":"rule-occupation-equals","parameter":"occupation","operator":"EQUALS","expectedValue":"farmer","isMandatory":true,"conditionName":"Farmer or Agricultural Society","sourceClause":"PM-KUSUM Operational Guidelines 3.1"}]',
  '[{"id":"doc-kusum-land","name":"Agricultural Land Revenue Records (7/12, RoR, Patta)","description":"Proof of agricultural land ownership","requirementType":"mandatory","issuingAuthority":"Revenue Dept","sourceEvidence":"PM-KUSUM Checklist 1"},{"id":"doc-kusum-bank","name":"Bank Passbook & Aadhaar Card","description":"Bank account details for credit/loan tie-up","requirementType":"mandatory","issuingAuthority":"Commercial Bank","sourceEvidence":"PM-KUSUM Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply on State Nodal Portal","description":"Apply on designated State Renewable Energy Agency portal (e.g. TGREDCO, MEDA, HAREDA).","channel":"online_portal","portalUrl":"https://pmkusum.mnre.gov.in"},{"stepNumber":2,"title":"Pay Beneficiary Share","description":"Pay 10% farmer share after site feasibility survey by vendor.","channel":"online_portal"},{"stepNumber":3,"title":"Solar Pump Installation","description":"Authorized empanelled vendor installs solar pump and testing certificate issued.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-kcc-interest-subvention',
  'kisan-credit-card-kcc-interest-subvention',
  'Kisan Credit Card (KCC) with Modified Interest Subvention Scheme (MISS)',
  'Short-term crop loans up to ₹3 Lakhs at an effective concessional interest rate of only 4% per annum upon prompt repayment.',
  'The Kisan Credit Card scheme provides timely institutional credit to farmers for agricultural inputs (seeds, fertilizers, pesticides), post-harvest expenses, animal husbandry, and fisheries at a subsidized base rate of 7%, reduced to 4% upon timely repayment.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture and Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://agricoop.nic.in',
  'free_verified',
  'Collateral-free short-term agricultural credit up to ₹1.60 Lakhs (and up to ₹3 Lakhs with land hypothecation) at 4% effective interest rate.',
  'All farmers - individuals/joint borrowers, tenant farmers, oral lessees, sharecroppers, and SHG/JLGs of farmers involved in agriculture, dairy, poultry, or fisheries.',
  '[{"id":"rule-activity-in","parameter":"activity","operator":"IN","expectedValue":["crop_cultivation","dairy","fisheries","poultry"],"isMandatory":true,"conditionName":"Agricultural or Allied Activities","sourceClause":"RBI KCC Master Circular Section 2"}]',
  '[{"id":"doc-kcc-land","name":"Land Record Extract / Tenancy Agreement","description":"Record of Rights showing cropping pattern","requirementType":"mandatory","issuingAuthority":"Revenue Officer / Patwari","sourceEvidence":"KCC Master Circular 4"},{"id":"doc-kcc-kyc","name":"Aadhaar Card and PAN / Form 60","description":"Identity and address verification","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"KCC Master Circular 5"}]',
  '[{"stepNumber":1,"title":"Submit One-Page KCC Form","description":"Submit simplified KCC application at nearest commercial bank, RRB, or CSC center.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Bank Verification","description":"Bank verifies land records on state digital revenue portal within 14 working days.","channel":"district_office"},{"stepNumber":3,"title":"KCC RuPay Card Issuance","description":"Receive RuPay Kisan Card for ATM withdrawal and point-of-sale agro purchase.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmmsy-fisheries',
  'pradhan-mantri-matsya-sampada-yojana-pmmsy',
  'Pradhan Mantri Matsya Sampada Yojana (PMMSY)',
  'Up to 60% capital subsidy for fish farming ponds, recirculatory aquaculture systems (RAS), biofloc, motorized fishing boats, and cold storage units.',
  'PMMSY is a landmark initiative under the Ministry of Fisheries, Animal Husbandry and Dairying aimed at harnessing India''s fisheries potential with ₹20,050 Crore investment, modernizing aquaculture infrastructure, and doubling fishers'' income.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Fisheries, Animal Husbandry and Dairying',
  'Department of Fisheries',
  'https://pmmsy.dof.gov.in',
  'free_verified',
  '60% project cost subsidy for Women, SC, and ST beneficiaries; 40% subsidy for General category entrepreneurs across freshwater aquaculture, biofloc, and marine crafts.',
  'Fishers, fish farmers, fish workers, SHGs, JLGs, fisheries cooperatives, and private entrepreneurs with owned or leased land/water bodies.',
  '[{"id":"rule-activityType-equals","parameter":"activityType","operator":"EQUALS","expectedValue":"aquaculture_fisheries","isMandatory":true,"conditionName":"Aquaculture or Fisheries Enterprise","sourceClause":"PMMSY Operational Guidelines 4.1"}]',
  '[{"id":"doc-pmmsy-dpr","name":"Detailed Project Report (DPR)","description":"Technical and financial viability report of aquaculture unit","requirementType":"mandatory","issuingAuthority":"Chartered Engineer / Self","sourceEvidence":"PMMSY Annexure III"},{"id":"doc-pmmsy-land","name":"Land / Waterbody Lease Agreement or Title","description":"Proof of ownership or minimum 10-year registered lease","requirementType":"mandatory","issuingAuthority":"Sub-Registrar","sourceEvidence":"PMMSY Annexure IV"}]',
  '[{"stepNumber":1,"title":"Online Project Submission","description":"Submit project proposal on the PMMSY National Portal.","channel":"online_portal","portalUrl":"https://pmmsy.dof.gov.in"},{"stepNumber":2,"title":"District Fisheries Review","description":"District Level Committee (DLC) evaluates technical viability and approves sanction.","channel":"district_office"},{"stepNumber":3,"title":"Phased Subsidy Release","description":"Back-ended subsidy released into bank account linked with construction milestones.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-national-livestock-mission',
  'national-livestock-mission-nlm-entrepreneurship',
  'National Livestock Mission (NLM) - Rural Entrepreneurship Scheme',
  '50% capital subsidy up to ₹50 Lakhs for establishing commercial sheep, goat, pig, and poultry breeding farms and feed/fodder plants.',
  'NLM supports rural entrepreneurs, SHGs, and FPOs to establish breed multiplication farms for sheep, goat, pig, and poultry, providing a 50% back-ended capital subsidy to create self-sustaining livestock enterprises and generate rural jobs.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Fisheries, Animal Husbandry and Dairying',
  'Department of Animal Husbandry and Dairying',
  'https://nlm.udyamimitra.in',
  'free_verified',
  '50% capital subsidy (up to ₹25 Lakhs for 500-bird poultry / 100-sheep farm, and up to ₹50 Lakhs for 500-sheep/goat breeding units) disbursed in two tranches.',
  'Individuals, FPOs, SHGs, JLGs, Section 8 companies having training or experience in animal husbandry with tied-up institutional bank financing.',
  '[{"id":"rule-minLandArea-greater_than_or_equal","parameter":"minLandArea","operator":"GREATER_THAN_OR_EQUAL","expectedValue":1,"isMandatory":true,"conditionName":"Minimum Land Availability for Farm Construction","sourceClause":"NLM Guidelines 2026 Clause 3"}]',
  '[{"id":"doc-nlm-bank-inprinciple","name":"Bank Loan In-Principle Sanction Letter","description":"Proof of bank loan tie-up for remaining 50% project cost","requirementType":"mandatory","issuingAuthority":"Commercial Bank","sourceEvidence":"NLM Checklist 2"},{"id":"doc-nlm-training","name":"Animal Husbandry Training Certificate","description":"Training from KVK / State Animal Husbandry Training Institute","requirementType":"mandatory","issuingAuthority":"KVK / ICAR","sourceEvidence":"NLM Checklist 3"}]',
  '[{"stepNumber":1,"title":"Apply on NLM Portal","description":"Submit DPR and land documents on the NLM Udyami Mitra portal.","channel":"online_portal","portalUrl":"https://nlm.udyamimitra.in"},{"stepNumber":2,"title":"State Implementing Agency Verification","description":"State Animal Husbandry Department inspects land and issues feasibility certificate.","channel":"district_office"},{"stepNumber":3,"title":"Subsidy Disbursement","description":"Central Government credits 50% subsidy to lender bank upon farm completion.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmksy-per-drop-more-crop',
  'pradhan-mantri-krishi-sinchayee-yojana-pdmc',
  'PM Krishi Sinchayee Yojana (PMKSY) - Per Drop More Crop (Micro Irrigation)',
  'Financial subsidy up to 55% for small/marginal farmers and 45% for other farmers for installing Drip and Sprinkler irrigation systems.',
  'Under PMKSY Per Drop More Crop, the Central Government provides financial subsidies to farmers across all states to adopt water-saving precision micro-irrigation systems (drip and sprinkler), significantly increasing crop yields and conserving groundwater.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture and Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://pmksy.gov.in',
  'free_verified',
  '55% subsidy of benchmark installation cost for Small and Marginal farmers (holding <= 2 hectares); 45% subsidy for other landholding farmers.',
  'All farmers possessing arable agricultural land with a perennial irrigation source (borewell, open well, or canal).',
  '[{"id":"rule-waterSourceAvailable-equals","parameter":"waterSourceAvailable","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Availability of Functional Water Source","sourceClause":"PMKSY PDMC Guidelines 2.4"}]',
  '[{"id":"doc-pdmc-ror","name":"Land Record / Passbook (Pahani / 7/12)","description":"Demonstrating cultivable land ownership","requirementType":"mandatory","issuingAuthority":"Tahsildar / Village Revenue Officer","sourceEvidence":"PMKSY Annexure 1"},{"id":"doc-pdmc-quotation","name":"Empanelled Manufacturer Micro-Irrigation Estimate","description":"Technical design blueprint and quotation","requirementType":"mandatory","issuingAuthority":"Empanelled Drip Vendor","sourceEvidence":"PMKSY Annexure 2"}]',
  '[{"stepNumber":1,"title":"Registration on State Horticulture Portal","description":"Register online via state agriculture/horticulture micro-irrigation portal.","channel":"online_portal","portalUrl":"https://pmksy.gov.in"},{"stepNumber":2,"title":"Field Verification & Work Order","description":"Horticulture Officer verifies water source and GPS coordinates.","channel":"district_office"},{"stepNumber":3,"title":"Installation & Subsidy Release","description":"Vendor installs drip/sprinkler lines; subsidy credited directly via DBT.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-agri-infrastructure-fund',
  'agriculture-infrastructure-fund-aif',
  'Agriculture Infrastructure Fund (AIF)',
  '3% interest subvention and CGTMSE credit guarantee on bank loans up to ₹2 Crore for post-harvest farm infrastructure and cold storage.',
  'AIF provides ₹1 Lakh Crore medium-to-long term debt financing facility for investment in viable post-harvest management infrastructure such as warehouses, cold chains, primary processing units, and smart agriculture IoT hubs.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture and Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://agriinfra.dac.gov.in',
  'free_verified',
  '3% per annum interest subvention on loans up to ₹2 Crore for a maximum period of 7 years, plus fee-free CGTMSE credit guarantee coverage.',
  'Primary Agricultural Credit Societies (PACS), Marketing Cooperative Societies, FPOs, SHGs, JLGs, Farmers, Agri-entrepreneurs, and Startups.',
  '[{"id":"rule-projectType-in","parameter":"projectType","operator":"IN","expectedValue":["warehouse","cold_storage","sorting_grading","silos","bio_fertilizer"],"isMandatory":true,"conditionName":"Post-Harvest Infrastructure Project","sourceClause":"AIF Scheme Guidelines 3.1"}]',
  '[{"id":"doc-aif-dpr","name":"Detailed Project Report (DPR)","description":"Financial projections and cashflow statement","requirementType":"mandatory","issuingAuthority":"Chartered Accountant / Consultant","sourceEvidence":"AIF Checklist 1"},{"id":"doc-aif-kyc","name":"Entity Registration & Land Title / Lease","description":"Proof of project site ownership","requirementType":"mandatory","issuingAuthority":"Sub-Registrar","sourceEvidence":"AIF Checklist 2"}]',
  '[{"stepNumber":1,"title":"Register on AIF Portal","description":"Submit basic project information and select preferred lending bank.","channel":"online_portal","portalUrl":"https://agriinfra.dac.gov.in"},{"stepNumber":2,"title":"Ministry Scrutiny","description":"Ministry Agriculture team vets DPR within 7-10 days and forwards to chosen bank.","channel":"online_portal"},{"stepNumber":3,"title":"Bank Sanction & Interest Benefit","description":"Bank sanctions loan and automatic 3% interest subvention applies from first EMI.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nikshay-poshan-yojana',
  'nikshay-poshan-yojana-tb-patient-dbt',
  'Nikshay Poshan Yojana (Direct Benefit Transfer for TB Patients)',
  'Direct monthly financial support of ₹500 to ₹1,000 per month for nutritional support to all notified Tuberculosis patients throughout treatment.',
  'Implemented under the National Tuberculosis Elimination Programme (NTEP) by Ministry of Health and Family Welfare, Nikshay Poshan Yojana provides direct cash assistance into patients'' bank accounts to meet dietary requirements during anti-TB treatment.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'Central TB Division',
  'https://nikshay.in',
  'free_verified',
  '₹500 to ₹1,000 per month credited directly through PFMS into beneficiary''s bank account for the entire duration of medical anti-TB treatment.',
  'All diagnosed Tuberculosis patients notified on the national Ni-kshay portal receiving treatment from either public or private health facilities.',
  '[{"id":"rule-healthCondition-equals","parameter":"healthCondition","operator":"EQUALS","expectedValue":"diagnosed_tuberculosis","isMandatory":true,"conditionName":"Notified TB Patient on Ni-kshay","sourceClause":"NTEP Guidelines Clause 2"}]',
  '[{"id":"doc-nikshay-id","name":"Ni-kshay Patient ID / Notification Slip","description":"Generated by treating physician or DOTS centre","requirementType":"mandatory","issuingAuthority":"Government Hospital / RNTCP","sourceEvidence":"NTEP Clause 3"},{"id":"doc-nikshay-bank","name":"Aadhaar Linked Bank Passbook","description":"Active single bank account for DBT transfers","requirementType":"mandatory","issuingAuthority":"Commercial Bank / Post Office","sourceEvidence":"NTEP Clause 4"}]',
  '[{"stepNumber":1,"title":"Clinical Notification","description":"Doctor notifies case on Ni-kshay digital portal during diagnosis.","channel":"district_office"},{"stepNumber":2,"title":"Bank Account Seeding","description":"Patient provides Aadhaar and bank account number to health worker / DOTS provider.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Credits","description":"Cash transferred automatically via PFMS for each month of verified medication compliance.","channel":"online_portal","portalUrl":"https://nikshay.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-janani-suraksha-yojana',
  'janani-suraksha-yojana-jsy-maternal-health',
  'Janani Suraksha Yojana (JSY - Safe Motherhood Intervention)',
  'Cash incentive of ₹1,400 (rural) and ₹1,000 (urban) to pregnant women delivering in government or accredited private health facilities.',
  'JSY is a safe motherhood intervention under the National Health Mission (NHM) aimed at reducing maternal and neonatal mortality by promoting institutional delivery among poor pregnant women, particularly in low-performing states.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'Maternal Health Division',
  'https://nhm.gov.in',
  'free_verified',
  '₹1,400 cash incentive in rural areas and ₹1,000 in urban areas for mothers, plus ₹600 ASHA incentive for rural institutional delivery support.',
  'Pregnant women aged 19 years and above belonging to BPL/SC/ST households delivering in public or accredited private hospitals.',
  '[{"id":"rule-deliveryLocation-in","parameter":"deliveryLocation","operator":"IN","expectedValue":["government_hospital","chc","phc","accredited_private_hospital"],"isMandatory":true,"conditionName":"Institutional Delivery Location","sourceClause":"JSY Guidelines Section 2"}]',
  '[{"id":"doc-jsy-mcp","name":"Mother and Child Protection (MCP) Card","description":"Issued during antenatal registration","requirementType":"mandatory","issuingAuthority":"PHC / ASHA Worker","sourceEvidence":"JSY Checklist 1"},{"id":"doc-jsy-discharge","name":"Hospital Institutional Delivery Discharge Certificate","description":"Confirming birth in medical facility","requirementType":"mandatory","issuingAuthority":"Medical Officer / Hospital","sourceEvidence":"JSY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Antenatal Registration","description":"Register pregnancy early with local ASHA / ANM and receive MCP Card.","channel":"district_office"},{"stepNumber":2,"title":"Institutional Delivery","description":"Deliver at nearest Primary Health Centre, Community Health Centre, or District Hospital.","channel":"district_office"},{"stepNumber":3,"title":"Cash Disbursal at Discharge","description":"Receive cheque or direct bank transfer before discharge from the hospital.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-rashtriya-arogya-nidhi',
  'rashtriya-arogya-nidhi-ran-financial-assistance',
  'Rashtriya Arogya Nidhi (RAN) - Critical Illness Assistance',
  'One-time financial assistance up to ₹15 Lakhs for poor patients suffering from life-threatening major diseases for treatment at government super-specialty hospitals.',
  'RAN provides vital financial aid to indigent patients living below the poverty line suffering from life-threatening conditions (cancer, cardiac, neuro, organ transplants) to receive super-specialty treatment at AIIMS and designated central government institutions.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'Department of Health and Family Welfare',
  'https://main.mohfw.gov.in/major-programmes/poor-patients-financial-assistance/rashtriya-arogya-nidhi',
  'free_verified',
  'Direct financial grant up to ₹15,00,000 released directly to the treating government super-specialty hospital (AIIMS, PGI, etc.) for procedures, implants, and medicines.',
  'Patient suffering from designated life-threatening illness, family income below state poverty line (BPL / Antyodaya), and not covered under AB-PMJAY.',
  '[{"id":"rule-hospitalCategory-in","parameter":"hospitalCategory","operator":"IN","expectedValue":["aiims","central_super_specialty_hospital"],"isMandatory":true,"conditionName":"Treatment at Designated Apex Institute","sourceClause":"RAN Scheme Rules 3.1"},{"id":"rule-bplStatus-equals","parameter":"bplStatus","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Below Poverty Line Household","sourceClause":"RAN Scheme Rules 3.2"}]',
  '[{"id":"doc-ran-proforma","name":"RAN Application Proforma & Cost Estimate","description":"Signed by treating Professor / Head of Department and Medical Superintendent","requirementType":"mandatory","issuingAuthority":"Government Hospital","sourceEvidence":"RAN Form A"},{"id":"doc-ran-income","name":"Valid BPL Ration Card / Income Certificate","description":"Proof of indigent economic status","requirementType":"mandatory","issuingAuthority":"Tahsildar / Food & Civil Supplies","sourceEvidence":"RAN Form B"}]',
  '[{"stepNumber":1,"title":"Medical Evaluation","description":"Consulting doctor at AIIMS/Govt Apex Hospital certifies disease and prepares estimate.","channel":"district_office"},{"stepNumber":2,"title":"Hospital Committee Endorsement","description":"Technical committee of treating hospital forwards application to MoHFW.","channel":"district_office"},{"stepNumber":3,"title":"Fund Sanction to Hospital","description":"Ministry sanctions funds directly to patient revolving fund of hospital.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-jan-dhan-yojana',
  'pradhan-mantri-jan-dhan-yojana-pmjdy',
  'Pradhan Mantri Jan Dhan Yojana (PMJDY)',
  'Zero-balance basic savings bank account with free RuPay debit card, ₹2 Lakh accidental insurance cover, and ₹10,000 overdraft facility.',
  'PMJDY is the National Mission for Financial Inclusion ensuring universal access to banking services, basic savings accounts, remittance, credit, insurance, and pension in an affordable manner with zero minimum balance requirement.',
  'welfare',
  'central',
  'All India',
  'Ministry of Finance',
  'Department of Financial Services',
  'https://pmjdy.gov.in',
  'free_verified',
  'Zero minimum balance account, free RuPay debit card with ₹2,00,000 accidental insurance, and eligible for ₹10,000 overdraft facility per household (preferable women).',
  'Any Indian citizen aged 10 years and above who does not already possess a bank account.',
  '[{"id":"rule-citizenship-equals","parameter":"citizenship","operator":"EQUALS","expectedValue":"indian","isMandatory":true,"conditionName":"Indian Citizen","sourceClause":"PMJDY Guidelines Section 2"}]',
  '[{"id":"doc-pmjdy-kyc","name":"Aadhaar Card / Voter ID / MGNREGA Job Card","description":"Officially Valid Document (OVD) for KYC","requirementType":"mandatory","issuingAuthority":"UIDAI / Election Commission","sourceEvidence":"PMJDY Annexure 1"}]',
  '[{"stepNumber":1,"title":"Visit Nearest Bank Branch or Bank Mitra","description":"Approach any commercial bank branch or Customer Service Point (CSP).","channel":"meeseva_csc"},{"stepNumber":2,"title":"Complete Simplified Account Opening Form","description":"Provide Aadhaar number and biometrics for e-KYC instant account creation.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Receive RuPay Debit Card","description":"Collect passbook and RuPay ATM card with active accident insurance.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-suraksha-bima',
  'pradhan-mantri-suraksha-bima-yojana-pmsby',
  'Pradhan Mantri Suraksha Bima Yojana (PMSBY)',
  'Accidental death and permanent disability insurance cover of ₹2 Lakhs for an annual premium of just ₹20 auto-debited from bank account.',
  'PMSBY is a government-backed accident insurance scheme in India providing high-value financial protection against accidental death and permanent total/partial disability for individuals aged 18 to 70 years.',
  'welfare',
  'central',
  'All India',
  'Ministry of Finance',
  'Department of Financial Services',
  'https://financialservices.gov.in/insurance-divisions/Government-Sponsored-Socially-Oriented-Insurance-Schemes/Pradhan-Mantri-Suraksha-Bima-Yojana(PMSBY)',
  'free_verified',
  '₹2,00,000 for accidental death or permanent total disability; ₹1,00,000 for permanent partial disability. Annual premium: ₹20.',
  'Individuals aged between 18 and 70 years holding an active bank savings account with auto-debit consent enabled.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"PMSBY Rules Clause 2"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":70,"isMandatory":true,"conditionName":"Maximum Age 70 Years","sourceClause":"PMSBY Rules Clause 3"}]',
  '[{"id":"doc-pmsby-consent","name":"Auto-Debit Bank Consent Mandate","description":"Authorization to deduct ₹20 annually in May/June","requirementType":"mandatory","issuingAuthority":"Bank Branch / Net Banking","sourceEvidence":"PMSBY Form 1"}]',
  '[{"stepNumber":1,"title":"Consent Submission","description":"Log in to internet/mobile banking or submit consent form at home bank branch.","channel":"online_portal"},{"stepNumber":2,"title":"Annual Premium Deduction","description":"Bank auto-debits ₹20 every year between 25th to 31st May.","channel":"online_portal"},{"stepNumber":3,"title":"Insurance Certificate","description":"Policy certificate issued with instant active risk cover from June 1 to May 31.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-jeevan-jyoti',
  'pradhan-mantri-jeevan-jyoti-bima-yojana-pmjjby',
  'Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)',
  'Life insurance cover of ₹2 Lakhs in case of death due to any cause for an annual premium of ₹436 auto-debited from bank account.',
  'PMJJBY provides renewable one-year term life insurance coverage of ₹2 Lakhs to people in the age group of 18 to 50 years against death due to any reason, making life insurance accessible to low-income households.',
  'welfare',
  'central',
  'All India',
  'Ministry of Finance',
  'Department of Financial Services',
  'https://financialservices.gov.in/insurance-divisions/Government-Sponsored-Socially-Oriented-Insurance-Schemes/Pradhan-Mantri-Jeevan-Jyoti-Bima-Yojana(PMJJBY)',
  'free_verified',
  '₹2,00,000 payable to nominee in the unfortunate event of the insured member''s death due to any cause. Annual premium: ₹436.',
  'Indian residents aged 18 to 50 years holding a savings bank account who give consent for auto-debit of premium.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"PMJJBY Rules Clause 2"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":50,"isMandatory":true,"conditionName":"Maximum Age 50 Years","sourceClause":"PMJJBY Rules Clause 3"}]',
  '[{"id":"doc-pmjjby-consent","name":"PMJJBY Enrolment & Nominee Mandate","description":"Nominee details and auto-debit authorization","requirementType":"mandatory","issuingAuthority":"Bank / Net Banking","sourceEvidence":"PMJJBY Schedule A"}]',
  '[{"stepNumber":1,"title":"Enrolment through Bank","description":"Submit enrolment form with nominee details at your bank branch or via mobile banking app.","channel":"online_portal"},{"stepNumber":2,"title":"Auto-Debit of ₹436","description":"Annual premium auto-debited directly from account.","channel":"online_portal"},{"stepNumber":3,"title":"Nominee Claim Process","description":"In case of demise, nominee submits death certificate and claim form for quick DBT settlement.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-shram-yogi-maandhan',
  'pradhan-mantri-shram-yogi-maan-dhan-pmsym',
  'Pradhan Mantri Shram Yogi Maan-dhan (PM-SYM)',
  'Guaranteed monthly pension of ₹3,000 after attaining 60 years of age for unorganised workers with matching 50% central contribution.',
  'PM-SYM is a voluntary and contributory pension scheme for unorganised workers (street vendors, domestic workers, rickshaw pullers, construction labourers, agricultural workers) earning up to ₹15,000/month, ensuring social security in old age.',
  'pension',
  'central',
  'All India',
  'Ministry of Labour and Employment',
  'Social Security Division',
  'https://maandhan.in',
  'free_verified',
  'Guaranteed monthly pension of ₹3,000 after reaching age 60. Beneficiary contributes ₹55 to ₹200 per month depending on entry age (18-40), with matching 50% contribution by Central Government.',
  'Unorganised workers aged 18 to 40 years with monthly income <= ₹15,000, not an income tax payer, and not covered under EPFO/ESIC/NPS.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Entry Age 18-40 Years","sourceClause":"PM-SYM Clause 2.1"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Maximum Entry Age 40 Years","sourceClause":"PM-SYM Clause 2.2"},{"id":"rule-monthlyIncome-less_than_or_equal","parameter":"monthlyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":15000,"isMandatory":true,"conditionName":"Monthly Income <= ₹15,000","sourceClause":"PM-SYM Clause 2.3"}]',
  '[{"id":"doc-pmsym-aadhaar","name":"Aadhaar Card","description":"Identity proof for e-KYC","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"PM-SYM Checklist 1"},{"id":"doc-pmsym-bank","name":"Savings Bank Passbook / Jan Dhan Account","description":"With auto-debit facility enabled","requirementType":"mandatory","issuingAuthority":"Bank / Post Office","sourceEvidence":"PM-SYM Checklist 2"}]',
  '[{"stepNumber":1,"title":"Visit Nearest CSC Centre","description":"Carry Aadhaar card and bank passbook to any Common Services Centre.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Calculate Contribution & e-Sign","description":"System computes monthly subscription amount based on age; sign auto-debit mandate.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Receive Shram Yogi Pension Card","description":"Get instant printed PM-SYM unique pension card with pension ID.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmegp-subsidy',
  'prime-ministers-employment-generation-programme-pmegp',
  'Prime Minister''s Employment Generation Programme (PMEGP)',
  'Credit-linked subsidy program providing 15% to 35% margin money subsidy on bank loans up to ₹50 Lakhs for setting up new manufacturing or service micro-enterprises.',
  'PMEGP is a major credit-linked subsidy scheme administered by KVIC under the Ministry of MSME to generate continuous employment opportunities in rural as well as urban areas by financing new micro-enterprises across manufacturing and service sectors.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Micro, Small and Medium Enterprises',
  'Khadi and Village Industries Commission (KVIC)',
  'https://www.kviconline.gov.in/pmegpeportal',
  'free_verified',
  'Project cost up to ₹50 Lakhs for manufacturing and ₹20 Lakhs for services. Margin money subsidy of 25-35% in rural areas and 15-25% in urban areas.',
  'Any individual aged 18+ with minimum 8th class pass for projects above ₹10L (manufacturing) or ₹5L (services). Self Help Groups and cooperative societies are also eligible.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"PMEGP Guidelines Clause 3.1"},{"id":"rule-newUnitOnly-equals","parameter":"newUnitOnly","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"New Enterprise Unit Setup Only","sourceClause":"PMEGP Guidelines Clause 3.2"}]',
  '[{"id":"doc-pmegp-dpr","name":"Detailed Project Report (DPR)","description":"Project cost, machinery details, and break-even analysis","requirementType":"mandatory","issuingAuthority":"Certified CA / Self","sourceEvidence":"PMEGP Form 1"},{"id":"doc-pmegp-edu","name":"Education Qualification Certificate (8th / 10th / Degree)","description":"Proof of minimum educational qualification","requirementType":"mandatory","issuingAuthority":"School Board / University","sourceEvidence":"PMEGP Form 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on KVIC Portal","description":"Fill out PMEGP online application and upload DPR and KYC documents.","channel":"online_portal","portalUrl":"https://www.kviconline.gov.in/pmegpeportal"},{"stepNumber":2,"title":"District Task Force Committee Review","description":"District Level Task Force Committee (DLTFC) scrutinizes application and forwards to financing bank.","channel":"district_office"},{"stepNumber":3,"title":"EDP Training & Disbursement","description":"Undergo mandatory Entrepreneurship Development Programme (EDP) training; bank disburses loan and subsidy is held in TDR.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-startup-india-seed-fund',
  'startup-india-seed-fund-scheme-sisfs',
  'Startup India Seed Fund Scheme (SISFS)',
  'Financial assistance up to ₹20 Lakhs as grant for proof of concept and up to ₹50 Lakhs through convertible debentures/debt for prototype commercialization.',
  'Administered by DPIIT under Ministry of Commerce and Industry, SISFS provides seed funding to early-stage DPIIT-recognized startups for proof of concept, prototype development, product trials, market entry, and commercialization through empanelled incubators across India.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Commerce and Industry',
  'Department for Promotion of Industry and Internal Trade (DPIIT)',
  'https://seedfund.startupindia.gov.in',
  'free_verified',
  'Up to ₹20,00,000 as direct grant for prototype / validation, and up to ₹50,00,000 as debt/convertible debentures for commercialization and scaling.',
  'DPIIT recognized startup incorporated not more than 2 years ago, with an innovative business idea, shareholding of Indian promoters >= 51%, and not received more than ₹10 Lakhs monetary support under other central/state schemes.',
  '[{"id":"rule-dpiitRecognized-equals","parameter":"dpiitRecognized","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"DPIIT Recognized Startup","sourceClause":"SISFS Guidelines Clause 4.1"},{"id":"rule-incorporationYears-less_than_or_equal","parameter":"incorporationYears","operator":"LESS_THAN_OR_EQUAL","expectedValue":2,"isMandatory":true,"conditionName":"Incorporated Within Past 2 Years","sourceClause":"SISFS Guidelines Clause 4.2"}]',
  '[{"id":"doc-sisfs-dpiit","name":"DPIIT Certificate of Recognition","description":"Issued by Startup India Portal","requirementType":"mandatory","issuingAuthority":"DPIIT","sourceEvidence":"SISFS Checklist 1"},{"id":"doc-sisfs-pitch","name":"Pitch Deck & Financial Model","description":"Showcasing product novelty, market size, and milestones","requirementType":"mandatory","issuingAuthority":"Startup Founder","sourceEvidence":"SISFS Checklist 2"}]',
  '[{"stepNumber":1,"title":"Login with Startup India Credentials","description":"Apply on the SISFS portal and select up to 3 preferred incubators.","channel":"online_portal","portalUrl":"https://seedfund.startupindia.gov.in"},{"stepNumber":2,"title":"Incubator Pitch Presentation","description":"Shortlisted startups present business model and POC to the Incubator Seed Management Committee (ISMC).","channel":"online_portal"},{"stepNumber":3,"title":"Milestone-Based Fund Release","description":"Sanctioned grant/debt disbursed directly to startup bank account based on agreed milestones.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-cgtmse-credit-guarantee',
  'credit-guarantee-fund-trust-micro-small-enterprises-cgtmse',
  'Credit Guarantee Fund Trust for Micro and Small Enterprises (CGTMSE)',
  'Collateral-free credit facility up to ₹5 Crore for micro and small enterprises with guarantee coverage up to 85% by the Government of India.',
  'CGTMSE was set up by Ministry of MSME and SIDBI to catalyze flow of institutional credit to micro and small manufacturing and service enterprises without requiring third-party collaterals or asset hypothecations.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Micro, Small and Medium Enterprises',
  'Department of MSME & SIDBI',
  'https://www.cgtmse.in',
  'free_verified',
  'Collateral-free term loans and working capital credit up to ₹5,00,00,000 with credit guarantee cover of 75% to 85% for women and SC/ST entrepreneurs.',
  'New and existing Micro and Small Enterprises (MSEs) in manufacturing, retail trade, and service sectors (excluding educational institutions, agriculture, and SHGs).',
  '[{"id":"rule-enterpriseCategory-in","parameter":"enterpriseCategory","operator":"IN","expectedValue":["micro_enterprise","small_enterprise"],"isMandatory":true,"conditionName":"Registered MSE with Udyam Registration","sourceClause":"CGTMSE Scheme Clause 2"}]',
  '[{"id":"doc-cgtmse-udyam","name":"Udyam Registration Certificate","description":"Valid MSME digital registration certificate","requirementType":"mandatory","issuingAuthority":"Ministry of MSME","sourceEvidence":"CGTMSE Checklist A"},{"id":"doc-cgtmse-itr","name":"ITR and Financial Statements (Last 2-3 Years)","description":"Audited balance sheet or projected financials","requirementType":"mandatory","issuingAuthority":"Chartered Accountant","sourceEvidence":"CGTMSE Checklist B"}]',
  '[{"stepNumber":1,"title":"Formulate Business Plan","description":"Prepare comprehensive project report with financial requirements.","channel":"online_portal"},{"stepNumber":2,"title":"Apply at Member Lending Bank","description":"Approach any scheduled commercial bank or NBFC for credit under CGTMSE scheme.","channel":"district_office"},{"stepNumber":3,"title":"Guarantee Sanction","description":"Lender bank processes loan without mortgage collateral and obtains guarantee from CGTMSE portal.","channel":"online_portal","portalUrl":"https://www.cgtmse.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-samarth-textiles',
  'samarth-scheme-for-capacity-building-textile-sector',
  'SAMARTH (Scheme for Capacity Building in Textile Sector)',
  'Industry-partnered job-oriented skilling program providing 100% free certified training and minimum 70% wage employment placement in textile industries.',
  'SAMARTH is a demand-driven and placement-oriented flagship skilling program under the Ministry of Textiles to train youth and handloom/handicraft artisans in spinning, weaving, garmenting, and technical textiles with verified employment.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Textiles',
  'Textile Training Division',
  'https://samarth-textiles.gov.in',
  'free_verified',
  '100% free national NSQF-aligned technical training, biometrically verified attendance, stipend, and guaranteed minimum 70% wage placement in textile factories.',
  'Indian youth aged 18 to 45 years seeking employment in textile and apparel manufacturing clusters.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"SAMARTH Scheme Clause 3"}]',
  '[{"id":"doc-samarth-aadhaar","name":"Aadhaar Card","description":"Mandatory for AEBAS biometric attendance","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"SAMARTH Checklist 1"}]',
  '[{"stepNumber":1,"title":"Enrolment at SAMARTH Training Centre","description":"Register at nearest accredited textile training facility in your cluster.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Classroom & Hands-on Training","description":"Undergo 300-400 hours of NSQF skill curriculum with biometric verification.","channel":"college_cell"},{"stepNumber":3,"title":"Assessment & Industry Placement","description":"Third-party assessment by Sector Skill Council followed by campus job placement.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nhdp-weavers',
  'national-handloom-development-programme-nhdp',
  'National Handloom Development Programme (NHDP)',
  'Concessional yarn supply with 15% price subsidy, financial grant up to ₹25,000 for upgraded looms, and design development for weavers.',
  'NHDP supports handloom weavers across India by ensuring subsidized supply of quality yarn (Raw Material Supply Scheme), upgrading traditional pit looms to modern frame looms, establishing mega handloom clusters, and promoting brand ''India Handloom''.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Textiles',
  'Office of the Development Commissioner for Handlooms',
  'https://handlooms.nic.in',
  'free_verified',
  '15% price subsidy on cotton/hank yarn, ₹25,000 financial grant for improved loom accessories, and marketing stalls at national handloom expos.',
  'Practicing handloom weavers, master weavers, handloom cooperatives, and Self Help Groups holding Weaver Pehchan Identity Cards.',
  '[{"id":"rule-profession-equals","parameter":"profession","operator":"EQUALS","expectedValue":"handloom_weaver","isMandatory":true,"conditionName":"Verified Handloom Weaver","sourceClause":"NHDP Scheme Clause 2.1"}]',
  '[{"id":"doc-nhdp-pehchan","name":"Weaver Pehchan Card","description":"Digital weaver identity card issued by DC Handlooms","requirementType":"mandatory","issuingAuthority":"Weavers Service Centre (WSC)","sourceEvidence":"NHDP Checklist 1"}]',
  '[{"stepNumber":1,"title":"Register at Weavers Service Centre","description":"Submit application at district Weavers Service Centre or state handloom cooperative.","channel":"district_office"},{"stepNumber":2,"title":"Avail Subsidized Yarn","description":"Purchase yarn through National Handloom Development Corporation (NHDC) depots with instant subsidy.","channel":"online_portal"},{"stepNumber":3,"title":"Loom Upgradation Grant","description":"Inspect and install sanctioned modern loom accessories with assistance from master trainers.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-adip-assistive-devices',
  'assistance-to-disabled-persons-adip-scheme',
  'Assistance to Disabled Persons for Purchase/Fitting of Aids and Appliances (ADIP)',
  '100% free distribution of sophisticated assistive aids including motorized tricycles, cochlear implants (up to ₹6 Lakhs), and smart vision devices for PwDs.',
  'The ADIP Scheme implemented by ALIMCO under Ministry of Social Justice and Empowerment assists needy persons with disabilities in procuring durable, sophisticated, and scientifically manufactured aids and appliances to promote physical, social, and economic independence.',
  'welfare',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Empowerment of Persons with Disabilities (DEPwD)',
  'https://adip.depwd.gov.in',
  'free_verified',
  '100% free assistive aids (up to ₹15,000 for standard aids, ₹50,000 for motorized tricycles, and up to ₹6,00,000 for pediatric cochlear implant surgeries).',
  'Indian citizen with minimum 40% disability holding valid UDID card, having monthly family income <= ₹20,000 (100% aid) or ₹20,001-₹30,000 (50% aid).',
  '[{"id":"rule-disabilityPercentage-greater_than_or_equal","parameter":"disabilityPercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Minimum 40% Benchmark Disability","sourceClause":"ADIP Scheme Guidelines Clause 3.1"},{"id":"rule-monthlyFamilyIncome-less_than_or_equal","parameter":"monthlyFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":30000,"isMandatory":true,"conditionName":"Monthly Income <= ₹30,000","sourceClause":"ADIP Scheme Guidelines Clause 3.2"}]',
  '[{"id":"doc-adip-udid","name":"Unique Disability Identity Card (UDID)","description":"Proof of benchmark disability","requirementType":"mandatory","issuingAuthority":"District Medical Board","sourceEvidence":"ADIP Form 1"},{"id":"doc-adip-income","name":"Income Certificate / BPL Card","description":"Income proof showing <= ₹30,000 per month","requirementType":"mandatory","issuingAuthority":"Revenue Authority / Tahsildar","sourceEvidence":"ADIP Form 2"}]',
  '[{"stepNumber":1,"title":"Assessment at ALIMCO Camp","description":"Attend district disability assessment camp organized by ALIMCO / District Social Welfare.","channel":"district_office"},{"stepNumber":2,"title":"Prescription & Measurement","description":"Medical experts examine clinical need and take measurements for customized prosthetic/orthotic aids.","channel":"district_office"},{"stepNumber":3,"title":"Free Distribution Mega Camp","description":"Receive motorized tricycle, wheelchair, hearing aid, or smart cane with warranty and user training.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-janman-tribal',
  'pradhan-mantri-janjati-adivasi-nyaya-maha-abhiyan-pm-janman',
  'Pradhan Mantri Janjati Adivasi Nyaya Maha Abhiyan (PM-JANMAN)',
  'Comprehensive ₹24,000 Crore mission delivering pucca homes, clean piped water, solar power, healthcare, and road connectivity to 75 PVTG tribal communities.',
  'PM-JANMAN is the dedicated mission targeting Particularly Vulnerable Tribal Groups (PVTGs) residing in deep forest and hill terrains across 18 states and UTs, saturated with housing, mobile medical units, clean drinking water, telecommunication, and livelihood centres.',
  'welfare',
  'central',
  'All India',
  'Ministry of Tribal Affairs',
  'PVTG Development Cell',
  'https://tribal.gov.in/PMJANMAN.aspx',
  'free_verified',
  'Free pucca house under PMAY-G (enhanced to ₹2.39 Lakhs), household off-grid solar electricity connection, functional tap water, piped road connectivity, and Van Dhan Vikas Kendra linkages.',
  'Households belonging to 75 notified Particularly Vulnerable Tribal Groups (PVTGs) identified through door-to-door saturation survey.',
  '[{"id":"rule-tribalGroup-equals","parameter":"tribalGroup","operator":"EQUALS","expectedValue":"pvtg","isMandatory":true,"conditionName":"Notified Particularly Vulnerable Tribal Group","sourceClause":"PM-JANMAN Operational Framework 2.1"}]',
  '[{"id":"doc-janman-survey","name":"PVTG Identification & Aadhaar Enrolment","description":"Verified by District Tribal Development Officer","requirementType":"mandatory","issuingAuthority":"Integrated Tribal Development Agency (ITDA)","sourceEvidence":"PM-JANMAN Checklist 1"}]',
  '[{"stepNumber":1,"title":"Door-to-Door Saturation Enumeration","description":"District ITDA field teams enumerate PVTG habitations using mobile application.","channel":"district_office"},{"stepNumber":2,"title":"On-the-spot Aadhaar & Ayushman Card Creation","description":"Mobile camps issue Aadhaar, caste certificates, and Jan Dhan accounts on-site.","channel":"district_office"},{"stepNumber":3,"title":"Infrastructure Sanction & Construction","description":"Funds released directly into beneficiary accounts for home construction and village micro-grids.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-smile-transgender',
  'support-for-marginalised-individuals-smile-scheme',
  'SMILE (Support for Marginalised Individuals for Livelihood and Enterprise)',
  'Integrated welfare offering comprehensive scholarship, health insurance (₹5 Lakhs PM-JAY cover), Garima Greh shelter, and skill training for Transgender persons.',
  'SMILE is an umbrella initiative formulated by the Ministry of Social Justice and Empowerment covering two sub-schemes: Comprehensive Rehabilitation for Welfare of Transgender Persons and Comprehensive Rehabilitation of Persons engaged in the act of Begging.',
  'welfare',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://transgender.dosje.gov.in',
  'free_verified',
  'Scholarships for transgender students (Classes 9 to Post-Graduation), ₹5,00,000 annual health cover including gender-affirming care, skill training stipend, and shelter at Garima Greh homes.',
  'Transgender persons holding Transgender Certificate of Identity issued through the National Portal for Transgender Persons.',
  '[{"id":"rule-transgenderCertificate-equals","parameter":"transgenderCertificate","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Registered on National Portal for Transgender Persons","sourceClause":"SMILE Scheme Clause 4"}]',
  '[{"id":"doc-smile-cert","name":"Transgender Certificate & Identity Card","description":"Digital certificate issued by District Magistrate","requirementType":"mandatory","issuingAuthority":"District Magistrate Portal","sourceEvidence":"National Portal TG Rules"}]',
  '[{"stepNumber":1,"title":"Apply on National Transgender Portal","description":"Obtain official Transgender Identity Card from District Magistrate with self-perceived gender identity.","channel":"online_portal","portalUrl":"https://transgender.dosje.gov.in"},{"stepNumber":2,"title":"Select Welfare Module","description":"Apply for education scholarship, PM-JAY Ayushman Bharat TG card, or skill development program.","channel":"online_portal"},{"stepNumber":3,"title":"Direct Benefit Disbursement","description":"Receive monthly education stipend and healthcare insurance card.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-ajay',
  'pradhan-mantri-anusuchit-jaati-abhyuday-yojana-pm-ajay',
  'Pradhan Mantri Anusuchit Jaati Abhyuday Yojana (PM-AJAY)',
  'Integrated development of Scheduled Caste dominant villages, income-generation asset grants up to ₹50,000, and construction of hostel facilities.',
  'PM-AJAY merges three earlier schemes (SCA to SCSP, PMAGY, and Babu Jagjivan Ram Chhatrawas Yojana) to reduce poverty among SC communities through generation of additional employment opportunities and saturation of infrastructure in SC-majority villages.',
  'welfare',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://pmajay.dosje.gov.in',
  'free_verified',
  'Financial subsidy up to ₹50,000 or 50% of asset cost for self-employment and micro-enterprises; infrastructure grants of ₹20 Lakhs per Adarsh Gram SC village.',
  'Individuals belonging to Scheduled Caste (SC) living below double poverty line limit seeking income generation assets or residing in identified Adarsh Grams.',
  '[{"id":"rule-casteCategory-equals","parameter":"casteCategory","operator":"EQUALS","expectedValue":"SC","isMandatory":true,"conditionName":"Scheduled Caste Community","sourceClause":"PM-AJAY Guidelines 2.1"}]',
  '[{"id":"doc-ajay-caste","name":"Scheduled Caste Certificate","description":"Proof of SC status","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"PM-AJAY Checklist 1"},{"id":"doc-ajay-income","name":"Income Certificate","description":"Income verification for subsidy entitlement","requirementType":"mandatory","issuingAuthority":"Revenue Authority","sourceEvidence":"PM-AJAY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Submit Application at District Welfare Office","description":"Submit proposal for income-generation asset (poultry, dairy, small retail shop).","channel":"district_office"},{"stepNumber":2,"title":"District Level Sanction","description":"District Welfare Officer evaluates beneficiary eligibility and approves capital grant.","channel":"district_office"},{"stepNumber":3,"title":"Direct Asset / Subsidy Transfer","description":"Subsidy released to supplier or beneficiary account to purchase verified machinery/stock.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-mission-shakti-one-stop-centre',
  'mission-shakti-sambal-one-stop-centre-sakhi',
  'Mission Shakti - Sambal: One Stop Centre (Sakhi Centres)',
  '24x7 integrated support providing immediate medical aid, police assistance, psycho-social counseling, legal aid, and temporary shelter for women facing violence.',
  'One Stop Centres (popularly known as Sakhi Centres) are established across all districts under Mission Shakti to facilitate access to an integrated range of services including medical, legal, police assistance, counseling, and 5-day temporary shelter under one roof to women affected by violence.',
  'welfare',
  'central',
  'All India',
  'Ministry of Women and Child Development',
  'Women Welfare Division',
  'https://wcd.nic.in/schemes/mission-shakti',
  'free_verified',
  '100% free emergency medical treatment, police FIR registration facilitation, free legal representation by empanelled advocates, psychological trauma counseling, and free shelter with food and clothing.',
  'Any woman or girl facing domestic violence, physical assault, sexual abuse, harassment, or emotional distress in public, private, or workplace spaces.',
  '[{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Women and Girl Children in Distress","sourceClause":"Mission Shakti Sambal Guidelines 4.1"}]',
  '[{"id":"doc-osc-none","name":"Zero Documentation Required for Emergency Entry","description":"Immediate admission and care without prior paperwork","requirementType":"mandatory","issuingAuthority":"Sakhi Centre","sourceEvidence":"OSC SOP Section 1"}]',
  '[{"stepNumber":1,"title":"Contact 181 Women Helpline or Walk-In","description":"Dial toll-free national 181 Women Helpline or walk into nearest District Hospital Sakhi Centre.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Immediate Medical & Shelter Intake","description":"Paramedical and legal counselor provide immediate emergency safety and trauma relief.","channel":"district_office"},{"stepNumber":3,"title":"Integrated Redressal & Rehabilitation","description":"Police facilitate video conferencing statements and legal aid attorney files court petitions.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-mahila-samman-savings',
  'mahila-samman-savings-certificate-mssc',
  'Mahila Samman Savings Certificate (MSSC)',
  'Government guaranteed small savings deposit scheme for women offering high 7.5% interest rate compounded quarterly for a 2-year tenure.',
  'MSSC is a specialized government small savings instrument announced by the Ministry of Finance to encourage financial independence among women and girls, offering an attractive fixed return of 7.5% per annum with partial withdrawal facility.',
  'welfare',
  'central',
  'All India',
  'Ministry of Finance',
  'Department of Economic Affairs',
  'https://www.indiapost.gov.in',
  'free_verified',
  'Guaranteed 7.5% annual interest compounded quarterly. Minimum deposit ₹1,000, maximum deposit ₹2,00,000 for a 2-year maturity period with up to 40% partial withdrawal after 1 year.',
  'Account can be opened by an individual woman for herself, or by a guardian on behalf of a minor girl child at any Post Office or authorized commercial bank.',
  '[{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Account Holder or Minor Girl Child","sourceClause":"MSSC Rules 2023 Rule 3"}]',
  '[{"id":"doc-mssc-kyc","name":"Aadhaar Card and PAN Card","description":"Proof of identity and address","requirementType":"mandatory","issuingAuthority":"UIDAI / Income Tax Dept","sourceEvidence":"MSSC Form 1"}]',
  '[{"stepNumber":1,"title":"Visit Post Office or Bank","description":"Obtain and fill MSSC Account Opening Form at any Head/Sub Post Office or nationalised bank.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Deposit Amount (₹1,000 to ₹2,00,000)","description":"Submit KYC documents along with cheque/cash deposit.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Receive Passbook / Certificate","description":"Collect official MSSC passbook showing interest calculation and maturity date.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-working-women-hostel',
  'mission-shakti-sakhi-niwas-working-women-hostel',
  'Mission Shakti - Sakhi Niwas (Working Women Hostel)',
  'Safe, comfortable, and highly subsidized residential hostel accommodation with day-care creche facilities for employed women in urban and semi-urban centres.',
  'Sakhi Niwas provides safe, clean, and conveniently located accommodation for working women, single mothers, and trainees away from their hometowns, charging nominal maintenance fees and featuring 24/7 security and children''s day-care.',
  'welfare',
  'central',
  'All India',
  'Ministry of Women and Child Development',
  'Mission Shakti Division',
  'https://wcd.nic.in',
  'free_verified',
  'Subsidized boarding, round-the-clock CCTV security, mess facilities, Wi-Fi, and attached creche for young children of working residents.',
  'Working women (single, widowed, divorced, separated, or married women whose families do not reside in the same city) earning up to ₹50,000/month (metropolitan) or ₹35,000/month (other areas).',
  '[{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Employed / Trainee Women","sourceClause":"Sakhi Niwas Guidelines Clause 4.1"}]',
  '[{"id":"doc-sakhi-employment","name":"Proof of Employment / Appointment Letter","description":"From employer indicating monthly remuneration","requirementType":"mandatory","issuingAuthority":"Employer HR","sourceEvidence":"Sakhi Niwas Checklist 1"}]',
  '[{"stepNumber":1,"title":"Online or Direct Application","description":"Submit application to District Sakhi Niwas hostel warden.","channel":"district_office"},{"stepNumber":2,"title":"Document Scrutiny","description":"Hostel management committee checks employment certificate and verifies seat vacancy.","channel":"district_office"},{"stepNumber":3,"title":"Room Allotment","description":"Pay nominal monthly maintenance fee and occupy allotted furnished room.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-jal-jeevan-mission',
  'jal-jeevan-mission-har-ghar-jal',
  'Jal Jeevan Mission (Har Ghar Jal)',
  'National mission ensuring functional tap water connection providing 55 litres per capita per day of prescribed potability to every rural household.',
  'Jal Jeevan Mission (JJM) is envisioned to provide safe and adequate drinking water through individual household tap connections by 2026 to all households in rural India, managed at the grassroots level by Gram Panchayat Paani Samitis.',
  'housing',
  'central',
  'All India',
  'Ministry of Jal Shakti',
  'Department of Drinking Water and Sanitation',
  'https://jaljeevanmission.gov.in',
  'free_verified',
  '100% free functional household tap water connection (FHTC) providing treated, laboratory-tested potable water at 55 litres per person per day.',
  'All permanent rural households without existing piped functional drinking water connections in villages across India.',
  '[{"id":"rule-locationType-equals","parameter":"locationType","operator":"EQUALS","expectedValue":"rural","isMandatory":true,"conditionName":"Rural Habitation Residence","sourceClause":"JJM Guidelines Section 2"}]',
  '[{"id":"doc-jjm-residence","name":"Aadhaar Card / Ration Card","description":"Proof of household occupancy in village","requirementType":"mandatory","issuingAuthority":"Panchayat Secretary","sourceEvidence":"JJM Village Registry"}]',
  '[{"stepNumber":1,"title":"Village Water Action Plan","description":"Village Water and Sanitation Committee (VWSC / Paani Samiti) surveys uncovered lanes.","channel":"district_office"},{"stepNumber":2,"title":"Pipeline Laying & Metering","description":"Contractor lays underground HDPE pipeline and installs meter and household brass bib-cock.","channel":"district_office"},{"stepNumber":3,"title":"Quality Certification","description":"Regular water testing by local women using Field Test Kits (FTKs) and geotagged on JJM portal.","channel":"online_portal","portalUrl":"https://jaljeevanmission.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-swachh-bharat-grameen',
  'swachh-bharat-mission-grameen-phase-2',
  'Swachh Bharat Mission (Grameen) Phase 2 - IHHL Incentive',
  'Direct financial incentive of ₹12,000 for constructing individual household latrines (IHHL) for rural households with solid and liquid waste management.',
  'SBM-G Phase 2 focuses on sustaining Open Defecation Free (ODF) status and achieving ODF Plus model villages across India, providing ₹12,000 financial support to new left-out households to construct durable twin-pit toilets.',
  'housing',
  'central',
  'All India',
  'Ministry of Jal Shakti',
  'Department of Drinking Water and Sanitation',
  'https://sbm.gov.in/sbmphase2',
  'free_verified',
  '₹12,000 direct financial incentive per household (Central Share ₹7,200 + State Share ₹4,800) paid in DBT installments upon construction and geotagging.',
  'All left-out rural households, newly formed families, and BPL / identified vulnerable APL households (SC/ST/women-headed/differently-abled) without a toilet.',
  '[{"id":"rule-householdToilet-equals","parameter":"householdToilet","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"No Existing Household Toilet","sourceClause":"SBM-G Guidelines Clause 4.1"}]',
  '[{"id":"doc-sbmg-aadhaar","name":"Aadhaar Card and Bank Passbook","description":"For DBT incentive transfer","requirementType":"mandatory","issuingAuthority":"UIDAI / Bank","sourceEvidence":"SBM-G Checklist 1"}]',
  '[{"stepNumber":1,"title":"Apply Online on SBM Portal","description":"Citizen registers online on SBM-G portal or via Gram Panchayat Secretary.","channel":"online_portal","portalUrl":"https://sbm.gov.in/sbmphase2"},{"stepNumber":2,"title":"Construct Twin-Pit Toilet","description":"Build sanitary toilet according to prescribed technical design.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Geotagging & Fund Transfer","description":"Block coordinator captures geotagged photo of completed toilet; ₹12,000 credited to bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-svamitva-property-card',
  'svamitva-scheme-drone-survey-property-cards',
  'SVAMITVA Scheme (Survey of Villages and Mapping with Improvised Technology in Village Areas)',
  'Drone-based demarcation of rural inhabited lands providing official legal Property Cards / Ownership Deeds for rural citizens to secure bank loans.',
  'SVAMITVA is a transformative Central Sector scheme of Ministry of Panchayati Raj using high-resolution drone mapping to provide an integrated property validation solution for rural India, issuing legal ''Property Cards'' enabling villagers to use property as a financial asset.',
  'welfare',
  'central',
  'All India',
  'Ministry of Panchayati Raj',
  'Survey and Settlement Division',
  'https://svamitva.nic.in',
  'free_verified',
  'Free legal Property Card / Ownership Deed (Sanad / Ghar Ka Naksha) demarcating exact boundaries, establishing clear ownership and unlocking property loans.',
  'All rural property owners having residential plots/houses located within the ''Abadi'' (inhabited) area of surveyed villages.',
  '[{"id":"rule-propertyLocation-equals","parameter":"propertyLocation","operator":"EQUALS","expectedValue":"rural_abadi","isMandatory":true,"conditionName":"House Located in Village Abadi Area","sourceClause":"SVAMITVA Scheme Guidelines 3.1"}]',
  '[{"id":"doc-svamitva-aadhaar","name":"Aadhaar Card and Ration Card","description":"For verification of family ownership","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"SVAMITVA Guidelines 4"}]',
  '[{"stepNumber":1,"title":"Chuna Demarcation","description":"Villagers mark ground boundary lines of individual plots with limestone (chuna).","channel":"district_office"},{"stepNumber":2,"title":"Survey of India Drone Flying","description":"Drones capture 5cm resolution ortho-rectified aerial imagery.","channel":"district_office"},{"stepNumber":3,"title":"Objection Redressal & Card Issuance","description":"Gram Sabha displays maps for claims; official digital Property Card distributed with QR code.","channel":"online_portal","portalUrl":"https://svamitva.nic.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmss-capf-paramilitary',
  'prime-ministers-scholarship-scheme-capfs-assam-rifles',
  'Prime Minister''s Scholarship Scheme (PMSS) for CAPFs, Assam Rifles & Police Personnel',
  'Scholarship of ₹3,000/month for girls and ₹2,500/month for boys pursuing professional degree courses (Engineering, Medical, MBA) for wards of deceased/ex-CAPF personnel.',
  'PMSS under the Ministry of Home Affairs encourages higher professional and technical education for dependent wards and widows of Central Armed Police Forces (CRPF, BSF, CISF, ITBP, SSB, NSG), Assam Rifles, and State Police personnel martyred during terror/Maoist attacks.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Home Affairs',
  'Welfare and Rehabilitation Board (WARB)',
  'https://scholarships.gov.in',
  'free_verified',
  '₹36,000 per annum (₹3,000/month) for female students; ₹30,000 per annum (₹2,500/month) for male students paid annually throughout the degree program.',
  'Dependent wards and widows of CAPFs & AR personnel martyred, disabled, or retired; or police personnel martyred in terror attacks, pursuing professional degree with >= 60% in Class 12/Diploma.',
  '[{"id":"rule-minClass12Marks-greater_than_or_equal","parameter":"minClass12Marks","operator":"GREATER_THAN_OR_EQUAL","expectedValue":60,"isMandatory":true,"conditionName":"Minimum 60% in Class 12 / Diploma","sourceClause":"PMSS Guidelines Clause 3.1"},{"id":"rule-courseType-in","parameter":"courseType","operator":"IN","expectedValue":["btech","mbbs","bds","bpharm","mba","mca"],"isMandatory":true,"conditionName":"Recognized Professional Degree","sourceClause":"PMSS Guidelines Clause 3.2"}]',
  '[{"id":"doc-pmss-discharge","name":"Service / Discharge Certificate (PPO)","description":"Proof of parent''s paramilitary service","requirementType":"mandatory","issuingAuthority":"WARB / Force HQ","sourceEvidence":"PMSS Annexure 1"},{"id":"doc-pmss-bonafide","name":"College Bonafide Student Certificate","description":"Certifying regular admission in recognized university","requirementType":"mandatory","issuingAuthority":"College Registrar","sourceEvidence":"PMSS Annexure 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on National Scholarship Portal","description":"Select Ministry of Home Affairs - PMSS on NSP portal.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":2,"title":"Verification by Force Headquarters","description":"WARB nodal officer at Force HQ verifies parent''s service records and priority order.","channel":"district_office"},{"stepNumber":3,"title":"Direct Bank Disbursement","description":"Annual scholarship credited straight into student''s Aadhaar-linked bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmss-ex-servicemen',
  'prime-ministers-scholarship-scheme-ksb-ex-servicemen',
  'Prime Minister''s Scholarship Scheme (PMSS) for Wards of Ex-Servicemen (Army, Navy, Air Force)',
  'Scholarship of ₹36,000/year for girls and ₹30,000/year for boys for dependent wards and widows of retired/disabled defense personnel.',
  'Administered by the Kendriya Sainik Board (KSB), Department of Ex-Servicemen Welfare, Ministry of Defence, this scheme provides financial support for professional graduate degree courses (BE/BTech, MBBS, BDS, BPharm, BSc Nursing, BBA, BCA, LLB).',
  'scholarship',
  'central',
  'All India',
  'Ministry of Defence',
  'Department of Ex-Servicemen Welfare / Kendriya Sainik Board',
  'https://ksb.gov.in',
  'free_verified',
  '₹3,000 per month for girls (₹36,000 annually) and ₹2,500 per month for boys (₹30,000 annually) disbursed by DBT.',
  'Wards and widows of Ex-Servicemen / Ex-Coast Guard personnel who served in Indian Army, Navy, or Air Force with minimum 60% marks in Minimum Educational Qualification (MEQ).',
  '[{"id":"rule-minMeqMarks-greater_than_or_equal","parameter":"minMeqMarks","operator":"GREATER_THAN_OR_EQUAL","expectedValue":60,"isMandatory":true,"conditionName":"Minimum 60% in Class 12 / Degree","sourceClause":"KSB PMSS Criteria 2"}]',
  '[{"id":"doc-ksb-esmc","name":"Ex-Servicemen Identity Card & ESM Certificate","description":"Signed by Zila Sainik Welfare Officer","requirementType":"mandatory","issuingAuthority":"Zila Sainik Board","sourceEvidence":"KSB Annexure A"},{"id":"doc-ksb-ppo","name":"Pension Payment Order (PPO) or Discharge Book","description":"Record of defense service and family details","requirementType":"mandatory","issuingAuthority":"Defence Records Office","sourceEvidence":"KSB Annexure B"}]',
  '[{"stepNumber":1,"title":"Register on KSB Portal","description":"Create applicant profile on the Kendriya Sainik Board portal.","channel":"online_portal","portalUrl":"https://ksb.gov.in"},{"stepNumber":2,"title":"Verification by Zila Sainik Board (ZSB)","description":"Secretary ZSB verifies ESM credentials and signs recommendation online.","channel":"district_office"},{"stepNumber":3,"title":"Disbursal into Student Account","description":"Funds directly transferred through electronic clearing to student''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-top-class-sc',
  'top-class-education-scheme-sc-students',
  'Top Class Education Scheme for SC Students',
  'Full tuition fee reimbursement (up to ₹7 Lakhs/yr in private, actual in govt) + ₹86,000 living/books/computer grant for SC students in premier institutes (IITs, IIMs, NLUs, AIIMS).',
  'Administered by the Ministry of Social Justice and Empowerment, this scheme covers full non-refundable tuition fees, living expenses of ₹3,000/month, ₹5,000/year for books, and a one-time ₹45,000 grant for computer equipment for SC students admitted into top-ranked institutions across India.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://scholarships.gov.in',
  'free_verified',
  'Full tuition fee payment, ₹36,000 annual living expense allowance, ₹5,000 annual books/stationery grant, and ₹45,000 one-time computer/laptop purchase grant.',
  'SC student who has secured admission in an empaneled Top Class Institution (IIT, IIM, NIT, AIIMS, NLU, etc.) with total family annual income <= ₹8 Lakhs.',
  '[{"id":"rule-casteCategory-equals","parameter":"casteCategory","operator":"EQUALS","expectedValue":"SC","isMandatory":true,"conditionName":"Scheduled Caste Community","sourceClause":"Top Class SC Rules Clause 2.1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8 Lakhs","sourceClause":"Top Class SC Rules Clause 2.2"},{"id":"rule-instituteType-equals","parameter":"instituteType","operator":"EQUALS","expectedValue":"notified_premier_institute","isMandatory":true,"conditionName":"Admission in Notified Premier Institute","sourceClause":"Top Class SC Rules Clause 2.3"}]',
  '[{"id":"doc-sc-caste","name":"Caste Certificate","description":"Issued by competent revenue authority","requirementType":"mandatory","issuingAuthority":"Tahsildar / RDO","sourceEvidence":"SC Checklist 1"},{"id":"doc-sc-income","name":"Income Certificate / ITR","description":"Showing family income <= ₹8 Lakhs","requirementType":"mandatory","issuingAuthority":"Revenue Officer / IT Dept","sourceEvidence":"SC Checklist 2"},{"id":"doc-sc-fee-receipt","name":"Institute Admission Fee Receipt","description":"Showing actual fee schedule of premier institute","requirementType":"mandatory","issuingAuthority":"IIT / IIM / AIIMS","sourceEvidence":"SC Checklist 3"}]',
  '[{"stepNumber":1,"title":"Admission in Premier Institute","description":"Secure admission in IIT, IIM, AIIMS, or other empaneled premier institute.","channel":"college_cell"},{"stepNumber":2,"title":"Apply on NSP","description":"Select Top Class Education Scheme for SC on National Scholarship Portal.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":3,"title":"Direct Institution & DBT Disbursal","description":"Tuition fee paid directly to institute; living and computer allowance sent to student account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-csir-net-jrf',
  'csir-ugc-junior-research-fellowship-jrf',
  'CSIR-UGC Junior Research Fellowship (JRF) in Sciences',
  'Monthly doctoral fellowship of ₹37,000 (JRF) and ₹42,000 (SRF) plus HRA and ₹20,000 annual contingency for science research.',
  'Council of Scientific and Industrial Research (CSIR) awards Junior Research Fellowships through the Joint CSIR-UGC NET examination for pursuing PhD in Chemical Sciences, Earth Sciences, Life Sciences, Mathematical Sciences, and Physical Sciences.',
  'fellowship',
  'central',
  'All India',
  'Ministry of Science and Technology',
  'Council of Scientific and Industrial Research (CSIR)',
  'https://csirhrdg.res.in',
  'free_verified',
  '₹37,000/month for first two years (JRF), ₹42,000/month for next three years (SRF), HRA (8-24%), and ₹20,000 annual contingency.',
  'M.Sc. or equivalent degree with minimum 55% marks (50% for SC/ST/PwD) and qualified CSIR-JRF in National Eligibility Test; age limit 28 years (relaxable).',
  '[{"id":"rule-qualifyingExam-equals","parameter":"qualifyingExam","operator":"EQUALS","expectedValue":"csir_net_jrf","isMandatory":true,"conditionName":"Qualified CSIR-UGC NET JRF Rank","sourceClause":"CSIR HRDG Criteria 1"},{"id":"rule-minMscMarks-greater_than_or_equal","parameter":"minMscMarks","operator":"GREATER_THAN_OR_EQUAL","expectedValue":55,"isMandatory":true,"conditionName":"Minimum 55% in Master of Science","sourceClause":"CSIR HRDG Criteria 2"}]',
  '[{"id":"doc-csir-award","name":"CSIR-UGC NET JRF Award Letter","description":"Official JRF rank qualification certificate","requirementType":"mandatory","issuingAuthority":"NTA / CSIR","sourceEvidence":"HRDG Annexure I"},{"id":"doc-csir-joining","name":"PhD Joining Report","description":"From recognized university or CSIR national laboratory","requirementType":"mandatory","issuingAuthority":"University / CSIR Lab","sourceEvidence":"HRDG Annexure II"}]',
  '[{"stepNumber":1,"title":"Clear Joint CSIR-UGC NET","description":"Appear for and qualify JRF rank in Joint CSIR-UGC NET exam.","channel":"online_portal"},{"stepNumber":2,"title":"PhD Registration & Joining","description":"Join PhD program at any recognized Indian university, IIT, IISER, or CSIR lab.","channel":"college_cell"},{"stepNumber":3,"title":"Submit Joining Proforma","description":"Submit joining documents on CSIR New Enterprise portal for DBT monthly fellowship.","channel":"online_portal","portalUrl":"https://csirhrdg.res.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-free-coaching-sc-obc',
  'free-coaching-scheme-sc-obc-students',
  'Free Coaching Scheme for SC and OBC Students',
  '100% free coaching at top institutes for UPSC, State PSCs, JEE, NEET, GATE, CAT, and Banking exams with ₹4,000 monthly living stipend.',
  'Implemented by Ministry of Social Justice and Empowerment, this scheme enables economically disadvantaged SC and OBC students to acquire quality coaching from premier coaching institutes to compete successfully in competitive and entrance examinations.',
  'education_aid',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Social Justice and Empowerment',
  'https://coaching.dosje.gov.in',
  'free_verified',
  'Full coaching course fee paid directly to the empaneled coaching institute, plus monthly stipend of ₹4,000 for local students and ₹6,000 for outstation students for lodging.',
  'Student belonging to SC or OBC community, passed qualifying board/degree exam, family annual income <= ₹8 Lakhs.',
  '[{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["SC","OBC"],"isMandatory":true,"conditionName":"SC or OBC Category","sourceClause":"Free Coaching Scheme Guidelines 3.1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8,00,000","sourceClause":"Free Coaching Scheme Guidelines 3.2"}]',
  '[{"id":"doc-coaching-caste","name":"Caste Certificate","description":"Issued by competent revenue authority","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"Coaching Checklist 1"},{"id":"doc-coaching-income","name":"Income Certificate","description":"Income proof of current financial year","requirementType":"mandatory","issuingAuthority":"Revenue Authority","sourceEvidence":"Coaching Checklist 2"}]',
  '[{"stepNumber":1,"title":"Online Portal Registration","description":"Register on the Free Coaching Portal of Ministry of Social Justice.","channel":"online_portal","portalUrl":"https://coaching.dosje.gov.in"},{"stepNumber":2,"title":"Select Exam & Empaneled Institute","description":"Choose competitive exam (UPSC, JEE, NEET) and preferred accredited coaching center.","channel":"online_portal"},{"stepNumber":3,"title":"Seat Allotment & Class Commencement","description":"Ministry releases merit list and confirms seat with direct fee payment to institute.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-post-matric-disabilities',
  'post-matric-scholarship-students-with-disabilities',
  'Post-Matric Scholarship for Students with Disabilities',
  'Comprehensive maintenance allowance up to ₹1,600/month + book grant + disability escort/transport allowance for higher education.',
  'Centrally Sponsored Scheme by DEPwD under Ministry of Social Justice to support students with disabilities pursuing Post-Matriculation or post-secondary courses from Class 11 up to Ph.D. level in recognized institutions.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Department of Empowerment of Persons with Disabilities',
  'https://scholarships.gov.in',
  'free_verified',
  'Maintenance allowance of ₹900 to ₹1,600/month, book grant of ₹1,500/year, reader allowance for visually impaired, and disability escort allowance.',
  'Student with >= 40% benchmark disability holding UDID card, enrolled in Class 11 to PhD, family income <= ₹2.5 Lakhs per year.',
  '[{"id":"rule-disabilityPercentage-greater_than_or_equal","parameter":"disabilityPercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Minimum 40% Disability (UDID)","sourceClause":"DEPwD Guidelines 2.1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Parental Income <= ₹2.5 Lakhs","sourceClause":"DEPwD Guidelines 2.2"}]',
  '[{"id":"doc-pwd-udid","name":"Unique Disability ID (UDID) Card","description":"Disability certification","requirementType":"mandatory","issuingAuthority":"District Medical Board","sourceEvidence":"DEPwD Form A"},{"id":"doc-pwd-bonafide","name":"College Admission Bonafide Certificate","description":"Showing enrolled post-matric course","requirementType":"mandatory","issuingAuthority":"Principal / Registrar","sourceEvidence":"DEPwD Form B"}]',
  '[{"stepNumber":1,"title":"Apply on NSP Portal","description":"Register on National Scholarship Portal and choose DEPwD Post-Matric Scheme.","channel":"online_portal","portalUrl":"https://scholarships.gov.in"},{"stepNumber":2,"title":"College Verification","description":"Institute nodal officer verifies course enrollment and hostel status online.","channel":"college_cell"},{"stepNumber":3,"title":"Direct Benefit Transfer","description":"Disability allowance and maintenance allowance credited directly to student bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-paramparagat-krishi-pkvy',
  'paramparagat-krishi-vikas-yojana-pkvy-organic-farming',
  'Paramparagat Krishi Vikas Yojana (PKVY) - Organic Farming',
  'Financial assistance of ₹50,000 per hectare over 3 years for organic farming clusters, PGS certification, bio-fertilizers, and marketing.',
  'PKVY is an extended component of Soil Health Management under National Mission for Sustainable Agriculture (NMSA) promoting chemical-free organic farming through cluster approach and Participatory Guarantee System (PGS-India) certification.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture and Farmers Welfare',
  'Department of Agriculture and Farmers Welfare',
  'https://pgsindia-ncof.gov.in',
  'free_verified',
  '₹50,000 per hectare for 3 years (₹31,000/ha provided directly via DBT for organic seeds, bio-inputs, vermicompost; remainder for value addition and packaging).',
  'Farmers willing to form organic farming clusters of minimum 20 hectares (50 or more farmers) and practice chemical-free agriculture.',
  '[{"id":"rule-farmingType-equals","parameter":"farmingType","operator":"EQUALS","expectedValue":"organic","isMandatory":true,"conditionName":"Commitment to Chemical-Free Cultivation","sourceClause":"PKVY Guidelines 3.1"}]',
  '[{"id":"doc-pkvy-land","name":"Land Title / Revenue Record (Pahani / Khasra)","description":"Proof of agricultural land","requirementType":"mandatory","issuingAuthority":"Revenue Dept","sourceEvidence":"PKVY Checklist 1"},{"id":"doc-pkvy-cluster","name":"Cluster Farmer Group Resolution","description":"Signed by minimum 50 cluster farmers","requirementType":"mandatory","issuingAuthority":"Gram Panchayat / Lead Farmer","sourceEvidence":"PKVY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Form Farmer Cluster","description":"Form a cluster of 50 or more farmers covering minimum 20 hectares in contiguous area.","channel":"district_office"},{"stepNumber":2,"title":"Register with Regional Council","description":"Register cluster under PGS-India Portal for organic conversion monitoring.","channel":"online_portal","portalUrl":"https://pgsindia-ncof.gov.in"},{"stepNumber":3,"title":"Receive Direct Input Subsidies","description":"Three-year phased DBT funding released for bio-inputs, soil testing, and green manure.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-sub-mission-agri-mechanization',
  'sub-mission-on-agricultural-mechanization-smam',
  'Sub-Mission on Agricultural Mechanization (SMAM)',
  '40% to 50% capital subsidy on agricultural machinery (tractors, power tillers, rotavators, combine harvesters) and up to 80% for Custom Hiring Centres.',
  'SMAM promotes the use of mechanized agricultural equipment to offset labor shortages, increase cropping intensity, and lower cultivation costs. It provides up to 50% subsidy to individual farmers and up to 80% capital grant for establishing village-level Custom Hiring Centres (CHCs).',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture and Farmers Welfare',
  'Mechanization and Technology Division',
  'https://agrimachinery.nic.in',
  'free_verified',
  '40-50% subsidy on purchase of tractors, laser land levelers, seed drills, and power weeders (max ₹1.25L to ₹4L depending on machine type); 80% subsidy (up to ₹8L) for village cooperative CHCs.',
  'Individual farmers (priority to SC, ST, small & marginal farmers, and women farmers), FPOs, cooperatives, and rural youth entrepreneurs.',
  '[{"id":"rule-occupation-equals","parameter":"occupation","operator":"EQUALS","expectedValue":"farmer","isMandatory":true,"conditionName":"Practicing Farmer or Custom Hiring Society","sourceClause":"SMAM Guidelines Section 4"}]',
  '[{"id":"doc-smam-land","name":"Land Records (7/12, RoR, Patta)","description":"Showing agricultural holding","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"SMAM Checklist 1"},{"id":"doc-smam-quotation","name":"Authorized Machinery Manufacturer Quotation","description":"Technical specification and quotation from empanelled dealer","requirementType":"mandatory","issuingAuthority":"Registered Tractor Dealer","sourceEvidence":"SMAM Checklist 2"}]',
  '[{"stepNumber":1,"title":"Online Application on DBT Agrimachinery Portal","description":"Register on the Ministry DBT Agrimachinery portal.","channel":"online_portal","portalUrl":"https://agrimachinery.nic.in"},{"stepNumber":2,"title":"Select Machine & Dealer","description":"Select approved machinery model, manufacturer, and nearest dealer.","channel":"online_portal"},{"stepNumber":3,"title":"Verification & Subsidy Disbursal","description":"Agriculture department inspects delivery and serial number; subsidy directly credited via DBT.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-rashtriya-gokul-mission',
  'rashtriya-gokul-mission-indigenous-cattle',
  'Rashtriya Gokul Mission (RGM) - Cattle Breed Productivity',
  'Up to 50% capital subsidy (up to ₹2 Crore) for establishing high-yielding indigenous cow breed multiplication farms and subsidized sex-sorted semen.',
  'RGM aims to genetically upgrade and conserve indigenous bovine breeds (Gir, Sahiwal, Red Sindhi, Tharparkar, Ongole) and enhance milk productivity across India, providing subsidized IVF technology, sex-sorted semen, and 50% capital grants for modern dairy cattle farms.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Fisheries, Animal Husbandry and Dairying',
  'Department of Animal Husbandry and Dairying',
  'https://dahd.nic.in',
  'free_verified',
  '50% capital subsidy up to ₹2,00,00,000 for establishing a Breed Multiplication Farm of minimum 200 indigenous cows/buffaloes, plus subsidized artificial insemination at ₹100 per straw.',
  'Private entrepreneurs, FPOs, Section 8 companies, Dairy Cooperatives with minimum 3-5 acres land and experience in dairy herd management.',
  '[{"id":"rule-minHerdSize-greater_than_or_equal","parameter":"minHerdSize","operator":"GREATER_THAN_OR_EQUAL","expectedValue":200,"isMandatory":true,"conditionName":"Minimum 200 Indigenous Cattle Farm Proposal","sourceClause":"RGM Guidelines Clause 5.1"}]',
  '[{"id":"doc-rgm-dpr","name":"Detailed Project Report for Dairy Farm","description":"Including bio-security, cow sheds, silage, and automated milking units","requirementType":"mandatory","issuingAuthority":"Chartered Engineer","sourceEvidence":"RGM Annexure I"},{"id":"doc-rgm-land","name":"Clear Land Ownership Deeds (Minimum 5 Acres)","description":"Freehold or minimum 25-year lease","requirementType":"mandatory","issuingAuthority":"Sub-Registrar","sourceEvidence":"RGM Annexure II"}]',
  '[{"stepNumber":1,"title":"Submit DPR on NLM/RGM Portal","description":"Submit project proposal and bank loan sanction on the national portal.","channel":"online_portal","portalUrl":"https://dahd.nic.in"},{"stepNumber":2,"title":"State Implementing Agency Scrutiny","description":"State Livestock Development Board verifies project site and infrastructure.","channel":"district_office"},{"stepNumber":3,"title":"Central Subsidy Release in Tranches","description":"50% capital subsidy disbursed in milestones linked with civil construction and cow procurement.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-national-beekeeping-mission',
  'national-beekeeping-and-honey-mission-nbhm',
  'National Beekeeping & Honey Mission (NBHM)',
  'Up to 50% subsidy for commercial beekeeping (bee boxes, honey extraction units, queen bee rearing, and honey testing labs).',
  'Under the Sweet Revolution, NBHM under Ministry of Agriculture provides capital subsidies and technical handholding to farmers and beekeepers to adopt scientific beekeeping, increase crop pollination yields, and generate high-value commercial honey exports.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Agriculture and Farmers Welfare',
  'National Bee Board (NBB)',
  'https://nbhm.gov.in',
  'free_verified',
  'Up to 50% financial subsidy on bee colonies and modern beehives (up to ₹2,000 per bee box), custom extraction equipment, and ₹5,00,000 for queen rearing stations.',
  'Small & marginal farmers, beekeepers, SHGs, FPOs registered with the National Bee Board practicing or intending to start scientific apiary.',
  '[{"id":"rule-registration-equals","parameter":"registration","operator":"EQUALS","expectedValue":"national_bee_board","isMandatory":true,"conditionName":"Registered on Madhukranti Portal","sourceClause":"NBHM Guidelines Clause 2"}]',
  '[{"id":"doc-nbhm-reg","name":"Madhukranti Portal Registration Certificate","description":"Beekeeper ID on NBB system","requirementType":"mandatory","issuingAuthority":"National Bee Board","sourceEvidence":"NBHM Form 1"}]',
  '[{"stepNumber":1,"title":"Register on Madhukranti Portal","description":"Register profile and details of existing/proposed colonies.","channel":"online_portal","portalUrl":"https://nbhm.gov.in"},{"stepNumber":2,"title":"Undertake Scientific Training","description":"Complete 7-day beekeeping training at KVK or National Bee Board center.","channel":"college_cell"},{"stepNumber":3,"title":"Avail Equipment Subsidy","description":"Purchase certified bee boxes from empanelled suppliers; subsidy credited directly via DBT.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-abdm-digital-health',
  'ayushman-bharat-digital-mission-abdm-abha-card',
  'Ayushman Bharat Digital Mission (ABDM) - ABHA Card',
  'Free 14-digit digital health account (ABHA ID) for every Indian citizen providing seamless, paperless access to lifetime medical records.',
  'ABHA (Ayushman Bharat Health Account) is the foundational digital health backbone enabling citizens to digitally store, manage, and share health records (lab reports, prescriptions, discharge summaries) with doctors across public and private hospitals seamlessly.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'National Health Authority (NHA)',
  'https://abha.abdm.gov.in',
  'free_verified',
  'Free instant 14-digit digital health account, interoperable health records storage, paperless hospital OPD registrations, and consent-based health record sharing.',
  'All Indian citizens of any age with an Aadhaar or mobile number.',
  '[{"id":"rule-citizenship-equals","parameter":"citizenship","operator":"EQUALS","expectedValue":"indian","isMandatory":true,"conditionName":"Indian Resident","sourceClause":"ABDM Policy Section 1"}]',
  '[{"id":"doc-abha-aadhaar","name":"Aadhaar Number or Mobile Number","description":"For instant OTP verification","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"ABDM Registration"}]',
  '[{"stepNumber":1,"title":"Visit ABHA Online Portal or App","description":"Access the official ABHA website or download the ABHA mobile app.","channel":"online_portal","portalUrl":"https://abha.abdm.gov.in"},{"stepNumber":2,"title":"Instant Aadhaar OTP Authentication","description":"Enter 12-digit Aadhaar and verify via OTP sent to registered mobile.","channel":"online_portal"},{"stepNumber":3,"title":"Download Digital ABHA Card","description":"Download digital card with QR code; show at any hospital for instant OPD token.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-mission-indradhanush',
  'intensified-mission-indradhanush-imi-immunization',
  'Intensified Mission Indradhanush (IMI 5.0) Universal Immunization',
  '100% free immunization against 12 vaccine-preventable life-threatening diseases for all children up to 5 years and pregnant mothers.',
  'Mission Indradhanush ensures full immunization coverage for unvaccinated and partially vaccinated children and pregnant women against 12 deadly diseases: Polio, Measles, Rubella, Diphtheria, Pertussis, Tetanus, Hepatitis B, Meningitis, TB, Pneumococcal, and Rotavirus.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Health and Family Welfare',
  'Immunization Division',
  'https://uwin.mohfw.gov.in',
  'free_verified',
  '100% free WHO-standard vaccines administered at all government primary health centres and special door-to-door immunization camps.',
  'All children from birth up to 5 years of age and pregnant women who missed routine immunization doses.',
  '[{"id":"rule-maxAgeYears-less_than_or_equal","parameter":"maxAgeYears","operator":"LESS_THAN_OR_EQUAL","expectedValue":5,"isMandatory":true,"conditionName":"Child Age 0 to 5 Years or Pregnant Mother","sourceClause":"UIP Guidelines Section 2"}]',
  '[{"id":"doc-imi-none","name":"No Prior Documents Required (U-WIN Registration on spot)","description":"Instant entry on digital U-WIN vaccine registry","requirementType":"mandatory","issuingAuthority":"Health Worker / ANM","sourceEvidence":"U-WIN SOP"}]',
  '[{"stepNumber":1,"title":"Locate Nearest Immunization Camp","description":"Check dates for Wednesday/Saturday Village Health Sanitation and Nutrition Day (VHSND).","channel":"district_office"},{"stepNumber":2,"title":"Vaccine Administration","description":"Trained ANM administers prescribed age-appropriate vaccines.","channel":"district_office"},{"stepNumber":3,"title":"Download U-WIN Digital Certificate","description":"Get digital vaccine passport with QR code instantly on mobile via U-WIN.","channel":"online_portal","portalUrl":"https://uwin.mohfw.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-ignwps-widow-pension',
  'indira-gandhi-national-widow-pension-scheme-ignwps',
  'Indira Gandhi National Widow Pension Scheme (IGNWPS)',
  'Monthly social security pension of ₹300 to ₹1,500/month (with state top-up) for widows aged 40 to 79 living below the poverty line.',
  'Part of the National Social Assistance Programme (NSAP), IGNWPS provides life-long monthly financial pensions directly into the bank accounts of indigent widows to prevent destitution and ensure dignity.',
  'pension',
  'central',
  'All India',
  'Ministry of Rural Development',
  'NSAP Social Assistance Division',
  'https://nsap.nic.in',
  'free_verified',
  'Central monthly pension of ₹300 supplemented by state governments (reaching ₹1,000 to ₹3,000/month in many states) credited directly via DBT.',
  'Widow aged between 40 and 79 years belonging to a household living below the poverty line according to SECC/BPL criteria.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Minimum Age 40 Years","sourceClause":"IGNWPS Guidelines Clause 1"},{"id":"rule-maritalStatus-equals","parameter":"maritalStatus","operator":"EQUALS","expectedValue":"widow","isMandatory":true,"conditionName":"Widow","sourceClause":"IGNWPS Guidelines Clause 2"},{"id":"rule-bplStatus-equals","parameter":"bplStatus","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Below Poverty Line Household","sourceClause":"IGNWPS Guidelines Clause 3"}]',
  '[{"id":"doc-ignwps-death","name":"Husband''s Death Certificate","description":"Official death certificate issued by registrar of births and deaths","requirementType":"mandatory","issuingAuthority":"Municipality / Panchayat","sourceEvidence":"NSAP Form 1"},{"id":"doc-ignwps-bpl","name":"BPL Ration Card / Income Certificate","description":"Confirming household below poverty line","requirementType":"mandatory","issuingAuthority":"Food & Civil Supplies","sourceEvidence":"NSAP Form 2"}]',
  '[{"stepNumber":1,"title":"Submit Application to Tahsildar / Panchayat","description":"Submit filled NSAP form with husband''s death certificate at local revenue office.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Gram Sabha / Municipal Verification","description":"Local body verifies applicant residence and economic condition.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Pension Direct Transfer","description":"Sanctioned pension deposited automatically every month into savings bank account.","channel":"online_portal","portalUrl":"https://nsap.nic.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-igndps-disability-pension',
  'indira-gandhi-national-disability-pension-scheme-igndps',
  'Indira Gandhi National Disability Pension Scheme (IGNDPS)',
  'Monthly pension for persons with severe and multiple disabilities (80%+ disability) living below the poverty line.',
  'Administered under NSAP, IGNDPS extends monthly cash pensions to persons with severe disabilities, dwarfism, or multiple disabilities belonging to BPL households to support their fundamental living and medical needs.',
  'pension',
  'central',
  'All India',
  'Ministry of Rural Development',
  'NSAP Social Assistance Division',
  'https://nsap.nic.in',
  'free_verified',
  'Monthly direct pension of ₹300 to ₹1,500/month (enhanced with state contribution up to ₹4,000/month in progressive states) deposited directly into beneficiary''s account.',
  'Individuals aged 18 to 79 years having minimum 80% severe disability or multiple disabilities belonging to BPL households.',
  '[{"id":"rule-disabilityPercentage-greater_than_or_equal","parameter":"disabilityPercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":80,"isMandatory":true,"conditionName":"Minimum 80% Severe Disability","sourceClause":"IGNDPS Criteria Clause 2"},{"id":"rule-bplStatus-equals","parameter":"bplStatus","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"BPL Family Member","sourceClause":"IGNDPS Criteria Clause 3"}]',
  '[{"id":"doc-igndps-medical","name":"Disability Certificate / UDID Card showing >= 80%","description":"Issued by District Medical Board / Civil Surgeon","requirementType":"mandatory","issuingAuthority":"District Hospital","sourceEvidence":"IGNDPS Checklist 1"},{"id":"doc-igndps-bpl","name":"BPL Ration Card / Income Certificate","description":"Proof of economic status","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"IGNDPS Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply at Local Revenue Office","description":"Submit application at Block Development Office (BDO) or Municipal Ward Office.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Medical Board Record Check","description":"Verifying UDID disability percentage and residency.","channel":"district_office"},{"stepNumber":3,"title":"Direct Monthly Credit","description":"Monthly pension credited to Aadhaar-linked savings account.","channel":"online_portal","portalUrl":"https://nsap.nic.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-nfbs-family-benefit',
  'national-family-benefit-scheme-nfbs',
  'National Family Benefit Scheme (NFBS)',
  'Lump sum cash assistance of ₹20,000 to the bereaved BPL household on the death of the primary breadwinner.',
  'NFBS provides emergency one-time cash assistance of ₹20,000 to indigent families below the poverty line upon the sudden death of the primary male or female breadwinner aged 18 to 59 years, preventing family starvation and debt traps.',
  'welfare',
  'central',
  'All India',
  'Ministry of Rural Development',
  'Social Assistance Division',
  'https://nsap.nic.in',
  'free_verified',
  '₹20,000 lump sum direct bank transfer paid to the surviving spouse or eldest surviving family member.',
  'Death of primary breadwinner aged between 18 and 59 years in a below-poverty-line household; application submitted within 1 year of demise.',
  '[{"id":"rule-bplStatus-equals","parameter":"bplStatus","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Below Poverty Line Household","sourceClause":"NFBS Scheme Rule 1"}]',
  '[{"id":"doc-nfbs-death","name":"Death Certificate of Breadwinner","description":"Showing age between 18 and 59 at time of death","requirementType":"mandatory","issuingAuthority":"Registrar of Deaths","sourceEvidence":"NFBS Checklist 1"},{"id":"doc-nfbs-bpl","name":"BPL Certificate / Food Security Card","description":"Proof of household poverty status","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"NFBS Checklist 2"}]',
  '[{"stepNumber":1,"title":"Submit Application within 12 Months","description":"Apply at Tahsil / Block Development Office within one year of demise.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Verification of Breadwinner Status","description":"Revenue Inspector verifies family dependency and cause of demise.","channel":"district_office"},{"stepNumber":3,"title":"Instant Lump Sum Transfer","description":"Direct transfer of ₹20,000 into the surviving nominee''s bank account.","channel":"online_portal","portalUrl":"https://nsap.nic.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-ddu-gky-skilling',
  'deen-dayal-upadhyaya-grameen-kaushalya-yojana-ddu-gky',
  'Deen Dayal Upadhyaya Grameen Kaushalya Yojana (DDU-GKY)',
  '100% free residential skill training, free uniforms, lodging, tablet computer, and guaranteed minimum 70% job placement for rural poor youth.',
  'DDU-GKY is a demand-driven placement-linked skill initiative under Ministry of Rural Development for rural youth aged 15-35 years, providing completely free training with industry partners in IT, Healthcare, Retail, Logistics, and Electronics with post-placement tracking.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Rural Development',
  'Rural Skills Division',
  'https://ddugky.gov.in',
  'free_verified',
  'Completely free residential training, free hostel accommodation, meals, tablet computer/books, and mandatory minimum 70% placement with salary >= statutory minimum wages.',
  'Rural youth aged 15 to 35 years (up to 45 for women, SC, ST, and PwD) belonging to poor rural households (BPL / SECC / MGNREGA workers).',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":15,"isMandatory":true,"conditionName":"Minimum Age 15 Years","sourceClause":"DDU-GKY Clause 3.1"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":35,"isMandatory":true,"conditionName":"Maximum Age 35 Years","sourceClause":"DDU-GKY Clause 3.2"},{"id":"rule-residence-equals","parameter":"residence","operator":"EQUALS","expectedValue":"rural","isMandatory":true,"conditionName":"Rural Resident","sourceClause":"DDU-GKY Clause 3.3"}]',
  '[{"id":"doc-gky-aadhaar","name":"Aadhaar Card","description":"Proof of identity and age","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"DDU-GKY Form 1"},{"id":"doc-gky-bpl","name":"BPL Card / MGNREGA Job Card / SECC Household Name","description":"Proof of rural poor background","requirementType":"mandatory","issuingAuthority":"Gram Panchayat","sourceEvidence":"DDU-GKY Form 2"}]',
  '[{"stepNumber":1,"title":"Mobilization Camp or Portal Registration","description":"Register at Gram Panchayat skill mela or on the Kaushal Panjee portal.","channel":"online_portal","portalUrl":"https://ddugky.gov.in"},{"stepNumber":2,"title":"Counseling & Trade Selection","description":"Counselor assesses aptitude and assigns student to certified Project Implementing Agency (PIA).","channel":"college_cell"},{"stepNumber":3,"title":"Training & Guaranteed Job Placement","description":"Complete 3-12 months residential course, earn NCVET certificate, and receive appointment letter.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-van-dhan-vikas',
  'van-dhan-vikas-karyakram-trifed',
  'Van Dhan Vikas Karyakram (TRIFED) - Forest Produce Value Addition',
  '₹15 Lakhs infrastructure grant per Van Dhan Vikas Kendra for tribal gathering SHGs to process, package, and brand Minor Forest Produce.',
  'Launched by the Ministry of Tribal Affairs and TRIFED, the Van Dhan scheme mobilizes tribal forest gatherers into SHGs and provides ₹15 Lakhs capital grant per cluster of 300 gatherers to establish value-addition processing units for forest produce (tamarind, mahua, wild honey, herbs) to multiply tribal incomes.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Tribal Affairs',
  'Tribal Cooperative Marketing Development Federation of India (TRIFED)',
  'https://trifed.tribal.gov.in',
  'free_verified',
  '₹15,00,000 infrastructure and working capital grant per Van Dhan Kendra (300 tribal gatherers), access to TRIFED ''Tribes India'' national retail marketing network.',
  'Forest-dwelling Scheduled Tribe (ST) gatherers and traditional artisans residing in scheduled and forest areas formed into 15-member SHGs.',
  '[{"id":"rule-casteCategory-equals","parameter":"casteCategory","operator":"EQUALS","expectedValue":"ST","isMandatory":true,"conditionName":"Scheduled Tribe Community","sourceClause":"Van Dhan Guidelines 3.1"}]',
  '[{"id":"doc-vandhan-st","name":"ST Certificate & Forest Habitation Proof","description":"Verified by Gram Sabha / ITDA","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"Van Dhan Form A"}]',
  '[{"stepNumber":1,"title":"SHG Formation by ITDA","description":"Form a 15-member Van Dhan Self Help Group under Gram Sabha guidance.","channel":"district_office"},{"stepNumber":2,"title":"Cluster Sanction by TRIFED","description":"Cluster of 20 SHGs (300 members) recognized as a Van Dhan Vikas Kendra.","channel":"district_office"},{"stepNumber":3,"title":"Establish Value-Addition Centre","description":"Utilize ₹15 Lakh grant for packaging, drying, and testing machinery; sell through Tribes India.","channel":"online_portal","portalUrl":"https://trifed.tribal.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-vishwakarma-toolkit',
  'pm-vishwakarma-toolkit-incentive-credit-support',
  'PM Vishwakarma Scheme (Toolkit Incentive & Concessional Credit)',
  '₹15,000 digital toolkit incentive + collateral-free loans up to ₹3 Lakhs at 5% interest + ₹500/day training stipend for 18 traditional artisan trades.',
  'PM Vishwakarma provides end-to-end holistic support to traditional artisans and craftspeople (carpenters, blacksmiths, goldsmiths, potters, sculptors, cobblers, tailors, boat builders) with skill upgradation, ₹15,000 digital toolkit grant, and low-interest credit without collateral.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Micro, Small and Medium Enterprises',
  'Department of MSME',
  'https://pmvishwakarma.gov.in',
  'free_verified',
  'Free PM Vishwakarma Certificate & ID, basic 5-7 days training with ₹500/day stipend, ₹15,000 e-voucher for modern tools, and loans up to ₹1 Lakh (Tranche 1) and ₹2 Lakhs (Tranche 2) at 5% concessional interest.',
  'Practicing artisan in one of 18 traditional family trades, minimum age 18 years, not availed PMEGP/MUDRA loan in past 5 years, one member per family.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"PM Vishwakarma Section 3.1"},{"id":"rule-tradeCategory-in","parameter":"tradeCategory","operator":"IN","expectedValue":["carpenter","blacksmith","armourer","sculptor","potter","cobbler","tailor","boat_builder","goldsmith","locksmith","barber","washerman"],"isMandatory":true,"conditionName":"18 Traditional Trades","sourceClause":"PM Vishwakarma Section 3.2"}]',
  '[{"id":"doc-vishwakarma-aadhaar","name":"Aadhaar Card and Mobile Number","description":"Identity authentication","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Vishwakarma Checklist 1"},{"id":"doc-vishwakarma-trade-proof","name":"Trade Self-Declaration / Gram Panchayat Verification","description":"Proof of working in traditional trade","requirementType":"mandatory","issuingAuthority":"Gram Panchayat / ULB","sourceEvidence":"Vishwakarma Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply at Common Services Centre (CSC)","description":"Artisan registers biometrics at CSC choosing traditional trade.","channel":"meeseva_csc","portalUrl":"https://pmvishwakarma.gov.in"},{"stepNumber":2,"title":"3-Tier Verification (Panchayat, District, State)","description":"Gram Panchayat verifies traditional artisan status.","channel":"district_office"},{"stepNumber":3,"title":"Skill Training & ₹15,000 Toolkit Voucher","description":"Attend basic training and receive ₹15,000 e-RUPI voucher for tools.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pli-electronics-manufacturing',
  'production-linked-incentive-pli-large-scale-electronics',
  'Production Linked Incentive (PLI) Scheme for Large Scale Electronics Manufacturing',
  '4% to 6% production incentive on incremental sales of manufactured mobile phones and electronic components in India.',
  'PLI Scheme for Large Scale Electronics Manufacturing under MeitY positions India as a global manufacturing hub by offering financial incentives of 4% to 6% on incremental sales over base year to domestic and global electronics manufacturers.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Electronics and Information Technology',
  'Electronics Hardware Manufacturing Division',
  'https://www.meity.gov.in/esdm/pli',
  'free_verified',
  'Incentive of 4% to 6% on incremental sales of manufactured goods (mobile phones, specified electronic components, semiconductors) for a period of 5 years.',
  'Companies incorporated in India meeting specified minimum threshold investments and incremental sales targets in electronic components or mobile manufacturing.',
  '[{"id":"rule-incorporationCountry-equals","parameter":"incorporationCountry","operator":"EQUALS","expectedValue":"India","isMandatory":true,"conditionName":"Company Incorporated in India","sourceClause":"PLI Guidelines Clause 2"}]',
  '[{"id":"doc-pli-approval","name":"PLI Approval Letter from MeitY / IFCI","description":"Designating approved manufacturing entity","requirementType":"mandatory","issuingAuthority":"MeitY / IFCI","sourceEvidence":"PLI Annexure 1"}]',
  '[{"stepNumber":1,"title":"Submit Application on MeitY ESDM Portal","description":"Submit detailed investment and domestic value addition proposal.","channel":"online_portal","portalUrl":"https://www.meity.gov.in"},{"stepNumber":2,"title":"Investment Audit & Factory Commissioning","description":"Project Management Agency (IFCI) audits plant and machinery investments.","channel":"district_office"},{"stepNumber":3,"title":"Annual Incentive Claim Disbursement","description":"Direct treasury credit based on audited incremental commercial turnover.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-green-hydrogen-mission',
  'national-green-hydrogen-mission-sight-incentive',
  'National Green Hydrogen Mission - SIGHT Programme',
  'Direct production incentive up to ₹50/kg for Green Hydrogen production and ₹4,440/kW capital incentive for domestic Electrolyser manufacturing.',
  'The Strategic Interventions for Green Hydrogen Transition (SIGHT) under MNRE offers financial incentives for domestic electrolyser manufacturing (₹4,440 Crore outlay) and green hydrogen production (₹13,050 Crore outlay) to make India a global green energy exporter.',
  'livelihood',
  'central',
  'All India',
  'Ministry of New and Renewable Energy',
  'Hydrogen Division',
  'https://mnre.gov.in',
  'free_verified',
  'Green hydrogen production subsidy: ₹50/kg (Year 1), ₹40/kg (Year 2), and ₹30/kg (Year 3); Electrolyser manufacturing subsidy up to ₹4,440 per kW base incentive.',
  'Producers of green hydrogen and manufacturers of electrolysers bidding through Solar Energy Corporation of India (SECI) competitive auctions.',
  '[{"id":"rule-technologyType-in","parameter":"technologyType","operator":"IN","expectedValue":["green_hydrogen","electrolyser_manufacturing"],"isMandatory":true,"conditionName":"Eligible Clean Tech Energy Enterprise","sourceClause":"SIGHT Guidelines Clause 3"}]',
  '[{"id":"doc-sight-seci","name":"SECI Award of Bid Letter","description":"Selection in competitive reverse auction","requirementType":"mandatory","issuingAuthority":"SECI","sourceEvidence":"SIGHT Doc 1"}]',
  '[{"stepNumber":1,"title":"Participate in SECI Reverse Auction","description":"Submit technical and financial bids on SECI e-procurement portal.","channel":"online_portal"},{"stepNumber":2,"title":"Establish Green Hydrogen Plant","description":"Set up capacity using renewable energy power purchase agreements.","channel":"district_office"},{"stepNumber":3,"title":"Claim Production Incentive","description":"Quarterly submission of certified green hydrogen mass output for DBT incentive credit.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-ebus-sewa',
  'pm-ebus-sewa-urban-mobility',
  'PM-eBus Sewa (Green Urban Bus Operation Scheme)',
  'Central operational subsidy to deploy 10,000 electric city buses across 169 tier-2 and tier-3 cities with depot charging infrastructure.',
  'PM-eBus Sewa deploys 10,000 electric buses on Public-Private Partnership (PPP) model in cities with population between 3 Lakh and 40 Lakhs lacking organized public bus transport, providing per-kilometer operational viability gap funding for 10 years.',
  'welfare',
  'central',
  'All India',
  'Ministry of Housing and Urban Affairs',
  'Urban Transport Division',
  'https://mohua.gov.in',
  'free_verified',
  'Central operational subsidy of ₹20 to ₹24 per bus-km for 10 years, plus 100% capital grant for power infrastructure behind the meter for bus charging stations.',
  'Municipal Corporations and Urban Local Bodies of non-metro cities without adequate bus fleet, operating through empanelled bus operators.',
  '[{"id":"rule-cityCategory-in","parameter":"cityCategory","operator":"IN","expectedValue":["tier_2","tier_3","aspirational_district"],"isMandatory":true,"conditionName":"Eligible Urban Local Body","sourceClause":"PM-eBus Guidelines 2.1"}]',
  '[{"id":"doc-ebus-mou","name":"Tripartite Agreement (MoHUA, State Govt, City Bus SPV)","description":"Framework agreement","requirementType":"mandatory","issuingAuthority":"MoHUA","sourceEvidence":"eBus Form 1"}]',
  '[{"stepNumber":1,"title":"City Bus Proposal Submission","description":"Urban Local Body submits city mobility DPR and depot land availability.","channel":"district_office"},{"stepNumber":2,"title":"Aggregated Tender by CESL","description":"National bulk procurement of electric buses at competitive tariffs.","channel":"online_portal"},{"stepNumber":3,"title":"Depot Electrification & Bus Rollout","description":"Buses commence commercial zero-emission daily passenger service.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-mitra-textiles',
  'pm-mega-integrated-textile-regions-and-apparel-pm-mitra',
  'PM Mega Integrated Textile Region and Apparel (PM MITRA) Parks',
  'Development grant of ₹500 Crore per greenfield mega textile park + ₹300 Crore Competitiveness Incentive Support (CIS) for textile factories.',
  'PM MITRA establishes 7 world-class integrated modern textile manufacturing ecosystems in Telangana, Tamil Nadu, Gujarat, Karnataka, Madhya Pradesh, Uttar Pradesh, and Maharashtra, covering farm to fiber, factory, fashion, and foreign trade under one roof.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Textiles',
  'Infrastructure Development Division',
  'https://textiles.nic.in/pm-mitra',
  'free_verified',
  'Up to ₹500 Crore per park for core common infrastructure, and up to ₹300 Crore per park as Competitiveness Incentive Support (CIS) up to 3% of turnover for manufacturing units.',
  'Textile manufacturing companies establishing spinning, weaving, processing, garmenting, or technical textile factories in notified PM MITRA parks.',
  '[{"id":"rule-unitLocation-equals","parameter":"unitLocation","operator":"EQUALS","expectedValue":"pm_mitra_park","isMandatory":true,"conditionName":"Located in PM MITRA Park","sourceClause":"PM MITRA Rules Clause 4"}]',
  '[{"id":"doc-mitra-allotment","name":"Industrial Land Allotment Letter in PM MITRA Park","description":"Issued by Park SPV","requirementType":"mandatory","issuingAuthority":"Park Development SPV","sourceEvidence":"MITRA Doc 1"}]',
  '[{"stepNumber":1,"title":"Apply for Plot Allocation","description":"Apply through state single window clearance for factory land in PM MITRA park.","channel":"district_office"},{"stepNumber":2,"title":"Factory Commissioning","description":"Construct automated manufacturing unit and commence commercial textile production.","channel":"district_office"},{"stepNumber":3,"title":"Avail CIS Turnover Incentive","description":"Receive Competitiveness Incentive Support based on annual export and domestic turnover.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-vibrant-villages',
  'vibrant-villages-programme-border-transformation',
  'Vibrant Villages Programme (Border Area Transformation)',
  'Comprehensive infrastructure and livelihood funding for border villages across Himachal, Uttarakhand, Sikkim, Arunachal, and Ladakh.',
  'Vibrant Villages Programme transforms northern border habitations into thriving eco-tourism and agri-processing centres, providing 100% all-weather road access, 24x7 solar electricity, high-speed broadband, and community tourism homestay grants.',
  'welfare',
  'central',
  'All India',
  'Ministry of Home Affairs',
  'Border Management Division',
  'https://mha.gov.in',
  'free_verified',
  'Up to ₹5 Lakhs capital grant for establishing eco-tourism homestays, free off-grid solar mini-grids, all-weather road connectivity, and optical fiber broadband.',
  'Permanent residents and Gram Panchayats in notified border blocks of Arunachal Pradesh, Himachal Pradesh, Sikkim, Uttarakhand, and UT of Ladakh.',
  '[{"id":"rule-locationType-equals","parameter":"locationType","operator":"EQUALS","expectedValue":"notified_border_village","isMandatory":true,"conditionName":"Notified Northern Border Village","sourceClause":"VVP Scheme Guidelines 2"}]',
  '[{"id":"doc-vvp-residence","name":"Border Area Permanent Resident Certificate","description":"Issued by District Magistrate","requirementType":"mandatory","issuingAuthority":"District Magistrate","sourceEvidence":"VVP Checklist 1"}]',
  '[{"stepNumber":1,"title":"Village Action Plan Formulation","description":"Gram Sabha formulates Village Development Plan (VDP) with ITBP and district administration.","channel":"district_office"},{"stepNumber":2,"title":"Homestay & Enterprise Sanction","description":"District Level Committee approves tourism and agricultural processing units.","channel":"district_office"},{"stepNumber":3,"title":"Fund Disbursal & Tourist Linkage","description":"Grant disbursed directly to resident bank account; village onboarded to national tourism portal.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-national-ayush-mission',
  'national-ayush-mission-nam-wellness-centres',
  'National Ayush Mission (NAM) - Ayush Wellness & Treatment Subsidy',
  '100% free outpatient and inpatient Ayurvedic, Yoga, Unani, Siddha, and Homeopathy healthcare and subsidized medicinal plant cultivation.',
  'NAM upgrades primary healthcare by establishing 12,500 Ayush Health and Wellness Centres (AHWCs), distributing free essential Ayush medicines, and providing financial subsidies up to 50% for farmers cultivating prioritized medicinal herbs and aromatic plants.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Ayush',
  'National Ayush Mission Division',
  'https://ayush.gov.in',
  'free_verified',
  '100% free Ayush consultation, panchakarma therapies, and generic Ayush medicines at wellness centres; 30-50% subsidy for cultivating rare medicinal plants.',
  'All citizens seeking holistic traditional medical care; farmers cultivating medicinal plants in designated agro-climatic clusters.',
  '[{"id":"rule-citizenship-equals","parameter":"citizenship","operator":"EQUALS","expectedValue":"indian","isMandatory":true,"conditionName":"Indian Resident","sourceClause":"NAM Guidelines 1"}]',
  '[{"id":"doc-ayush-none","name":"No Prior Documentation Required for OPD Treatment","description":"Open walk-in consultation","requirementType":"mandatory","issuingAuthority":"Ayush Health Centre","sourceEvidence":"NAM SOP"}]',
  '[{"stepNumber":1,"title":"Walk in to Nearest Ayush Wellness Centre","description":"Visit registered Ayush Health & Wellness Centre in your block or district.","channel":"district_office"},{"stepNumber":2,"title":"Consult Registered Ayush Physician","description":"Get pulse diagnosis, herbal medicine prescription, and yoga lifestyle guidance.","channel":"district_office"},{"stepNumber":3,"title":"Receive Free Certified Medicines","description":"Collect free certified Ayurvedic/Homeopathic medications from hospital dispensary.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-mission-vatsalya',
  'mission-vatsalya-child-protection-foster-care',
  'Mission Vatsalya (Child Protection & Non-Institutional Care Sponsorship)',
  'Monthly sponsorship grant of ₹4,000 per month per child for foster care or vulnerable families to prevent child abandonment and ensure education.',
  'Mission Vatsalya secures healthy, happy childhoods for children in need of care and protection, providing a direct family sponsorship grant of ₹4,000 per child per month for education, healthcare, and nutrition to prevent institutionalization.',
  'welfare',
  'central',
  'All India',
  'Ministry of Women and Child Development',
  'Child Protection Services',
  'https://wcd.nic.in/schemes/mission-vatsalya',
  'free_verified',
  '₹4,000 per child per month transferred directly to the bank account of the mother, foster parent, or kinship caregiver until the child attains 18 years of age.',
  'Children orphaned, abandoned, whose parents are terminally ill, or living in extreme economic distress (family income <= ₹72,000/yr rural, ₹96,000/yr urban).',
  '[{"id":"rule-childAgeYears-less_than_or_equal","parameter":"childAgeYears","operator":"LESS_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Child Under 18 Years of Age","sourceClause":"Mission Vatsalya Rules 3"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":96000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹96,000","sourceClause":"Mission Vatsalya Rules 4"}]',
  '[{"id":"doc-vatsalya-cwc","name":"Child Welfare Committee (CWC) Recommendation Order","description":"Mandatory legal order placing child under sponsorship","requirementType":"mandatory","issuingAuthority":"Child Welfare Committee","sourceEvidence":"Vatsalya Form A"},{"id":"doc-vatsalya-school","name":"Active School Enrollment Certificate","description":"Proof of continuous schooling","requirementType":"mandatory","issuingAuthority":"School Headmaster","sourceEvidence":"Vatsalya Form B"}]',
  '[{"stepNumber":1,"title":"Referral to Child Welfare Committee (CWC)","description":"Report case to District Child Protection Officer (DCPO) or CWC.","channel":"district_office"},{"stepNumber":2,"title":"Social Investigation Report (SIR)","description":"Child Protection Officer visits family and prepares socio-economic assessment.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Sponsorship Transfer","description":"CWC passes sponsorship order; ₹4,000/month credited to mother/caregiver''s account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pmgsy-rural-roads',
  'pradhan-mantri-gram-sadak-yojana-pmgsy',
  'Pradhan Mantri Gram Sadak Yojana (PMGSY - All-Weather Rural Roads)',
  '100% centrally funded construction of durable all-weather blacktopped roads connecting unconnected rural habitations.',
  'PMGSY connects all unconnected rural habitations with population >= 500 in plains (>= 250 in hill/tribal states) with durable, all-weather blacktopped paved roads, unlocking access to schools, primary healthcare, and agricultural markets.',
  'housing',
  'central',
  'All India',
  'Ministry of Rural Development',
  'National Rural Infrastructure Development Agency (NRIDA)',
  'https://omms.nic.in',
  'free_verified',
  '100% Central Government grant to construct engineered blacktop paved roads with bridges, cross-drainage, and 5-year post-construction maintenance guarantee.',
  'Rural habitations without existing all-weather road connectivity according to Census data.',
  '[{"id":"rule-habitationStatus-equals","parameter":"habitationStatus","operator":"EQUALS","expectedValue":"unconnected_rural","isMandatory":true,"conditionName":"Unconnected Habitation","sourceClause":"PMGSY Operational Guidelines Clause 2"}]',
  '[{"id":"doc-pmgsy-dpr","name":"Detailed Project Report & GIS Alignment","description":"Road engineering survey","requirementType":"mandatory","issuingAuthority":"State Rural Roads Agency","sourceEvidence":"OMMS Doc 1"}]',
  '[{"stepNumber":1,"title":"District Rural Roads Plan","description":"District administration identifies unconnected village habitations on GIS portal.","channel":"district_office"},{"stepNumber":2,"title":"Central Sanction by Empowered Committee","description":"NRIDA approves technical project DPR and sanctions central funding.","channel":"online_portal"},{"stepNumber":3,"title":"Road Construction & Mobile Geotagging","description":"Contractor constructs road with quality monitoring inspected via Meri Sadak mobile app.","channel":"district_office","portalUrl":"https://omms.nic.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-dr-ambedkar-overseas-subsidy',
  'dr-ambedkar-interest-subsidy-scheme-overseas-studies-obc-ebc',
  'Dr. Ambedkar Central Sector Scheme of Interest Subsidy for Overseas Studies (OBC/EBC)',
  '100% government payment of interest payable on educational loans taken for pursuing Master''s, MPhil, and PhD courses abroad.',
  'Under Ministry of Social Justice and Empowerment, this scheme reimburses 100% of the interest charged during the moratorium period (course duration plus one year) on education loans up to ₹20 Lakhs for OBC and EBC students studying abroad.',
  'scholarship',
  'central',
  'All India',
  'Ministry of Social Justice and Empowerment',
  'Backward Classes Division',
  'https://socialjustice.gov.in',
  'free_verified',
  '100% interest subsidy on bank educational loan during course study period plus one year or six months after securing a job, saving students up to ₹5-8 Lakhs.',
  'Student belonging to OBC or EBC community admitted to Master''s, M.Phil, or Ph.D abroad, family annual income <= ₹8 Lakhs for OBC (<= ₹5 Lakhs for EBC).',
  '[{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["OBC","EBC"],"isMandatory":true,"conditionName":"OBC or EBC Community","sourceClause":"Dr Ambedkar Guidelines Clause 3.1"},{"id":"rule-courseLevel-in","parameter":"courseLevel","operator":"IN","expectedValue":["masters","mphil","phd"],"isMandatory":true,"conditionName":"Postgraduate / Doctoral Degree Abroad","sourceClause":"Dr Ambedkar Guidelines Clause 3.2"}]',
  '[{"id":"doc-ambedkar-loan","name":"Bank Education Loan Sanction Letter","description":"From scheduled commercial bank under IBA scheme","requirementType":"mandatory","issuingAuthority":"Lending Bank","sourceEvidence":"Ambedkar Checklist 1"},{"id":"doc-ambedkar-caste","name":"OBC / EBC Certificate","description":"Issued by competent revenue authority","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"Ambedkar Checklist 2"}]',
  '[{"stepNumber":1,"title":"Avail Bank Education Loan","description":"Secure education loan from scheduled commercial bank under IBA model scheme.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Bank Claims Subsidy on Canara Bank Portal","description":"Lending bank submits claim on the nodal Canara Bank subsidy portal.","channel":"district_office"},{"stepNumber":3,"title":"Interest Credit to Loan Account","description":"Government credits full accrued interest directly to student''s loan account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-annapurna-food-grains',
  'annapurna-scheme-free-food-grains-senior-citizens',
  'Annapurna Scheme (Free Food Grains for Indigent Senior Citizens)',
  '100% free supply of 10 kg food grains (rice/wheat) per month for indigent senior citizens aged 65+ not receiving any other social pension.',
  'The Annapurna Scheme provides food security to meet the requirement of those senior citizens aged 65 years and above who are destitute, having no source of livelihood and who are not covered under the National Old Age Pension Scheme (NOAPS).',
  'welfare',
  'central',
  'All India',
  'Ministry of Consumer Affairs, Food and Public Distribution',
  'Department of Food and Public Distribution',
  'https://dfpd.gov.in',
  'free_verified',
  '10 kg of food grains (wheat or rice) per month free of cost provided through Fair Price Shops (ration shops).',
  'Senior citizens aged 65 years and above who are destitute, with no regular income, and not receiving any other old age pension.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":65,"isMandatory":true,"conditionName":"Age 65 Years and Above","sourceClause":"Annapurna Guidelines Section 2"},{"id":"rule-otherPensionReceived-equals","parameter":"otherPensionReceived","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"No Other Pension Received","sourceClause":"Annapurna Guidelines Section 3"}]',
  '[{"id":"doc-annapurna-card","name":"Annapurna Green / Yellow Ration Card","description":"Issued by Food & Civil Supplies","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept","sourceEvidence":"Annapurna Form 1"}]',
  '[{"stepNumber":1,"title":"Apply at Block Food Supply Office","description":"Submit age proof and destitute self-declaration at Tehsil/Block office.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Gram Sabha Ratification","description":"Panchayat confirms destitute status and lack of family support.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Free Grain Collection","description":"Collect 10 kg grain free from local Fair Price Shop using biometric POS.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-craftsmen-training-iti',
  'craftsmen-training-scheme-cts-industrial-training-institutes',
  'Craftsmen Training Scheme (CTS) through ITIs',
  '100% free or nominal fee vocational engineering and non-engineering trade courses in Government ITIs with national NCVT certification.',
  'Craftsmen Training Scheme (CTS) implemented by DGT under Ministry of Skill Development & Entrepreneurship provides structured vocational training in 150+ high-demand industrial trades (Electrician, Fitter, Turner, Machinist, Welder, COPA) across 15,000+ ITIs in India.',
  'education_aid',
  'central',
  'All India',
  'Ministry of Skill Development and Entrepreneurship',
  'Directorate General of Training (DGT)',
  'https://dgt.gov.in/CTS',
  'free_verified',
  'Free/subsidized vocational training, free tool kits, monthly stipend in government ITIs, and National Trade Certificate (NTC) recognized globally for technician jobs.',
  'Candidates aged 14 years and above who have passed Class 8th, 10th, or 12th depending on the chosen vocational trade.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":14,"isMandatory":true,"conditionName":"Minimum Age 14 Years","sourceClause":"CTS Rules Clause 2"}]',
  '[{"id":"doc-iti-marksheet","name":"Class 8th / 10th Passing Marksheet","description":"Proof of minimum educational qualification","requirementType":"mandatory","issuingAuthority":"School Board","sourceEvidence":"CTS Checklist 1"}]',
  '[{"stepNumber":1,"title":"Online ITI Admission Portal","description":"Apply on state ITI admission single-window portal.","channel":"online_portal"},{"stepNumber":2,"title":"Merit Counseling & Trade Allotment","description":"Choose preferred trade (Electrician, Fitter, Diesel Mechanic) based on merit rank.","channel":"college_cell"},{"stepNumber":3,"title":"Hands-on Workshop Training","description":"Complete 1-2 years training, pass AITT exam, and receive NCVT National Trade Certificate.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-rseti-rural-entrepreneurship',
  'rural-self-employment-training-institutes-rseti',
  'Rural Self Employment Training Institutes (RSETI) Free Residential Training',
  '100% free short-term residential skill training with free lodging, boarding, and bank credit linkage for rural youth to launch self-employment.',
  'RSETIs are dedicated district-level training centres managed by lead commercial banks with Ministry of Rural Development, offering short-term residential courses (mobile repairing, plumbing, tailoring, dairy farming, bakery, beauty care) with 70%+ self-employment conversion.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Rural Development',
  'Rural Livelihoods Division',
  'https://nrrseti.in',
  'free_verified',
  '100% free residential training, free hostel stay, wholesome meals, study kits, and direct credit linkage with Mudra/PMEGP bank loans upon graduation.',
  'Rural youth aged 18 to 45 years possessing basic literacy and motivation to start a micro-enterprise or trade.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Age 18 Years","sourceClause":"RSETI Norms Clause 2.1"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":45,"isMandatory":true,"conditionName":"Maximum Age 45 Years","sourceClause":"RSETI Norms Clause 2.2"}]',
  '[{"id":"doc-rseti-aadhaar","name":"Aadhaar Card and Passport Photographs","description":"Identity verification","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"RSETI Form A"}]',
  '[{"stepNumber":1,"title":"Enrol at District RSETI","description":"Walk into your district lead bank RSETI or apply through village SHG.","channel":"meeseva_csc"},{"stepNumber":2,"title":"10-30 Days Residential Course","description":"Undergo intensive practical skill training and business planning.","channel":"college_cell"},{"stepNumber":3,"title":"Bank Loan & Business Launch","description":"RSETI credit officer assists in obtaining collateral-free bank loan to start business.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-national-career-service',
  'national-career-service-ncs-portal-jobs',
  'National Career Service (NCS) Portal',
  'Free nationwide digital employment exchange offering 50+ Lakh verified private and public job vacancies, career counseling, and job fairs.',
  'NCS is a Mission Mode Project by Ministry of Labour and Employment connecting job seekers, employers, career counselors, and skill training providers through a free, transparent national digital platform with regular job melas.',
  'livelihood',
  'central',
  'All India',
  'Ministry of Labour and Employment',
  'Directorate General of Employment',
  'https://www.ncs.gov.in',
  'free_verified',
  'Free national job seeker ID card, free video-proctored career counseling, free soft skills training, and direct invitations to national job fairs.',
  'Any Indian citizen aged 14+ years seeking employment, internship, or career counseling.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":14,"isMandatory":true,"conditionName":"Minimum Age 14 Years","sourceClause":"NCS Guidelines Clause 1"}]',
  '[{"id":"doc-ncs-aadhaar","name":"Aadhaar Card or PAN Card","description":"For instant e-KYC profile verification","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"NCS Doc 1"}]',
  '[{"stepNumber":1,"title":"Register on NCS Portal","description":"Create jobseeker profile with educational qualifications and skills.","channel":"online_portal","portalUrl":"https://www.ncs.gov.in"},{"stepNumber":2,"title":"Career Counseling & Aptitude Test","description":"Book free session with accredited national career counselor.","channel":"online_portal"},{"stepNumber":3,"title":"Direct Job Application & Interviews","description":"Apply to verified vacancies and attend Model Career Centre job melas.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-atal-bhujal-yojana',
  'atal-bhujal-yojana-groundwater-management',
  'Atal Bhujal Yojana (Atal Jal - Community Groundwater Security)',
  'Community-led groundwater management scheme in 8,220 water-stressed Gram Panchayats with participatory water budgets and recharge funding.',
  'Atal Jal is a World Bank supported ₹6,000 Crore scheme under Ministry of Jal Shakti empowering community institutions (Water User Associations, Panchayats) to plan demand-side water management, construct artificial recharge structures, and conserve declining aquifers.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Jal Shakti',
  'Department of Water Resources, River Development and Ganga Rejuvenation',
  'https://ataljal.mowr.gov.in',
  'free_verified',
  'Incentive grants to Gram Panchayats for water conservation, micro-irrigation installation, rooftop rainwater harvesting, and groundwater monitoring piezometers.',
  'Gram Panchayats located in 80 water-stressed districts across Gujarat, Haryana, Karnataka, Madhya Pradesh, Maharashtra, Rajasthan, and Uttar Pradesh.',
  '[{"id":"rule-panchayatStatus-equals","parameter":"panchayatStatus","operator":"EQUALS","expectedValue":"water_stressed_atal_jal","isMandatory":true,"conditionName":"Notified Water-Stressed Gram Panchayat","sourceClause":"Atal Jal Guidelines 2"}]',
  '[{"id":"doc-ataljal-panchayat","name":"Gram Panchayat Water Security Plan (WSP)","description":"Approved by Gram Sabha","requirementType":"mandatory","issuingAuthority":"Gram Sabha","sourceEvidence":"Atal Jal Form 1"}]',
  '[{"stepNumber":1,"title":"Formulate Water Security Plan","description":"Gram Sabha assesses village water availability and drafts water budget.","channel":"district_office"},{"stepNumber":2,"title":"State Level Steering Committee Approval","description":"State groundwater board approves proposed recharge structures.","channel":"district_office"},{"stepNumber":3,"title":"Incentive Grant Disbursement","description":"Financial incentives credited directly to Gram Panchayat account upon verified water table improvement.","channel":"online_portal","portalUrl":"https://ataljal.mowr.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-matsya-kisan',
  'pradhan-mantri-matsya-kisan-samridhi-sah-yojana-pmmssy',
  'Pradhan Mantri Matsya Kisan Samridhi Sah-Yojana (PMMKSSY)',
  'Central micro-enterprise support providing up to 50% capital subsidy and performance grants for formalizing fish farmers and aquaculture workers.',
  'PMMKSSY is a Central Sector sub-scheme under PMMSY providing ₹6,000 Crore focused funding to formalize the unorganized fisheries sector, facilitate institutional credit, and provide aquaculture insurance incentives.',
  'agriculture',
  'central',
  'All India',
  'Ministry of Fisheries, Animal Husbandry and Dairying',
  'Department of Fisheries',
  'https://pmmsy.dof.gov.in',
  'free_verified',
  'Up to 50% performance grant (up to ₹25 Lakhs) for micro-enterprises in fish supply chain, plus 20-30% premium subsidy on aquaculture crop insurance.',
  'Fishers, fish vendors, fish workers, micro-enterprises, and fish farmer producer organizations registered on the National Fisheries Digital Platform.',
  '[{"id":"rule-sector-equals","parameter":"sector","operator":"EQUALS","expectedValue":"fisheries","isMandatory":true,"conditionName":"Registered Fisher or Fish Enterprise","sourceClause":"PMMKSSY Rules 2.1"}]',
  '[{"id":"doc-pmmks-reg","name":"NFDP Digital Registration ID","description":"Issued by National Fisheries Development Board","requirementType":"mandatory","issuingAuthority":"NFDB","sourceEvidence":"PMMKSSY Doc 1"}]',
  '[{"stepNumber":1,"title":"Register on National Fisheries Digital Platform","description":"Create digital profile as fish farmer or vendor.","channel":"online_portal","portalUrl":"https://nfdp.dof.gov.in"},{"stepNumber":2,"title":"Submit Project Proposal","description":"Apply for working capital support or post-harvest cold unit.","channel":"online_portal"},{"stepNumber":3,"title":"Receive Performance Grant","description":"Grant disbursed via DBT linked with verified production milestones.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-poshan-abhiyan',
  'poshan-abhiyan-national-nutrition-mission',
  'POSHAN Abhiyaan (National Nutrition Mission)',
  'Integrated nutrition support providing free supplementary hot meals, take-home rations, and growth monitoring for children and pregnant mothers.',
  'POSHAN Abhiyaan (National Nutrition Mission) is the Government of India''s flagship programme to improve nutritional outcomes for children under 6 years, adolescent girls, pregnant women, and lactating mothers using tech-driven Poshan Tracker monitoring across 14 Lakh Anganwadis.',
  'healthcare',
  'central',
  'All India',
  'Ministry of Women and Child Development',
  'Poshan Abhiyaan Division',
  'https://poshantracker.in',
  'free_verified',
  'Free fortified Take Home Ration (THR), daily hot cooked morning snacks/meals at Anganwadis, growth faltering monitoring, and micronutrient supplementation.',
  'Children aged 6 months to 6 years, pregnant women, and lactating mothers registered at Anganwadi Centres.',
  '[{"id":"rule-ageGroup-in","parameter":"ageGroup","operator":"IN","expectedValue":["infant_child","pregnant_mother","lactating_mother"],"isMandatory":true,"conditionName":"Target Nutrition Group","sourceClause":"Poshan Guidelines Section 2"}]',
  '[{"id":"doc-poshan-mcp","name":"Mother and Child Protection (MCP) Card","description":"Issued by local Anganwadi Worker","requirementType":"mandatory","issuingAuthority":"WCD Dept","sourceEvidence":"Poshan Doc 1"}]',
  '[{"stepNumber":1,"title":"Registration on Poshan Tracker","description":"Anganwadi worker captures beneficiary details on Poshan Tracker mobile app.","channel":"district_office"},{"stepNumber":2,"title":"Receive Supplementary Nutrition","description":"Collect weekly fortified food packets and hot cooked morning meals.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Growth Monitoring","description":"Worker measures height and weight to track healthy developmental milestones.","channel":"district_office","portalUrl":"https://poshantracker.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-laghu-vyapari-maandhan',
  'national-pension-scheme-for-traders-and-self-employed-pm-nps-traders',
  'National Pension Scheme for Traders and Self-Employed Persons (PM-NPS-Traders)',
  'Guaranteed monthly pension of ₹3,00,000/year (₹3,000/month) after age 60 for retail shopkeepers and small traders with 50% central matching contribution.',
  'A voluntary and contributory pension scheme for small shopkeepers, retail traders, rice millers, commission agents, and self-employed professionals with annual turnover up to ₹1.5 Crore, offering ₹3,000 guaranteed monthly pension upon reaching age 60.',
  'pension',
  'central',
  'All India',
  'Ministry of Labour and Employment',
  'Social Security Division',
  'https://maandhan.in',
  'free_verified',
  'Guaranteed ₹3,000 per month pension after age 60. Monthly contribution of ₹55 to ₹200 (depending on entry age 18-40) matched 50:50 by the Central Government.',
  'Retail shopkeepers, traders, and self-employed individuals aged 18 to 40 years with annual turnover <= ₹1.5 Crore, not covered under EPFO/ESIC/NPS.',
  '[{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Entry Age 18 to 40 Years","sourceClause":"PM-NPS-Traders Clause 2"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Maximum Age 40 Years","sourceClause":"PM-NPS-Traders Clause 3"},{"id":"rule-annualTurnoverLimit-less_than_or_equal","parameter":"annualTurnoverLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":15000000,"isMandatory":true,"conditionName":"Annual GST/Turnover <= ₹1.5 Crore","sourceClause":"PM-NPS-Traders Clause 4"}]',
  '[{"id":"doc-traders-gst","name":"GSTIN or Trade Licence / Udyam Certificate","description":"Proof of retail shop or trading business","requirementType":"mandatory","issuingAuthority":"GSTN / Municipality","sourceEvidence":"Traders Checklist 1"},{"id":"doc-traders-bank","name":"Aadhaar Card and Savings Bank Passbook","description":"For auto-debit of subscription","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Traders Checklist 2"}]',
  '[{"stepNumber":1,"title":"Enrol at Common Services Centre (CSC)","description":"Carry GSTIN/Udyam certificate and Aadhaar to nearest CSC kiosk.","channel":"meeseva_csc","portalUrl":"https://maandhan.in"},{"stepNumber":2,"title":"Set Up Auto-Debit Mandate","description":"Authenticate bank account for monthly auto-debit of prescribed subscription.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Download Vyapari Pension Card","description":"Receive instant printed PM-NPS Traders Pension Card.","channel":"meeseva_csc"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'central-pm-devine-northeast',
  'prime-ministers-development-initiative-for-north-east-pm-devine',
  'PM-DevINE (Prime Minister''s Development Initiative for North-East)',
  '100% centrally funded infrastructure and social development grant for transformative projects across all 8 North Eastern states.',
  'PM-DevINE is a 100% Central Sector scheme under Ministry of Development of North Eastern Region (MDoNER) with an outlay of ₹6,600 Crore, funding strategic infrastructure, healthcare networks, bamboo value chains, and youth employment projects in the North East.',
  'welfare',
  'central',
  'All India',
  'Ministry of Development of North Eastern Region',
  'MDoNER Projects Division',
  'https://mdoner.gov.in',
  'free_verified',
  '100% Central Government grant for high-impact regional connectivity, healthcare super-specialties, livelihood clusters, and youth sports academies.',
  'State Governments, North Eastern Council (NEC), and autonomous regional councils across the 8 North Eastern states.',
  '[{"id":"rule-region-equals","parameter":"region","operator":"EQUALS","expectedValue":"north_eastern_region","isMandatory":true,"conditionName":"North Eastern State Project","sourceClause":"PM-DevINE Guidelines Clause 3"}]',
  '[{"id":"doc-devine-dpr","name":"Project DPR and Inter-Departmental Feasibility","description":"Endorsed by State Chief Secretary","requirementType":"mandatory","issuingAuthority":"State Planning Dept","sourceEvidence":"DevINE Doc 1"}]',
  '[{"stepNumber":1,"title":"Project Prioritization by State","description":"State government submits flagship regional proposal to MDoNER.","channel":"district_office"},{"stepNumber":2,"title":"Empowered Committee Approval","description":"Inter-ministerial committee evaluates developmental impact and sanctions budget.","channel":"online_portal"},{"stepNumber":3,"title":"Fund Release & Project Execution","description":"Funds released directly to designated state implementing agency.","channel":"online_portal","portalUrl":"https://mdoner.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-rythu-bharosa',
  'telangana-rythu-bharosa',
  'Telangana Rythu Bharosa Scheme (Farmers & Agricultural Labourers)',
  'Annual direct investment support of ₹15,000 per acre to landowning farmers and ₹12,000 per year to landless agricultural labourers in Telangana.',
  'The Government of Telangana implemented the Rythu Bharosa scheme as a flagship agricultural transformation guarantee. It offers ₹15,000 per acre per year (₹7,500 each for Kharif and Rabi crop seasons) to all eligible farmers holding patta passbooks or RoFR forest title deeds. Additionally, it extends ₹12,000 per year to verified landless agricultural families to ensure financial resilience and eliminate agrarian distress.',
  'agriculture',
  'state',
  'Telangana',
  'Department of Agriculture and Cooperation, Government of Telangana',
  'Department of Agriculture and Cooperation, Government of Telangana',
  'https://rythubharosa.telangana.gov.in',
  'free_verified',
  '₹15,00,000 financial security net across seasons: ₹15,000 per acre per year for farmers (paid in two seasonal installments of ₹7,500 each); ₹12,000 per year for landless agricultural labourers via direct bank transfer (DBT).',
  'Resident farmer owning agricultural land in Telangana with updated Dharani / Bhumatha patta title or RoFR patta; or landless agricultural labourer household with valid Food Security Card.',
  '[{"id":"rule-tg-rb-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"State Domicile","sourceClause":"Telangana Rythu Bharosa Guidelines Clause 2.1"},{"id":"rule-tg-rb-land","parameter":"farmerCategory","operator":"IN","expectedValue":["landowner","rofr_patta_holder","agricultural_labourer"],"isMandatory":true,"conditionName":"Agricultural Land or Farm Labourer Status","sourceClause":"Telangana Rythu Bharosa Guidelines Clause 3.2"}]',
  '[{"id":"doc-tg-rb-passbook","name":"Pattadar Passbook / Dharani Title","description":"Digitally verified Dharani portal Patta passbook or RoFR record.","requirementType":"conditional","issuingAuthority":"Revenue Department, Govt of Telangana","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-rb-aadhaar","name":"Aadhaar Card","description":"Aadhaar linked to bank account for NPCI direct benefit transfer.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"},{"id":"doc-tg-rb-ration","name":"Food Security Card (White Ration Card)","description":"For landless agricultural labourer verification.","requirementType":"conditional","issuingAuthority":"Civil Supplies Dept, Telangana","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Land Record Verification on Dharani","description":"Ensure agricultural land parcel is properly mapped and Aadhaar-seeded in Dharani / Bhumatha records.","portalUrl":"https://dharani.telangana.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Enrollment via Agriculture Extension Officer","description":"AEO conducts field verification of the cultivator or farm labourer during Gram Sabha / Praja Palana drives.","channel":"district_office"},{"stepNumber":3,"title":"DBT Fund Disbursement","description":"Assistance is credited directly into the bank account linked via Aadhaar Payment Bridge before each cropping season.","portalUrl":"https://rythubharosa.telangana.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-mahalakshmi-free-bus',
  'telangana-mahalakshmi-free-bus-travel',
  'Telangana Mahalakshmi Scheme (Free TSRTC Bus Travel for Women)',
  '100% free bus travel for all domicile women, girls, and transgender persons across Telangana in TGS-RTC buses.',
  'Launched under the Six Guarantees, the Mahalakshmi Free Bus Travel Scheme provides unrestricted free travel to girls, women of all ages, and transgender persons resident in Telangana on State-owned public transport corporation buses (Palle Velugu, Express, City Ordinary, and Metro Express within the state borders).',
  'welfare',
  'state',
  'Telangana',
  'Transport Department & TSRTC (TGS-RTC), Government of Telangana',
  'Transport Department & TSRTC (TGS-RTC), Government of Telangana',
  'https://tgsrtc.telangana.gov.in',
  'free_verified',
  'Zero-fare tickets issued across Palle Velugu, Express, and City buses within Telangana state boundaries.',
  'Girls and women of all ages and transgender persons domiciled in Telangana. Must produce valid government photo ID card proving Telangana domicile upon boarding.',
  '[{"id":"rule-tg-mb-gender","parameter":"gender","operator":"IN","expectedValue":["female","transgender"],"isMandatory":true,"conditionName":"Gender Eligibility","sourceClause":"Mahalakshmi Bus Scheme Notification G.O.Ms.No.37"},{"id":"rule-tg-mb-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Residence","sourceClause":"Mahalakshmi Bus Scheme Clause 3"}]',
  '[{"id":"doc-tg-mb-id","name":"Telangana Domicile Photo ID","description":"Aadhaar Card, Voter ID, or Resident Certificate with Telangana address.","requirementType":"mandatory","issuingAuthority":"Govt of India / Govt of Telangana","sourceEvidence":"Notification G.O.Ms.No.37"}]',
  '[{"stepNumber":1,"title":"Board Eligible Bus","description":"Board any TSRTC (TGS-RTC) Palle Velugu, Express, or City Ordinary/Metro bus within Telangana.","channel":"online_portal"},{"stepNumber":2,"title":"Present ID to Conductor","description":"Show Aadhaar card or valid government ID with Telangana residence address.","channel":"district_office"},{"stepNumber":3,"title":"Receive Zero-Fare Ticket","description":"Conductor issues an instant zero-fare Mahalakshmi paper ticket for the intended destination.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-mahalakshmi-500-gas',
  'telangana-mahalakshmi-500-rupees-gas-cylinder',
  'Telangana Mahalakshmi Scheme (LPG Cylinder Refill at ₹500)',
  'Domestic LPG cylinder refills at a subsidized rate of ₹500 for eligible BPL families in Telangana.',
  'Under the Mahalakshmi Guarantee, the Telangana Government provides domestic LPG cooking gas cylinders to Food Security Card (White Ration Card) holder families at an effective cost of ₹500 per cylinder. Consumers pay the cylinder price at delivery, and the excess amount above ₹500 is directly credited by the State Government into the beneficiary woman''s Aadhaar-linked bank account.',
  'welfare',
  'state',
  'Telangana',
  'Civil Supplies Department, Government of Telangana',
  'Civil Supplies Department, Government of Telangana',
  'https://prajapalana.telangana.gov.in',
  'free_verified',
  'Direct bank transfer (DBT) subsidy covering the entire retail difference above ₹500 per cylinder refill for up to eligible quota per year.',
  'Telangana resident holding an active White Ration Card (Food Security Card) with active domestic LPG connection in the name of the woman of the family.',
  '[{"id":"rule-tg-mg-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"State Domicile","sourceClause":"G.O.Ms.No.9 Consumer Affairs, Food & Civil Supplies"},{"id":"rule-tg-mg-ration","parameter":"rationCardType","operator":"EQUALS","expectedValue":"white_food_security_card","isMandatory":true,"conditionName":"Food Security Card Holder","sourceClause":"G.O.Ms.No.9 Clause 2.2"}]',
  '[{"id":"doc-tg-mg-ration","name":"Food Security Card (White Ration Card)","description":"Active FSC card copy with beneficiary woman name.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept, Govt of Telangana","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-mg-lpg","name":"LPG Consumer Connection Passbook","description":"Domestic gas connection booklet or subscription receipt.","requirementType":"mandatory","issuingAuthority":"IOCL / BPCL / HPCL Agency","sourceEvidence":"Clause 4.2"},{"id":"doc-tg-mg-aadhaar","name":"Aadhaar Card","description":"Beneficiary woman Aadhaar linked to bank account.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Submit Praja Palana Application","description":"Submit Praja Palana form or apply online linking Food Security Card and LPG Consumer ID.","portalUrl":"https://prajapalana.telangana.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Book Gas Cylinder","description":"Book LPG refill through regular distributor channels and pay standard delivery price.","channel":"online_portal"},{"stepNumber":3,"title":"Receive Balance Refund via DBT","description":"State government automatically credits the subsidy amount (bill amount minus ₹500) into the Aadhaar-seeded bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-gruha-jyothi',
  'telangana-gruha-jyothi-free-electricity',
  'Telangana Gruha Jyothi Scheme (200 Units Free Electricity)',
  'Free domestic electricity up to 200 units per month for all eligible residential households in Telangana.',
  'Telangana Gruha Jyothi scheme fulfills the promise of providing up to 200 units of free power per month to residential consumers possessing Food Security Cards (White Ration Cards). The scheme exempts households from energy charges, customer charges, and electricity duties for consumption up to 200 kWh per billing cycle.',
  'welfare',
  'state',
  'Telangana',
  'Energy Department, TGSPDCL & TGNPDCL, Government of Telangana',
  'Energy Department, TGSPDCL & TGNPDCL, Government of Telangana',
  'https://prajapalana.telangana.gov.in',
  'free_verified',
  'Zero electricity bill for consumption up to 200 units per month for domestic connections.',
  'Resident domestic electricity consumer in Telangana with active Food Security Card (White Ration Card), unique Service Connection Number linked to Aadhaar.',
  '[{"id":"rule-tg-gj-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"State Domicile","sourceClause":"Gruha Jyothi Policy Guidelines Clause 2.1"},{"id":"rule-tg-gj-consumption","parameter":"monthlyElectricityUnits","operator":"LESS_THAN_OR_EQUAL","expectedValue":200,"isMandatory":true,"conditionName":"Monthly Power Consumption Limit","sourceClause":"Gruha Jyothi Policy Guidelines Clause 3.1"}]',
  '[{"id":"doc-tg-gj-bill","name":"Domestic Electricity Bill / USC No","description":"Recent electricity bill showing domestic Category-I service connection.","requirementType":"mandatory","issuingAuthority":"TGSPDCL / TGNPDCL","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-gj-fsc","name":"Food Security Card (White Ration Card)","description":"Active White Ration Card registered in Telangana.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Department, Telangana","sourceEvidence":"Clause 4.2"},{"id":"doc-tg-gj-aadhaar","name":"Aadhaar Card","description":"Aadhaar of consumer matching ration card records.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Submit Application via Praja Palana / MeeSeva","description":"Provide Consumer USC Number, White Ration Card number, and Aadhaar on Praja Palana or DISCOM portal.","portalUrl":"https://prajapalana.telangana.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Database Linking and Verification","description":"DISCOM links service meter to Civil Supplies ration card registry.","channel":"district_office"},{"stepNumber":3,"title":"Issuance of Zero Electricity Bill","description":"Meter reader issues a monthly zero bill showing full subsidy for units consumed under 200 units.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-indiramma-indlu',
  'telangana-indiramma-indlu-housing',
  'Telangana Indiramma Indlu Housing Scheme',
  'Financial assistance of ₹5,00,000 for constructing a permanent house for homeless poor and plot owners in Telangana.',
  'The Indiramma Indlu Scheme provides housing assistance of ₹5,00,000 to economically disadvantaged homeless families in Telangana. For families who already own a residential plot of land, ₹5 lakh is provided in four construction milestone stages. For shelterless families without land, a residential house site plot along with ₹5 lakh financial assistance is sanctioned.',
  'housing',
  'state',
  'Telangana',
  'Telangana State Housing Corporation Limited (TSHCL), Government of Telangana',
  'Telangana State Housing Corporation Limited (TSHCL), Government of Telangana',
  'https://housing.telangana.gov.in',
  'free_verified',
  '₹5,00,000 financial grant released in 4 stages (Basement, Roof Level, Roof Slab, and Completion) + MGNREGS wage component and SBM toilet assistance.',
  'Homeless families or those residing in katcha huts in Telangana holding a White Ration Card; priority given to SC, ST, minority, and female-headed households.',
  '[{"id":"rule-tg-ii-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"Indiramma Housing Operational Guidelines Section 2"},{"id":"rule-tg-ii-housing","parameter":"housingStatus","operator":"IN","expectedValue":["homeless","katcha_house","open_plot_only"],"isMandatory":true,"conditionName":"Lack of Pucca House","sourceClause":"Indiramma Housing Operational Guidelines Section 3"}]',
  '[{"id":"doc-tg-ii-plot","name":"Plot Title Deed / Possession Certificate","description":"Registered document, Gram Panchayat / Municipal patta, or possession certificate.","requirementType":"conditional","issuingAuthority":"Registration Dept / Tahsildar","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-ii-ration","name":"White Food Security Card","description":"Proof of BPL status in Telangana.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept","sourceEvidence":"Clause 4.2"},{"id":"doc-tg-ii-bank","name":"Aadhaar-Seeded Bank Account Passbook","description":"Bank account details of the woman head of household for stage-wise DBT.","requirementType":"mandatory","issuingAuthority":"Scheduled Commercial Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Application through Praja Palana or Gram Sabha","description":"Apply during Praja Palana ward/village assemblies or via MeeSeva.","portalUrl":"https://prajapalana.telangana.gov.in","channel":"meeseva_csc"},{"stepNumber":2,"title":"Field Verification & Geotagging","description":"Housing engineer conducts physical inspection and geotags the plot location.","channel":"district_office"},{"stepNumber":3,"title":"Sanction Order & Stage-Wise Fund Release","description":"District Collector sanctions approval; funds disbursed at basement, roof level, slab, and completion.","portalUrl":"https://housing.telangana.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-dalit-bandhu',
  'telangana-dalit-bandhu',
  'Telangana Dalit Bandhu Scheme',
  'Direct financial grant of ₹10,00,000 per eligible Scheduled Caste (SC) family for enterprise creation with 100% subsidy.',
  'Telangana Dalit Bandhu is an economic empowerment initiative offering ₹10,00,000 direct one-time grant to eligible SC families to start businesses, trade, manufacturing, or service enterprises. The assistance is a 100% direct grant with no bank linkage, collateral, or repayment requirement, designed to foster Dalit entrepreneurship and financial autonomy.',
  'livelihood',
  'state',
  'Telangana',
  'Scheduled Castes Development Department, Government of Telangana',
  'Scheduled Castes Development Department, Government of Telangana',
  'https://dalitbandhu.telangana.gov.in',
  'free_verified',
  '₹10,00,000 direct financial grant credited into dedicated Dalit Bandhu bank account for starting approved enterprise or business activity.',
  'Permanent resident of Telangana belonging to Scheduled Caste (SC) community with valid caste certificate and Food Security Card.',
  '[{"id":"rule-tg-db-caste","parameter":"socialCategory","operator":"EQUALS","expectedValue":"SC","isMandatory":true,"conditionName":"Scheduled Caste Community","sourceClause":"Dalit Bandhu Operational Rules Clause 2"},{"id":"rule-tg-db-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"Dalit Bandhu Operational Rules Clause 3"}]',
  '[{"id":"doc-tg-db-caste","name":"Integrated Caste Certificate (MeeSeva)","description":"Valid SC community certificate issued by Revenue Department.","requirementType":"mandatory","issuingAuthority":"Tahsildar via MeeSeva","sourceEvidence":"Clause 5.1"},{"id":"doc-tg-db-ration","name":"Food Security Card","description":"White ration card confirming family composition.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept","sourceEvidence":"Clause 5.2"},{"id":"doc-tg-db-project","name":"Business / Enterprise Profile","description":"Detailed business idea or asset selection statement.","requirementType":"mandatory","issuingAuthority":"Beneficiary / District Scrutiny Committee","sourceEvidence":"Clause 5.3"}]',
  '[{"stepNumber":1,"title":"Identification and Verification by District Committee","description":"District Collectorate and SC Corporation identify beneficiaries in assembly constituencies.","channel":"district_office"},{"stepNumber":2,"title":"Selection of Business Sector","description":"Beneficiary chooses enterprise (agriculture, transport, retail, manufacturing, services) with guidance.","channel":"district_office"},{"stepNumber":3,"title":"Account Opening & Fund Disbursal","description":"Special Dalit Bandhu bank account opened and ₹10 lakh deposited directly for asset creation.","portalUrl":"https://dalitbandhu.telangana.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-kalyana-lakshmi-shaadi-mubarak',
  'telangana-kalyana-lakshmi-shaadi-mubarak',
  'Telangana Kalyana Lakshmi / Shaadi Mubarak Scheme',
  'One-time financial assistance of ₹1,00,116 for the marriage of brides from SC, ST, BC, EBC, and Minority families in Telangana.',
  'Kalyana Lakshmi (for SC, ST, BC, and EBC brides) and Shaadi Mubarak (for Minority brides) provide one-time financial aid of ₹1,00,116 directly deposited into the unmarried bride''s mother''s or bride''s bank account before marriage, preventing child marriage and alleviating financial stress on poor families.',
  'welfare',
  'state',
  'Telangana',
  'Scheduled Castes, ST, BC & Minority Welfare Departments, Government of Telangana',
  'Scheduled Castes, ST, BC & Minority Welfare Departments, Government of Telangana',
  'https://telanganaepass.cgg.gov.in',
  'free_verified',
  '₹1,00,116 one-time direct bank transfer for marriage expenses.',
  'Unmarried girl resident in Telangana aged 18 years or above; annual family income not exceeding ₹2,00,000 (urban) or ₹1,50,000 (rural); belonging to SC, ST, BC, EBC, or Minority communities.',
  '[{"id":"rule-tg-kl-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Minimum Legal Age of Bride","sourceClause":"ePASS Kalyana Lakshmi Guidelines Section 2"},{"id":"rule-tg-kl-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":200000,"isMandatory":true,"conditionName":"Income Ceiling","sourceClause":"ePASS Kalyana Lakshmi Guidelines Section 3"}]',
  '[{"id":"doc-tg-kl-birth","name":"Bride Age Proof / SSC Certificate","description":"SSC marks memo or Birth Certificate issued by competent authority.","requirementType":"mandatory","issuingAuthority":"Registrar of Births / BSE Telangana","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-kl-caste","name":"Caste Certificate from MeeSeva","description":"Integrated community certificate.","requirementType":"mandatory","issuingAuthority":"Tahsildar via MeeSeva","sourceEvidence":"Clause 4.2"},{"id":"doc-tg-kl-income","name":"Income Certificate from MeeSeva","description":"Income certificate issued within last 6 months.","requirementType":"mandatory","issuingAuthority":"Tahsildar via MeeSeva","sourceEvidence":"Clause 4.3"},{"id":"doc-tg-kl-card","name":"Wedding Invitation Card (Lagna Patrika)","description":"Wedding invitation or certificate from religious authority / Jamaat.","requirementType":"mandatory","issuingAuthority":"Religious Institution / Gram Panchayat","sourceEvidence":"Clause 4.4"}]',
  '[{"stepNumber":1,"title":"Online Registration on ePASS Portal","description":"Upload bride and groom details, MeeSeva certificates, and wedding date.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Field Verification by Mandal Revenue Officer (MRO)","description":"Revenue Inspector and Tahsildar physically verify age, eligibility, and marriage details.","channel":"district_office"},{"stepNumber":3,"title":"Sanction and Direct Bank Credit","description":"Amount of ₹1,00,116 is credited directly into the bride''s/mother''s bank account.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-epass-rtf',
  'telangana-epass-post-matric-rtf',
  'Telangana ePASS Post-Matric Scholarship (Reimbursement of Tuition Fee - RTF)',
  '100% or sanctioned tuition fee reimbursement for eligible SC, ST, BC, EBC, and Minority college students in Telangana.',
  'Telangana ePASS RTF pays college tuition fees directly to colleges on behalf of eligible post-matric students (Intermediate, ITI, Polytechnic, Degree, Engineering, Medicine, MBA, MCA, and Ph.D.). Admitted under the convenor quota through standard entrance tests (TG EAPCET, ICET, ECET, etc.), the program ensures zero out-of-pocket tuition expense for disadvantaged communities.',
  'scholarship',
  'state',
  'Telangana',
  'BC Welfare & SC Development Departments, Government of Telangana',
  'BC Welfare & SC Development Departments, Government of Telangana',
  'https://telanganaepass.cgg.gov.in',
  'free_verified',
  'Full sanctioned tuition fee reimbursed directly to the educational institution as notified by the Telangana Admission and Fee Regulatory Committee (TAFRC).',
  'Telangana domicile student enrolled in recognized post-matric course under convenor quota with family income <= ₹2,00,000 (SC/ST/Rural BC) or ₹1,50,000 (Urban BC/EBC) and minimum 75% attendance.',
  '[{"id":"rule-tg-rtf-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"ePASS RTF Regulation 3.1"},{"id":"rule-tg-rtf-attendance","parameter":"minimumAttendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"Minimum Attendance","sourceClause":"ePASS RTF Regulation 4.2"}]',
  '[{"id":"doc-tg-rtf-caste","name":"Integrated Caste Certificate","description":"Permanent MeeSeva caste certificate.","requirementType":"mandatory","issuingAuthority":"Tahsildar via MeeSeva","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-rtf-income","name":"Latest Income Certificate","description":"MeeSeva income certificate issued in the current financial year.","requirementType":"mandatory","issuingAuthority":"Tahsildar via MeeSeva","sourceEvidence":"Clause 4.2"},{"id":"doc-tg-rtf-allotment","name":"CET Allotment Order","description":"Convenor quota admission order with hall ticket number.","requirementType":"mandatory","issuingAuthority":"TG EAPCET / TG ICET Convenor","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Register on ePASS Portal","description":"Submit fresh/renewal post-matric scholarship application on telanganaepass.cgg.gov.in.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"College Principal Verification","description":"College verification officer confirms bonafide admission, certificates, and biometrics.","channel":"college_cell"},{"stepNumber":3,"title":"District Welfare Officer (DWO) Sanction","description":"DWO verifies and approves fee disbursement directly to the college treasury account.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-epass-mtf',
  'telangana-epass-post-matric-mtf',
  'Telangana ePASS Post-Matric Maintenance Fee & Mess Charges (MTF)',
  'Monthly hostel and maintenance stipend of up to ₹1,400 per month for SC, ST, BC, and Minority college students in Telangana.',
  'Telangana ePASS MTF (Maintenance Fee) provides monthly living allowances and mess charges to eligible post-matric college students. Disbursed quarterly, it supports College Attached Hostels (CAH), Department Attached Hostels (DAH), and Day Scholars with fixed monthly stipends deposited directly into students'' bank accounts.',
  'scholarship',
  'state',
  'Telangana',
  'BC Welfare & SC Development Departments, Government of Telangana',
  'BC Welfare & SC Development Departments, Government of Telangana',
  'https://telanganaepass.cgg.gov.in',
  'free_verified',
  'Up to ₹1,400 per month for hostellers (CAH/DSWH) and ₹650 per month for day scholars, disbursed on a quarterly basis.',
  'Students eligible for Telangana ePASS RTF residing in attached hostels or attending as day scholars with regular 75% biometric attendance.',
  '[{"id":"rule-tg-mtf-attendance","parameter":"minimumAttendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"Minimum 75% Attendance","sourceClause":"ePASS MTF Guidelines Clause 3.1"}]',
  '[{"id":"doc-tg-mtf-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Bank account copy of student with IFSC and NPCI mapping.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-mtf-bonafide","name":"Hostel Stay Certificate / Bonafide","description":"Warden/Principal certificate confirming hostel stay or day-scholar status.","requirementType":"mandatory","issuingAuthority":"College / Hostel Warden","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Select MTF in ePASS Application","description":"Check MTF hostel option while submitting ePASS Post-Matric registration.","portalUrl":"https://telanganaepass.cgg.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Biometric Attendance Authentication","description":"Authenticate via Aadhaar-enabled biometric attendance system (AEBAS) in college.","channel":"college_cell"},{"stepNumber":3,"title":"Quarterly DBT Transfer","description":"Welfare department credits maintenance stipend into student''s Aadhaar-linked bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-aarogyasri',
  'telangana-rajiv-aarogyasri',
  'Telangana Rajiv Aarogyasri Health Scheme',
  'Cashless hospitalization healthcare cover up to ₹10,00,000 per family per year in empaneled network hospitals across Telangana.',
  'Rajiv Aarogyasri is Telangana''s premier universal health assurance scheme providing comprehensive cashless inpatient care up to ₹10,00,000 per family per year. Covering over 1,672 medical and surgical procedures across heart disease, cancer, nephrology, neurosurgery, orthopedics, and polytrauma, it ensures end-to-end cashless treatment including diagnostics, medicines, implants, and post-discharge follow-ups.',
  'healthcare',
  'state',
  'Telangana',
  'Aarogyasri Health Care Trust, Department of Health, Medical and Family Welfare, Govt of Telangana',
  'Aarogyasri Health Care Trust, Department of Health, Medical and Family Welfare, Govt of Telangana',
  'https://aarogyasri.telangana.gov.in',
  'free_verified',
  'Cashless in-patient treatment up to ₹10,00,000 per family per year across 1,672 secondary and tertiary medical therapies in empaneled hospitals.',
  'Resident families in Telangana holding valid Food Security Card (White Ration Card) or Rajiv Aarogyasri Card.',
  '[{"id":"rule-tg-as-state","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"State Domicile","sourceClause":"Aarogyasri Guidelines Clause 2.1"},{"id":"rule-tg-as-ration","parameter":"rationCardType","operator":"EQUALS","expectedValue":"white_food_security_card","isMandatory":true,"conditionName":"Food Security Card Holder","sourceClause":"Aarogyasri Guidelines Clause 2.2"}]',
  '[{"id":"doc-tg-as-fsc","name":"White Food Security Card / Aarogyasri Card","description":"Ration card or Aarogyasri health card with family member names.","requirementType":"mandatory","issuingAuthority":"Civil Supplies / Aarogyasri Trust","sourceEvidence":"Clause 4.1"},{"id":"doc-tg-as-aadhaar","name":"Aadhaar Card of Patient","description":"Aadhaar card for biometric authentication at hospital Aarogya Mithra desk.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Visit Empaneled Network Hospital","description":"Visit any government or empaneled private hospital in Telangana.","channel":"district_office"},{"stepNumber":2,"title":"Approach Aarogya Mithra Desk","description":"Aarogya Mithra verifies Food Security Card and Aadhaar, registers patient, and initiates pre-authorization.","channel":"district_office"},{"stepNumber":3,"title":"Avail Cashless Treatment & Discharge","description":"Hospital delivers cashless surgery/treatment, free diagnostic tests, medicines, and food.","portalUrl":"https://aarogyasri.telangana.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-talliki-vandanam',
  'andhra-pradesh-talliki-vandanam',
  'Andhra Pradesh Talliki Vandanam Scheme (Amma Vodi)',
  'Annual financial aid of ₹15,000 per school-going child directly credited to the mother''s bank account in Andhra Pradesh.',
  'Talliki Vandanam (the enhanced iteration of the Amma Vodi scheme under Andhra Pradesh''s Super Six guarantees) supports education from Class 1 to 12. It provides ₹15,000 annually per school-going child directly into the mother''s bank account, ensuring that poverty never prevents a parent from educating their children.',
  'education_aid',
  'state',
  'Andhra Pradesh',
  'Department of School Education, Government of Andhra Pradesh',
  'Department of School Education, Government of Andhra Pradesh',
  'https://gsws.ap.gov.in',
  'free_verified',
  '₹15,000 per year per school-going child directly credited into the mother''s or guardian''s Aadhaar-enabled bank account.',
  'Mother or legal guardian of children studying in Class 1 to 12 in recognized schools/junior colleges in AP; family holding Rice Card with student attendance >= 75%.',
  '[{"id":"rule-ap-tv-state","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"Talliki Vandanam Guidelines Section 1"},{"id":"rule-ap-tv-attendance","parameter":"minimumAttendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"Minimum 75% Attendance","sourceClause":"Talliki Vandanam Guidelines Section 2"}]',
  '[{"id":"doc-ap-tv-ricecard","name":"AP Rice Card / BPL Proof","description":"Valid Rice Card issued by Civil Supplies Dept AP.","requirementType":"mandatory","issuingAuthority":"Gram/Ward Sachivalayam","sourceEvidence":"Clause 3.1"},{"id":"doc-ap-tv-aadhaar","name":"Mother & Child Aadhaar Cards","description":"Aadhaar cards linked to student ChildInfo / U-DISE ID.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 3.2"},{"id":"doc-ap-tv-bank","name":"Mother''s NPCI-Mapped Bank Passbook","description":"Active bank account linked with Aadhaar.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 3.3"}]',
  '[{"stepNumber":1,"title":"School Enrollment and U-DISE ChildInfo Entry","description":"School headmaster enters and verifies student attendance and mother''s Aadhaar in the ChildInfo portal.","channel":"college_cell"},{"stepNumber":2,"title":"Gram/Ward Sachivalayam Social Audit","description":"Village/Ward Education Secretary displays beneficiary lists for social audit and biometric eKYC.","portalUrl":"https://gsws.ap.gov.in","channel":"district_office"},{"stepNumber":3,"title":"Annual DBT Transfer","description":"Funds are credited directly to the mother''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-annadata-sukhibhava',
  'andhra-pradesh-annadata-sukhibhava',
  'Andhra Pradesh Annadata Sukhibhava Scheme (Rythu Bharosa)',
  'Annual input financial assistance of ₹20,000 per farmer family per year in Andhra Pradesh.',
  'Annadata Sukhibhava provides ₹20,000 annual income support to farmer families in Andhra Pradesh (combining the Central PM-KISAN ₹6,000 and the State Government contribution of ₹14,000). The assistance is disbursed in three seasonal installments to landowning farmers, tenant farmers holding Crop Cultivator Rights Cards (CCRC), and forest land cultivators under RoFR.',
  'agriculture',
  'state',
  'Andhra Pradesh',
  'Department of Agriculture & Cooperation, Government of Andhra Pradesh',
  'Department of Agriculture & Cooperation, Government of Andhra Pradesh',
  'https://apagrisnet.gov.in',
  'free_verified',
  '₹20,000 per year per farmer family disbursed in three installments (Kharif sowing, Rabi sowing, and harvest/Sankranti).',
  'Farmer families cultivating agricultural land in Andhra Pradesh with registered land records, tenant farmers with CCRC cards, or RoFR forest title holders.',
  '[{"id":"rule-ap-as-state","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"Annadata Sukhibhava Guidelines Section 2"},{"id":"rule-ap-as-farmer","parameter":"farmerCategory","operator":"IN","expectedValue":["landowner","tenant_ccrc","rofr_cultivator"],"isMandatory":true,"conditionName":"Farmer Category","sourceClause":"Annadata Sukhibhava Guidelines Section 3"}]',
  '[{"id":"doc-ap-as-patta","name":"Webland Patta Passbook / 1B Adangal","description":"Digitally certified Webland revenue record copy.","requirementType":"conditional","issuingAuthority":"Revenue Dept, AP","sourceEvidence":"Clause 4.1"},{"id":"doc-ap-as-ccrc","name":"Crop Cultivator Rights Card (CCRC)","description":"Valid CCRC card for tenant farmers.","requirementType":"conditional","issuingAuthority":"Tahsildar / Village Revenue Officer","sourceEvidence":"Clause 4.2"},{"id":"doc-ap-as-aadhaar","name":"Aadhaar Card","description":"Aadhaar linked to bank account and e-Crop booking.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"e-Crop Booking at Rythu Bharosa Kendras (RBKs)","description":"Village Agriculture Assistant registers crop details and geo-tags farmland in the e-Crop portal.","channel":"district_office"},{"stepNumber":2,"title":"eKYC Biometric Verification","description":"Farmer completes biometric or facial eKYC at the local Rythu Bharosa Kendra / Sachivalayam.","channel":"district_office"},{"stepNumber":3,"title":"Direct Benefit Transfer","description":"Seasonal installments are deposited directly into the farmer''s bank account.","portalUrl":"https://apagrisnet.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-vidya-deevena',
  'andhra-pradesh-jagananna-vidya-deevena',
  'Andhra Pradesh Jagananna Vidya Deevena (RTF - Full Fee Reimbursement)',
  '100% full tuition fee reimbursement for college and professional students from low-income families in Andhra Pradesh.',
  'Jagananna Vidya Deevena ensures complete higher education access by providing 100% college tuition fee reimbursement for students pursuing Polytechnic, ITI, Degree, Engineering, Medicine, Pharmacy, MBA, and MCA courses. The sanctioned tuition fee is credited on a quarterly basis directly into the mother''s bank account to promote financial oversight.',
  'scholarship',
  'state',
  'Andhra Pradesh',
  'Department of Higher Education & Social Welfare, Government of Andhra Pradesh',
  'Department of Higher Education & Social Welfare, Government of Andhra Pradesh',
  'https://jnanabhumi.ap.gov.in',
  'free_verified',
  '100% college tuition fee reimbursement as determined by the AP Higher Education Regulatory and Monitoring Commission (APHERMC).',
  'Resident of Andhra Pradesh; annual family income <= ₹2.5 Lakhs; landholding <= 10 wet acres or 25 dry acres; no four-wheeler; minimum 75% attendance.',
  '[{"id":"rule-ap-vd-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Income Ceiling","sourceClause":"Jnanabhumi Vidya Deevena Rules Section 3"},{"id":"rule-ap-vd-attendance","parameter":"minimumAttendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"75% Attendance","sourceClause":"Jnanabhumi Vidya Deevena Rules Section 4"}]',
  '[{"id":"doc-ap-vd-rice","name":"Rice Card / BPL Certificate","description":"AP Civil Supplies Rice Card.","requirementType":"mandatory","issuingAuthority":"Gram/Ward Sachivalayam","sourceEvidence":"Clause 4.1"},{"id":"doc-ap-vd-cet","name":"Convenor Allotment Letter","description":"Admission allotment order from AP EAPCET / ICET / ECET / POLYCET.","requirementType":"mandatory","issuingAuthority":"Admissions Convenor","sourceEvidence":"Clause 4.2"},{"id":"doc-ap-vd-motherbank","name":"Mother''s Aadhaar-Seeded Bank Passbook","description":"Bank account where tuition fee is credited quarterly.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Online Registration on Jnanabhumi","description":"College nodal officer registers student admission and enters mother''s Aadhaar and bank details.","portalUrl":"https://jnanabhumi.ap.gov.in","channel":"college_cell"},{"stepNumber":2,"title":"Sachivalayam Verification & eKYC","description":"Welfare and Education Assistant verifies family eligibility parameters and completes biometric eKYC.","channel":"district_office"},{"stepNumber":3,"title":"Quarterly Fee Credit","description":"Tuition fees released into mother''s account, which is then paid to the college.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-vasathi-deevena',
  'andhra-pradesh-jagananna-vasathi-deevena',
  'Andhra Pradesh Jagananna Vasathi Deevena (MTF - Hostel & Boarding Aid)',
  'Annual food and hostel maintenance allowance up to ₹20,000 for college students in Andhra Pradesh.',
  'Jagananna Vasathi Deevena assists college students from economically vulnerable backgrounds with boarding, food, and accommodation costs. It sanctions ₹10,000/year for ITI students, ₹15,000/year for Polytechnic students, and ₹20,000/year for Degree, Engineering, and PG students, credited in two installments into the mother''s bank account.',
  'education_aid',
  'state',
  'Andhra Pradesh',
  'Department of Higher Education & Social Welfare, Government of Andhra Pradesh',
  'Department of Higher Education & Social Welfare, Government of Andhra Pradesh',
  'https://jnanabhumi.ap.gov.in',
  'free_verified',
  '₹10,000/yr for ITI, ₹15,000/yr for Polytechnic, and ₹20,000/yr for Degree/PG students in two installments.',
  'Same criteria as Vidya Deevena: AP domicile, family income <= ₹2.5 Lakhs, enrolled in recognized post-matric course with >= 75% attendance.',
  '[{"id":"rule-ap-vas-attendance","parameter":"minimumAttendancePercentage","operator":"GREATER_THAN_OR_EQUAL","expectedValue":75,"isMandatory":true,"conditionName":"Minimum 75% Attendance","sourceClause":"Vasathi Deevena Guidelines Section 2"}]',
  '[{"id":"doc-ap-vas-study","name":"Bonafide Study Certificate","description":"College bonafide confirming regular attendance.","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"Clause 3.1"},{"id":"doc-ap-vas-bank","name":"Mother''s Bank Account Passbook","description":"Active bank passbook linked to Aadhaar.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 3.2"}]',
  '[{"stepNumber":1,"title":"Integrated Jnanabhumi Application","description":"Integrated automatically when submitting Jnanabhumi Vidya Deevena application.","portalUrl":"https://jnanabhumi.ap.gov.in","channel":"college_cell"},{"stepNumber":2,"title":"Sachivalayam Social Audit","description":"Local Sachivalayam checks attendance and approves eligibility.","channel":"district_office"},{"stepNumber":3,"title":"Direct Account Credit","description":"Funds released directly to the mother''s account in two equal installments.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-aarogyasri',
  'andhra-pradesh-dr-ysr-aarogyasri',
  'Andhra Pradesh Dr. YSR Aarogyasri Health Scheme',
  'Cashless hospitalization healthcare cover up to ₹25,00,000 per family per year covering 3,257 procedures in Andhra Pradesh.',
  'Dr. YSR Aarogyasri is Andhra Pradesh''s flagship healthcare program providing cashless medical treatment up to ₹25,00,000 per eligible family per year across 3,257 listed procedures. In addition to in-hospital treatment, beneficiaries receive post-operative financial assistance under Aarogya Aasara (up to ₹5,000 per month or ₹225 per day during recovery).',
  'healthcare',
  'state',
  'Andhra Pradesh',
  'Dr. YSR Aarogyasri Health Care Trust, Government of Andhra Pradesh',
  'Dr. YSR Aarogyasri Health Care Trust, Government of Andhra Pradesh',
  'https://aarogyasri.ap.gov.in',
  'free_verified',
  'Cashless in-patient healthcare coverage up to ₹25,00,000 per family per year, plus post-operative recovery allowance up to ₹5,00,000 total medical security.',
  'Resident of Andhra Pradesh holding a valid Rice Card or Aarogyasri Card, or families with annual income up to ₹5.0 Lakhs.',
  '[{"id":"rule-ap-as-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":500000,"isMandatory":true,"conditionName":"Income Ceiling","sourceClause":"Aarogyasri Health Trust Operational Guidelines Clause 2.1"}]',
  '[{"id":"doc-ap-as-card","name":"Dr. YSR Aarogyasri Health Card / Rice Card","description":"Health card with QR code or Rice card.","requirementType":"mandatory","issuingAuthority":"Aarogyasri Trust / GSWS","sourceEvidence":"Clause 4.1"},{"id":"doc-ap-as-aadhaar","name":"Aadhaar Card of Patient","description":"Aadhaar for biometric hospital admission.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Admission at Network Hospital","description":"Visit any empaneled government or private network hospital across AP, Hyderabad, Chennai, or Bengaluru.","channel":"district_office"},{"stepNumber":2,"title":"Aarogya Mithra Assistance","description":"Aarogya Mithra conducts biometric verification and uploads medical pre-authorization request.","channel":"district_office"},{"stepNumber":3,"title":"Cashless Treatment & Post-Operative Aid","description":"Avail cashless therapy and discharge; Aarogya Aasara recovery allowance disbursed via DBT.","portalUrl":"https://aarogyasri.ap.gov.in","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-ysr-cheyutha',
  'andhra-pradesh-ysr-cheyutha',
  'Andhra Pradesh YSR Cheyutha Scheme',
  'Direct financial aid of ₹75,000 over 4 years (₹18,750 per year) for SC, ST, BC, and Minority women aged 45-60 in AP.',
  'YSR Cheyutha provides financial assistance of ₹75,000 in four equal tranches of ₹18,750 per year to women aged between 45 and 60 years belonging to Scheduled Caste (SC), Scheduled Tribe (ST), Backward Class (BC), and Minority communities. In partnership with commercial leaders like Amul, ITC, and HUL, it equips women to set up sustainable retail, dairy, and grocery enterprises.',
  'livelihood',
  'state',
  'Andhra Pradesh',
  'Department of Social Welfare & SERP, Government of Andhra Pradesh',
  'Department of Social Welfare & SERP, Government of Andhra Pradesh',
  'https://navasakam.ap.gov.in',
  'free_verified',
  '₹18,750 per year for 4 years (total ₹75,000) directly into the woman''s bank account, plus technical and supply-chain linkages.',
  'Women resident in AP aged between 45 to 60 years belonging to SC, ST, BC, or Minority communities with valid Rice Card.',
  '[{"id":"rule-ap-ch-age","parameter":"age","operator":"BETWEEN","expectedValue":[45,60],"isMandatory":true,"conditionName":"Age Between 45 and 60 Years","sourceClause":"YSR Cheyutha Guidelines Section 2"},{"id":"rule-ap-ch-category","parameter":"socialCategory","operator":"IN","expectedValue":["SC","ST","BC","Minority"],"isMandatory":true,"conditionName":"Target Community","sourceClause":"YSR Cheyutha Guidelines Section 3"}]',
  '[{"id":"doc-ap-ch-caste","name":"Integrated Caste Certificate","description":"MeeSeva / Sachivalayam issued caste certificate.","requirementType":"mandatory","issuingAuthority":"Tahsildar via GSWS","sourceEvidence":"Clause 4.1"},{"id":"doc-ap-ch-rice","name":"AP Rice Card","description":"Valid Rice Card demonstrating BPL status.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept","sourceEvidence":"Clause 4.2"},{"id":"doc-ap-ch-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Beneficiary single bank account.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Identification by Village/Ward Volunteers","description":"Volunteer / Welfare Assistant conducts door-to-door verification of eligible age and caste.","channel":"district_office"},{"stepNumber":2,"title":"Social Audit at Gram/Ward Sachivalayam","description":"Eligible list displayed on notice boards and biometric eKYC collected.","portalUrl":"https://navasakam.ap.gov.in","channel":"district_office"},{"stepNumber":3,"title":"Annual Fund Crediting","description":"Annual installment of ₹18,750 credited directly into the woman''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-gruha-lakshmi',
  'karnataka-gruha-lakshmi',
  'Karnataka Gruha Lakshmi Scheme',
  'Direct benefit transfer of ₹2,000 every month to the woman head of household in Karnataka.',
  'Gruha Lakshmi is Karnataka''s landmark guarantee providing monthly direct benefit transfer of ₹2,000 (₹24,000 annually) into the bank accounts of women recognized as the head (Yajamani) of Antyodaya (AAY), BPL, or APL families. The scheme empowers women with continuous financial independence and helps meet household expenses.',
  'welfare',
  'state',
  'Karnataka',
  'Department of Women and Child Development, Government of Karnataka',
  'Department of Women and Child Development, Government of Karnataka',
  'https://sevasindhuservices.karnataka.gov.in',
  'free_verified',
  '₹2,000 per month directly transferred into the beneficiary woman''s Aadhaar-linked bank account.',
  'Resident woman in Karnataka designated as the head of family on Antyodaya, BPL, or APL ration cards. Neither the woman nor her spouse can be an income-tax payer or GST-registered taxpayer.',
  '[{"id":"rule-ka-gl-state","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Resident","sourceClause":"Gruha Lakshmi Notification Clause 2.1"},{"id":"rule-ka-gl-tax","parameter":"isIncomeTaxPayer","operator":"BOOLEAN","expectedValue":false,"isMandatory":true,"conditionName":"Non-Income Tax Payer","sourceClause":"Gruha Lakshmi Notification Clause 3.1"}]',
  '[{"id":"doc-ka-gl-ration","name":"Ration Card (BPL / Antyodaya / APL)","description":"Ration card showing the applicant as the head of the family (Yajamani).","requirementType":"mandatory","issuingAuthority":"Food, Civil Supplies Dept Karnataka","sourceEvidence":"Clause 4.1"},{"id":"doc-ka-gl-aadhaar","name":"Applicant & Husband''s Aadhaar Card","description":"Aadhaar cards for demographic and tax verification.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"},{"id":"doc-ka-gl-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Active bank account linked via NPCI mapping.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Visit Karnataka One / Grama One Center","description":"Apply for free at any Karnataka One, Grama One, Bangalore One, or Bapuji Seva Kendra.","portalUrl":"https://sevasindhuservices.karnataka.gov.in","channel":"meeseva_csc"},{"stepNumber":2,"title":"Authentication & Verification","description":"Operator verifies ration card number and completes OTP/biometric Aadhaar authentication.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Monthly DBT Credit","description":"Department releases ₹2,000 every month directly to the verified bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-shakti-scheme',
  'karnataka-shakti-scheme',
  'Karnataka Shakti Scheme (Free Bus Travel for Women)',
  '100% free bus travel for all women and girl students domiciled in Karnataka across state RTC buses.',
  'The Shakti Scheme grants free public bus travel to all women, girl students, and transgender persons resident in Karnataka. Applicable across all ordinary, express, and city bus services operated by the four state transport corporations (KSRTC, BMTC, NWKRTC, and KKRTC) within Karnataka state limits.',
  'welfare',
  'state',
  'Karnataka',
  'Transport Department, Government of Karnataka',
  'Transport Department, Government of Karnataka',
  'https://transport.karnataka.gov.in',
  'free_verified',
  'Zero-fare tickets on all non-premium state buses across Karnataka without any journey count limitation.',
  'Women, girl students, and transgender persons domiciled in Karnataka presenting valid photo ID with Karnataka address or Shakti Smart Card.',
  '[{"id":"rule-ka-sh-gender","parameter":"gender","operator":"IN","expectedValue":["female","transgender"],"isMandatory":true,"conditionName":"Gender Eligibility","sourceClause":"Shakti Scheme Guidelines Section 1"},{"id":"rule-ka-sh-state","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Domicile","sourceClause":"Shakti Scheme Guidelines Section 2"}]',
  '[{"id":"doc-ka-sh-id","name":"Government Photo Identity Card","description":"Aadhaar Card, Voter ID, Driving Licence, or Karnataka Smart Card.","requirementType":"mandatory","issuingAuthority":"Govt of India / Govt of Karnataka","sourceEvidence":"Section 3.1"}]',
  '[{"stepNumber":1,"title":"Board Eligible RTC Bus","description":"Board any KSRTC, BMTC, NWKRTC, or KKRTC non-luxury bus within Karnataka.","channel":"online_portal"},{"stepNumber":2,"title":"Display Karnataka ID","description":"Show Aadhaar card or government photo ID verifying Karnataka domicile to the conductor.","channel":"district_office"},{"stepNumber":3,"title":"Obtain Free Shakti Ticket","description":"Conductor issues an electronic zero-value Shakti ticket.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-gruha-jyothi',
  'karnataka-gruha-jyothi-free-power',
  'Karnataka Gruha Jyothi Scheme (Up to 200 Units Free Electricity)',
  'Up to 200 units of free monthly electricity for residential households in Karnataka.',
  'Karnataka Gruha Jyothi ensures free domestic electricity for residential consumers whose monthly consumption falls within their calculated entitlement quota (calculated as average consumption of the previous 12 months + 10% buffer, subject to a maximum cap of 200 units). Tenants and homeowners alike are eligible.',
  'welfare',
  'state',
  'Karnataka',
  'Energy Department, Government of Karnataka (BESCOM, HESCOM, MESCOM, GESCOM, CESC)',
  'Energy Department, Government of Karnataka (BESCOM, HESCOM, MESCOM, GESCOM, CESC)',
  'https://sevasindhuservices.karnataka.gov.in',
  'free_verified',
  'Zero electricity bill when monthly residential consumption is within the entitlement quota (up to 200 units).',
  'Domestic residential electricity consumers residing in Karnataka; meter account number linked with Aadhaar.',
  '[{"id":"rule-ka-gj-state","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Resident","sourceClause":"Gruha Jyothi Order EN 42 PSR 2023"},{"id":"rule-ka-gj-units","parameter":"monthlyElectricityUnits","operator":"LESS_THAN_OR_EQUAL","expectedValue":200,"isMandatory":true,"conditionName":"Consumption Cap","sourceClause":"Gruha Jyothi Order Clause 3"}]',
  '[{"id":"doc-ka-gj-account","name":"Electricity Bill Account ID","description":"Account ID / Connection ID from the power utility bill.","requirementType":"mandatory","issuingAuthority":"ESCOMs (BESCOM / HESCOM / MESCOM / GESCOM / CESC)","sourceEvidence":"Clause 4.1"},{"id":"doc-ka-gj-aadhaar","name":"Aadhaar Card","description":"Aadhaar of the occupant (owner or tenant).","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Register on Seva Sindhu Portal","description":"Visit sevasindhuservices.karnataka.gov.in and select Gruha Jyothi.","portalUrl":"https://sevasindhuservices.karnataka.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Enter ESCOM Connection ID & Aadhaar","description":"Authenticate via Aadhaar OTP and verify consumer account details.","channel":"online_portal"},{"stepNumber":3,"title":"Receive Subsidized Zero Bill","description":"Eligible monthly consumption within entitlement yields a net zero electricity bill.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-yuva-nidhi',
  'karnataka-yuva-nidhi',
  'Karnataka Yuva Nidhi Scheme (Unemployment Financial Assistance)',
  'Monthly financial aid of ₹3,000 for unemployed graduates and ₹1,500 for diploma holders in Karnataka for up to 2 years.',
  'Karnataka Yuva Nidhi provides temporary financial relief to educated youth during job searches. It offers ₹3,000 per month for unemployed degree graduates and ₹1,500 per month for unemployed diploma holders who completed their degrees in Karnataka and remained without job or higher education enrollment for at least 180 days, paid for up to 24 months.',
  'livelihood',
  'state',
  'Karnataka',
  'Department of Skill Development, Entrepreneurship and Livelihood, Govt of Karnataka',
  'Department of Skill Development, Entrepreneurship and Livelihood, Govt of Karnataka',
  'https://sevasindhuservices.karnataka.gov.in',
  'free_verified',
  '₹3,000/month for degree graduates and ₹1,500/month for diploma holders for up to 24 months via DBT.',
  'Karnataka domicile candidates who graduated or passed diploma in academic years 2022-23 onwards, who remain unemployed or not enrolled in higher education for >= 180 days.',
  '[{"id":"rule-ka-yn-state","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Domicile","sourceClause":"Yuva Nidhi Scheme Rules Section 2.1"},{"id":"rule-ka-yn-employed","parameter":"isEmployed","operator":"BOOLEAN","expectedValue":false,"isMandatory":true,"conditionName":"Unemployed Status","sourceClause":"Yuva Nidhi Scheme Rules Section 3.1"}]',
  '[{"id":"doc-ka-yn-degree","name":"Degree / Diploma Certificate & Marks Cards","description":"Graduation / Diploma passing certificate issued by recognized Karnataka university or board.","requirementType":"mandatory","issuingAuthority":"University / DTE Karnataka","sourceEvidence":"Clause 4.1"},{"id":"doc-ka-yn-aadhaar","name":"Aadhaar Card","description":"Aadhaar card with Karnataka address.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"},{"id":"doc-ka-yn-bank","name":"Aadhaar-Seeded Bank Account Passbook","description":"Applicant''s bank account details.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Register on Seva Sindhu / Yuva Nidhi Portal","description":"Fill out the online application with registration number, university details, and Aadhaar.","portalUrl":"https://sevasindhuservices.karnataka.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Submit Self-Declaration of Unemployment","description":"Attest that applicant is not employed in public or private sectors and not self-employed.","channel":"online_portal"},{"stepNumber":3,"title":"Monthly DBT Crediting","description":"Stipend credited monthly; candidate submits periodic monthly self-attestation of continuing unemployment.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-anna-bhagya',
  'karnataka-anna-bhagya',
  'Karnataka Anna Bhagya Scheme (Food Security & Direct Benefit Transfer)',
  '10 kg food grains per person per month (5 kg grains + ₹170 cash DBT for additional 5 kg) for BPL families in Karnataka.',
  'Karnataka Anna Bhagya guarantees 10 kg of food grains per person per month to Antyodaya Anna Yojana (AAY) and Priority Household (PHH/BPL) ration card holders. It provides 5 kg food grains through the central NFSA allocation and credits ₹170 in cash DBT (calculated at ₹34 per kg for 5 kg) per member directly into the bank account of the head of the household.',
  'welfare',
  'state',
  'Karnataka',
  'Department of Food, Civil Supplies and Consumer Affairs, Govt of Karnataka',
  'Department of Food, Civil Supplies and Consumer Affairs, Govt of Karnataka',
  'https://ahara.kar.nic.in',
  'free_verified',
  '5 kg subsidized grains + ₹170 per person per month transferred directly to the household head''s bank account via DBT.',
  'Resident of Karnataka enrolled under BPL (Priority Household) or Antyodaya Anna Yojana (AAY) ration card with active Aadhaar-seeded bank account.',
  '[{"id":"rule-ka-ab-card","parameter":"rationCardType","operator":"IN","expectedValue":["bpl_priority_household","antyodaya_aay"],"isMandatory":true,"conditionName":"BPL or AAY Card Holder","sourceClause":"Anna Bhagya Guidelines Clause 2.1"}]',
  '[{"id":"doc-ka-ab-ration","name":"BPL / Antyodaya Ration Card","description":"Active food card with member details.","requirementType":"mandatory","issuingAuthority":"Food and Civil Supplies Dept, Karnataka","sourceEvidence":"Clause 3.1"},{"id":"doc-ka-ab-aadhaar","name":"Aadhaar Card of Family Head","description":"Aadhaar linked to bank account.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 3.2"}]',
  '[{"stepNumber":1,"title":"Fair Price Shop Allocation","description":"Collect 5 kg free NFSA rice per person monthly from Fair Price Shop using biometric ePDS.","channel":"district_office"},{"stepNumber":2,"title":"Aadhaar Bank Account Seeding","description":"Ensure the head of family''s bank account is mapped on NPCI Aadhaar payment bridge.","portalUrl":"https://ahara.kar.nic.in","channel":"online_portal"},{"stepNumber":3,"title":"Monthly Cash Transfer","description":"Food Department credits ₹170 per eligible member directly into the family head''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mh-majhi-ladki-bahin',
  'maharashtra-majhi-ladki-bahin-yojana',
  'Maharashtra Mukhyamantri Majhi Ladki Bahin Yojana',
  'Monthly financial aid of ₹1,500 (₹18,000 per year) directly transferred to eligible women aged 21-65 in Maharashtra.',
  'Mukhyamantri Majhi Ladki Bahin Yojana is Maharashtra''s flagship women empowerment welfare initiative. It transfers ₹1,500 per month (₹18,000 per year) directly into the Aadhaar-linked bank accounts of married, widowed, divorced, abandoned, or destitute women aged between 21 and 65 years whose annual family income is within ₹2.5 Lakhs.',
  'welfare',
  'state',
  'Maharashtra',
  'Women and Child Development Department, Government of Maharashtra',
  'Women and Child Development Department, Government of Maharashtra',
  'https://ladakibahin.maharashtra.gov.in',
  'free_verified',
  '₹1,500 per month direct financial allowance credited via DBT (Aadhaar Payment Bridge).',
  'Resident woman in Maharashtra aged 21 to 65 years with annual family income up to ₹2.5 Lakhs (or holding Yellow/Orange ration card), not an income tax payer.',
  '[{"id":"rule-mh-lb-state","parameter":"state","operator":"EQUALS","expectedValue":"Maharashtra","isMandatory":true,"conditionName":"Maharashtra Domicile","sourceClause":"Govt Resolution No. WCD-2024/CR-102"},{"id":"rule-mh-lb-age","parameter":"age","operator":"BETWEEN","expectedValue":[21,65],"isMandatory":true,"conditionName":"Age Between 21 and 65 Years","sourceClause":"Govt Resolution Clause 3.1"},{"id":"rule-mh-lb-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Annual Income Limit","sourceClause":"Govt Resolution Clause 3.2"}]',
  '[{"id":"doc-mh-lb-aadhaar","name":"Aadhaar Card","description":"Aadhaar with Maharashtra address.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.1"},{"id":"doc-mh-lb-domicile","name":"Domicile Certificate or 15-Year Ration Card","description":"Maharashtra domicile certificate or yellow/orange ration card.","requirementType":"mandatory","issuingAuthority":"Revenue Dept / Tahsildar","sourceEvidence":"Clause 4.2"},{"id":"doc-mh-lb-bank","name":"Aadhaar-Seeded Bank Account Passbook","description":"Single bank account in applicant''s name with NPCI mapping.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Register on Nari Shakti Doot App / Ladki Bahin Portal","description":"Download Nari Shakti Doot App or visit ladakibahin.maharashtra.gov.in.","portalUrl":"https://ladakibahin.maharashtra.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Upload Documents and Complete eKYC","description":"Upload Aadhaar, ration card, bank passbook, and submit self-declaration.","channel":"online_portal"},{"stepNumber":3,"title":"Approval & Monthly Disbursement","description":"Ward/Taluka committee verifies and initiates ₹1,500 monthly payment directly into bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mh-mjpjay-health',
  'maharashtra-mjpjay-health-scheme',
  'Mahatma Jyotirao Phule Jan Arogya Yojana (MJPJAY)',
  'Universal cashless health insurance coverage up to ₹5,00,000 per family per year across 1,356 procedures in Maharashtra.',
  'MJPJAY provides universal cashless hospitalization coverage up to ₹5,00,000 per family per year to all citizens residing in Maharashtra. Integrated with Ayushman Bharat PM-JAY, it covers 1,356 identified secondary and tertiary medical and surgical treatments, renal transplants, oncology, cardiac interventions, and intensive care across recognized public and private hospitals.',
  'healthcare',
  'state',
  'Maharashtra',
  'State Health Assurance Society (SHAS), Public Health Department, Govt of Maharashtra',
  'State Health Assurance Society (SHAS), Public Health Department, Govt of Maharashtra',
  'https://www.jeevandayee.gov.in',
  'free_verified',
  'Universal cashless healthcare coverage up to ₹5,00,000 per family per year for 1,356 surgeries, therapies, and diagnostics.',
  'All families domiciled in Maharashtra holding Yellow, Orange, or White Ration Cards or Maharashtra domicile certificate.',
  '[{"id":"rule-mh-mjp-state","parameter":"state","operator":"EQUALS","expectedValue":"Maharashtra","isMandatory":true,"conditionName":"Maharashtra Domicile","sourceClause":"SHAS MJPJAY Universal Coverage Resolution"}]',
  '[{"id":"doc-mh-mjp-ration","name":"Ration Card (Yellow / Orange / White)","description":"Valid Maharashtra ration card with family member names.","requirementType":"mandatory","issuingAuthority":"Food and Civil Supplies Dept, Maharashtra","sourceEvidence":"Clause 4.1"},{"id":"doc-mh-mjp-aadhaar","name":"Aadhaar Card","description":"Aadhaar card of patient.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Visit Network Hospital","description":"Approach any empaneled government or private network hospital in Maharashtra.","portalUrl":"https://www.jeevandayee.gov.in","channel":"district_office"},{"stepNumber":2,"title":"Consult Arogya Mitra Desk","description":"Arogya Mitra verifies ration card and Aadhaar, generates e-card, and routes to specialist.","channel":"district_office"},{"stepNumber":3,"title":"Receive Cashless Treatment","description":"Hospital performs procedure cashless; discharge medications and diagnostics included.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mh-mahadbt-post-matric',
  'maharashtra-mahadbt-post-matric-scholarship',
  'Maharashtra MahaDBT Post-Matric Scholarship & Tuition Fee Waiver',
  '100% or 50% college tuition fee waiver and maintenance allowance for SC, ST, OBC, VJNT, and EBC students in Maharashtra.',
  'MahaDBT Post-Matric Scholarships offer comprehensive financial support to students in Maharashtra studying in Class 11, 12, undergraduate, postgraduate, engineering, medical, and polytechnic courses. Covers 100% tuition and exam fee waiver for SC/ST and 50% to 100% for OBC, VJNT, SBC, and EBC/SEBC under Rajarshi Chhatrapati Shahu Maharaj Shikshan Shulkh Shishyavrutti Yojna, plus monthly maintenance stipends.',
  'scholarship',
  'state',
  'Maharashtra',
  'Social Justice & Special Assistance / Higher & Technical Education Dept, Govt of Maharashtra',
  'Social Justice & Special Assistance / Higher & Technical Education Dept, Govt of Maharashtra',
  'https://mahadbt.maharashtra.gov.in',
  'free_verified',
  'Full or partial reimbursement of tuition and examination fees plus monthly maintenance allowance up to ₹1,200 per month.',
  'Maharashtra domicile students enrolled in recognized post-matric courses through CAP/convenor quota. Income ceiling: up to ₹2.5 Lakhs (SC/ST) and ₹1.5 to ₹8.0 Lakhs depending on category/EBC scheme.',
  '[{"id":"rule-mh-dbt-state","parameter":"state","operator":"EQUALS","expectedValue":"Maharashtra","isMandatory":true,"conditionName":"Maharashtra Domicile","sourceClause":"MahaDBT Post Matric Rules Section 2"}]',
  '[{"id":"doc-mh-dbt-caste","name":"Caste & Caste Validity Certificate","description":"Caste Certificate along with Scrutiny Committee Validity (for professional courses).","requirementType":"mandatory","issuingAuthority":"Divisional Caste Scrutiny Committee","sourceEvidence":"Section 3.1"},{"id":"doc-mh-dbt-income","name":"Income Certificate from Tahsildar","description":"Valid income certificate for current financial year.","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"Section 3.2"},{"id":"doc-mh-dbt-allotment","name":"CAP Allotment Letter","description":"Centralized Admission Process (CAP) allotment letter.","requirementType":"mandatory","issuingAuthority":"State CET Cell Maharashtra","sourceEvidence":"Section 3.3"}]',
  '[{"stepNumber":1,"title":"Register on MahaDBT Portal","description":"Create applicant profile on mahadbt.maharashtra.gov.in and complete Aadhaar biometric authentication.","portalUrl":"https://mahadbt.maharashtra.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"College Verification","description":"College verification clerk reviews uploaded certificates, bonafide, and attendance.","channel":"college_cell"},{"stepNumber":3,"title":"Direct Scholarship Disbursal","description":"Tuition fee is directly reimbursed to the institute, and maintenance allowance is credited to the student''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-kmut-magalir-urimai',
  'tamil-nadu-kalaignar-magalir-urimai-thittam',
  'Tamil Nadu Kalaignar Magalir Urimai Thittam (KMUT - Basic Income for Women)',
  'Unconditional basic income support of ₹1,000 per month directly transferred to women heads of families in Tamil Nadu.',
  'Kalaignar Magalir Urimai Thittam (KMUT) provides ₹1,000 per month (₹12,000 annually) as universal basic income recognition to female heads of eligible households in Tamil Nadu. The payment is transferred directly into beneficiaries'' Aadhaar-linked bank accounts via direct benefit transfer on the 15th of every month.',
  'welfare',
  'state',
  'Tamil Nadu',
  'Special Programme Implementation & Revenue Department, Government of Tamil Nadu',
  'Special Programme Implementation & Revenue Department, Government of Tamil Nadu',
  'https://kmut.tn.gov.in',
  'free_verified',
  '₹1,000 per month deposited directly into the beneficiary woman''s bank account via DBT.',
  'Woman head of family aged 21 years or older domiciled in Tamil Nadu; family annual income below ₹2.5 Lakhs; annual domestic electricity consumption below 3,600 units; family landholding below 5 acres wetland or 10 acres dryland.',
  '[{"id":"rule-tn-kmut-state","parameter":"state","operator":"EQUALS","expectedValue":"Tamil Nadu","isMandatory":true,"conditionName":"Tamil Nadu Domicile","sourceClause":"KMUT Implementation Guidelines Section 2"},{"id":"rule-tn-kmut-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":21,"isMandatory":true,"conditionName":"Minimum Age 21","sourceClause":"KMUT Guidelines Section 3.1"},{"id":"rule-tn-kmut-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Income Ceiling","sourceClause":"KMUT Guidelines Section 3.2"}]',
  '[{"id":"doc-tn-kmut-smartcard","name":"Tamil Nadu Smart Family Ration Card","description":"Smart Card showing applicant as head of the family.","requirementType":"mandatory","issuingAuthority":"Civil Supplies & Consumer Protection Dept, TN","sourceEvidence":"Clause 4.1"},{"id":"doc-tn-kmut-aadhaar","name":"Aadhaar Card","description":"Aadhaar linked to bank account and smart card.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"},{"id":"doc-tn-kmut-ebill","name":"TANGEDCO Electricity Consumer Number","description":"Domestic electricity service number to verify annual consumption under 3,600 units.","requirementType":"mandatory","issuingAuthority":"TANGEDCO","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Application at Special Camp","description":"Submit application with smart card and electricity bill at Fair Price Shop / Ward special camps.","portalUrl":"https://kmut.tn.gov.in","channel":"district_office"},{"stepNumber":2,"title":"Field Verification & eKYC","description":"Volunteers and Revenue authorities verify socio-economic criteria through biometric eKYC.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Direct Credit","description":"₹1,000 credited automatically into the beneficiary''s bank account on the 15th of every month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-pudhumai-penn',
  'tamil-nadu-pudhumai-penn-scheme',
  'Tamil Nadu Pudhumai Penn Scheme (Higher Education Assurance)',
  'Monthly financial grant of ₹1,000 for female students studying in colleges who completed Class 6-12 in Tamil Nadu Govt schools.',
  'Moovalur Ramamirtham Ammaiyar Higher Education Assurance Scheme (Pudhumai Penn) encourages female education by granting ₹1,000 per month directly into bank accounts of girl students who studied in government schools from Class 6 to 12. It covers the entire duration of undergraduate degree, diploma, ITI, or professional college courses without disruption.',
  'education_aid',
  'state',
  'Tamil Nadu',
  'Social Welfare and Women Empowerment Department, Government of Tamil Nadu',
  'Social Welfare and Women Empowerment Department, Government of Tamil Nadu',
  'https://pudhumaipenn.tn.gov.in',
  'free_verified',
  '₹1,000 per month credited directly into the student''s bank account throughout their college degree/diploma.',
  'Female students who studied continuously from Class 6 to 12 in Tamil Nadu Government schools, enrolled in an undergraduate degree, diploma, or ITI course in Tamil Nadu.',
  '[{"id":"rule-tn-pp-gender","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Student","sourceClause":"Pudhumai Penn Guidelines Section 1"},{"id":"rule-tn-pp-school","parameter":"schoolEducationType","operator":"EQUALS","expectedValue":"tn_government_school_class_6_to_12","isMandatory":true,"conditionName":"Govt Schooling Class 6-12","sourceClause":"Pudhumai Penn Guidelines Section 2"}]',
  '[{"id":"doc-tn-pp-emis","name":"EMIS Student ID & School Bonafide","description":"EMIS number verifying Class 6 to 12 education in Tamil Nadu government schools.","requirementType":"mandatory","issuingAuthority":"School Education Department, TN","sourceEvidence":"Section 3.1"},{"id":"doc-tn-pp-college","name":"College Admission Bonafide","description":"Bonafide certificate confirming admission in recognized higher education institution.","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"Section 3.2"},{"id":"doc-tn-pp-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Student''s single bank account with NPCI mapping.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Section 3.3"}]',
  '[{"stepNumber":1,"title":"College Level Registration","description":"College nodal officer uploads student EMIS number and certificates on pudhumaipenn.tn.gov.in.","portalUrl":"https://pudhumaipenn.tn.gov.in","channel":"college_cell"},{"stepNumber":2,"title":"Automated EMIS Verification","description":"School Education Department automatically cross-checks government school schooling records.","channel":"online_portal"},{"stepNumber":3,"title":"Monthly DBT Disbursement","description":"State treasury deposits ₹1,000 every month directly into the student''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-cmchis-health',
  'tamil-nadu-cmchis-health-insurance',
  'Tamil Nadu Chief Minister''s Comprehensive Health Insurance Scheme (CMCHIS)',
  'Cashless hospitalization health cover up to ₹5,00,000 per family per year in empaneled hospitals in Tamil Nadu.',
  'CMCHIS provides cashless secondary and tertiary medical treatments up to ₹5,00,000 per family per year for low-income families in Tamil Nadu. Covering 1,513 medical and surgical procedures, 52 specialized diagnostic tests, and 8 high-end surgeries in recognized government and private hospitals.',
  'healthcare',
  'state',
  'Tamil Nadu',
  'Tamil Nadu Health Systems Project (TNHSP), Health and Family Welfare Dept, Govt of Tamil Nadu',
  'Tamil Nadu Health Systems Project (TNHSP), Health and Family Welfare Dept, Govt of Tamil Nadu',
  'https://www.cmchistn.com',
  'free_verified',
  'Cashless in-patient care up to ₹5,00,000 per family per year across 1,513 surgical procedures and therapies.',
  'Resident families in Tamil Nadu having annual family income below ₹1,20,000 as certified by VAO/Revenue authorities, or enrolled on smart family ration card.',
  '[{"id":"rule-tn-cmc-state","parameter":"state","operator":"EQUALS","expectedValue":"Tamil Nadu","isMandatory":true,"conditionName":"Tamil Nadu Domicile","sourceClause":"CMCHIS Scheme Guidelines Section 2"},{"id":"rule-tn-cmc-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":120000,"isMandatory":true,"conditionName":"Annual Income Limit","sourceClause":"CMCHIS Scheme Guidelines Section 3"}]',
  '[{"id":"doc-tn-cmc-smartcard","name":"Tamil Nadu Smart Ration Card","description":"Family card showing all family members.","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept, Tamil Nadu","sourceEvidence":"Clause 4.1"},{"id":"doc-tn-cmc-income","name":"Income Certificate from VAO / Tahsildar","description":"Income certificate certifying annual family income below ₹1.2 Lakhs.","requirementType":"mandatory","issuingAuthority":"Revenue Dept, Tamil Nadu","sourceEvidence":"Clause 4.2"},{"id":"doc-tn-cmc-aadhaar","name":"Aadhaar Card of Patient","description":"Aadhaar for biometric hospital admission.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Obtain CMCHIS Smart Health Card","description":"Enroll at the District Collectorate CMCHIS kiosk with smart ration card and income certificate.","channel":"district_office"},{"stepNumber":2,"title":"Visit Empaneled Network Hospital","description":"Report to CMCHIS liaison desk at any empaneled government or private hospital.","portalUrl":"https://www.cmchistn.com","channel":"district_office"},{"stepNumber":3,"title":"Avail Cashless Hospitalization","description":"Pre-authorization approved electronically; treatment, diagnostics, and food delivered cashless.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'up-kanya-sumangala',
  'uttar-pradesh-mukhyamantri-kanya-sumangala-yojana',
  'Uttar Pradesh Mukhyamantri Kanya Sumangala Yojana',
  'Phased conditional financial grant totaling ₹25,000 for girl children across 6 key developmental milestones in UP.',
  'Mukhyamantri Kanya Sumangala Yojana delivers ₹25,000 conditional cash transfers disbursed across 6 developmental milestones: Stage 1 (Birth: ₹3,000), Stage 2 (Complete 1-year immunization: ₹2,000), Stage 3 (Admission to Class 1: ₹3,000), Stage 4 (Admission to Class 6: ₹3,000), Stage 5 (Admission to Class 9: ₹5,000), and Stage 6 (Admission to undergraduate degree or diploma of >= 2 years: ₹7,000).',
  'welfare',
  'state',
  'Uttar Pradesh',
  'Women and Child Development Department, Government of Uttar Pradesh',
  'Women and Child Development Department, Government of Uttar Pradesh',
  'https://mksy.up.gov.in',
  'free_verified',
  '₹25,000 cumulative financial assistance released in 6 milestone-based installments directly to the girl''s/mother''s bank account.',
  'Resident of Uttar Pradesh with annual family income up to ₹3,00,000; maximum of two daughters per family (or up to three in case of second birth twins).',
  '[{"id":"rule-up-ks-state","parameter":"state","operator":"EQUALS","expectedValue":"Uttar Pradesh","isMandatory":true,"conditionName":"UP Domicile","sourceClause":"Kanya Sumangala Rules Clause 2"},{"id":"rule-up-ks-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":300000,"isMandatory":true,"conditionName":"Income Ceiling ₹3 Lakhs","sourceClause":"Kanya Sumangala Rules Clause 3"}]',
  '[{"id":"doc-up-ks-birth","name":"Birth Certificate of Girl Child","description":"Birth certificate issued by Nagar Nigam / Gram Panchayat.","requirementType":"mandatory","issuingAuthority":"Registrar of Births & Deaths","sourceEvidence":"Clause 4.1"},{"id":"doc-up-ks-domicile","name":"UP Domicile Certificate","description":"Resident / domicile certificate of parents.","requirementType":"mandatory","issuingAuthority":"Revenue Dept, UP","sourceEvidence":"Clause 4.2"},{"id":"doc-up-ks-bank","name":"Joint / Single Bank Passbook","description":"Bank account in girl''s or mother''s name with IFSC and Aadhaar seeding.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Register on MKSY Portal","description":"Citizen registers on mksy.up.gov.in and enters family details and Aadhaar.","portalUrl":"https://mksy.up.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Apply for Specific Category / Stage","description":"Select stage (e.g. Birth, Class 1, Class 6, Class 9, College) and upload admission / immunization proof.","portalUrl":"https://mksy.up.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Verification & DBT Release","description":"Block Development Officer (BDO) or SDM approves application, and installment is credited via PFMS.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'up-post-matric-scholarship',
  'uttar-pradesh-post-matric-scholarship',
  'Uttar Pradesh Post-Matric Scholarship & Fee Reimbursement Scheme',
  'Full fee reimbursement and monthly maintenance stipend for college students from SC, ST, General, OBC, and Minority communities in UP.',
  'The Uttar Pradesh Post-Matric Scholarship and Fee Reimbursement Scheme reimburses tuition fees and grants monthly maintenance allowances to students studying in Class 11, 12, undergraduate, postgraduate, engineering, medical, and polytechnic courses in recognized institutions. Covers non-refundable fee components up to ₹50,000+ plus maintenance allowances.',
  'scholarship',
  'state',
  'Uttar Pradesh',
  'Social Welfare, Backward Classes Welfare & Minority Welfare Departments, Govt of Uttar Pradesh',
  'Social Welfare, Backward Classes Welfare & Minority Welfare Departments, Govt of Uttar Pradesh',
  'https://scholarship.up.gov.in',
  'free_verified',
  'Direct reimbursement of non-refundable course fees plus monthly maintenance stipend (up to ₹1,200/month for hostellers and ₹600/month for day scholars).',
  'Permanent resident of Uttar Pradesh enrolled in recognized post-matric course; annual family income <= ₹2.5 Lakhs (SC/ST/General) and <= ₹2.0 Lakhs (OBC/Minority).',
  '[{"id":"rule-up-pms-state","parameter":"state","operator":"EQUALS","expectedValue":"Uttar Pradesh","isMandatory":true,"conditionName":"UP Domicile","sourceClause":"UP Scholarship Guidelines Clause 2.1"},{"id":"rule-up-pms-income","parameter":"annualFamilyIncome","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Income Ceiling","sourceClause":"UP Scholarship Guidelines Clause 3.1"}]',
  '[{"id":"doc-up-pms-caste","name":"Caste Certificate from eDistrict UP","description":"Digitally verified caste certificate.","requirementType":"mandatory","issuingAuthority":"Revenue Dept, UP via edistrict.up.gov.in","sourceEvidence":"Clause 4.1"},{"id":"doc-up-pms-income","name":"Income Certificate from eDistrict UP","description":"Valid income certificate for current financial year.","requirementType":"mandatory","issuingAuthority":"Tahsildar via eDistrict","sourceEvidence":"Clause 4.2"},{"id":"doc-up-pms-fee","name":"Fee Receipt and Allotment Letter","description":"Current year college fee deposit receipt and entrance admission slip.","requirementType":"mandatory","issuingAuthority":"College / University Registrar","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Online Registration on UP Scholarship Portal","description":"Submit application on scholarship.up.gov.in, link DigiLocker, and authenticate Aadhaar.","portalUrl":"https://scholarship.up.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Institute Verification and Forwarding","description":"College verifies fee receipt, attendance, and forwards application to District Welfare Officer.","channel":"college_cell"},{"stepNumber":3,"title":"District Scrutiny & PFMS Disbursement","description":"District scholarship committee approves grant; funds disbursed via PFMS into student''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'wb-lakshmir-bhandar',
  'west-bengal-lakshmir-bhandar',
  'West Bengal Lakshmir Bhandar Scheme (Basic Income Support)',
  'Monthly basic income support of ₹1,200 for SC/ST and ₹1,000 for General/OBC women aged 25-60 in West Bengal.',
  'Lakshmir Bhandar provides monthly unconditional financial assistance to adult female members of households in West Bengal. Female heads aged 25 to 60 years receive ₹1,200 per month for SC/ST households and ₹1,000 per month for General and OBC households directly into their bank accounts.',
  'welfare',
  'state',
  'West Bengal',
  'Department of Women & Child Development and Social Welfare, Govt of West Bengal',
  'Department of Women & Child Development and Social Welfare, Govt of West Bengal',
  'https://socialwelfarewb.gov.in',
  'free_verified',
  '₹1,200/month for SC/ST women and ₹1,000/month for General/OBC women transferred directly via DBT.',
  'Female resident of West Bengal aged 25 to 60 years enrolled under Swasthya Sathi or Khadya Sathi, not employed in government jobs or receiving regular government pensions.',
  '[{"id":"rule-wb-lb-state","parameter":"state","operator":"EQUALS","expectedValue":"West Bengal","isMandatory":true,"conditionName":"West Bengal Domicile","sourceClause":"Lakshmir Bhandar Guidelines Section 2"},{"id":"rule-wb-lb-age","parameter":"age","operator":"BETWEEN","expectedValue":[25,60],"isMandatory":true,"conditionName":"Age Between 25 and 60 Years","sourceClause":"Lakshmir Bhandar Guidelines Section 3.1"}]',
  '[{"id":"doc-wb-lb-swasthya","name":"Swasthya Sathi Card","description":"Health card showing applicant as a beneficiary.","requirementType":"mandatory","issuingAuthority":"Health & Family Welfare Dept, WB","sourceEvidence":"Clause 4.1"},{"id":"doc-wb-lb-aadhaar","name":"Aadhaar Card","description":"Aadhaar card with West Bengal address.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"},{"id":"doc-wb-lb-caste","name":"SC/ST Certificate","description":"Sub-divisional officer certificate for higher ₹1,200 rate.","requirementType":"conditional","issuingAuthority":"Backward Classes Welfare Dept, WB","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Application at Duare Sarkar Camp","description":"Collect and submit application form during Duare Sarkar outreach camps or municipal offices.","portalUrl":"https://duaresarkar.wb.gov.in","channel":"district_office"},{"stepNumber":2,"title":"BDO / SDO Verification","description":"Block Development Officer verifies Aadhaar and Swasthya Sathi card mapping.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Direct Benefit Transfer","description":"State treasury deposits ₹1,000 or ₹1,200 monthly directly into the woman''s single bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'wb-kanyashree-prakalpa',
  'west-bengal-kanyashree-prakalpa',
  'West Bengal Kanyashree Prakalpa Scheme (K1 & K2)',
  'Annual scholarship of ₹1,000 (K1) and one-time grant of ₹25,000 (K2) for adolescent girls in West Bengal.',
  'Kanyashree Prakalpa is an internationally recognized conditional cash transfer initiative combating child marriage and incentivizing girl child education. Tier 1 (K1) gives an annual scholarship of ₹1,000 to unmarried girls aged 13-18 enrolled in Class 8 to 12. Tier 2 (K2) awards a one-time grant of ₹25,000 when an unmarried girl reaches 18 years and is enrolled in college or vocational studies.',
  'scholarship',
  'state',
  'West Bengal',
  'Department of Women and Child Development and Social Welfare, Govt of West Bengal',
  'Department of Women and Child Development and Social Welfare, Govt of West Bengal',
  'https://www.wbkanyashree.gov.in',
  'free_verified',
  'K1: ₹1,000 annual scholarship; K2: ₹25,000 one-time grant deposited directly into the girl''s bank account.',
  'Unmarried girl resident in West Bengal enrolled as regular student in recognized school, college, or polytechnic institution.',
  '[{"id":"rule-wb-kp-state","parameter":"state","operator":"EQUALS","expectedValue":"West Bengal","isMandatory":true,"conditionName":"West Bengal Domicile","sourceClause":"Kanyashree Scheme Guidelines Section 2"},{"id":"rule-wb-kp-marital","parameter":"isUnmarried","operator":"BOOLEAN","expectedValue":true,"isMandatory":true,"conditionName":"Unmarried Status","sourceClause":"Kanyashree Scheme Guidelines Section 3.1"}]',
  '[{"id":"doc-wb-kp-school","name":"School / College Bonafide Certificate","description":"Certificate showing regular enrollment and date of birth.","requirementType":"mandatory","issuingAuthority":"Head of Institution / Principal","sourceEvidence":"Clause 4.1"},{"id":"doc-wb-kp-unmarried","name":"Unmarried Self-Declaration","description":"Declaration endorsed by parents/guardians that the girl is unmarried.","requirementType":"mandatory","issuingAuthority":"Applicant / Parent","sourceEvidence":"Clause 4.2"},{"id":"doc-wb-kp-bank","name":"Applicant Single Bank Account Passbook","description":"Savings bank account in the girl''s own name.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Clause 4.3"}]',
  '[{"stepNumber":1,"title":"Application Form at School / College","description":"Obtain and submit the K1 or K2 application form through your educational institution.","channel":"college_cell"},{"stepNumber":2,"title":"Institution Portal Upload","description":"Head of school/college enters student details and uploads documents on wbkanyashree.gov.in.","portalUrl":"https://www.wbkanyashree.gov.in","channel":"college_cell"},{"stepNumber":3,"title":"Administrative Sanction & Fund Disbursal","description":"District Magistrate sanction leads to direct bank crediting of ₹1,000 (K1) or ₹25,000 (K2).","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'wb-swasthya-sathi',
  'west-bengal-swasthya-sathi',
  'West Bengal Swasthya Sathi Universal Health Scheme',
  'Universal cashless secondary and tertiary hospitalization cover up to ₹5,00,000 per family per year in West Bengal.',
  'Swasthya Sathi is West Bengal''s universal group health assurance scheme providing up to ₹5,00,000 cashless hospitalization coverage per family per year across secondary and tertiary healthcare procedures. Smart biometric cards are issued in the name of the eldest female member (mother/grandmother/wife) of the household, ensuring complete family coverage.',
  'healthcare',
  'state',
  'West Bengal',
  'Department of Health & Family Welfare, Government of West Bengal',
  'Department of Health & Family Welfare, Government of West Bengal',
  'https://swasthyasathi.gov.in',
  'free_verified',
  'Cashless in-patient hospitalization up to ₹5,00,000 per family per year across 2,000+ medical and surgical packages in empaneled hospitals.',
  'Universal coverage for all resident families in West Bengal not covered under another statutory government medical scheme.',
  '[{"id":"rule-wb-ss-state","parameter":"state","operator":"EQUALS","expectedValue":"West Bengal","isMandatory":true,"conditionName":"West Bengal Domicile","sourceClause":"Swasthya Sathi Universal Notification Clause 2"}]',
  '[{"id":"doc-wb-ss-card","name":"Swasthya Sathi Smart Card","description":"Biometric smart card issued in the name of female family head.","requirementType":"mandatory","issuingAuthority":"Health & Family Welfare Dept, West Bengal","sourceEvidence":"Clause 4.1"},{"id":"doc-wb-ss-aadhaar","name":"Aadhaar Card","description":"Aadhaar of patient.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Enroll at Duare Sarkar Camp","description":"Submit Form-B with family details and photo of female head at Duare Sarkar camp.","portalUrl":"https://swasthyasathi.gov.in","channel":"district_office"},{"stepNumber":2,"title":"Receive Biometric Smart Card","description":"Collect personalized Swasthya Sathi smart card with encoded family biometric data.","channel":"district_office"},{"stepNumber":3,"title":"Avail Cashless Hospitalization","description":"Present smart card at Swasthya Sathi helpdesk in any empaneled hospital for cashless treatment.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'dl-mahila-samman-yojana',
  'delhi-mukhyamantri-mahila-samman-yojana',
  'Delhi Mukhyamantri Mahila Samman Yojana',
  'Direct financial assistance of ₹1,000 per month (₹12,000 per year) for non-taxpayer adult women in Delhi.',
  'Mukhyamantri Mahila Samman Yojana provides a monthly financial support of ₹1,000 (₹12,000 per year) directly to adult women residing in the National Capital Territory of Delhi. The scheme aims to enhance financial security and autonomy for women who are not government employees, regular taxpayers, or recipients of other governmental welfare pensions.',
  'welfare',
  'state',
  'Delhi',
  'Department of Women and Child Development, Govt of NCT of Delhi',
  'Department of Women and Child Development, Govt of NCT of Delhi',
  'https://wcd.delhi.gov.in',
  'free_verified',
  '₹1,000 per month transferred directly to the beneficiary woman''s Aadhaar-linked bank account.',
  'Women aged 18 years and above who are registered voters in NCT of Delhi with valid Delhi voter ID, not paying income tax, not central/state government employees, and not drawing other government pensions.',
  '[{"id":"rule-dl-msy-state","parameter":"state","operator":"EQUALS","expectedValue":"Delhi","isMandatory":true,"conditionName":"Delhi Domicile / Voter","sourceClause":"Mahila Samman Yojana Policy Resolution Section 2"},{"id":"rule-dl-msy-age","parameter":"age","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Adult Woman 18+ Years","sourceClause":"Mahila Samman Yojana Policy Resolution Section 3.1"},{"id":"rule-dl-msy-tax","parameter":"isIncomeTaxPayer","operator":"BOOLEAN","expectedValue":false,"isMandatory":true,"conditionName":"Non-Income Tax Payer","sourceClause":"Mahila Samman Yojana Policy Resolution Section 3.2"}]',
  '[{"id":"doc-dl-msy-voter","name":"Delhi Voter Identity Card (EPIC)","description":"Valid Voter ID card showing registration in Delhi assembly constituency.","requirementType":"mandatory","issuingAuthority":"Election Commission of India / CEO Delhi","sourceEvidence":"Section 4.1"},{"id":"doc-dl-msy-aadhaar","name":"Aadhaar Card","description":"Aadhaar with Delhi address.","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Section 4.2"},{"id":"doc-dl-msy-bank","name":"Aadhaar-Seeded Bank Passbook","description":"Beneficiary''s single bank account with NPCI mapping.","requirementType":"mandatory","issuingAuthority":"Bank","sourceEvidence":"Section 4.3"}]',
  '[{"stepNumber":1,"title":"Online / Kiosk Registration","description":"Submit application on the official Delhi Government portal or at authorized registration centers.","portalUrl":"https://wcd.delhi.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Self-Declaration of Non-Taxpayer Status","description":"Sign self-declaration confirming non-taxpayer status and that applicant is not receiving any other government pension.","channel":"online_portal"},{"stepNumber":3,"title":"Monthly Direct Benefit Transfer","description":"WCD department transfers ₹1,000 every month directly to the verified Aadhaar-linked bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'dl-free-power-water',
  'delhi-free-power-water-lifeline-scheme',
  'Delhi Free Power & Water Lifeline Scheme',
  '100% free electricity up to 200 units/month and up to 20,000 liters of free potable water/month in NCT of Delhi.',
  'The Delhi Lifeline Scheme provides 100% electricity subsidy for domestic consumption up to 200 units per month (and 50% subsidy up to ₹800 for consumption between 201 and 400 units) for consumers opting in. Concurrently, it provides up to 20,000 litres of clean potable water per household per month completely free of charge (with zero sewer and service charges) for all residential metered connections under Delhi Jal Board.',
  'welfare',
  'state',
  'Delhi',
  'Power Department & Delhi Jal Board, Government of NCT of Delhi',
  'Power Department & Delhi Jal Board, Government of NCT of Delhi',
  'https://delhijalboard.delhi.gov.in',
  'free_verified',
  'Zero electricity bill for up to 200 units/month + zero water bill for consumption up to 20,000 litres/month for domestic consumers.',
  'Domestic residential electricity consumers in NCT of Delhi (BRPL, BYPL, TPDDL) opting into the power subsidy, and households with functional domestic water meters under Delhi Jal Board.',
  '[{"id":"rule-dl-pw-state","parameter":"state","operator":"EQUALS","expectedValue":"Delhi","isMandatory":true,"conditionName":"Delhi Resident Consumer","sourceClause":"Delhi Power & Water Policy Resolution"},{"id":"rule-dl-pw-power","parameter":"monthlyElectricityUnits","operator":"LESS_THAN_OR_EQUAL","expectedValue":200,"isMandatory":true,"conditionName":"Monthly Power Consumption <= 200 Units","sourceClause":"Delhi Power Subsidy Scheme Clause 2"}]',
  '[{"id":"doc-dl-pw-powerbill","name":"Electricity Bill CA Number","description":"Consumer Account number on BSES Yamuna, BSES Rajdhani, or Tata Power DDL bill.","requirementType":"mandatory","issuingAuthority":"Delhi DISCOMs","sourceEvidence":"Clause 4.1"},{"id":"doc-dl-pw-waterbill","name":"Delhi Jal Board (DJB) K No","description":"Water connection K Number showing metered domestic connection.","requirementType":"mandatory","issuingAuthority":"Delhi Jal Board","sourceEvidence":"Clause 4.2"}]',
  '[{"stepNumber":1,"title":"Opt-In for Electricity Subsidy","description":"Submit opt-in request by sending WhatsApp message with CA number to 7011311111 or via DISCOM website.","portalUrl":"https://power.delhi.gov.in","channel":"online_portal"},{"stepNumber":2,"title":"Ensure Functional Water Meter","description":"Ensure working functional water meter installed and registered with Delhi Jal Board.","portalUrl":"https://delhijalboard.delhi.gov.in","channel":"online_portal"},{"stepNumber":3,"title":"Receive Zero Monthly Utility Bills","description":"DISCOM and DJB automatically issue zero bills for consumption within eligible lifeline caps.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-yuva-vikasam',
  'telangana-yuva-vikasam-vidya-bharosa-card',
  'Telangana Yuva Vikasam (Vidya Bharosa Card)',
  'Financial assistance card up to ₹5 Lakhs for students to cover college admission fees, coaching, and international exams.',
  'Yuva Vikasam is part of Telangana Government''s Six Guarantees providing Vidya Bharosa financial assistance cards of up to ₹5,00,000 for students to pursue higher education, specialized skill development, and competitive examination coaching.',
  'education_aid',
  'state',
  'Telangana',
  'Higher Education Department, Government of Telangana',
  'Higher Education Department, Government of Telangana',
  'https://telangana.gov.in',
  'free_verified',
  'Financial guarantee card covering up to ₹5,00,000 for college admission, coaching fees, and professional certification courses.',
  'Resident of Telangana, enrolled in accredited intermediate, undergraduate, or postgraduate college with family annual income <= ₹2 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"Yuva Vikasam Rules 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":200000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2 Lakhs","sourceClause":"Yuva Vikasam Rules 2"}]',
  '[{"id":"doc-tg-yv-residence","name":"Telangana Residence / Domicile Certificate","description":"Proof of continuous residence","requirementType":"mandatory","issuingAuthority":"MeeSeva / Tahsildar","sourceEvidence":"YV Checklist 1"},{"id":"doc-tg-yv-income","name":"Latest MeeSeva Income Certificate","description":"Digitally signed current year certificate","requirementType":"mandatory","issuingAuthority":"Revenue Dept","sourceEvidence":"YV Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply on Praja Palana / MeeSeva Portal","description":"Submit application with college enrollment details.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Institutional Endorsement","description":"College Principal verifies student bonafide details on portal.","channel":"college_cell"},{"stepNumber":3,"title":"Vidya Bharosa Card Issuance","description":"Digital card issued with credit line for verified educational expenses.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-cheyutha-pension',
  'telangana-cheyutha-social-security-pension',
  'Telangana Cheyutha Social Security Pension Scheme',
  'Monthly social security pension of ₹4,000 per month for senior citizens, widows, single women, beedi workers, and weavers in Telangana.',
  'Under the Cheyutha Guarantee, the Government of Telangana provides enhanced social security pensions of ₹4,000 per month (and ₹6,000/month for persons with severe disabilities) to ensure vulnerable and elderly citizens live with security and self-respect.',
  'pension',
  'state',
  'Telangana',
  'Panchayat Raj & Rural Development Department, Government of Telangana',
  'Panchayat Raj & Rural Development Department, Government of Telangana',
  'https://epensions.telangana.gov.in',
  'free_verified',
  '₹4,000 per month direct bank transfer for elderly, widows, toddy tappers, weavers, and beedi workers; ₹6,000 per month for differently abled persons.',
  'Telangana resident, age 57+ for elderly pension; or verified widow / beedi worker / disabled person holding white ration card.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"Cheyutha Rules Clause 1"},{"id":"rule-rationCardType-equals","parameter":"rationCardType","operator":"EQUALS","expectedValue":"white_food_security_card","isMandatory":true,"conditionName":"BPL White Ration Card Holder","sourceClause":"Cheyutha Rules Clause 2"}]',
  '[{"id":"doc-tg-cheyutha-fsc","name":"Telangana Food Security Card (White Ration Card)","description":"Proof of BPL status","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept","sourceEvidence":"Cheyutha Doc 1"},{"id":"doc-tg-cheyutha-age","name":"Aadhaar Card / Voter ID","description":"Age verification document","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Cheyutha Doc 2"}]',
  '[{"stepNumber":1,"title":"Submit Application via Praja Palana / MeeSeva","description":"Fill Cheyutha application at nearest MeeSeva or Gram Panchayat office.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Field Verification by MPDO / Municipal Commissioner","description":"Verification of BPL status and biometric authentication.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Credit","description":"Pension deposited on 1st of every month directly into postal/bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-tpride-dalit-entrepreneurship',
  'telangana-tpride-sc-st-entrepreneurship-incentives',
  'Telangana T-PRIDE (Program for Rapid Incubation of Dalit Entrepreneurs)',
  'Up to 45% investment subsidy (max ₹75 Lakhs) and 5% interest subvention for SC and ST entrepreneurs setting up industrial units or commercial transport.',
  'T-PRIDE is a targeted affirmative initiative by Government of Telangana providing preferential capital subsidies, stamp duty reimbursements, subsidized power, and 45% capital investment subsidy for Dalit and Adivasi entrepreneurs.',
  'livelihood',
  'state',
  'Telangana',
  'Industries and Commerce Department, Government of Telangana',
  'Industries and Commerce Department, Government of Telangana',
  'https://ipass.telangana.gov.in',
  'free_verified',
  '35% to 45% capital investment subsidy on plant & machinery (up to ₹75 Lakhs), 5% interest subvention for 5 years, 100% stamp duty refund, and ₹1.50/unit power tariff subsidy.',
  'Enterprises owned 100% by Scheduled Caste (SC) or Scheduled Tribe (ST) entrepreneurs located within Telangana state.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Located in Telangana","sourceClause":"T-PRIDE Policy Section 2"},{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["SC","ST"],"isMandatory":true,"conditionName":"SC or ST Entrepreneur 100% Ownership","sourceClause":"T-PRIDE Policy Section 3"}]',
  '[{"id":"doc-tpride-caste","name":"MeeSeva Integrated SC/ST Community Certificate","description":"Issued by Revenue Dept","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"T-PRIDE Checklist 1"},{"id":"doc-tpride-ipass","name":"TS-iPASS Industrial Approval & Udyam Certificate","description":"State single window clearance","requirementType":"mandatory","issuingAuthority":"District Industries Centre (DIC)","sourceEvidence":"T-PRIDE Checklist 2"}]',
  '[{"stepNumber":1,"title":"TS-iPASS Single Window Registration","description":"Apply on TS-iPASS digital industrial clearance portal.","channel":"online_portal","portalUrl":"https://ipass.telangana.gov.in"},{"stepNumber":2,"title":"District Level Committee (DLC) Inspection","description":"General Manager DIC inspects factory site, machinery, and commercial production commencement.","channel":"district_office"},{"stepNumber":3,"title":"Direct Subsidy Sanction","description":"State Investment Promotion Board credits 45% investment subsidy into term loan account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-kcr-kit-nutrition',
  'telangana-mother-and-child-kcr-nutrition-kit',
  'Telangana Mother & Child Nutrition Kit (KCR Kit)',
  '₹12,000 cash incentive (₹13,000 for girl child) in 4 installments plus 16-item mother and baby care kit for deliveries in government hospitals.',
  'Government of Telangana provides comprehensive maternity protection including ₹12,000 financial support (₹13,000 for girl infant) disbursed across pregnancy stages and a baby kit comprising baby bed, clothes, mosquito net, baby soap, and oil.',
  'healthcare',
  'state',
  'Telangana',
  'Health, Medical & Family Welfare Department, Government of Telangana',
  'Health, Medical & Family Welfare Department, Government of Telangana',
  'https://kcrkit.telangana.gov.in',
  'free_verified',
  '₹12,000 (boy) or ₹13,000 (girl) direct bank transfer in 4 stages (antenatal checkup, delivery, vaccination at 14 weeks, vaccination at 9 months) + 16-item baby kit.',
  'Pregnant women domiciled in Telangana delivering in government hospitals (Primary Health Centres, Area Hospitals, Teaching Hospitals) up to two deliveries.',
  '[{"id":"rule-deliveryHospital-equals","parameter":"deliveryHospital","operator":"EQUALS","expectedValue":"government_hospital","isMandatory":true,"conditionName":"Delivery in Telangana Government Hospital","sourceClause":"KCR Kit Rules 2"}]',
  '[{"id":"doc-kcr-anc","name":"MCP Card & Antenatal Registration","description":"Issued by ANM / PHC","requirementType":"mandatory","issuingAuthority":"Government Hospital","sourceEvidence":"KCR Kit Doc 1"}]',
  '[{"stepNumber":1,"title":"ANC Registration on KCR Kit Portal","description":"Register pregnancy with local ANM before 12 weeks of gestation.","channel":"district_office"},{"stepNumber":2,"title":"Institutional Delivery","description":"Deliver in government hospital; receive baby kit and Phase 2 cash transfer on discharge.","channel":"district_office"},{"stepNumber":3,"title":"Post-Natal Immunization Stages","description":"Bring infant for scheduled vaccines; remaining installments credited via DBT.","channel":"online_portal","portalUrl":"https://kcrkit.telangana.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-ysr-aasara',
  'ap-ysr-aasara-shg-debt-relief',
  'Andhra Pradesh YSR Aasara (SHG Women Debt Relief Scheme)',
  'Reimbursement of outstanding bank loan amounts of DWCRA Self Help Groups in 4 annual installments to empower rural and urban women.',
  'YSR Aasara reimburses the outstanding bank loan dues of women DWCRA Self Help Groups directly into their individual savings accounts, eliminating debt distress and fostering micro-enterprises.',
  'welfare',
  'state',
  'Andhra Pradesh',
  'Society for Elimination of Rural Poverty (SERP), Government of Andhra Pradesh',
  'Society for Elimination of Rural Poverty (SERP), Government of Andhra Pradesh',
  'https://navasakam.ap.gov.in',
  'free_verified',
  'Direct reimbursement of total bank loan outstanding of SHG group divided among members and paid annually directly via DBT.',
  'Women members of recognized DWCRA Self Help Groups (SHGs) in rural and urban areas of Andhra Pradesh.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"Andhra Pradesh Domicile","sourceClause":"YSR Aasara Guidelines 2.1"},{"id":"rule-shgMember-equals","parameter":"shgMember","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Active DWCRA SHG Member","sourceClause":"YSR Aasara Guidelines 2.2"}]',
  '[{"id":"doc-aasara-shg","name":"SHG Group Passbook & Resolution","description":"Issued by Village Organisation (VO)","requirementType":"mandatory","issuingAuthority":"SERP / MEPMA","sourceEvidence":"Aasara Checklist 1"}]',
  '[{"stepNumber":1,"title":"Verification by Village / Ward Secretariat","description":"Welfare & Education Assistant cross-verifies SHG bank loan records.","channel":"district_office"},{"stepNumber":2,"title":"Social Audit Display","description":"Beneficiary list displayed at Gram Sachivalayam for social audit.","channel":"district_office"},{"stepNumber":3,"title":"DBT Credit","description":"Funds credited directly into members'' personal savings accounts.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-ysr-bima',
  'ap-ysr-bima-accident-natural-death-insurance',
  'Andhra Pradesh YSR Bima (Social Security Insurance Scheme)',
  '100% state-paid insurance of ₹5 Lakhs for accidental death/permanent disability and ₹1 Lakh for natural death of primary breadwinners.',
  'YSR Bima provides 100% government-funded life and accidental insurance protection to unorganised sector breadwinners belonging to BPL families with immediate ₹10,000 cash relief within 24 hours.',
  'welfare',
  'state',
  'Andhra Pradesh',
  'Department of Labour, Employment, Training and Factories, Govt of AP',
  'Department of Labour, Employment, Training and Factories, Govt of AP',
  'https://ysrbima.ap.gov.in',
  'free_verified',
  '₹5,00,000 for accidental death (age 18-70); ₹1,00,000 for natural death (age 18-50); ₹10,000 immediate funeral cash delivered by Village Secretariat within 24 hours.',
  'Primary breadwinner of BPL household holding Rice Card in Andhra Pradesh aged 18 to 70 years.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"YSR Bima Rules 1"},{"id":"rule-riceCardHolder-equals","parameter":"riceCardHolder","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Rice Card Holder (BPL)","sourceClause":"YSR Bima Rules 2"}]',
  '[{"id":"doc-bima-rice","name":"AP Rice Card","description":"Electronic BPL food security card","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept AP","sourceEvidence":"Bima Checklist 1"}]',
  '[{"stepNumber":1,"title":"Automatic Enrolment via Volunteer Survey","description":"Village/Ward Volunteer captures household breadwinner and nominee details.","channel":"district_office"},{"stepNumber":2,"title":"Immediate Claim Registration on Demise","description":"Village Secretariat Welfare Assistant visits bereaved family upon incident.","channel":"district_office"},{"stepNumber":3,"title":"Instant Funeral Cash & Insurance Settlement","description":"₹10,000 handed in cash immediately; balance DBT settled by Insurance Company.","channel":"online_portal","portalUrl":"https://ysrbima.ap.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-ysr-matsyakara-bharosa',
  'ap-ysr-matsyakara-bharosa-fishing-ban-relief',
  'Andhra Pradesh YSR Matsyakara Bharosa (Fishermen Welfare Scheme)',
  'Annual financial relief of ₹10,000 during the marine fishing ban period plus subsidized diesel at ₹9/litre rebate for motorized boats.',
  'Provides direct livelihood compensation of ₹10,000 during the annual marine fishing conservation ban (April 15 to June 14) and enhanced diesel subsidy of ₹9/litre for registered mechanized and motorized boat owners.',
  'agriculture',
  'state',
  'Andhra Pradesh',
  'Department of Fisheries, Government of Andhra Pradesh',
  'Department of Fisheries, Government of Andhra Pradesh',
  'https://fisheries.ap.gov.in',
  'free_verified',
  '₹10,000 annual DBT cash transfer during 61-day fishing ban; diesel rebate of ₹9 per litre credited directly into smart cards at designated fishing harbours.',
  'Traditional marine fishers operating motorized and non-motorized crafts with valid biometric fisher card in coastal districts of Andhra Pradesh.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"Matsyakara Bharosa Section 2"},{"id":"rule-occupation-equals","parameter":"occupation","operator":"EQUALS","expectedValue":"marine_fisherman","isMandatory":true,"conditionName":"Marine Fisher / Boat Crew","sourceClause":"Matsyakara Bharosa Section 3"}]',
  '[{"id":"doc-fisher-biometric","name":"Marine Fishermen Biometric Card / Registration","description":"Issued by Fisheries Dept","requirementType":"mandatory","issuingAuthority":"Assistant Director Fisheries","sourceEvidence":"Fisheries Form A"}]',
  '[{"stepNumber":1,"title":"Enumeration by Fisheries Assistant","description":"Village Fisheries Assistant surveys active fishing crews at landing centres.","channel":"district_office"},{"stepNumber":2,"title":"Social Audit Verification","description":"Draft list displayed at coastal Gram Sachivalayam.","channel":"district_office"},{"stepNumber":3,"title":"Direct DBT Release","description":"₹10,000 credited to bank account at the start of ban period.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-ysr-vahana-mitra',
  'ap-ysr-vahana-mitra-auto-taxi-drivers',
  'Andhra Pradesh YSR Vahana Mitra (Self-Owned Auto & Taxi Drivers)',
  'Annual financial grant of ₹10,000 for self-employed auto, taxi, and maxi-cab driver-owners to meet insurance, fitness certificate, and repair costs.',
  'YSR Vahana Mitra provides ₹10,000 every year to owner-drivers of auto-rickshaws, metered taxis, and maxi cabs to cover recurring vehicle insurance, fitness certificates, and maintenance expenses.',
  'welfare',
  'state',
  'Andhra Pradesh',
  'Transport Department, Government of Andhra Pradesh',
  'Transport Department, Government of Andhra Pradesh',
  'https://aptransport.org',
  'free_verified',
  '₹10,000 per year direct financial grant credited to the driver-cum-owner''s bank account via DBT.',
  'Resident of AP, owning and driving an Auto-rickshaw, light motor vehicle (Taxi/Cab) holding valid driving licence and vehicle registration certificate.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"Vahana Mitra Section 1"},{"id":"rule-vehicleOwnerDriver-equals","parameter":"vehicleOwnerDriver","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Vehicle Owner-cum-Driver Status","sourceClause":"Vahana Mitra Section 2"}]',
  '[{"id":"doc-vahana-rc","name":"Vehicle Registration Certificate (RC)","description":"Showing applicant as registered owner","requirementType":"mandatory","issuingAuthority":"RTO Andhra Pradesh","sourceEvidence":"Vahana Checklist 1"},{"id":"doc-vahana-dl","name":"Driving Licence (Commercial / LMV)","description":"Valid driving licence","requirementType":"mandatory","issuingAuthority":"RTO","sourceEvidence":"Vahana Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online via Village Secretariat","description":"Submit RC, DL, and Aadhaar on Navasakam portal.","channel":"district_office","portalUrl":"https://navasakam.ap.gov.in"},{"stepNumber":2,"title":"Transport Department Verification","description":"Motor Vehicle Inspector verifies vehicle ownership and active fitness certificate.","channel":"district_office"},{"stepNumber":3,"title":"Annual Cash Transfer","description":"₹10,000 credited directly into the applicant''s account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-vidyasiri-scholarship',
  'karnataka-vidyasiri-food-accommodation-scholarship',
  'Karnataka Vidyasiri (Food & Accommodation Scholarship Scheme)',
  'Monthly financial stipend of ₹1,500/month (₹15,000/year) for SC, ST, OBC students from rural areas pursuing post-matric courses without hostel admission.',
  'Vidyasiri (Karepass) is a flagship welfare program by Karnataka Backward Classes Welfare Department providing food and accommodation assistance of ₹1,500 per month for 10 months to rural college students who could not secure admission in government hostels.',
  'scholarship',
  'state',
  'Karnataka',
  'Backward Classes Welfare Department, Government of Karnataka',
  'Backward Classes Welfare Department, Government of Karnataka',
  'https://karepass.cgg.gov.in',
  'free_verified',
  '₹1,500 per month for 10 academic months (total ₹15,000 per year) credited straight to the student''s bank account.',
  'Karnataka student from SC/ST/OBC category, studying in post-matric college located at least 5 km away from hometown, not admitted in any government hostel, family income <= ₹2.5 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Domicile","sourceClause":"Vidyasiri Rules Clause 2.1"},{"id":"rule-minDistanceKm-greater_than_or_equal","parameter":"minDistanceKm","operator":"GREATER_THAN_OR_EQUAL","expectedValue":5,"isMandatory":true,"conditionName":"College Distance >= 5 km from Residence","sourceClause":"Vidyasiri Rules Clause 2.2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2.5 Lakhs","sourceClause":"Vidyasiri Rules Clause 2.3"}]',
  '[{"id":"doc-ka-caste-rd","name":"Caste & Income Certificate (RD Number)","description":"Digitally signed RD certificate from Nada Kacheri","requirementType":"mandatory","issuingAuthority":"Revenue Dept Karnataka","sourceEvidence":"Karepass Doc 1"},{"id":"doc-ka-hostel-non","name":"Non-Hostel Admission Certificate","description":"Proof that student was not allotted government hostel","requirementType":"mandatory","issuingAuthority":"Taluk BCM Officer","sourceEvidence":"Karepass Doc 2"}]',
  '[{"stepNumber":1,"title":"Apply on Karepass / SSP Portal","description":"Login to State Scholarship Portal (SSP) using Aadhaar and enter SATS ID.","channel":"online_portal","portalUrl":"https://ssp.postmatric.karnataka.gov.in"},{"stepNumber":2,"title":"College E-Attestation","description":"College principal e-attests admission and attendance records on SSP.","channel":"college_cell"},{"stepNumber":3,"title":"Direct Monthly DBT","description":"₹1,500 monthly stipend transferred via Aadhaar Payment Bridge.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-ganga-kalyana-borewell',
  'karnataka-ganga-kalyana-scheme-irrigation',
  'Karnataka Ganga Kalyana Scheme (Free Irrigation Borewells)',
  '100% free drilling of agricultural borewells, submersible pump installation, and electrical energization for small/marginal SC, ST, and minority farmers.',
  'Under the Ganga Kalyana Scheme, the Government of Karnataka provides dedicated individual or collective irrigation facilities by drilling free borewells, installing pumpsets, and energizing them for small and marginal farmers belonging to SC, ST, and OBC communities.',
  'agriculture',
  'state',
  'Karnataka',
  'Dr. B.R. Ambedkar Development Corporation, Government of Karnataka',
  'Dr. B.R. Ambedkar Development Corporation, Government of Karnataka',
  'https://adcl.karnataka.gov.in',
  'free_verified',
  '100% free borewell drilling up to 500+ feet, submersible pump, motor, pipelines, and free electrical power line connection (worth up to ₹3.5 Lakhs per borewell).',
  'Small or marginal farmer belonging to SC/ST/OBC in Karnataka owning minimum 1 to 5 acres of agricultural land without perennial water source; family income <= ₹96,000/yr (rural).',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Domicile","sourceClause":"Ganga Kalyana Rules 1"},{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["SC","ST","OBC_Cat1","OBC_2A"],"isMandatory":true,"conditionName":"Eligible Backward Community","sourceClause":"Ganga Kalyana Rules 2"}]',
  '[{"id":"doc-ka-rtc","name":"Land Records (RTC / Pahani)","description":"Demonstrating cultivable dry agricultural land","requirementType":"mandatory","issuingAuthority":"Revenue Dept (Bhoomi)","sourceEvidence":"Ganga Kalyana Checklist 1"},{"id":"doc-ka-small-farmer","name":"Small / Marginal Farmer Certificate","description":"Issued by Tahsildar","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"Ganga Kalyana Checklist 2"}]',
  '[{"stepNumber":1,"title":"Online Application on Seva Sindhu","description":"Submit application on Karnataka Seva Sindhu portal or at Grama One centre.","channel":"online_portal","portalUrl":"https://sevasindhu.karnataka.gov.in"},{"stepNumber":2,"title":"Hydrogeologist Ground Survey","description":"Groundwater department geologists survey land and mark drilling point.","channel":"district_office"},{"stepNumber":3,"title":"Drilling & Energization by Corporation","description":"Corporation rigs drill borewell and DISCOM (BESCOM/HESCOM) connects power.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-tamil-pudhalvan',
  'tamil-nadu-tamil-pudhalvan-college-boys-stipend',
  'Tamil Nadu Tamil Pudhalvan Scheme (College Boys Higher Education Incentive)',
  'Monthly financial assistance of ₹1,000 per month for male students from government schools pursuing undergraduate degrees, engineering, or polytechnic diplomas.',
  'Complementing the Pudhumai Penn scheme for girls, Tamil Pudhalvan provides a direct monthly stipend of ₹1,000 to boys who studied in government schools (Classes 6 to 12) to pursue college degrees and technical education without dropping out due to economic pressures.',
  'scholarship',
  'state',
  'Tamil Nadu',
  'Social Welfare and Women Empowerment Department, Government of Tamil Nadu',
  'Social Welfare and Women Empowerment Department, Government of Tamil Nadu',
  'https://tamilpudhalvan.tn.gov.in',
  'free_verified',
  '₹1,000 per month credited directly into the student''s bank account every month until completion of degree/diploma course.',
  'Male students who studied from Class 6 to 12 in Tamil Nadu Government schools, enrolled in full-time regular undergraduate, engineering, medical, or polytechnic course.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Tamil Nadu","isMandatory":true,"conditionName":"Tamil Nadu Domicile","sourceClause":"Tamil Pudhalvan Criteria 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"male","isMandatory":true,"conditionName":"Male Student","sourceClause":"Tamil Pudhalvan Criteria 2"},{"id":"rule-schoolingGovtClass6to12-equals","parameter":"schoolingGovtClass6to12","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Class 6-12 in TN Govt School","sourceClause":"Tamil Pudhalvan Criteria 3"}]',
  '[{"id":"doc-tn-emits","name":"School EMIS Number / Transfer Certificate","description":"Proof of studying in TN Govt School Class 6-12","requirementType":"mandatory","issuingAuthority":"School Headmaster","sourceEvidence":"Tamil Pudhalvan Doc 1"},{"id":"doc-tn-college-bonafide","name":"College Admission Bonafide","description":"Confirming regular college enrollment","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"Tamil Pudhalvan Doc 2"}]',
  '[{"stepNumber":1,"title":"College Level Registration Camp","description":"Nodal officer at college enters student EMIS number on Tamil Pudhalvan portal.","channel":"college_cell"},{"stepNumber":2,"title":"Departmental Verification","description":"Education department verifies government school schooling record via EMIS.","channel":"online_portal"},{"stepNumber":3,"title":"Monthly DBT Transfer","description":"₹1,000 credited every month into student''s Aadhaar-seeded bank account.","channel":"online_portal","portalUrl":"https://tamilpudhalvan.tn.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-naan-mudhalvan',
  'tamil-nadu-naan-mudhalvan-upskilling-employment',
  'Tamil Nadu Naan Mudhalvan Scheme (Flagship Career Upskilling)',
  '100% free industry-certified skill training in AI/ML, Cloud Computing, Robotics, and Foreign Languages with top MNC hiring linkages for college students.',
  'Naan Mudhalvan is Tamil Nadu''s umbrella skill and career guidance platform empowering over 10 Lakh college youth annually with cutting-edge curriculum delivered by industry leaders (Microsoft, Google, Infosys, L&T) integrated into semester timetables.',
  'livelihood',
  'state',
  'Tamil Nadu',
  'Tamil Nadu Skill Development Corporation (TNSDC)',
  'Tamil Nadu Skill Development Corporation (TNSDC)',
  'https://naanmudhalvan.tn.gov.in',
  'free_verified',
  '100% free industry courses, cloud lab credits, mandatory semester credits, mentorship, hackathons, and placement drives in top tech and engineering companies.',
  'All students currently studying in Arts & Science, Engineering, Polytechnic, and ITI colleges in Tamil Nadu.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Tamil Nadu","isMandatory":true,"conditionName":"College Enrolled in Tamil Nadu","sourceClause":"Naan Mudhalvan Guidelines 2"}]',
  '[{"id":"doc-naan-id","name":"College Student ID Card & Registration Number","description":"Current active enrollment","requirementType":"mandatory","issuingAuthority":"College","sourceEvidence":"NM Checklist 1"}]',
  '[{"stepNumber":1,"title":"Login to Naan Mudhalvan Portal","description":"Student logs in with university register number and accesses skill dashboard.","channel":"online_portal","portalUrl":"https://naanmudhalvan.tn.gov.in"},{"stepNumber":2,"title":"Complete Semester Skill Module","description":"Undergo hands-on project training as part of curriculum.","channel":"college_cell"},{"stepNumber":3,"title":"Industry Certification & Placement","description":"Earn global industry certificate and participate in campus job drives.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-cm-breakfast-scheme',
  'tamil-nadu-chief-ministers-breakfast-scheme',
  'Tamil Nadu Chief Minister''s Breakfast Scheme (Mudhalvarin Kaalai Unavu Thittam)',
  'Free nutritious hot cooked breakfast (pongal, kichadi, idli, upma with sambar) every school morning for all primary school children across Tamil Nadu.',
  'Pioneered by Tamil Nadu, this flagship school nutrition scheme provides freshly prepared, healthy hot breakfast to over 17 Lakh children in Grades 1 to 5 across all 31,000+ government primary schools to eliminate morning hunger and improve classroom attention.',
  'welfare',
  'state',
  'Tamil Nadu',
  'Social Welfare and Women Empowerment Department, Government of Tamil Nadu',
  'Social Welfare and Women Empowerment Department, Government of Tamil Nadu',
  'https://cmbreakfast.tn.gov.in',
  'free_verified',
  'Free hot cooked nutritious breakfast every school working day (variety menu: rava upma, pongal, semiya kichadi, wheat upma, and vegetable sambar).',
  'All children studying in Classes 1 to 5 in government primary and middle schools in Tamil Nadu.',
  '[{"id":"rule-schoolClass-less_than_or_equal","parameter":"schoolClass","operator":"LESS_THAN_OR_EQUAL","expectedValue":5,"isMandatory":true,"conditionName":"Class 1 to 5 in Government School","sourceClause":"CM Breakfast Policy 1"}]',
  '[{"id":"doc-breakfast-none","name":"No Application Required (Universal for all enrolled students)","description":"Automatic school entitlement","requirementType":"mandatory","issuingAuthority":"Primary School Headmaster","sourceEvidence":"CMBS Guidelines"}]',
  '[{"stepNumber":1,"title":"School Enrolment","description":"Enrol in any government primary school in Tamil Nadu.","channel":"college_cell"},{"stepNumber":2,"title":"Daily Breakfast Serving","description":"Served hot breakfast every school morning between 8:00 AM and 8:45 AM.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mh-rajarshi-shahu-maharaj-fee',
  'maharashtra-rajarshi-chhatrapati-shahu-maharaj-fee-reimbursement',
  'Maharashtra Rajarshi Chhatrapati Shahu Maharaj Shikshan Shulkh Shishyavrutti',
  '50% to 100% tuition and exam fee reimbursement for EBC, OBC, and SEBC students pursuing professional engineering, medical, and pharmacy degrees.',
  'This flagship higher education scheme by Government of Maharashtra pays 50% of tuition and exam fees for EBC/OBC students (and 100% for girl students from families earning <= ₹8 Lakhs) admitted through CAP in government-approved professional colleges.',
  'scholarship',
  'state',
  'Maharashtra',
  'Directorate of Higher / Technical / Medical Education, Govt of Maharashtra',
  'Directorate of Higher / Technical / Medical Education, Govt of Maharashtra',
  'https://mahadbt.maharashtra.gov.in',
  'free_verified',
  '50% reimbursement of sanctioned tuition fees and examination fees (100% for girl students under revised state policy) credited directly to college/student account.',
  'Maharashtra domicile, admitted through Centralized Admission Process (CAP) in approved degree/diploma course, family income <= ₹8 Lakhs per year.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Maharashtra","isMandatory":true,"conditionName":"Maharashtra Domicile","sourceClause":"RCSM Scheme Rules 2.1"},{"id":"rule-capAdmission-equals","parameter":"capAdmission","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Admission through CAP Round","sourceClause":"RCSM Scheme Rules 2.2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8 Lakhs","sourceClause":"RCSM Scheme Rules 2.3"}]',
  '[{"id":"doc-mh-domicile","name":"Maharashtra Domicile Certificate","description":"Proof of continuous residence","requirementType":"mandatory","issuingAuthority":"Tahsildar / Setu Centre","sourceEvidence":"MahaDBT Doc 1"},{"id":"doc-mh-income-tehsil","name":"Tehsildar Income Certificate","description":"Income verification for current year","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"MahaDBT Doc 2"},{"id":"doc-mh-cap-allotment","name":"CAP Allotment Letter","description":"Proof of merit seat via CET Cell","requirementType":"mandatory","issuingAuthority":"State CET Cell","sourceEvidence":"MahaDBT Doc 3"}]',
  '[{"stepNumber":1,"title":"Create Profile on MahaDBT Portal","description":"Register on Aaple Sarkar DBT portal with Aadhaar e-KYC.","channel":"online_portal","portalUrl":"https://mahadbt.maharashtra.gov.in"},{"stepNumber":2,"title":"Upload CAP Allotment & Income Proof","description":"Select Directorate of Technical/Higher Education and apply for Shahu Maharaj Scheme.","channel":"online_portal"},{"stepNumber":3,"title":"College Scrutiny & Direct Credit","description":"College verifies form and state treasury releases fee reimbursement.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mh-sanjay-gandhi-niradhar',
  'maharashtra-sanjay-gandhi-niradhar-anudan-yojana',
  'Maharashtra Sanjay Gandhi Niradhar Anudan Yojana',
  'Monthly financial pension of ₹1,500/month for destitute persons, widows, divorced women, orphan children, and patients with critical illnesses.',
  'Administered by Social Justice and Special Assistance Department of Maharashtra, this scheme provides a vital social safety net of ₹1,500 per month for persons with no regular source of income who are aged 65+, destitute, disabled, or suffering from critical conditions.',
  'pension',
  'state',
  'Maharashtra',
  'Social Justice and Special Assistance Department, Govt of Maharashtra',
  'Social Justice and Special Assistance Department, Govt of Maharashtra',
  'https://sjsa.maharashtra.gov.in',
  'free_verified',
  '₹1,500 per month for single beneficiary (₹2,000 per month if family has two or more beneficiaries) credited directly to bank account.',
  'Resident of Maharashtra for 15+ years, age 65+ (or destitute widow/divorcee/disabled of any age), family income <= ₹50,000 per annum.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Maharashtra","isMandatory":true,"conditionName":"Maharashtra Resident for 15+ Years","sourceClause":"SGNAY Clause 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":50000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹50,000","sourceClause":"SGNAY Clause 2"}]',
  '[{"id":"doc-sgnay-income","name":"Tehsildar Income & Destitute Certificate","description":"Showing income below ₹50,000/yr","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"SGNAY Form A"},{"id":"doc-sgnay-residence","name":"15 Years Residence Domicile Proof","description":"Ration card or election voter ID","requirementType":"mandatory","issuingAuthority":"Competent Authority","sourceEvidence":"SGNAY Form B"}]',
  '[{"stepNumber":1,"title":"Apply at Tahsil Office or Setu Suvidha Kendra","description":"Submit filled SGNAY form with residence and income proof.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Sanjay Gandhi Committee Sanction","description":"Taluka Level Sanjay Gandhi Committee headed by MLA/Tahsildar approves pension list.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Disbursal","description":"Sanctioned monthly pension credited straight into savings bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'kl-karunya-health-scheme',
  'kerala-karunya-arogya-suraksha-paddhati-kasp',
  'Kerala Karunya Arogya Suraksha Paddhati (KASP) & Karunya Benevolent Fund',
  'Comprehensive cashless hospitalisation health cover up to ₹5 Lakhs per family per year across 600+ empanelled government and private hospitals.',
  'KASP is Kerala''s flagship converged health care scheme providing ₹5,00,000 per family per year for secondary and tertiary care hospitalization, complemented by the Karunya Benevolent Fund (KBF) offering one-time grants up to ₹3 Lakhs for rare diseases.',
  'healthcare',
  'state',
  'Kerala',
  'State Health Agency (SHA), Health and Family Welfare Department, Govt of Kerala',
  'State Health Agency (SHA), Health and Family Welfare Department, Govt of Kerala',
  'https://sha.kerala.gov.in',
  'free_verified',
  '₹5,00,000 per family per year cashless treatment for 1,600+ surgical and medical packages in empanelled hospitals, covering pre-existing conditions without waiting period.',
  'All ration card holders categorized as Antyodaya Anna Yojana (AAY) and Priority Household (PHH - Pink and Yellow cards), and enrolled Non-Priority Subsidy families.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Kerala","isMandatory":true,"conditionName":"Kerala Resident","sourceClause":"KASP Scheme Rules Section 2"},{"id":"rule-rationCardCategory-in","parameter":"rationCardCategory","operator":"IN","expectedValue":["AAY","PHH","BPL"],"isMandatory":true,"conditionName":"Priority Ration Card Holder","sourceClause":"KASP Scheme Rules Section 3"}]',
  '[{"id":"doc-kl-ration","name":"Kerala Electronic Ration Card","description":"Pink / Yellow / Blue card","requirementType":"mandatory","issuingAuthority":"Civil Supplies Dept Kerala","sourceEvidence":"KASP Checklist 1"},{"id":"doc-kl-aadhaar","name":"Aadhaar Card","description":"For biometric patient verification","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"KASP Checklist 2"}]',
  '[{"stepNumber":1,"title":"Approach KASP Helpdesk at Hospital","description":"Visit Karunya Arogya Mitra (KAM) counter at any empanelled hospital.","channel":"district_office"},{"stepNumber":2,"title":"Instant Biometric Authentication","description":"Verify Aadhaar and ration card on SHA Kerala portal.","channel":"online_portal","portalUrl":"https://sha.kerala.gov.in"},{"stepNumber":3,"title":"100% Cashless Treatment & Discharge","description":"Diagnostic tests, surgeries, medicines, and food covered without paying any cash.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'kl-life-mission-housing',
  'kerala-life-mission-housing-for-all',
  'Kerala LIFE Mission (Livelihood Inclusion and Financial Empowerment)',
  '₹4 Lakhs direct grant to construct 400 sq.ft. pucca house for all landless and homeless families in Kerala with livelihood convergence.',
  'LIFE Mission is Kerala''s revolutionary housing mission providing pucca, climate-resilient houses of minimum 400 sq.ft. with ₹4,00,000 financial grant to homeless families having land, and turnkey apartment complexes for landless-homeless families.',
  'housing',
  'state',
  'Kerala',
  'Local Self Government Department, Government of Kerala',
  'Local Self Government Department, Government of Kerala',
  'https://lifemission.kerala.gov.in',
  'free_verified',
  '₹4,00,000 financial grant disbursed in 4 construction milestones (foundation, lintel, roof, completion) for homeless families, plus skill training and livelihood assistance.',
  'Homeless individuals/families domiciled in Kerala holding pink/yellow ration card without a pucca house in their name anywhere in India.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Kerala","isMandatory":true,"conditionName":"Kerala Domicile","sourceClause":"LIFE Mission Guidelines Clause 3"},{"id":"rule-ownPuccaHouse-equals","parameter":"ownPuccaHouse","operator":"EQUALS","expectedValue":false,"isMandatory":true,"conditionName":"No Existing Pucca House","sourceClause":"LIFE Mission Guidelines Clause 4"}]',
  '[{"id":"doc-kl-life-land","name":"Land Tax Receipt / Possession Certificate","description":"Proof of minimum 1-3 cents of land","requirementType":"mandatory","issuingAuthority":"Village Officer","sourceEvidence":"LIFE Mission Form 1"},{"id":"doc-kl-life-ration","name":"Ration Card & Aadhaar","description":"Proof of BPL status","requirementType":"mandatory","issuingAuthority":"Civil Supplies","sourceEvidence":"LIFE Mission Form 2"}]',
  '[{"stepNumber":1,"title":"Online Application on LIFE Mission Portal","description":"Apply online with land details through Akshaya Centre or Grama Panchayat.","channel":"meeseva_csc","portalUrl":"https://lifemission.kerala.gov.in"},{"stepNumber":2,"title":"Field Verification & Grama Sabha Approval","description":"Grama Panchayat secretary inspects site; beneficiary list ratified by Grama Sabha.","channel":"district_office"},{"stepNumber":3,"title":"Milestone-Based Fund Credit","description":"Grant released in 4 installments directly to bank account based on engineer geotagged photos.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'up-swami-vivekanand-tablets',
  'up-swami-vivekanand-yuva-sashaktikaran-smartphones-tablets',
  'Uttar Pradesh Swami Vivekanand Yuva Sashaktikaran Yojana (Free Tablets & Smartphones)',
  '100% free distribution of branded Android tablets and smartphones to higher education and diploma college students across Uttar Pradesh.',
  'To digitally empower students pursuing higher education, technical courses (ITI, Polytechnic), medical, and skill development programs, Government of Uttar Pradesh provides free high-performance tablets and smartphones with preloaded educational applications.',
  'education_aid',
  'state',
  'Uttar Pradesh',
  'Department of IT and Electronics, Government of Uttar Pradesh',
  'Department of IT and Electronics, Government of Uttar Pradesh',
  'https://digishakti.up.gov.in',
  'free_verified',
  'Free branded Android Tablet (for professional/technical students) or Smartphone (for general graduation students) with 1-year warranty and free digital learning content.',
  'Student enrolled in final year or pursuing graduation, post-graduation, ITI, polytechnic, medical, nursing, or skill certification in an accredited college in Uttar Pradesh.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Uttar Pradesh","isMandatory":true,"conditionName":"UP Resident","sourceClause":"DigiShakti Rules 1"},{"id":"rule-collegeEnrolled-equals","parameter":"collegeEnrolled","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Enrolled in Higher Education College in UP","sourceClause":"DigiShakti Rules 2"}]',
  '[{"id":"doc-up-bonafide","name":"College Student Identity Card & Enrollment Slip","description":"Uploaded by college on DigiShakti","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"DigiShakti Doc 1"}]',
  '[{"stepNumber":1,"title":"Data Upload by College","description":"College nodal officer uploads verified student database onto the DigiShakti portal.","channel":"college_cell"},{"stepNumber":2,"title":"District Level Screening","description":"District Magistrate led committee approves device distribution rosters.","channel":"district_office"},{"stepNumber":3,"title":"Device Distribution Camp","description":"Students receive free tablet/smartphone during campus distribution event.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'up-abhyudaya-free-coaching',
  'up-mukhyamantri-abhyudaya-free-coaching-scheme',
  'Uttar Pradesh Mukhyamantri Abhyudaya Yojana (Free Competitive Coaching)',
  '100% free classroom and online coaching by IAS/IPS officers and subject experts for UPSC, UPPSC, JEE, NEET, CDS, and NDA with free tablet grant.',
  'Mukhyamantri Abhyudaya Yojana provides free state-level guidance, study materials, physical classroom lectures by serving civil servants, and virtual e-learning platforms for talented youth preparing for competitive examinations who cannot afford costly private coaching.',
  'education_aid',
  'state',
  'Uttar Pradesh',
  'Social Welfare Department, Government of Uttar Pradesh',
  'Social Welfare Department, Government of Uttar Pradesh',
  'https://abhyuday.up.gov.in',
  'free_verified',
  'Free physical and virtual coaching, free mock tests, access to digital e-library, and tablet grant for top performing enrolled aspirants.',
  'Resident of Uttar Pradesh preparing for competitive entrance examinations (Civil Services, JEE, NEET, Defense, Banking) selected through state eligibility test.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Uttar Pradesh","isMandatory":true,"conditionName":"UP Domicile","sourceClause":"Abhyudaya Guidelines Clause 2"}]',
  '[{"id":"doc-abhyudaya-domicile","name":"UP Domicile / Aadhaar Card","description":"Proof of residency","requirementType":"mandatory","issuingAuthority":"Revenue Dept","sourceEvidence":"Abhyudaya Checklist 1"}]',
  '[{"stepNumber":1,"title":"Online Registration on Abhyudaya Portal","description":"Register profile and choose target examination coaching track.","channel":"online_portal","portalUrl":"https://abhyuday.up.gov.in"},{"stepNumber":2,"title":"Appear for Online Screening Exam","description":"Take state entrance test to qualify for physical classroom batch.","channel":"online_portal"},{"stepNumber":3,"title":"Attend Offline / Online Classes","description":"Attend daily evening classes at divisional headquarters.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'up-bc-sakhi-yojana',
  'uttar-pradesh-bc-sakhi-banking-correspondent-yojana',
  'Uttar Pradesh BC Sakhi Yojana (Banking Correspondent Women Livelihood)',
  'Direct monthly stipend of ₹4,000 for 6 months + ₹75,000 subsidized loan for POS device and micro-ATM equipment for rural women banking correspondents.',
  'BC Sakhi Yojana trains rural women Self Help Group members to operate as doorstep banking correspondents in every Gram Panchayat of Uttar Pradesh, providing cash withdrawals, DBT pensions, bill payments, and doorstep savings services while earning commission and stipends.',
  'livelihood',
  'state',
  'Uttar Pradesh',
  'Rural Development Department / UPSRLM, Government of Uttar Pradesh',
  'Rural Development Department / UPSRLM, Government of Uttar Pradesh',
  'https://upsrlm.up.gov.in',
  'free_verified',
  '₹4,000/month stipend for the first 6 months, ₹75,000 loan assistance for micro-ATM hardware/laptop, IIBF banking certification, and transaction commission.',
  'Woman resident of target Gram Panchayat aged 18 to 50 years, minimum 10th class pass, proficient in operating smartphones and electronic transactions.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Uttar Pradesh","isMandatory":true,"conditionName":"UP Gram Panchayat Resident","sourceClause":"BC Sakhi Clause 2.1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Candidate","sourceClause":"BC Sakhi Clause 2.2"},{"id":"rule-minClass10Pass-equals","parameter":"minClass10Pass","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Minimum 10th Class Pass","sourceClause":"BC Sakhi Clause 2.3"}]',
  '[{"id":"doc-bcsakhi-edu","name":"Class 10 Marksheet & Certificate","description":"Proof of educational qualification","requirementType":"mandatory","issuingAuthority":"UP Board / CBSE","sourceEvidence":"BC Sakhi Checklist 1"},{"id":"doc-bcsakhi-aadhaar","name":"Aadhaar Card and Mobile Number","description":"Identity proof","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"BC Sakhi Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply on UP BC Sakhi Mobile App","description":"Download official mobile app from Google Play and complete psychometric survey.","channel":"online_portal"},{"stepNumber":2,"title":"RSETI Training & IIBF Certification","description":"Undergo mandatory 6-day residential banking training and clear IIBF exam.","channel":"college_cell"},{"stepNumber":3,"title":"Deployment in Village","description":"Receive Micro-ATM terminal and commence doorstep banking in allotted Gram Panchayat.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mp-ladli-behna',
  'madhya-pradesh-mukhyamantri-ladli-behna-yojana',
  'Madhya Pradesh Mukhyamantri Ladli Behna Yojana',
  'Direct monthly financial support of ₹1,250 per month (₹15,000/year) transferred on the 10th of every month to eligible married women in MP.',
  'Ladli Behna Yojana is MP''s flagship socio-economic transformation initiative providing monthly DBT cash transfers of ₹1,250 to married, widowed, and divorced women to foster nutritional self-sufficiency, financial autonomy, and decision-making.',
  'welfare',
  'state',
  'Madhya Pradesh',
  'Women and Child Development Department, Government of Madhya Pradesh',
  'Women and Child Development Department, Government of Madhya Pradesh',
  'https://cmladlibehna.mp.gov.in',
  'free_verified',
  '₹1,250 per month (paid on the 10th of every month) credited directly to beneficiary''s Aadhaar-linked DBT bank account.',
  'Married woman resident of MP aged 21 to 60 years, whose family annual income <= ₹2.5 Lakhs, owning less than 5 acres of agricultural land, and not paying income tax.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Madhya Pradesh","isMandatory":true,"conditionName":"MP Domicile","sourceClause":"Ladli Behna Criteria 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Resident","sourceClause":"Ladli Behna Criteria 2"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":21,"isMandatory":true,"conditionName":"Minimum Age 21 Years","sourceClause":"Ladli Behna Criteria 3"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":250000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2.5 Lakhs","sourceClause":"Ladli Behna Criteria 4"}]',
  '[{"id":"doc-mp-samagra","name":"Samagra Family ID (9-Digit Samagra ID)","description":"E-KYC verified Samagra profile","requirementType":"mandatory","issuingAuthority":"Panchayat / Samagra Portal","sourceEvidence":"Ladli Behna Checklist 1"},{"id":"doc-mp-aadhaar-dbt","name":"Aadhaar Card Linked Bank Account","description":"Active Aadhaar Payment Bridge (APB) seeding","requirementType":"mandatory","issuingAuthority":"Bank Branch","sourceEvidence":"Ladli Behna Checklist 2"}]',
  '[{"stepNumber":1,"title":"Complete Samagra e-KYC","description":"Link Aadhaar with Samagra ID via OTP or biometric at CSC or Gram Panchayat.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Submit Form at Camp","description":"Village secretary / Anganwadi worker enters form and takes live photo.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Transfer on 10th","description":"Automatic ₹1,250 DBT credit to bank account on the 10th of every month.","channel":"online_portal","portalUrl":"https://cmladlibehna.mp.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mp-medhavi-vidyarthi',
  'madhya-pradesh-mukhyamantri-medhavi-vidyarthi-yojana-mmvy',
  'Madhya Pradesh Mukhyamantri Medhavi Vidyarthi Yojana (MMVY)',
  '100% full tuition fee payment for meritorious students securing admission in IITs, AIIMS, NITs, NLUs, Medical, and Engineering colleges.',
  'MMVY ensures that no talented student in Madhya Pradesh is deprived of premier higher education due to financial constraints. The MP Government pays 100% of the tuition fees for students securing admission to IITs, AIIMS, premier NLUs, government medical colleges, or engineering colleges.',
  'scholarship',
  'state',
  'Madhya Pradesh',
  'Department of Technical Education, Skill Development and Employment, Govt of MP',
  'Department of Technical Education, Skill Development and Employment, Govt of MP',
  'https://scholarshipportal.mp.nic.in/MedhaviChhatra',
  'free_verified',
  '100% government payment of actual college tuition fees (up to ₹1.5 Lakhs in private engineering, full in government medical and national institutes like IITs).',
  'MP domicile who scored >= 70% (MP Board) or >= 85% (CBSE/ICSE) in Class 12, family income <= ₹6 Lakhs, admitted to recognized degree courses.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Madhya Pradesh","isMandatory":true,"conditionName":"MP Domicile","sourceClause":"MMVY Rules Clause 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":600000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹6 Lakhs","sourceClause":"MMVY Rules Clause 2"}]',
  '[{"id":"doc-mmvy-marksheet","name":"Class 12 Marksheet (>= 70% MPBSE or >= 85% CBSE)","description":"Showing merit percentile","requirementType":"mandatory","issuingAuthority":"State Board / CBSE","sourceEvidence":"MMVY Checklist 1"},{"id":"doc-mmvy-admission","name":"Allotment Letter & College Fee Structure","description":"Admission proof for engineering/medical/degree","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"MMVY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Register on MP Scholarship Portal","description":"Login to portal and choose Mukhyamantri Medhavi Vidyarthi Scheme.","channel":"online_portal","portalUrl":"https://scholarshipportal.mp.nic.in/MedhaviChhatra"},{"stepNumber":2,"title":"Upload Admission & Marksheet Details","description":"Provide entrance exam rank (JEE/NEET/CLAT) and college fee structure.","channel":"online_portal"},{"stepNumber":3,"title":"Treasury Fee Reimbursement","description":"State sanctioning authority transfers tuition fees directly to the institution bank account.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mp-seekho-kamao-yojana',
  'madhya-pradesh-mukhyamantri-seekho-kamao-yojana-mmsky',
  'Madhya Pradesh Mukhyamantri Seekho Kamao Yojana (Learn and Earn)',
  'Monthly stipend of ₹8,000 to ₹10,000 per month for youth undergoing on-the-job industrial skill training across 700+ sectors in MP.',
  'Seekho Kamao Yojana bridges the industry-academia skill gap by placing youth in registered enterprises for live on-the-job training (OJT), with the MP Government co-funding 75% of the monthly stipend directly into the trainee''s bank account via DBT.',
  'livelihood',
  'state',
  'Madhya Pradesh',
  'Madhya Pradesh State Skill Development and Employment Generation Board',
  'Madhya Pradesh State Skill Development and Employment Generation Board',
  'https://mmsky.mp.gov.in',
  'free_verified',
  'Monthly stipend: ₹8,000 (Class 12 pass), ₹8,500 (ITI pass), ₹9,000 (Diploma pass), and ₹10,000 (Graduate/Post-Graduate) for up to 1 year.',
  'MP domicile youth aged 18 to 29 years, passed Class 12 / ITI / Diploma / Degree, not currently in regular government or formal wage employment.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Madhya Pradesh","isMandatory":true,"conditionName":"MP Domicile","sourceClause":"MMSKY Clause 2.1"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Age 18-29 Years","sourceClause":"MMSKY Clause 2.2"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":29,"isMandatory":true,"conditionName":"Maximum Age 29 Years","sourceClause":"MMSKY Clause 2.3"}]',
  '[{"id":"doc-mmsky-samagra","name":"Samagra ID and Aadhaar Card","description":"E-KYC verified identity","requirementType":"mandatory","issuingAuthority":"Panchayat / UIDAI","sourceEvidence":"MMSKY Doc 1"},{"id":"doc-mmsky-degree","name":"Educational Qualification Degree / Diploma / ITI","description":"Certificate of highest education","requirementType":"mandatory","issuingAuthority":"University / ITI","sourceEvidence":"MMSKY Doc 2"}]',
  '[{"stepNumber":1,"title":"Candidate Registration on MMSKY Portal","description":"Create candidate profile, select vocational interests and target district.","channel":"online_portal","portalUrl":"https://mmsky.mp.gov.in"},{"stepNumber":2,"title":"Apply to Registered Industry Vacancies","description":"Choose from available on-the-job training openings in private/public firms.","channel":"online_portal"},{"stepNumber":3,"title":"Contract Execution & Monthly DBT","description":"Sign training agreement; state government transfers 75% stipend directly via DBT.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'rj-ayushman-swasthya-bima',
  'rajasthan-mukhya-mantri-ayushman-arogya-yojana',
  'Rajasthan Mukhya Mantri Ayushman Arogya Yojana (MAA Yojana)',
  'Cashless hospital treatment up to ₹25 Lakhs per family per year and organ transplant coverage across private and government hospitals in Rajasthan.',
  'Rajasthan''s universal health insurance scheme (formerly Chiranjeevi) provides unprecedented health coverage of up to ₹25,00,000 per family per year across 1,800+ medical and surgical packages, including cochlear implants, heart, liver, and bone marrow transplants.',
  'healthcare',
  'state',
  'Rajasthan',
  'Rajasthan State Health Assurance Agency (RSHAA)',
  'Rajasthan State Health Assurance Agency (RSHAA)',
  'https://health.rajasthan.gov.in',
  'free_verified',
  'Cashless medical and surgical cover up to ₹25,00,000 per family per year in empanelled hospitals, plus ₹10 Lakh accidental insurance cover.',
  'All residents of Rajasthan enrolled via Jan Aadhaar Card. Free for NFSA, SECC, small farmers, and contract workers; other families can enroll at nominal ₹850/year premium.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Rajasthan","isMandatory":true,"conditionName":"Rajasthan Resident with Jan Aadhaar","sourceClause":"MAA Yojana Guidelines 1"}]',
  '[{"id":"doc-rj-janaadhaar","name":"Jan Aadhaar Card","description":"Mandatory Rajasthan resident family digital card","requirementType":"mandatory","issuingAuthority":"Jan Aadhaar Authority","sourceEvidence":"MAA Doc 1"}]',
  '[{"stepNumber":1,"title":"Approach Empanelled Hospital Swasthya Margdarshak","description":"Visit help desk at any empaneled government or private hospital in Rajasthan.","channel":"district_office"},{"stepNumber":2,"title":"Jan Aadhaar Authentication","description":"Instant biometric/OTP verification of family membership.","channel":"online_portal"},{"stepNumber":3,"title":"Cashless Treatment & Medication","description":"Hospital provides complete cashless surgery, medications, and diagnostics up to ₹25 Lakhs.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'rj-anupriti-free-coaching',
  'rajasthan-mukhyamantri-anupriti-coaching-yojana',
  'Rajasthan Mukhyamantri Anupriti Coaching Yojana',
  '100% free coaching at top coaching institutes for UPSC, RAS, JEE, NEET, CLAT, REET, and CA with ₹40,000 annual boarding allowance for outstation students.',
  'Anupriti Coaching Yojana sponsors 30,000 meritorious underprivileged students every year for premier coaching for professional entrance exams, paying the entire coaching fees directly to premier private institutes like Allen, Resonance, Drishti IAS, etc., plus living costs.',
  'education_aid',
  'state',
  'Rajasthan',
  'Social Justice and Empowerment Department, Government of Rajasthan',
  'Social Justice and Empowerment Department, Government of Rajasthan',
  'https://sje.rajasthan.gov.in',
  'free_verified',
  'Full coaching fees paid directly to top institute + ₹40,000 per annum living/boarding allowance for outstation students admitted to coaching in major cities (Jaipur, Kota, Jodhpur).',
  'Rajasthan domicile belonging to SC, ST, OBC, MBC, EWS, or Minority, with family annual income <= ₹8 Lakhs, selected on merit of Class 10/12 marks.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Rajasthan","isMandatory":true,"conditionName":"Rajasthan Domicile","sourceClause":"Anupriti Criteria 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8 Lakhs","sourceClause":"Anupriti Criteria 2"}]',
  '[{"id":"doc-rj-janaadhaar-id","name":"Jan Aadhaar Card","description":"Identity and residence proof","requirementType":"mandatory","issuingAuthority":"Jan Aadhaar Portal","sourceEvidence":"Anupriti Checklist 1"},{"id":"doc-rj-marksheet","name":"Class 10 / 12 Marksheet","description":"For merit ranking","requirementType":"mandatory","issuingAuthority":"RBSE / CBSE","sourceEvidence":"Anupriti Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on SJMS Portal","description":"Login via Rajasthan SSO and submit Anupriti online application.","channel":"online_portal","portalUrl":"https://sso.rajasthan.gov.in"},{"stepNumber":2,"title":"Merit List Generation","description":"Department publishes course-wise and category-wise cut-off merit lists.","channel":"online_portal"},{"stepNumber":3,"title":"Join Empanelled Coaching Centre","description":"Join allotted coaching institute; fees paid by state treasury and living allowance credited via DBT.","channel":"college_cell"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'rj-palanhar-yojana',
  'rajasthan-palanhar-yojana-child-care',
  'Rajasthan Palanhar Yojana (Vulnerable Children Care Assistance)',
  'Monthly financial allowance of ₹1,500 to ₹2,500 per child plus ₹2,000 annual clothing/school kit grant for relatives caring for orphan children.',
  'Palanhar Yojana provides institutional family-care assistance by paying monthly allowances to foster parents, relatives, or guardians caring for orphans, children of life imprisonment convicts, AIDS patients, or widows, ensuring the child receives continuous education.',
  'welfare',
  'state',
  'Rajasthan',
  'Social Justice and Empowerment Department, Government of Rajasthan',
  'Social Justice and Empowerment Department, Government of Rajasthan',
  'https://sje.rajasthan.gov.in/Default.aspx?PageID=41',
  'free_verified',
  'Monthly allowance: ₹1,500/child (ages 0-6 years) and ₹2,500/child (ages 6-18 years enrolled in school) + ₹2,000 annual lump sum for shoes, books, and clothing.',
  'Caregiver (Palanhar) residing in Rajasthan taking care of orphan children or children of eligible vulnerable categories, family income <= ₹1.2 Lakhs/year.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Rajasthan","isMandatory":true,"conditionName":"Rajasthan Domicile","sourceClause":"Palanhar Rules Clause 2"},{"id":"rule-childSchoolEnrollment-equals","parameter":"childSchoolEnrollment","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Mandatory School Enrollment (for ages 6+)","sourceClause":"Palanhar Rules Clause 3"}]',
  '[{"id":"doc-palanhar-death","name":"Parents'' Death Certificate / Judicial Order","description":"Proof of orphan status or conviction order","requirementType":"mandatory","issuingAuthority":"Municipal Authority / Court","sourceEvidence":"Palanhar Form A"},{"id":"doc-palanhar-school","name":"Annual School Bonafide Certificate","description":"Showing regular attendance in school","requirementType":"mandatory","issuingAuthority":"School Headmaster","sourceEvidence":"Palanhar Form B"}]',
  '[{"stepNumber":1,"title":"Apply on E-Mitra / SSO Portal","description":"Submit Palanhar application online through any E-Mitra kiosk.","channel":"meeseva_csc","portalUrl":"https://sso.rajasthan.gov.in"},{"stepNumber":2,"title":"Verification by Child Development Project Officer","description":"Field inspection confirms child is living with guardian and attending school.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Transfer","description":"Direct benefit credited into caregiver''s bank account every month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'br-kanya-utthan',
  'bihar-mukhyamantri-kanya-utthan-yojana',
  'Bihar Mukhyamantri Kanya Utthan Yojana (Complete Girl Child Empowerment)',
  'Cumulative financial assistance up to ₹54,100 from birth up to college graduation (including ₹50,000 on graduating) for girl students in Bihar.',
  'Mukhyamantri Kanya Utthan Yojana provides graded cash incentives at every milestone of a girl''s life (birth, vaccination, intermediate pass ₹25,000, and college graduation ₹50,000) to eliminate female foeticide, stop child marriage, and achieve 100% higher education among girls.',
  'welfare',
  'state',
  'Bihar',
  'Education Department & Social Welfare Department, Government of Bihar',
  'Education Department & Social Welfare Department, Government of Bihar',
  'https://medhasoft.bih.nic.in',
  'free_verified',
  '₹54,100 cumulative support: ₹2,000 on birth, ₹1,000 on Aadhaar linking, ₹2,000 on full immunization, ₹25,000 on passing Class 12 (unmarried), and ₹50,000 upon passing Graduation degree.',
  'Girl student resident of Bihar passing intermediate (unmarried) or graduating (married or unmarried) from a recognized university in Bihar.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Bihar","isMandatory":true,"conditionName":"Bihar Domicile","sourceClause":"Kanya Utthan Rules 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Beneficiary","sourceClause":"Kanya Utthan Rules 2"}]',
  '[{"id":"doc-br-grad-marksheet","name":"Graduation Degree Marksheet & Certificate","description":"Passed from recognized Bihar university","requirementType":"mandatory","issuingAuthority":"University Registrar","sourceEvidence":"Medhasoft Doc 1"},{"id":"doc-br-residential","name":"Bihar Residential / Domicile Certificate","description":"Proof of Bihar permanent residence","requirementType":"mandatory","issuingAuthority":"Circle Officer (CO)","sourceEvidence":"Medhasoft Doc 2"}]',
  '[{"stepNumber":1,"title":"Register on Medhasoft Portal","description":"Enter University registration number and Aadhaar details.","channel":"online_portal","portalUrl":"https://medhasoft.bih.nic.in"},{"stepNumber":2,"title":"University Result Validation","description":"University verifies marksheet and enrollment data online.","channel":"college_cell"},{"stepNumber":3,"title":"₹50,000 Direct DBT Credit","description":"State treasury directly credits ₹50,000 into the girl student''s personal bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'br-student-credit-card',
  'bihar-student-credit-card-yojana-bsccy',
  'Bihar Student Credit Card Yojana (BSCCY)',
  'State-guaranteed education loan up to ₹4 Lakhs at a nominal 1% interest rate for girls/transgender and 4% for boys for 40+ professional courses.',
  'Part of Bihar''s ''Saat Nischay'' initiative, BSCCY provides education loans up to ₹4,00,000 with 100% Bihar Government guarantee for pursuing polytechnic, engineering, management, nursing, and general degrees without requiring any mortgage collateral.',
  'education_aid',
  'state',
  'Bihar',
  'Bihar State Education Finance Corporation (BSEFC)',
  'Bihar State Education Finance Corporation (BSEFC)',
  'https://www.7nishchay-yuvaupmission.bihar.gov.in',
  'free_verified',
  'Loan up to ₹4,00,000 at 1% simple interest for women, PwD, and transgender students (4% simple interest for men). Repayment begins 1 year after course completion or getting a job.',
  'Resident of Bihar aged up to 25 years who passed Class 12 and gained admission into recognized higher education courses in Bihar or anywhere in India.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Bihar","isMandatory":true,"conditionName":"Bihar Domicile","sourceClause":"BSCCY Rules Clause 2"},{"id":"rule-maxAgeYears-less_than_or_equal","parameter":"maxAgeYears","operator":"LESS_THAN_OR_EQUAL","expectedValue":25,"isMandatory":true,"conditionName":"Maximum Age 25 Years at Application","sourceClause":"BSCCY Rules Clause 3"}]',
  '[{"id":"doc-bsccy-allotment","name":"College Admission Proof & Fee Schedule","description":"Prospectus and detailed annual fee schedule","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"BSCCY Checklist 1"},{"id":"doc-bsccy-domicile","name":"Residential Certificate of Bihar","description":"Issued by Circle Officer","requirementType":"mandatory","issuingAuthority":"Revenue Dept Bihar","sourceEvidence":"BSCCY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on MNSSBY Portal","description":"Register on Mukhyamantri Nishchay Swayam Sahayata Bhatta portal.","channel":"online_portal","portalUrl":"https://www.7nishchay-yuvaupmission.bihar.gov.in"},{"stepNumber":2,"title":"Visit District Registration and Counseling Centre (DRCC)","description":"Submit self-attested copies of documents for physical counter verification.","channel":"district_office"},{"stepNumber":3,"title":"Sanction & Direct Fee Disbursal","description":"BSEFC sanctions card and disburses course fees directly to college semester by semester.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'br-mukhyamantri-udyami',
  'bihar-mukhyamantri-udyami-yojana',
  'Bihar Mukhyamantri Udyami Yojana (SC/ST/EBC/Women/Youth)',
  '₹10 Lakhs financial package (₹5 Lakhs free grant + ₹5 Lakhs loan at 0% to 1% interest) to start manufacturing or processing micro-enterprises.',
  'Administered by the Department of Industries in Bihar, this flagship industrial entrepreneurship scheme gives ₹10,00,000 to new entrepreneurs, with 50% (₹5 Lakhs) as 100% non-repayable grant and remaining ₹5 Lakhs as interest-free loan (0% for SC/ST/Women, 1% for General/OBC youth) repayable in 84 installments.',
  'livelihood',
  'state',
  'Bihar',
  'Department of Industries, Government of Bihar',
  'Department of Industries, Government of Bihar',
  'https://udyami.bihar.gov.in',
  'free_verified',
  '₹10,00,000 project capital: ₹5,00,000 direct non-repayable government grant + ₹5,00,000 soft loan at 0% (SC/ST/Women/EBC) or 1% (Youth) repayable over 7 years.',
  'Permanent resident of Bihar, minimum 10+2 / Intermediate / ITI / Polytechnic / Diploma passed, aged 18 to 50 years, intending to setup an enterprise in approved 102 project trades.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Bihar","isMandatory":true,"conditionName":"Bihar Resident","sourceClause":"Udyami Guidelines Clause 2.1"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Age 18 to 50 Years","sourceClause":"Udyami Guidelines Clause 2.2"},{"id":"rule-minEducation10Plus2-equals","parameter":"minEducation10Plus2","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Minimum Intermediate / ITI Pass","sourceClause":"Udyami Guidelines Clause 2.3"}]',
  '[{"id":"doc-udyami-current-account","name":"Firm / Sole Proprietorship Current Account","description":"Active current bank account in name of enterprise","requirementType":"mandatory","issuingAuthority":"Commercial Bank","sourceEvidence":"Udyami Checklist 1"},{"id":"doc-udyami-caste-domicile","name":"Caste and Residential Certificate","description":"Digital certificate issued by Circle Officer","requirementType":"mandatory","issuingAuthority":"CO / Revenue Officer","sourceEvidence":"Udyami Checklist 2"}]',
  '[{"stepNumber":1,"title":"Online Application on Udyami Portal","description":"Submit DPR and select from 102 approved manufacturing trades.","channel":"online_portal","portalUrl":"https://udyami.bihar.gov.in"},{"stepNumber":2,"title":"Computerized Lottery Selection","description":"Transparent randomized computerized lottery selects beneficiaries.","channel":"online_portal"},{"stepNumber":3,"title":"Mandatory Training & Tranche Disbursal","description":"Complete 2-week training at prestigious institute; receive ₹10 Lakhs in three tranches.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'od-subhadra-yojana',
  'odisha-subhadra-yojana-women-empowerment',
  'Odisha Subhadra Yojana (Flagship Women Empowerment Mission)',
  'Financial grant of ₹50,000 over 5 years (₹10,000/year in 2 equal installments on Rakhi Purnima & International Women''s Day) for 1 Crore women in Odisha.',
  'Subhadra Yojana is Odisha''s transformative women''s welfare guarantee providing ₹50,000 directly via DBT to over 1 Crore women aged 21-60 years to foster entrepreneurship, financial inclusion, and social dignity.',
  'welfare',
  'state',
  'Odisha',
  'Women and Child Development Department, Government of Odisha',
  'Women and Child Development Department, Government of Odisha',
  'https://subhadra.odisha.gov.in',
  'free_verified',
  '₹50,000 direct financial assistance disbursed in 10 installments of ₹5,000 each over 5 years (paid on Raksha Bandhan and International Women''s Day), plus ₹500 digital transaction incentive for top digital payees.',
  'Woman resident of Odisha aged 21 to 60 years whose family does not pay income tax and does not own more than 5 acres of irrigated or 10 acres of un-irrigated land.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Odisha","isMandatory":true,"conditionName":"Odisha Domicile","sourceClause":"Subhadra Guidelines Section 2"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Beneficiary","sourceClause":"Subhadra Guidelines Section 3"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":21,"isMandatory":true,"conditionName":"Age 21-60 Years","sourceClause":"Subhadra Guidelines Section 4"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":60,"isMandatory":true,"conditionName":"Maximum Age 60 Years","sourceClause":"Subhadra Guidelines Section 5"}]',
  '[{"id":"doc-od-aadhaar-dbt","name":"Aadhaar Card Linked Bank Account","description":"Active single savings account with DBT mandate","requirementType":"mandatory","issuingAuthority":"Commercial Bank","sourceEvidence":"Subhadra Doc 1"},{"id":"doc-od-ration","name":"National Food Security Card / Ration Card","description":"Household verification","requirementType":"mandatory","issuingAuthority":"Civil Supplies Odisha","sourceEvidence":"Subhadra Doc 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on Subhadra Portal or Mo Seva Kendra","description":"Fill offline or digital application with Aadhaar authentication.","channel":"meeseva_csc","portalUrl":"https://subhadra.odisha.gov.in"},{"stepNumber":2,"title":"Field Verification & Approval","description":"Block Development Officer (BDO) validates land and income eligibility.","channel":"district_office"},{"stepNumber":3,"title":"Direct Bank Transfer of Installments","description":"₹5,000 credited automatically on Rakhi Purnima and Women''s Day.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'od-kalia-farmers',
  'odisha-kalia-scheme-krushak-assistance',
  'Odisha KALIA Scheme (Krushak Assistance for Livelihood and Income Augmentation)',
  'Financial assistance of ₹10,000 per year for small/marginal farmers and ₹12,500 one-time livelihood grant for landless agricultural households.',
  'KALIA provides comprehensive financial support for cultivation inputs to small and marginal farmers, financial assistance to landless agricultural labourers, and interest-free crop loans up to ₹1,00,000 across Odisha.',
  'agriculture',
  'state',
  'Odisha',
  'Department of Agriculture and Farmers'' Empowerment, Government of Odisha',
  'Department of Agriculture and Farmers'' Empowerment, Government of Odisha',
  'https://kalia.odisha.gov.in',
  'free_verified',
  '₹10,000 per family per year for small and marginal farmers (₹5,000 each for Kharif and Rabi); ₹12,500 livelihood package for landless households.',
  'Small & marginal farmers, landless agricultural labourers, and vulnerable agricultural households domiciled in Odisha.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Odisha","isMandatory":true,"conditionName":"Odisha Domicile","sourceClause":"KALIA Guidelines Clause 2"}]',
  '[{"id":"doc-kalia-land","name":"Record of Rights (RoR / Patta)","description":"Proof of agricultural land for small farmers","requirementType":"mandatory","issuingAuthority":"Revenue Dept Odisha","sourceEvidence":"KALIA Checklist 1"}]',
  '[{"stepNumber":1,"title":"Enrolment through KALIA Portal or PACS","description":"Submit self-declaration and bank details.","channel":"online_portal","portalUrl":"https://kalia.odisha.gov.in"},{"stepNumber":2,"title":"Gram Panchayat Vetting","description":"Panchayat nodal committee displays draft list in village.","channel":"district_office"},{"stepNumber":3,"title":"Seasonal Direct Benefit Transfer","description":"Funds deposited in bank account before sowing seasons.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'wb-student-credit-card',
  'west-bengal-student-credit-card-scheme-wbscc',
  'West Bengal Student Credit Card Scheme (WBSCC)',
  'Collateral-free soft education loan up to ₹10 Lakhs at 4% simple interest with 100% West Bengal State Government guarantee.',
  'WBSCC enables students from West Bengal to pursue secondary, higher secondary, diploma, undergraduate, postgraduate, and professional doctoral degrees in India or abroad, with loan repayment spread over 15 years.',
  'education_aid',
  'state',
  'West Bengal',
  'Higher Education Department, Government of West Bengal',
  'Higher Education Department, Government of West Bengal',
  'https://wbscc.wb.gov.in',
  'free_verified',
  'Loan up to ₹10,00,000 with 4% simple interest (interest subvention provided by state if interest paid regularly during study period); 15-year repayment tenure.',
  'Indian citizen resident of West Bengal for at least 10 years, aged up to 40 years, enrolled in recognized educational institution in India or abroad.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"West Bengal","isMandatory":true,"conditionName":"West Bengal Resident for 10+ Years","sourceClause":"WBSCC Clause 2.1"},{"id":"rule-maxAgeYears-less_than_or_equal","parameter":"maxAgeYears","operator":"LESS_THAN_OR_EQUAL","expectedValue":40,"isMandatory":true,"conditionName":"Maximum Age 40 Years","sourceClause":"WBSCC Clause 2.2"}]',
  '[{"id":"doc-wbscc-admission","name":"College Admission Proof & Fee Schedule","description":"Showing course fee breakdown","requirementType":"mandatory","issuingAuthority":"College / University","sourceEvidence":"WBSCC Form 1"},{"id":"doc-wbscc-residence","name":"10 Years Residence Proof (Ration Card / Voter ID)","description":"Confirming 10 years continuous domicile","requirementType":"mandatory","issuingAuthority":"Competent Authority","sourceEvidence":"WBSCC Form 2"}]',
  '[{"stepNumber":1,"title":"Online Application on WBSCC Portal","description":"Register student and co-borrower profile and upload admission documents.","channel":"online_portal","portalUrl":"https://wbscc.wb.gov.in"},{"stepNumber":2,"title":"Forwarding by Higher Education Department","description":"College and State Higher Education Department forward approved file to partner bank.","channel":"college_cell"},{"stepNumber":3,"title":"Credit Card Issuance & Fee Sanction","description":"Bank issues WBSCC physical/digital card and disburses fee directly to college.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'wb-krishak-bandhu',
  'west-bengal-krishak-bandhu-scheme',
  'West Bengal Krishak Bandhu (Assured Farm Income & Life Insurance)',
  'Assured financial assistance of ₹10,000/year per acre (min ₹4,000/yr) for all farmers and sharecroppers + ₹2 Lakh life insurance benefit.',
  'Krishak Bandhu provides assured financial assistance in two seasonal installments (Kharif and Rabi) to all farmers and recorded bargadars (sharecroppers), along with death compensation of ₹2,00,000 to the nominee upon farmer''s death.',
  'agriculture',
  'state',
  'West Bengal',
  'Department of Agriculture, Government of West Bengal',
  'Department of Agriculture, Government of West Bengal',
  'https://krishakbandhu.wb.gov.in',
  'free_verified',
  'Financial assistance of ₹10,000 per acre per year (minimum ₹4,000 per year for fractional holdings) paid in two installments, plus ₹2,00,000 life insurance coverage (age 18-60).',
  'All farmers, land owners, and recorded bargadars (sharecroppers) holding agricultural land in West Bengal.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"West Bengal","isMandatory":true,"conditionName":"West Bengal Domicile","sourceClause":"Krishak Bandhu Criteria 1"}]',
  '[{"id":"doc-kb-ror","name":"Land Record / RoR (Khatian)","description":"Proof of cultivable land or bargadar record","requirementType":"mandatory","issuingAuthority":"Block Land & Land Reforms Office (BL&LRO)","sourceEvidence":"Krishak Bandhu Doc 1"}]',
  '[{"stepNumber":1,"title":"Submit Application at Duare Sarkar Camp","description":"Submit Krishak Bandhu form with land record at grassroots Duare Sarkar camp.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Verification by Assistant Director of Agriculture (ADA)","description":"Agricultural officers verify land khatian on digital revenue portal.","channel":"district_office"},{"stepNumber":3,"title":"Direct Bank Transfer","description":"Funds deposited directly into farmer''s bank account before sowing season.","channel":"online_portal","portalUrl":"https://krishakbandhu.wb.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'gj-vhali-dikri-yojana',
  'gujarat-vhali-dikri-yojana-girl-child',
  'Gujarat Vhali Dikri Yojana (Dear Daughter Empowerment Scheme)',
  'Financial assistance of ₹1,10,000 in three stages (Class 1 admission ₹4,000, Class 9 admission ₹6,000, and ₹1,00,000 at age 18) for girls in Gujarat.',
  'Vhali Dikri Yojana promotes girl child education, prevents child marriage, and enhances female sex ratio in Gujarat by providing financial grants at key educational milestones and a ₹1,00,000 lump sum grant on turning 18.',
  'welfare',
  'state',
  'Gujarat',
  'Women and Child Development Department, Government of Gujarat',
  'Women and Child Development Department, Government of Gujarat',
  'https://wcd.gujarat.gov.in',
  'free_verified',
  'Total ₹1,10,000 assistance: ₹4,000 on admission in Class 1, ₹6,000 on admission in Class 9, and ₹1,00,000 upon reaching 18 years for higher education or marriage.',
  'First two daughters of a family residing in Gujarat, family annual income <= ₹2 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Gujarat","isMandatory":true,"conditionName":"Gujarat Domicile","sourceClause":"Vhali Dikri Rules 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Girl Child","sourceClause":"Vhali Dikri Rules 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":200000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2 Lakhs","sourceClause":"Vhali Dikri Rules 3"}]',
  '[{"id":"doc-gj-birth","name":"Birth Certificate of Girl Child","description":"Issued by Municipal Corporation / Gram Panchayat","requirementType":"mandatory","issuingAuthority":"Registrar of Births","sourceEvidence":"Vhali Dikri Form 1"},{"id":"doc-gj-income","name":"Mamlatdar Income Certificate","description":"Income verification certificate","requirementType":"mandatory","issuingAuthority":"Mamlatdar Office","sourceEvidence":"Vhali Dikri Form 2"}]',
  '[{"stepNumber":1,"title":"Apply within 1 Year of Birth","description":"Submit application at Anganwadi Centre or Taluka Mamlatdar office.","channel":"district_office"},{"stepNumber":2,"title":"CDPO Verification","description":"Child Development Project Officer verifies birth and parity of daughter.","channel":"district_office"},{"stepNumber":3,"title":"Direct Cash Credit & Bond Issuance","description":"State releases stage installments via DBT and issues maturity bond.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'gj-mysy-scholarship',
  'gujarat-mukhyamantri-yuva-swavalamban-yojana-mysy',
  'Gujarat Mukhyamantri Yuva Swavalamban Yojana (MYSY)',
  '50% tuition fee assistance (up to ₹2 Lakhs/year in medical, ₹50,000 in engineering) + ₹12,000 hostel allowance for meritorious students in Gujarat.',
  'MYSY supports students of all categories scoring >= 80 percentile in Class 10/12 to pursue higher professional studies in Gujarat, covering 50% tuition fees, hostel allowance, and book grants.',
  'scholarship',
  'state',
  'Gujarat',
  'Education Department, Government of Gujarat',
  'Education Department, Government of Gujarat',
  'https://mysy.guj.nic.in',
  'free_verified',
  '50% tuition fee waiver up to ₹2,00,000/year (Medical/Dental) or ₹50,000/year (Engineering/Pharmacy/Degree), plus ₹12,000 annual hostel allowance and ₹10,000 book grant.',
  'Gujarat student scoring >= 80 percentile in Class 10/12 board exam, pursuing regular college degree, family income <= ₹6 Lakhs per year.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Gujarat","isMandatory":true,"conditionName":"Gujarat Domicile","sourceClause":"MYSY Criteria 1"},{"id":"rule-percentileMarks-greater_than_or_equal","parameter":"percentileMarks","operator":"GREATER_THAN_OR_EQUAL","expectedValue":80,"isMandatory":true,"conditionName":"Class 10/12 Percentile >= 80","sourceClause":"MYSY Criteria 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":600000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹6 Lakhs","sourceClause":"MYSY Criteria 3"}]',
  '[{"id":"doc-mysy-marksheet","name":"Class 10 / 12 Board Marksheet with Percentile","description":"Showing >= 80 percentile","requirementType":"mandatory","issuingAuthority":"GSEB / CBSE","sourceEvidence":"MYSY Checklist 1"},{"id":"doc-mysy-income","name":"Mamlatdar / TDO Income Certificate","description":"Income proof showing <= ₹6 Lakhs/year","requirementType":"mandatory","issuingAuthority":"Mamlatdar","sourceEvidence":"MYSY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on MYSY Portal","description":"Register with board seat number and admission details.","channel":"online_portal","portalUrl":"https://mysy.guj.nic.in"},{"stepNumber":2,"title":"Help Centre Document Verification","description":"Present original documents at empaneled government college help centre.","channel":"college_cell"},{"stepNumber":3,"title":"Direct Treasury Disbursal","description":"Tuition subsidy deposited directly into student''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'as-orunodoi-3',
  'assam-orunodoi-3-flagship-dbt-women',
  'Assam Orunodoi 3.0 Scheme (Flagship Poverty Alleviation & Nutrition)',
  'Direct unconditional monthly cash transfer of ₹1,250 per month directly to the female head of over 27 Lakh poor households in Assam.',
  'Orunodoi is the largest direct benefit transfer scheme in Assam''s history, transferring ₹1,250 on the 10th of every month to nominated female family members to buy essential medicines, pulses, fruits, and sugar.',
  'welfare',
  'state',
  'Assam',
  'Finance Department, Government of Assam',
  'Finance Department, Government of Assam',
  'https://finance.assam.gov.in',
  'free_verified',
  '₹1,250 per month credited directly to the nominated female head of the family''s bank account via DBT on the 10th of each month.',
  'Permanent resident of Assam whose composite family income is less than ₹2 Lakhs per annum, prioritizing widows, divorced women, un-married women aged 45+, and families with disabled members.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Assam","isMandatory":true,"conditionName":"Assam Domicile","sourceClause":"Orunodoi Guidelines Clause 2"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Nominated Female Beneficiary","sourceClause":"Orunodoi Guidelines Clause 3"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":200000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹2 Lakhs","sourceClause":"Orunodoi Guidelines Clause 4"}]',
  '[{"id":"doc-as-ration","name":"National Food Security Card / Ration Card","description":"Ration card proof","requirementType":"mandatory","issuingAuthority":"Food & Civil Supplies Assam","sourceEvidence":"Orunodoi Doc 1"},{"id":"doc-as-bank","name":"Aadhaar Linked Bank Passbook","description":"Single account in female head''s name","requirementType":"mandatory","issuingAuthority":"Commercial Bank","sourceEvidence":"Orunodoi Doc 2"}]',
  '[{"stepNumber":1,"title":"Verification by Gaonburah & VCDC","description":"Gaonburah and Village Council Development Committee identify eligible women.","channel":"district_office"},{"stepNumber":2,"title":"District Level Committee (DLC) Finalization","description":"District Commissioner approves finalized beneficiary roll.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Transfer on 10th","description":"State finance department releases ₹1,250 DBT on the 10th of every month.","channel":"online_portal","portalUrl":"https://finance.assam.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'as-pragyan-bharati-scooty',
  'assam-pragyan-bharati-dr-banikanta-kakati-merit-scooty',
  'Assam Pragyan Bharati - Dr. Banikanta Kakati Merit Award (Free Scooty)',
  '100% free petrol / electric two-wheeler scooty to meritorious girl students scoring >= 60% and boy students scoring >= 75% in Class 12 exams.',
  'Under the Pragyan Bharati initiative, the Government of Assam distributes free two-wheeler scooties to meritorious students who excel in Higher Secondary examinations conducted by AHSEC to facilitate mobility to college universities.',
  'education_aid',
  'state',
  'Assam',
  'Higher Education Department, Government of Assam',
  'Higher Education Department, Government of Assam',
  'https://directorateofhighereducation.assam.gov.in',
  'free_verified',
  'Free brand-new two-wheeler Scooty (choice of petrol or electric scooter) with registration, helmet, and 5-year insurance paid by the Assam Government.',
  'Students passing Class 12 Higher Secondary from AHSEC with >= 60% (girls) or >= 75% (boys) enrolled in regular degree courses in Assam.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Assam","isMandatory":true,"conditionName":"Assam Domicile","sourceClause":"Pragyan Bharati Criteria 1"}]',
  '[{"id":"doc-scooty-marksheet","name":"AHSEC Class 12 Marksheet","description":"Official marksheet showing first division","requirementType":"mandatory","issuingAuthority":"AHSEC","sourceEvidence":"Scooty Checklist 1"},{"id":"doc-scooty-college","name":"Degree College Admission Receipt","description":"Proof of continuing higher education","requirementType":"mandatory","issuingAuthority":"College Principal","sourceEvidence":"Scooty Checklist 2"}]',
  '[{"stepNumber":1,"title":"Selection on SEBA / DHE Portal","description":"Eligible students select petrol or electric scooter model on portal.","channel":"online_portal"},{"stepNumber":2,"title":"District Distribution Ceremony","description":"Collect allocation token and vehicle chassis allotment.","channel":"district_office"},{"stepNumber":3,"title":"Vehicle Handover from Authorized Dealer","description":"Take delivery of registered two-wheeler with helmet and insurance documents.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'pb-free-power-300-units',
  'punjab-free-electricity-300-units-scheme',
  'Punjab Free Power Scheme (300 Units Zero-Bill Electricity)',
  '100% free domestic electricity up to 300 units per month (600 units bimonthly) resulting in zero electricity bills for over 90% of Punjab households.',
  'The Government of Punjab provides 300 units of completely free domestic electricity every month to domestic electricity consumers across all districts, generating zero bills for millions of households while encouraging solar net-metering.',
  'welfare',
  'state',
  'Punjab',
  'Department of Power, Government of Punjab',
  'Department of Power, Government of Punjab',
  'https://pspcl.in',
  'free_verified',
  '100% waiver of electricity bill if bimonthly consumption <= 600 units (300 units/month), including complete waiver of energy charges, meter rent, and electricity duty.',
  'All domestic category (DS) electricity consumers in Punjab possessing a residential electricity meter connected with PSPCL.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Punjab","isMandatory":true,"conditionName":"Punjab Domestic Electricity Connection","sourceClause":"PSPCL Tariff Order Clause 4"}]',
  '[{"id":"doc-pb-elec-bill","name":"PSPCL Consumer Electricity Account Number","description":"Proof of active domestic connection","requirementType":"mandatory","issuingAuthority":"PSPCL","sourceEvidence":"PSPCL Checklist 1"}]',
  '[{"stepNumber":1,"title":"Automatic Application on Meter Reading","description":"No form required; meter reader records bimonthly consumption.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Zero Bill Generation","description":"If consumption <= 600 units in bimonthly cycle, bill is automatically generated at ₹0.","channel":"online_portal","portalUrl":"https://pspcl.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'hr-chirayu-ayushman',
  'haryana-chirayu-ayushman-bharat-extension',
  'Haryana CHIRAYU (Comprehensive Health Insurance Extension)',
  'Cashless hospital treatment up to ₹5 Lakhs per year for all families earning up to ₹3 Lakhs/year integrated with Parivar Pehchan Patra (PPP).',
  'CHIRAYU Haryana expands the Ayushman Bharat PM-JAY entitlement to cover all families in Haryana with verified annual income up to ₹3,00,000 in Parivar Pehchan Patra (PPP), offering cashless secondary and tertiary hospital treatment.',
  'healthcare',
  'state',
  'Haryana',
  'Haryana State Health Authority',
  'Haryana State Health Authority',
  'https://chirayuayushman.haryana.gov.in',
  'free_verified',
  'Cashless hospital treatment up to ₹5,00,000 per family per year in empanelled private and civil hospitals across Haryana.',
  'Haryana resident family with verified annual family income up to ₹3,00,000 in Parivar Pehchan Patra (PPP).',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Haryana","isMandatory":true,"conditionName":"Haryana Resident with PPP","sourceClause":"CHIRAYU Rules 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":300000,"isMandatory":true,"conditionName":"PPP Verified Family Income <= ₹3 Lakhs","sourceClause":"CHIRAYU Rules 2"}]',
  '[{"id":"doc-hr-ppp","name":"Parivar Pehchan Patra (PPP / Family ID)","description":"Mandatory family ID card with verified income","requirementType":"mandatory","issuingAuthority":"Citizen Resources Information Dept","sourceEvidence":"CHIRAYU Checklist 1"}]',
  '[{"stepNumber":1,"title":"Check Eligibility on Chirayu Portal","description":"Enter PPP Family ID to verify income verification status.","channel":"online_portal","portalUrl":"https://chirayuayushman.haryana.gov.in"},{"stepNumber":2,"title":"Generate Golden Card","description":"Generate Ayushman-Chirayu digital golden card online or at CSC kiosk.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Avail Cashless Hospitalization","description":"Show Chirayu card at any empanelled hospital for cashless treatment.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'dl-jai-bhim-coaching',
  'delhi-jai-bhim-mukhyamantri-pratibha-vikas-yojana',
  'Delhi Jai Bhim Mukhyamantri Pratibha Vikas Yojana',
  '100% free coaching at top private institutes for UPSC, IIT-JEE, NEET, CLAT, and Banking exams with ₹2,500/month stipend for Delhi students.',
  'Administered by the Department of SC/ST Welfare in Delhi, this scheme finances 100% coaching fees at premier institutes in Delhi for students belonging to SC, ST, OBC, and EWS categories, plus provides ₹2,500 monthly travel/study stipend.',
  'education_aid',
  'state',
  'Delhi',
  'Department for Welfare of SC/ST/OBC, Government of NCT of Delhi',
  'Department for Welfare of SC/ST/OBC, Government of NCT of Delhi',
  'https://scstwelfare.delhi.gov.in',
  'free_verified',
  '100% tuition fees paid directly to empaneled coaching institute (up to ₹1.5 Lakhs) + ₹2,500 monthly stipend paid to student account for travel and books.',
  'Resident of Delhi who passed Class 10 and 12 in Delhi, belonging to SC, ST, OBC, or EWS, with family annual income <= ₹8 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Delhi","isMandatory":true,"conditionName":"Delhi Resident","sourceClause":"Jai Bhim Criteria 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":800000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹8 Lakhs","sourceClause":"Jai Bhim Criteria 2"}]',
  '[{"id":"doc-delhi-caste","name":"Caste / EWS Certificate issued by GNCTD","description":"Issued by Delhi Revenue Dept","requirementType":"mandatory","issuingAuthority":"SDM / Tehsildar Delhi","sourceEvidence":"Jai Bhim Checklist 1"},{"id":"doc-delhi-schooling","name":"Class 10 & 12 Passing Marksheets from Delhi School","description":"Proof of continuous schooling in Delhi","requirementType":"mandatory","issuingAuthority":"CBSE / ICSE","sourceEvidence":"Jai Bhim Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on Delhi e-District Portal","description":"Register using Delhi e-District portal or with empaneled coaching institute.","channel":"online_portal","portalUrl":"https://edistrict.delhigovt.nic.in"},{"stepNumber":2,"title":"Institute Verification","description":"Empaneled coaching centre confirms merit ranking and batch schedule.","channel":"college_cell"},{"stepNumber":3,"title":"Fee Sanction & Monthly Stipend","description":"Delhi Government pays full course fees directly to coaching institute and credits ₹2,500 monthly stipend.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'jk-mumkin-youth-vehicles',
  'jammu-kashmir-mission-youth-mumkin-scheme',
  'Jammu & Kashmir Mission Youth - MUMKIN Scheme (Commercial Vehicles)',
  '100% on-road commercial vehicle financing with 10% upfront subsidy from vehicle manufacturer and 10% cash subsidy from J&K Government.',
  'Under Mission Youth J&K, MUMKIN enables unemployed youth aged 18-35 to become self-reliant transport entrepreneurs by providing financial assistance to acquire commercial small commercial vehicles (mini-trucks, pick-up vans) without initial capital investment.',
  'livelihood',
  'state',
  'Jammu and Kashmir',
  'Mission Youth, Government of Jammu and Kashmir',
  'Mission Youth, Government of Jammu and Kashmir',
  'https://missionyouth.jk.gov.in',
  'free_verified',
  '20% upfront subsidy (10% from vehicle manufacturer like Tata/Mahindra + 10% or ₹80,000 from Mission Youth J&K); remaining 80% financed via subsidized bank loan.',
  'Domicile of Jammu & Kashmir aged between 18 and 35 years registered with district employment exchange, holding commercial driving licence.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Jammu and Kashmir","isMandatory":true,"conditionName":"J&K Domicile","sourceClause":"MUMKIN Clause 2.1"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Age 18 to 35 Years","sourceClause":"MUMKIN Clause 2.2"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":35,"isMandatory":true,"conditionName":"Maximum Age 35 Years","sourceClause":"MUMKIN Clause 2.3"}]',
  '[{"id":"doc-jk-domicile","name":"J&K Domicile Certificate","description":"Proof of permanent residence","requirementType":"mandatory","issuingAuthority":"Tehsildar","sourceEvidence":"MUMKIN Doc 1"},{"id":"doc-jk-dl","name":"Commercial Driving Licence","description":"Valid LMV/commercial transport licence","requirementType":"mandatory","issuingAuthority":"RTO J&K","sourceEvidence":"MUMKIN Doc 2"}]',
  '[{"stepNumber":1,"title":"Apply on Mission Youth JK Portal","description":"Submit online application selecting vehicle brand (Tata, Mahindra, Ashok Leyland).","channel":"online_portal","portalUrl":"https://missionyouth.jk.gov.in"},{"stepNumber":2,"title":"District Level Task Force Screening","description":"Deputy Commissioner led committee interviews candidates and approves allocation.","channel":"district_office"},{"stepNumber":3,"title":"Vehicle Delivery at Dealership","description":"Collect brand new commercial vehicle with zero down payment.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'hp-himcare-health',
  'himachal-pradesh-himcare-health-scheme',
  'Himachal Pradesh HIMCARE Health Scheme',
  'Cashless hospital treatment up to ₹5 Lakhs per family per year for all families in Himachal Pradesh not covered under Ayushman Bharat.',
  'HIMCARE ensures universal health protection in Himachal Pradesh by extending ₹5 Lakhs annual cashless healthcare coverage in government and empanelled private hospitals to all families outside Ayushman Bharat PM-JAY.',
  'healthcare',
  'state',
  'Himachal Pradesh',
  'Department of Health and Family Welfare, Government of Himachal Pradesh',
  'Department of Health and Family Welfare, Government of Himachal Pradesh',
  'https://hpsbys.in',
  'free_verified',
  'Cashless hospital treatment up to ₹5,00,000 per family per year covering secondary and tertiary medical treatments, diagnostic tests, and surgeries.',
  'Permanent residents of Himachal Pradesh who are not government employees/retirees and not covered under AB-PMJAY.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Himachal Pradesh","isMandatory":true,"conditionName":"HP Domicile","sourceClause":"HIMCARE Rules 1"}]',
  '[{"id":"doc-hp-ration","name":"Digital Ration Card / Parivar Register Copy","description":"Household family record","requirementType":"mandatory","issuingAuthority":"Food & Civil Supplies HP","sourceEvidence":"HIMCARE Doc 1"}]',
  '[{"stepNumber":1,"title":"Enrolment on HIMCARE Portal or LokMitra Kendra","description":"Submit digital ration card and pay nominal annual fee (free for BPL/street vendors).","channel":"meeseva_csc","portalUrl":"https://hpsbys.in"},{"stepNumber":2,"title":"Receive HIMCARE Digital Card","description":"Download electronic health card with unique HIMCARE ID.","channel":"online_portal"},{"stepNumber":3,"title":"Cashless Medical Treatment","description":"Present card at any hospital across HP and PGI Chandigarh for 100% cashless care.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'hp-mukhyamantri-kanyadan',
  'himachal-pradesh-mukhyamantri-kanyadan-yojana',
  'Himachal Pradesh Mukhyamantri Kanyadan Yojana',
  'Financial marriage grant of ₹51,000 for destitute girls, widows'' daughters, and girls with disabilities in Himachal Pradesh.',
  'Provides direct financial assistance of ₹51,000 for the marriage of adult daughters of helpless widows, destitute parents, or orphan girls residing in Himachal Pradesh.',
  'welfare',
  'state',
  'Himachal Pradesh',
  'Women and Child Development Department, Government of Himachal Pradesh',
  'Women and Child Development Department, Government of Himachal Pradesh',
  'https://wcd.hp.gov.in',
  'free_verified',
  'One-time financial grant of ₹51,000 transferred via DBT directly into the bride''s bank account.',
  'Girl aged 18+ resident of HP whose parents are destitute, or mother is a widow, with family income <= ₹50,000/year.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Himachal Pradesh","isMandatory":true,"conditionName":"HP Domicile","sourceClause":"Kanyadan Rules 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":50000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹50,000","sourceClause":"Kanyadan Rules 2"}]',
  '[{"id":"doc-hp-kanyadan-income","name":"Income Certificate from Tehsildar","description":"Income proof showing <= ₹50,000/year","requirementType":"mandatory","issuingAuthority":"Tehsildar","sourceEvidence":"Kanyadan Doc 1"}]',
  '[{"stepNumber":1,"title":"Apply at Child Development Project Office (CDPO)","description":"Submit application before or within 6 months of marriage.","channel":"district_office"},{"stepNumber":2,"title":"Tehsil Verification","description":"Social education coordinator verifies economic status.","channel":"district_office"},{"stepNumber":3,"title":"Direct Cash Transfer","description":"₹51,000 credited to bride''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'uk-gaura-devi-kanya-dhan',
  'uttarakhand-nanda-gaura-devi-kanya-dhan-yojana',
  'Uttarakhand Nanda Gaura Yojana (Girl Child Protection & Higher Education)',
  'Financial grant of ₹11,000 on birth of girl child and ₹51,000 upon passing Class 12 for pursuing higher education in Uttarakhand.',
  'Nanda Gaura Yojana protects girl children, prevents female foeticide, and encourages girls to complete 12th grade and enter university in Uttarakhand by providing ₹11,000 at birth and ₹51,000 after 12th class.',
  'welfare',
  'state',
  'Uttarakhand',
  'Women Empowerment and Child Development Department, Govt of Uttarakhand',
  'Women Empowerment and Child Development Department, Govt of Uttarakhand',
  'https://nandagaura.uk.gov.in',
  'free_verified',
  '₹11,000 upon birth of daughter and ₹51,000 upon passing Class 12 board examination credited directly to the girl''s bank account.',
  'Permanent resident of Uttarakhand belonging to BPL or annual family income <= ₹72,000, girl child unmarried and enrolled in higher education.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Uttarakhand","isMandatory":true,"conditionName":"Uttarakhand Domicile","sourceClause":"Nanda Gaura Rules 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Child","sourceClause":"Nanda Gaura Rules 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":72000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹72,000","sourceClause":"Nanda Gaura Rules 3"}]',
  '[{"id":"doc-uk-marksheet","name":"Class 12 Marksheet & Passing Certificate","description":"From UK Board / CBSE","requirementType":"mandatory","issuingAuthority":"School Principal","sourceEvidence":"Nanda Gaura Doc 1"},{"id":"doc-uk-income","name":"Tehsildar Income Certificate","description":"Family income <= ₹72,000","requirementType":"mandatory","issuingAuthority":"Tehsildar","sourceEvidence":"Nanda Gaura Doc 2"}]',
  '[{"stepNumber":1,"title":"Online Application on Nanda Gaura Portal","description":"Apply on portal with 12th marksheet and college admission receipt.","channel":"online_portal","portalUrl":"https://nandagaura.uk.gov.in"},{"stepNumber":2,"title":"District Probation Officer Scrutiny","description":"DPO inspects documents and verifies institutional admission.","channel":"district_office"},{"stepNumber":3,"title":"Direct Treasury Transfer","description":"₹51,000 credited to girl student''s account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'uk-atal-ayushman',
  'uttarakhand-atal-ayushman-universal-health',
  'Uttarakhand Atal Ayushman Yojana (Universal Cashless Healthcare)',
  '100% universal cashless healthcare coverage up to ₹5 Lakhs per family per year for all 27 Lakh households in Uttarakhand.',
  'Uttarakhand is one of the few states providing 100% universal cashless health coverage of ₹5,00,000 per family per year across all citizens regardless of income, covering secondary and tertiary treatments at top hospitals in Dehradun, Rishikesh AIIMS, and nationwide.',
  'healthcare',
  'state',
  'Uttarakhand',
  'Uttarakhand State Health Authority',
  'Uttarakhand State Health Authority',
  'https://ayushmanuttarakhand.org',
  'free_verified',
  'Cashless treatment up to ₹5,00,000 per family per year across 1,700+ medical and surgical procedures in over 300 empanelled hospitals.',
  'All permanent residents of Uttarakhand holding an active digital ration card or voter ID in Uttarakhand.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Uttarakhand","isMandatory":true,"conditionName":"Uttarakhand Domicile","sourceClause":"Atal Ayushman Rules 1"}]',
  '[{"id":"doc-uk-ration","name":"Uttarakhand Ration Card","description":"National Food Security / State Ration Card","requirementType":"mandatory","issuingAuthority":"Civil Supplies UK","sourceEvidence":"Ayushman UK Doc 1"}]',
  '[{"stepNumber":1,"title":"Create Golden Card at CSC or Hospital","description":"Visit nearest Common Service Centre or Ayushman kiosk at District Hospital.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Biometric e-KYC Verification","description":"Authenticate with Aadhaar and family ration card.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Avail Free Hospital Treatment","description":"Show card for 100% cashless admission, surgery, and post-discharge medication.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'cg-mahtari-vandan',
  'chhattisgarh-mahtari-vandan-yojana-women-dbt',
  'Chhattisgarh Mahtari Vandan Yojana (Monthly Women Financial Guarantee)',
  'Direct unconditional monthly financial assistance of ₹1,000 per month (₹12,000 per year) directly to married women across Chhattisgarh.',
  'Mahtari Vandan Yojana provides monthly financial independence and social security to over 70 Lakh married women in Chhattisgarh by transferring ₹1,000 on the first week of every month into their DBT bank accounts.',
  'welfare',
  'state',
  'Chhattisgarh',
  'Women and Child Development Department, Government of Chhattisgarh',
  'Women and Child Development Department, Government of Chhattisgarh',
  'https://mahtarivandan.cgstate.gov.in',
  'free_verified',
  '₹1,000 per month (₹12,000 per annum) directly credited into the woman''s personal Aadhaar-linked bank account.',
  'Married woman resident of Chhattisgarh aged 21 years and above as of 1st January of application year, whose family does not pay income tax.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Chhattisgarh","isMandatory":true,"conditionName":"Chhattisgarh Domicile","sourceClause":"Mahtari Vandan Rules 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Resident","sourceClause":"Mahtari Vandan Rules 2"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":21,"isMandatory":true,"conditionName":"Minimum Age 21 Years","sourceClause":"Mahtari Vandan Rules 3"}]',
  '[{"id":"doc-cg-marriage","name":"Marriage Certificate / Ration Card Showing Spouse","description":"Proof of marriage","requirementType":"mandatory","issuingAuthority":"Gram Panchayat / Municipal Authority","sourceEvidence":"Mahtari Doc 1"},{"id":"doc-cg-aadhaar","name":"Aadhaar Card with Bank Seeding","description":"Proof of identity","requirementType":"mandatory","issuingAuthority":"UIDAI","sourceEvidence":"Mahtari Doc 2"}]',
  '[{"stepNumber":1,"title":"Submit Application at Anganwadi or Portal","description":"Apply online on Mahtari Vandan portal or submit physical form to Anganwadi worker.","channel":"online_portal","portalUrl":"https://mahtarivandan.cgstate.gov.in"},{"stepNumber":2,"title":"Verification & Claims Redressal","description":"Provisional list published in Gram Panchayat; objections resolved within 7 days.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Transfer","description":"Direct benefit of ₹1,000 credited on the 1st week of every month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'cg-krishak-unnati',
  'chhattisgarh-krishak-unnati-yojana-paddy-procurement',
  'Chhattisgarh Krishak Unnati Yojana (₹3,100/Quintal Paddy Support)',
  'Guaranteed paddy procurement at ₹3,100 per quintal (up to 21 quintals per acre) with difference amount paid directly via DBT to farmers.',
  'Chhattisgarh''s flagship farm transformation scheme purchases paddy from farmers at a historic high price of ₹3,100 per quintal up to 21 quintals per acre, paying the differential amount over MSP directly to farmers via DBT.',
  'agriculture',
  'state',
  'Chhattisgarh',
  'Department of Agriculture and Farmers Welfare, Government of Chhattisgarh',
  'Department of Agriculture and Farmers Welfare, Government of Chhattisgarh',
  'https://agriportal.cg.nic.in',
  'free_verified',
  'Input assistance paying the difference between Central MSP and ₹3,100 per quintal, resulting in net transfers of up to ₹19,000+ per acre into farmer accounts.',
  'All registered farmers in Chhattisgarh cultivating paddy on owned or leased land registered on the Integrated Farmer Portal (Kisan Panjiyan).',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Chhattisgarh","isMandatory":true,"conditionName":"Chhattisgarh Farmer","sourceClause":"Krishak Unnati Criteria 1"},{"id":"rule-kisanPortalRegistered-equals","parameter":"kisanPortalRegistered","operator":"EQUALS","expectedValue":true,"isMandatory":true,"conditionName":"Registered on CG Kisan Portal","sourceClause":"Krishak Unnati Criteria 2"}]',
  '[{"id":"doc-cg-bhu-naksha","name":"Khasra / B-1 Kistabandi Revenue Records","description":"Proof of land acreage under paddy","requirementType":"mandatory","issuingAuthority":"Revenue Dept CG (Bhuiyan)","sourceEvidence":"Krishak Unnati Doc 1"}]',
  '[{"stepNumber":1,"title":"Kisan Panjiyan on Portal","description":"Register agricultural land and bank account on the CG Kisan Portal before October.","channel":"meeseva_csc","portalUrl":"https://kisan.cg.nic.in"},{"stepNumber":2,"title":"Sell Paddy at Primary Cooperative Society (PACS)","description":"Sell paddy crop at local procurement centre (Mandi/Samiti).","channel":"district_office"},{"stepNumber":3,"title":"Lump Sum DBT Difference Payment","description":"Receive base MSP at procurement and difference up to ₹3,100/quintal via direct DBT.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'jh-marang-gomke-scholarship',
  'jharkhand-marang-gomke-jaipal-singh-munda-overseas-scholarship',
  'Jharkhand Marang Gomke Jaipal Singh Munda Overseas Scholarship',
  '100% full tuition fees and living expenses for tribal, SC, OBC, and minority youth to pursue Master''s/MPhil degrees in top UK universities (Oxford, Cambridge, LSE).',
  'Named after legendary Adivasi leader Jaipal Singh Munda, this landmark scheme fully finances 25 brilliant youth every year from Jharkhand to pursue postgraduate degrees in premier British and Irish universities across 31 subject fields.',
  'scholarship',
  'state',
  'Jharkhand',
  'Scheduled Tribe, Scheduled Caste, Minority and Backward Class Welfare Dept, Govt of Jharkhand',
  'Scheduled Tribe, Scheduled Caste, Minority and Backward Class Welfare Dept, Govt of Jharkhand',
  'https://mgjsoverseas.jharkhand.gov.in',
  'free_verified',
  '100% tuition fees, airfare, visa fees, health insurance, and annual living allowance of £9,900 to £15,000 for Master''s degree at top UK universities.',
  'Resident of Jharkhand belonging to ST, SC, OBC, or Minority community, aged <= 35 years, with unconditional offer letter from empaneled UK/Ireland universities.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Jharkhand","isMandatory":true,"conditionName":"Jharkhand Domicile","sourceClause":"MGJS Guidelines Clause 2"},{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["ST","SC","OBC","Minority"],"isMandatory":true,"conditionName":"Eligible Backward Community","sourceClause":"MGJS Guidelines Clause 3"},{"id":"rule-maxAgeYears-less_than_or_equal","parameter":"maxAgeYears","operator":"LESS_THAN_OR_EQUAL","expectedValue":35,"isMandatory":true,"conditionName":"Maximum Age 35 Years","sourceClause":"MGJS Guidelines Clause 4"}]',
  '[{"id":"doc-uk-uni-offer","name":"Unconditional Foreign University Offer Letter","description":"From Oxford, Cambridge, LSE, Edinburgh, etc.","requirementType":"mandatory","issuingAuthority":"Foreign University","sourceEvidence":"MGJS Checklist 1"},{"id":"doc-jh-caste","name":"Jharkhand Caste Certificate","description":"Issued by SDO / DC","requirementType":"mandatory","issuingAuthority":"Welfare Dept Jharkhand","sourceEvidence":"MGJS Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online with University Offer Letter","description":"Submit application on Marang Gomke portal during annual application window.","channel":"online_portal","portalUrl":"https://mgjsoverseas.jharkhand.gov.in"},{"stepNumber":2,"title":"State High Level Selection Committee Interview","description":"Appear before expert committee of academics and senior bureaucrats.","channel":"district_office"},{"stepNumber":3,"title":"Full Scholarship Award & Visa Sponsorship","description":"Government pays university directly and releases flight tickets and living stipend.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'jh-mukhyamantri-maiyan-samman',
  'jharkhand-mukhyamantri-maiyan-samman-yojana-jmmsy',
  'Jharkhand Mukhyamantri Maiyan Samman Yojana (JMMSY)',
  'Monthly financial assistance of ₹1,000 per month (₹12,000/year) directly to women aged 18 to 50 years across Jharkhand.',
  'JMMSY empowers women aged 18 to 50 in Jharkhand with a guaranteed direct cash transfer of ₹1,000 per month deposited on the 15th of every month into their Aadhaar-linked bank accounts to ensure social self-reliance.',
  'welfare',
  'state',
  'Jharkhand',
  'Women, Child Development and Social Security Department, Govt of Jharkhand',
  'Women, Child Development and Social Security Department, Govt of Jharkhand',
  'https://mmmsy.jharkhand.gov.in',
  'free_verified',
  '₹1,000 per month direct financial grant credited to the beneficiary''s single bank account via Aadhaar Payment Bridge.',
  'Woman resident of Jharkhand aged 18 to 50 years whose family holds a green/yellow/pink ration card or family income <= ₹8 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Jharkhand","isMandatory":true,"conditionName":"Jharkhand Domicile","sourceClause":"JMMSY Criteria 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Resident","sourceClause":"JMMSY Criteria 2"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Age 18-50 Years","sourceClause":"JMMSY Criteria 3"},{"id":"rule-maxAge-less_than_or_equal","parameter":"maxAge","operator":"LESS_THAN_OR_EQUAL","expectedValue":50,"isMandatory":true,"conditionName":"Maximum Age 50 Years","sourceClause":"JMMSY Criteria 4"}]',
  '[{"id":"doc-jh-ration-card","name":"Ration Card / Voter ID","description":"Household residency verification","requirementType":"mandatory","issuingAuthority":"Civil Supplies Jharkhand","sourceEvidence":"JMMSY Doc 1"},{"id":"doc-jh-aadhaar","name":"Aadhaar Card Linked Bank Account","description":"Active DBT mandate","requirementType":"mandatory","issuingAuthority":"UIDAI / Bank","sourceEvidence":"JMMSY Doc 2"}]',
  '[{"stepNumber":1,"title":"Apply at Aapki Yojana Aapki Sarkar Camp","description":"Submit form at special camp in your Panchayat.","channel":"meeseva_csc"},{"stepNumber":2,"title":"BDO Scrutiny & Sanction Order","description":"Block Development Officer approves eligible applications online.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Transfer on 15th","description":"Funds credited to bank account on 15th of each month.","channel":"online_portal","portalUrl":"https://mmmsy.jharkhand.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ga-griha-aadhaar-scheme',
  'goa-griha-aadhaar-scheme-homemakers',
  'Goa Griha Aadhaar Scheme (Homemakers Financial Assistance)',
  'Monthly financial assistance of ₹1,500 per month directly to homemakers from middle and lower income families in Goa.',
  'The Griha Aadhaar Scheme implemented by Directorate of Women and Child Development in Goa provides a monthly financial allowance of ₹1,500 to housewives to compensate for price inflation and maintain family living standards.',
  'welfare',
  'state',
  'Goa',
  'Directorate of Women and Child Development, Government of Goa',
  'Directorate of Women and Child Development, Government of Goa',
  'https://dwcd.goa.gov.in',
  'free_verified',
  '₹1,500 per month credited directly into the homemaker''s savings bank account via DBT.',
  'Married woman resident of Goa for at least 15 years, family annual income <= ₹3 Lakhs, husband residing with family.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Goa","isMandatory":true,"conditionName":"Goa Resident for 15+ Years","sourceClause":"Griha Aadhaar Section 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Homemaker","sourceClause":"Griha Aadhaar Section 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":300000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹3 Lakhs","sourceClause":"Griha Aadhaar Section 3"}]',
  '[{"id":"doc-goa-15yr-domicile","name":"15 Years Domicile / Residence Certificate","description":"Issued by Mamlatdar","requirementType":"mandatory","issuingAuthority":"Mamlatdar Office","sourceEvidence":"Griha Aadhaar Form 1"},{"id":"doc-goa-marriage","name":"Marriage Registration Certificate","description":"Issued by Civil Registrar","requirementType":"mandatory","issuingAuthority":"Sub-Registrar Goa","sourceEvidence":"Griha Aadhaar Form 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on Goa Online Portal","description":"Submit application on goaonline.gov.in portal or through Citizen Service Centre.","channel":"online_portal","portalUrl":"https://goaonline.gov.in"},{"stepNumber":2,"title":"Mamlatdar Income & Domicile Inquiry","description":"Mamlatdar verifies 15-year residence and income proof.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Benefit Credit","description":"Directorate releases ₹1,500 every month via electronic clearance.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ga-dayanand-social-security',
  'goa-dayanand-social-security-scheme-dsss',
  'Goa Dayanand Social Security Scheme (DSSS - Senior & Disability Pension)',
  'Monthly pension of ₹2,000 to ₹3,500 per month for senior citizens, widows, disabled persons, and single women in Goa.',
  'DSSS is Goa''s comprehensive universal pension program delivering direct financial support of ₹2,000/month (enhanced up to ₹3,500/month for severe disability and terminal diseases) to vulnerable seniors and widows.',
  'pension',
  'state',
  'Goa',
  'Directorate of Social Welfare, Government of Goa',
  'Directorate of Social Welfare, Government of Goa',
  'https://socialwelfare.goa.gov.in',
  'free_verified',
  '₹2,000 per month for elderly and widows; ₹2,500 to ₹3,500 per month for persons with severe disabilities, HIV/cancer patients, and children with special needs.',
  'Resident of Goa for 15+ years, age 60+ for elderly, or widows/disabled of any age, family annual income <= ₹1.5 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Goa","isMandatory":true,"conditionName":"Goa Domicile (15+ Years)","sourceClause":"DSSS Guidelines Section 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":150000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹1.5 Lakhs","sourceClause":"DSSS Guidelines Section 3"}]',
  '[{"id":"doc-dsss-15yr","name":"15 Years Residence Certificate from Mamlatdar","description":"Proof of continuous residence","requirementType":"mandatory","issuingAuthority":"Mamlatdar","sourceEvidence":"DSSS Form A"},{"id":"doc-dsss-income","name":"Income Certificate","description":"Income verification certificate","requirementType":"mandatory","issuingAuthority":"Tahsildar / Mamlatdar","sourceEvidence":"DSSS Form B"}]',
  '[{"stepNumber":1,"title":"Submit Application on Goa Online Portal","description":"Fill DSSS application with bank account details.","channel":"online_portal","portalUrl":"https://goaonline.gov.in"},{"stepNumber":2,"title":"Verification by Social Welfare Inspector","description":"Inspector checks living status and eligibility.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Pension Direct Transfer","description":"Monthly pension credited directly to bank account on the 1st of every month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'sk-aama-yojana',
  'sikkim-aama-yojana-unemployed-mothers',
  'Sikkim Aama Yojana (Annual Financial Assistance for Non-Working Mothers)',
  'Annual financial grant of ₹40,000 transferred directly to non-working rural and urban mothers across Sikkim.',
  'Aama Yojana is a pioneering maternal welfare scheme by the Government of Sikkim providing an annual financial grant of ₹40,000 to all unemployed, non-working mothers to recognise their unpaid domestic labour and ensure economic dignity.',
  'welfare',
  'state',
  'Sikkim',
  'Social Welfare Department, Government of Sikkim',
  'Social Welfare Department, Government of Sikkim',
  'https://sikkim.gov.in',
  'free_verified',
  '₹40,000 per year credited directly to the mother''s individual savings bank account via DBT in two seasonal installments.',
  'Mothers resident in Sikkim who are not employed in any regular government or private formal job, appearing in the Sikkim state electoral roll.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Sikkim","isMandatory":true,"conditionName":"Sikkim Subject / COI Holder","sourceClause":"Aama Yojana Rules 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Mother Status","sourceClause":"Aama Yojana Rules 2"},{"id":"rule-employmentStatus-equals","parameter":"employmentStatus","operator":"EQUALS","expectedValue":"unemployed","isMandatory":true,"conditionName":"Non-Working Mother","sourceClause":"Aama Yojana Rules 3"}]',
  '[{"id":"doc-sk-coi","name":"Certificate of Identification (COI) / Residential Certificate","description":"Proof of Sikkim domicile","requirementType":"mandatory","issuingAuthority":"District Collectorate","sourceEvidence":"Aama Checklist 1"},{"id":"doc-sk-unemp","name":"Unemployment Certificate / Self-Declaration","description":"Certified by Gram Panchayat","requirementType":"mandatory","issuingAuthority":"Panchayat President","sourceEvidence":"Aama Checklist 2"}]',
  '[{"stepNumber":1,"title":"Submit Application at Block Administrative Centre (BAC)","description":"Fill application form at nearest BAC or Ward level office.","channel":"district_office"},{"stepNumber":2,"title":"Gram Panchayat Vetting","description":"Panchayat Secretary confirms non-working status and residence.","channel":"district_office"},{"stepNumber":3,"title":"Direct Treasury DBT Transfer","description":"₹40,000 credited directly into beneficiary''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tr-mukhyamantri-matru-pushti-upahar',
  'tripura-mukhyamantri-matru-pushti-upahar-nutrition-kits',
  'Tripura Mukhyamantri Matru Pushti Uphar (Maternal Nutrition Kits)',
  'Free nutritional food kits (peanut butter, ghee, milk powder, horlicks, dates) worth ₹1,500 in 4 tranches during pregnancy and lactation.',
  'Provides special nutritional food baskets containing protein and micronutrient supplements to pregnant and lactating mothers across Tripura during periodic antenatal checkups to combat maternal anaemia and infant stunting.',
  'healthcare',
  'state',
  'Tripura',
  'Social Welfare and Social Education Department, Government of Tripura',
  'Social Welfare and Social Education Department, Government of Tripura',
  'https://socialwelfare.tripura.gov.in',
  'free_verified',
  'Free comprehensive nutritional grocery kit worth ₹1,500 distributed 4 times during pregnancy and postpartum checkups at Anganwadi Centres.',
  'Pregnant and lactating women registered at any Anganwadi Centre across Tripura attending periodic ANC checkups.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Tripura","isMandatory":true,"conditionName":"Tripura Domicile","sourceClause":"Matru Pushti Rules 1"}]',
  '[{"id":"doc-tr-mcp","name":"Mother & Child Protection (MCP) Card","description":"Issued by Health Worker","requirementType":"mandatory","issuingAuthority":"Sub-Centre / PHC","sourceEvidence":"Tripura MCP Doc"}]',
  '[{"stepNumber":1,"title":"Register Pregnancy at Anganwadi","description":"Register within 12 weeks of pregnancy with local Anganwadi worker.","channel":"district_office"},{"stepNumber":2,"title":"Attend Antenatal Checkup (ANC)","description":"Complete medical checkup at Primary Health Centre.","channel":"district_office"},{"stepNumber":3,"title":"Collect Nutrition Basket","description":"Receive sealed high-nutrition food kit free of charge at Anganwadi centre.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ml-focus-farmers-producers',
  'meghalaya-focus-farmers-collectivisation-scheme',
  'Meghalaya FOCUS (Farmers'' Collectivisation for Upscaling of Production and Marketing Systems)',
  'Direct financial assistance of ₹5,000 per member (up to ₹50,000 to ₹1 Lakh per producer group) for agri-horticultural input and marketing.',
  'FOCUS is Meghalaya''s flagship rural farmer collectivisation program mobilizing small tribal farmers into Producer Groups (PGs) and providing seed capital grants directly to groups for seeds, organic fertilizers, mini-processing units, and market aggregation.',
  'agriculture',
  'state',
  'Meghalaya',
  'Agriculture and Farmers'' Welfare Department, Government of Meghalaya',
  'Agriculture and Farmers'' Welfare Department, Government of Meghalaya',
  'https://focus.meghalaya.gov.in',
  'free_verified',
  'Direct grant of ₹5,000 per farming household distributed as group capital to registered Producer Groups of 10-20 farmers (up to ₹1,00,000 per group).',
  'Farming households residing in Meghalaya cultivating spices (Lakadong turmeric, ginger), horticulture, or floriculture organized into Producer Groups.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Meghalaya","isMandatory":true,"conditionName":"Meghalaya Resident","sourceClause":"FOCUS Guidelines Clause 2"}]',
  '[{"id":"doc-ml-voter","name":"EPIC / Aadhaar Card","description":"Identity proof in Meghalaya","requirementType":"mandatory","issuingAuthority":"Election Commission","sourceEvidence":"FOCUS Doc 1"},{"id":"doc-ml-pg-resolution","name":"Producer Group Formation Resolution","description":"Certified by Headman / Nokma","requirementType":"mandatory","issuingAuthority":"Traditional Dorbar / Nokma","sourceEvidence":"FOCUS Doc 2"}]',
  '[{"stepNumber":1,"title":"Form Producer Group","description":"10 to 20 farmers form an interest group under village extension worker guidance.","channel":"district_office"},{"stepNumber":2,"title":"Open Joint Group Bank Account","description":"Open savings bank account in nearest bank branch.","channel":"meeseva_csc"},{"stepNumber":3,"title":"Receive Seed Grant","description":"State agriculture department transfers group capital directly into bank account.","channel":"online_portal","portalUrl":"https://focus.meghalaya.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ar-deendayal-swavalamban',
  'arunachal-pradesh-deendayal-upadhyaya-swavalamban-yojana',
  'Arunachal Pradesh Deen Dayal Upadhyaya Swavalamban Yojana',
  'Front-ended capital investment subsidy of 30% to 40% (up to ₹20 Lakhs) for unemployed youth setting up enterprises in agriculture, tourism, and services.',
  'Swavalamban Yojana promotes entrepreneurship among Arunachalee youth, providing a 30% back-ended capital subsidy (enhanced to 40% for women entrepreneurs) on institutional bank loans from ₹10 Lakhs up to ₹50 Lakhs for eco-tourism, homestays, and agri-processing.',
  'livelihood',
  'state',
  'Arunachal Pradesh',
  'Department of Finance, Investment and State Lotteries, Government of Arunachal Pradesh',
  'Department of Finance, Investment and State Lotteries, Government of Arunachal Pradesh',
  'https://financialservices.arunachal.gov.in',
  'free_verified',
  '30% capital subsidy (40% for women entrepreneurs) on bank loans between ₹10 Lakhs and ₹50 Lakhs (maximum subsidy up to ₹20,00,000).',
  'Unemployed youth possessing Arunachal Pradesh Scheduled Tribe (APST) certificate or permanent resident certificate.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Arunachal Pradesh","isMandatory":true,"conditionName":"Arunachal Domicile / APST","sourceClause":"Swavalamban Rules 2"}]',
  '[{"id":"doc-ar-apst","name":"Arunachal Pradesh Scheduled Tribe (APST) Certificate","description":"Proof of indigenous residency","requirementType":"mandatory","issuingAuthority":"Deputy Commissioner","sourceEvidence":"APST Doc 1"},{"id":"doc-ar-dpr","name":"Detailed Project Report for Business Unit","description":"Financial projections and cost estimates","requirementType":"mandatory","issuingAuthority":"Chartered Accountant","sourceEvidence":"DPR Doc 2"}]',
  '[{"stepNumber":1,"title":"Online Application on State Finance Portal","description":"Submit DPR and land documents online.","channel":"online_portal","portalUrl":"https://financialservices.arunachal.gov.in"},{"stepNumber":2,"title":"District Level Screening Committee (DLSC) Review","description":"Deputy Commissioner evaluates interview and project viability.","channel":"district_office"},{"stepNumber":3,"title":"Subsidy Front-Ending in Bank Loan","description":"Subsidy parked in escrow with financing bank; loan disbursed for construction.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mn-cmyang-health',
  'manipur-chief-ministers-gi-hakshelgi-tengbang-cmht',
  'Manipur Chief Minister-gi Hakshelgi Tengbang (CMHT - Cashless Health Scheme)',
  'Cashless hospitalisation coverage up to ₹5 Lakhs per family per year for secondary and tertiary care for poor and low-income families in Manipur.',
  'CMHT is Manipur''s pioneering cashless healthcare assurance program covering critical care, cardiology, neurosurgery, and burns in empaneled state hospitals and super-specialty hospitals in Guwahati and Delhi.',
  'healthcare',
  'state',
  'Manipur',
  'State Health Agency, Health and Family Welfare Department, Government of Manipur',
  'State Health Agency, Health and Family Welfare Department, Government of Manipur',
  'https://cmhtmanipur.gov.in',
  'free_verified',
  'Cashless hospital treatment up to ₹5,00,000 per family per year for BPL families, media professionals, village chiefs, and disabled persons.',
  'BPL, Antyodaya, or low-income household in Manipur not covered under central Ayushman Bharat scheme.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Manipur","isMandatory":true,"conditionName":"Manipur Domicile","sourceClause":"CMHT Rules Clause 1"}]',
  '[{"id":"doc-mn-ration","name":"Manipur NFSA Ration Card / Income Certificate","description":"Proof of family economic category","requirementType":"mandatory","issuingAuthority":"DC / SDO","sourceEvidence":"CMHT Checklist 1"}]',
  '[{"stepNumber":1,"title":"Enrolment at District Hospital CMHT Kiosk","description":"Biometric capture and digital photograph at district hospital.","channel":"district_office"},{"stepNumber":2,"title":"Receive CMHT Health Card","description":"Collect biometric smart health card.","channel":"district_office"},{"stepNumber":3,"title":"Cashless Treatment","description":"Swipe card at hospital reception for completely cashless admission and surgery.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mz-sedp-entrepreneurship',
  'mizoram-socio-economic-development-policy-sedp',
  'Mizoram Socio-Economic Development Policy (SEDP)',
  'Direct family financial grant of ₹50,000 to ₹1 Lakh to develop household livelihoods in ginger, turmeric, piggery, and handloom weaving.',
  'SEDP is the flagship multi-sectoral transformation program in Mizoram providing direct family capital grants and technical mentoring to transition traditional jhum (shifting) cultivators to sustainable cash crops, piggery, and eco-tourism.',
  'livelihood',
  'state',
  'Mizoram',
  'Planning and Programme Implementation Department, Government of Mizoram',
  'Planning and Programme Implementation Department, Government of Mizoram',
  'https://sedp.mizoram.gov.in',
  'free_verified',
  'Direct financial assistance of ₹50,000 to ₹1,00,000 per family disbursed via DBT for identified household economic activities.',
  'Permanent indigenous families of Mizoram possessing Mizoram Tribal Certificate and family ration card.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Mizoram","isMandatory":true,"conditionName":"Mizoram Domicile","sourceClause":"SEDP Guidelines Clause 2"}]',
  '[{"id":"doc-mz-tribal","name":"Mizo Scheduled Tribe Certificate","description":"Issued by DC","requirementType":"mandatory","issuingAuthority":"Deputy Commissioner Mizoram","sourceEvidence":"SEDP Form 1"}]',
  '[{"stepNumber":1,"title":"Selection by Village Level SEDP Committee","description":"Village Council identifies beneficiary families in Gram Sabha.","channel":"district_office"},{"stepNumber":2,"title":"Activity Vetting by Nodal Department","description":"Animal husbandry / agriculture officers inspect proposed livelihood activity.","channel":"district_office"},{"stepNumber":3,"title":"Direct Bank Account Credit","description":"Assistance released directly into head of family''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'nl-cm-microfinance-initiative',
  'nagaland-chief-ministers-microfinance-initiative-cmmfi',
  'Nagaland Chief Minister''s Microfinance Initiative (CMMFI)',
  'Subsidized credit with 30% capital subsidy and 4% interest subvention up to ₹15 Lakhs for agri-allied, micro-enterprises, and SHGs in Nagaland.',
  'CMMFI accelerates flow of institutional credit to farmers, agri-entrepreneurs, and self-help groups in Nagaland, providing a 30% capital subsidy, 4% interest subvention for timely repayment, and moratorium up to 12 months.',
  'livelihood',
  'state',
  'Nagaland',
  'Finance Department, Government of Nagaland',
  'Finance Department, Government of Nagaland',
  'https://cmmfi.nagaland.gov.in',
  'free_verified',
  'Loans up to ₹15,00,000 with 30% capital subsidy back-ended by the state government and 4% interest subvention for 5 years.',
  'Indigenous inhabitants of Nagaland, SHGs, Joint Liability Groups, and Farmer Producer Organizations.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Nagaland","isMandatory":true,"conditionName":"Indigenous Inhabitant of Nagaland","sourceClause":"CMMFI Guidelines Clause 1"}]',
  '[{"id":"doc-nl-iic","name":"Indigenous Inhabitant Certificate (IIC)","description":"Proof of indigenous Nagaland citizenship","requirementType":"mandatory","issuingAuthority":"Deputy Commissioner","sourceEvidence":"CMMFI Checklist 1"}]',
  '[{"stepNumber":1,"title":"Apply on CMMFI Online Portal","description":"Fill online application with project plan.","channel":"online_portal","portalUrl":"https://cmmfi.nagaland.gov.in"},{"stepNumber":2,"title":"District Level Screening Committee (DLSC) Sanction","description":"DC-led committee approves business feasibility.","channel":"district_office"},{"stepNumber":3,"title":"Bank Loan Disbursement with Subsidy","description":"Partner bank releases credit with state subsidy adjustment.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'la-revamped-subsidy-solar',
  'ladakh-solar-greenhouse-and-pashmina-subsidy',
  'Ladakh Green Energy, Solar Greenhouse & Pashmina De-hairing Scheme',
  'Up to 75% capital subsidy for passive solar greenhouses, sheep sheds, and solar water pumps for high-altitude farmers in Leh and Kargil.',
  'The Union Territory Administration of Ladakh provides specialized climate-resilient capital subsidies up to 75% for modern Ladakh-type passive solar greenhouses enabling fresh vegetable cultivation during harsh -30°C winters, alongside mechanized de-hairing for Changthangi Pashmina goat herders.',
  'agriculture',
  'state',
  'Ladakh',
  'Department of Agriculture, UT Administration of Ladakh',
  'Department of Agriculture, UT Administration of Ladakh',
  'https://ladakh.nic.in',
  'free_verified',
  '75% subsidy (up to ₹3 Lakhs) for commercial passive solar greenhouses, ₹50,000 grant for pashmina goat shearing equipment, and free poly-carbonate solar drying sheds.',
  'Permanent residents of Leh and Kargil districts holding agricultural land or registered with Pashmina Goat Wool Growers Cooperative Society.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Ladakh","isMandatory":true,"conditionName":"Ladakh Domicile / Resident","sourceClause":"Ladakh Agri Guidelines Section 3"}]',
  '[{"id":"doc-la-prc","name":"Resident Certificate of Ladakh / PRC","description":"Issued by Tehsildar Leh / Kargil","requirementType":"mandatory","issuingAuthority":"Revenue Dept Ladakh","sourceEvidence":"Ladakh Checklist 1"}]',
  '[{"stepNumber":1,"title":"Submit Application at Block Agriculture Office","description":"Apply at Block Development Office in Leh or Kargil.","channel":"district_office"},{"stepNumber":2,"title":"Technical Site Feasibility","description":"Agriculture officer inspects sun exposure and winter water availability.","channel":"district_office"},{"stepNumber":3,"title":"Greenhouse Construction & Subsidy","description":"Department supplies prefabricated materials; balance cash subsidy released upon completion.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'py-free-rice-dbt',
  'puducherry-free-rice-dbt-scheme',
  'Puducherry Universal Free Rice & Essential Commodities DBT Scheme',
  'Direct monthly cash transfer of ₹300 per person directly into the bank accounts of all ration card holders in lieu of 10-20 kg free rice.',
  'The Union Territory of Puducherry provides a convenient, cash-out Direct Benefit Transfer (DBT) model giving beneficiaries direct monthly cash transfers equivalent to 10-20 kg of free quality rice directly into their bank accounts to eliminate ration leakage.',
  'welfare',
  'state',
  'Puducherry',
  'Department of Civil Supplies and Consumer Affairs, Government of Puducherry',
  'Department of Civil Supplies and Consumer Affairs, Government of Puducherry',
  'https://py.gov.in',
  'free_verified',
  'Direct monthly cash transfer of ₹300 per beneficiary (up to ₹1,200 to ₹1,500/month for family of 4-5 members) credited directly via DBT.',
  'All red (BPL) and yellow (APL) ration card holders residing in Puducherry, Karaikal, Mahe, and Yanam regions.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Puducherry","isMandatory":true,"conditionName":"Puducherry Resident","sourceClause":"PY Rice Rules Clause 1"}]',
  '[{"id":"doc-py-ration","name":"Puducherry Family Ration Card","description":"Red / Yellow card","requirementType":"mandatory","issuingAuthority":"Civil Supplies Puducherry","sourceEvidence":"PY Ration Checklist"}]',
  '[{"stepNumber":1,"title":"Aadhaar & Bank Linking with Ration Card","description":"Link bank account with Civil Supplies portal.","channel":"meeseva_csc","portalUrl":"https://py.gov.in"},{"stepNumber":2,"title":"Automatic Monthly Cash Credit","description":"Funds deposited directly on the first week of every month into family head account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'pb-ashirwad-scheme',
  'punjab-ashirwad-scheme-shagun-daughters-marriage',
  'Punjab Ashirwad Scheme (Shagun Financial Assistance for Daughters'' Marriage)',
  'Financial grant of ₹51,000 for the marriage of daughters belonging to SC, BC, and economically weaker families in Punjab.',
  'Administered by the Social Justice, Empowerment and Minorities Department in Punjab, this scheme provides direct financial assistance of ₹51,000 on the marriage of adult daughters from low-income families to support wedding expenses.',
  'welfare',
  'state',
  'Punjab',
  'Department of Social Justice, Empowerment and Minorities, Government of Punjab',
  'Department of Social Justice, Empowerment and Minorities, Government of Punjab',
  'https://welfare.punjab.gov.in',
  'free_verified',
  'Direct lump-sum bank transfer of ₹51,000 deposited into the bride''s personal savings account.',
  'Resident of Punjab belonging to SC, BC, Christian, or EWS category, daughter aged 18+ years, family annual income <= ₹32,790.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Punjab","isMandatory":true,"conditionName":"Punjab Domicile","sourceClause":"Ashirwad Scheme Rules 1"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":32790,"isMandatory":true,"conditionName":"Annual Family Income <= ₹32,790","sourceClause":"Ashirwad Scheme Rules 2"}]',
  '[{"id":"doc-pb-ashirwad-caste","name":"SC / BC / EWS Caste Certificate","description":"Issued by competent revenue authority","requirementType":"mandatory","issuingAuthority":"Tehsildar","sourceEvidence":"Ashirwad Checklist 1"},{"id":"doc-pb-ashirwad-income","name":"Tehsildar Income Certificate","description":"Income verification","requirementType":"mandatory","issuingAuthority":"Tehsildar","sourceEvidence":"Ashirwad Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on Punjab Welfare Portal","description":"Submit application 30 days before or within 30 days after marriage.","channel":"online_portal","portalUrl":"https://welfare.punjab.gov.in"},{"stepNumber":2,"title":"District Social Justice Officer Scrutiny","description":"Official scrutinizes age and family income documents.","channel":"district_office"},{"stepNumber":3,"title":"Direct Bank Transfer","description":"₹51,000 credited to bride''s bank account before marriage.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'hr-bhavantar-bharpayee',
  'haryana-bhavantar-bharpayee-yojana-horticulture',
  'Haryana Bhavantar Bharpayee Yojana (BBY - Crop Price Deficit Protection)',
  'Direct compensation for price deficit below protected base price for 21 horticulture and vegetable crops for farmers in Haryana.',
  'BBY protects farmers in Haryana from market price crashes by setting protected base prices for 21 vegetables and fruits (potato, tomato, onion, cauliflower, carrots, kinnow, guava), paying the difference directly into farmers'' accounts via DBT when wholesale mandi prices fall below the base price.',
  'agriculture',
  'state',
  'Haryana',
  'Haryana State Agricultural Marketing Board (HSAMB)',
  'Haryana State Agricultural Marketing Board (HSAMB)',
  'https://fasal.haryana.gov.in',
  'free_verified',
  'Direct price deficit compensation (difference between average mandi selling price and protected base price) per quintal credited via DBT.',
  'Farmers cultivating notified horticulture/vegetable crops in Haryana registered on the ''Meri Fasal Mera Byora'' portal.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Haryana","isMandatory":true,"conditionName":"Haryana Resident Farmer","sourceClause":"BBY Scheme Clause 2"}]',
  '[{"id":"doc-hr-mfmb","name":"Meri Fasal Mera Byora Registration Slip","description":"Proof of crop sowing verification","requirementType":"mandatory","issuingAuthority":"HSAMB","sourceEvidence":"BBY Doc 1"}]',
  '[{"stepNumber":1,"title":"Register Sowing on Meri Fasal Mera Byora","description":"Register acreage and crop variety on the portal before designated deadline.","channel":"online_portal","portalUrl":"https://fasal.haryana.gov.in"},{"stepNumber":2,"title":"Sell at Notified APMC Mandi","description":"Sell vegetable/fruit produce through J-Form in regulated grain/vegetable markets.","channel":"district_office"},{"stepNumber":3,"title":"Automatic Price Deficit DBT","description":"System calculates difference from base price and transfers compensation automatically.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'rj-indira-smartphone',
  'rajasthan-indira-gandhi-smartphone-yojana-igsy',
  'Rajasthan Indira Gandhi Smartphone Yojana (Free Smartphone & 3-Year Internet)',
  'Free Android 4G/5G smartphone + ₹6,800 DBT wallet for 3 years of free voice calling and 20 GB monthly data for women family heads in Rajasthan.',
  'IGSY provides free 4G/5G smartphones with preloaded government welfare apps and 3 years of free high-speed internet to women heads of families enrolled under Chiranjeevi / Jan Aadhaar and girl students studying in higher education.',
  'welfare',
  'state',
  'Rajasthan',
  'Department of Information Technology and Communication (DoIT&C), Govt of Rajasthan',
  'Department of Information Technology and Communication (DoIT&C), Govt of Rajasthan',
  'https://igsy.rajasthan.gov.in',
  'free_verified',
  'Free 4G/5G smartphone device (₹6,125 voucher) + ₹675 direct wallet credit for 9 months initial internet + ₹900/year for next 2 years.',
  'Women head of family holding Jan Aadhaar who worked 100 days in MGNREGA / 50 days in Indira Gandhi Urban Employment, or girl students in Class 9-12/College.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Rajasthan","isMandatory":true,"conditionName":"Rajasthan Resident with Jan Aadhaar","sourceClause":"IGSY Guidelines Clause 2"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Female Head / Student","sourceClause":"IGSY Guidelines Clause 3"}]',
  '[{"id":"doc-igsy-janaadhaar","name":"Jan Aadhaar Card","description":"Digital family identity","requirementType":"mandatory","issuingAuthority":"Jan Aadhaar Authority","sourceEvidence":"IGSY Doc 1"}]',
  '[{"stepNumber":1,"title":"Receive SMS Invitation for Camp","description":"Eligible women receive SMS alert with camp token date and location.","channel":"online_portal"},{"stepNumber":2,"title":"Camp e-KYC & Mobile Selection","description":"Visit district camp, choose telecom operator (Airtel, Jio, BSNL) and handset brand.","channel":"district_office"},{"stepNumber":3,"title":"Receive Configured Smartphone","description":"Wallet credit transferred instantly to purchase phone and activate SIM card.","channel":"district_office","portalUrl":"https://igsy.rajasthan.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mp-sambal-card',
  'madhya-pradesh-mukhyamantri-jan-kalyan-sambal-2-yojana',
  'Madhya Pradesh Mukhyamantri Jan Kalyan (Sambal 2.0) Yojana',
  'Integrated social security card offering ₹4 Lakh accidental death cover, ₹2 Lakh natural death cover, ₹16,000 maternity assistance, and free electricity.',
  'Sambal 2.0 is an umbrella social security system for millions of unorganised workers in Madhya Pradesh, delivering cradle-to-grave financial protection: antenatal assistance, institutional maternity cash, scholarships for children, accidental insurance, and funeral aid.',
  'welfare',
  'state',
  'Madhya Pradesh',
  'Labour Department, Government of Madhya Pradesh',
  'Labour Department, Government of Madhya Pradesh',
  'https://sambal.mp.gov.in',
  'free_verified',
  '₹4,00,000 accidental death relief; ₹2,00,000 natural death relief; ₹16,000 maternity aid; ₹5,000 funeral grant; 100% free higher education fees for children.',
  'Unorganised workers resident in MP aged 18 to 60 years whose family does not own more than 1 hectare of land and does not pay income tax.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Madhya Pradesh","isMandatory":true,"conditionName":"MP Resident","sourceClause":"Sambal Guidelines 1"},{"id":"rule-workerType-equals","parameter":"workerType","operator":"EQUALS","expectedValue":"unorganised_worker","isMandatory":true,"conditionName":"Unorganised Sector Worker","sourceClause":"Sambal Guidelines 2"}]',
  '[{"id":"doc-mp-sambal-samagra","name":"Samagra ID and Aadhaar","description":"Verified family profile","requirementType":"mandatory","issuingAuthority":"Samagra Portal","sourceEvidence":"Sambal Doc 1"}]',
  '[{"stepNumber":1,"title":"Apply Online on Sambal Portal","description":"Register using 9-digit Samagra Member ID.","channel":"online_portal","portalUrl":"https://sambal.mp.gov.in"},{"stepNumber":2,"title":"Inquiry by Gram Panchayat / Ward Officer","description":"Secretary verifies unorganised worker status within 15 days.","channel":"district_office"},{"stepNumber":3,"title":"Download Sambal Digital Card","description":"Receive QR-coded Sambal Card unlocking all 12 converged state welfare schemes.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'br-gram-parivahan',
  'bihar-mukhyamantri-gram-parivahan-yojana-mgpy',
  'Bihar Mukhyamantri Gram Parivahan Yojana (Rural Commercial Vehicle Subsidy)',
  '50% capital subsidy up to ₹1,00,000 for purchasing 4 to 10-seater commercial passenger vehicles (auto, e-rickshaw, magic) in rural Bihar.',
  'Administered by the Transport Department in Bihar, this scheme provides 50% capital grant up to ₹1 Lakh to rural youth belonging to SC, ST, and EBC categories to buy commercial passenger vehicles, linking remote panchayats with block and district headquarters.',
  'livelihood',
  'state',
  'Bihar',
  'Transport Department, Government of Bihar',
  'Transport Department, Government of Bihar',
  'https://transport.bihar.gov.in',
  'free_verified',
  '50% subsidy of purchase price (up to ₹1,00,000) for buying new 4 to 10-seater commercial vehicles (Tata Magic, Mahindra Bolero Camper, Auto-rickshaws, or E-Rickshaws).',
  'Permanent resident of rural Panchayat in Bihar, minimum age 21 years, belonging to SC, ST, or EBC, possessing a valid commercial driving licence.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Bihar","isMandatory":true,"conditionName":"Bihar Rural Resident","sourceClause":"MGPY Rules 2.1"},{"id":"rule-casteCategory-in","parameter":"casteCategory","operator":"IN","expectedValue":["SC","ST","EBC"],"isMandatory":true,"conditionName":"SC, ST, or EBC Category","sourceClause":"MGPY Rules 2.2"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":21,"isMandatory":true,"conditionName":"Minimum Age 21 Years","sourceClause":"MGPY Rules 2.3"}]',
  '[{"id":"doc-mgpy-dl","name":"Commercial Driving Licence","description":"Valid driver licence","requirementType":"mandatory","issuingAuthority":"DTO Bihar","sourceEvidence":"MGPY Checklist 1"},{"id":"doc-mgpy-caste","name":"SC / ST / EBC Caste Certificate","description":"Issued by Circle Officer","requirementType":"mandatory","issuingAuthority":"Revenue Dept","sourceEvidence":"MGPY Checklist 2"}]',
  '[{"stepNumber":1,"title":"Apply Online on Bihar Transport Portal","description":"Fill application selecting Panchayat and preferred vehicle model.","channel":"online_portal","portalUrl":"https://transport.bihar.gov.in"},{"stepNumber":2,"title":"Block & Sub-Divisional Selection Committee","description":"SDO and BDO select 5 beneficiaries per Panchayat (3 SC/ST and 2 EBC).","channel":"district_office"},{"stepNumber":3,"title":"Vehicle Purchase & 50% Subsidy Credit","description":"Purchase vehicle from authorized dealer; ₹1 Lakh subsidy credited to loan account.","channel":"district_office"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'od-madhu-babu-pension',
  'odisha-madhu-babu-pension-yojana-mbpy',
  'Odisha Madhu Babu Pension Yojana (MBPY - Universal Social Pension)',
  'Monthly social security pension of ₹500 to ₹900 per month for elderly, widows, persons with disabilities, and transgender persons in Odisha.',
  'MBPY provides monthly direct pensions to destitute elderly citizens, widows, individuals with disabilities, and destitute transgender persons across Odisha, delivered on the 15th of each month under the ''Jana Seva Diwas'' through cash-at-doorstep or DBT.',
  'pension',
  'state',
  'Odisha',
  'Social Security and Empowerment of Persons with Disabilities (SSEPD) Dept, Govt of Odisha',
  'Social Security and Empowerment of Persons with Disabilities (SSEPD) Dept, Govt of Odisha',
  'https://ssepd.odisha.gov.in',
  'free_verified',
  '₹500 per month (for age up to 79) and ₹700 to ₹900 per month (for age 80+ and severe disability) delivered transparently every month.',
  'Resident of Odisha aged 60+ (or widow/disabled of any age), family annual income <= ₹24,000, not receiving any other central/state pension.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Odisha","isMandatory":true,"conditionName":"Odisha Domicile","sourceClause":"MBPY Rules Clause 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":24000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹24,000","sourceClause":"MBPY Rules Clause 3"}]',
  '[{"id":"doc-mbpy-income","name":"Income Certificate from Tahsildar","description":"Showing family income <= ₹24,000/year","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"MBPY Form 1"}]',
  '[{"stepNumber":1,"title":"Apply at Block Development Office or Mo Seva Kendra","description":"Submit MBPY application form.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Gram Panchayat Enquiry","description":"Social security officer verifies residency and non-pensioner status.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Pension Distribution","description":"Receive monthly cash directly in Gram Panchayat on 15th or through DBT.","channel":"district_office","portalUrl":"https://ssepd.odisha.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'gj-namo-saraswati-girls',
  'gujarat-namo-saraswati-yojana-science-education',
  'Gujarat Namo Saraswati Yojana (Class 11-12 Science Stream Incentive)',
  'Scholarship of ₹25,000 over two years (₹10,000 in Class 11 and ₹15,000 in Class 12) to encourage girl students to pursue Science stream.',
  'Namo Saraswati Yojana incentivizes girl students across Gujarat to opt for Science, Technology, Engineering, and Mathematics (STEM) streams in secondary school, paying ₹25,000 across Classes 11 and 12 to build female representation in engineering and medicine.',
  'scholarship',
  'state',
  'Gujarat',
  'Education Department, Government of Gujarat',
  'Education Department, Government of Gujarat',
  'https://gujaratindia.gov.in',
  'free_verified',
  '₹25,000 direct bank transfer: ₹10,000 in Class 11 (₹1,000/month for 10 months) and ₹15,000 in Class 12 (₹1,500/month for 10 months).',
  'Girl students studying in Class 11 or 12 in Science stream in any government, grant-in-aid, or recognized private school in Gujarat, family income <= ₹6 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Gujarat","isMandatory":true,"conditionName":"Gujarat Domicile","sourceClause":"Namo Saraswati Rules 1"},{"id":"rule-gender-equals","parameter":"gender","operator":"EQUALS","expectedValue":"female","isMandatory":true,"conditionName":"Girl Student","sourceClause":"Namo Saraswati Rules 2"},{"id":"rule-schoolStream-equals","parameter":"schoolStream","operator":"EQUALS","expectedValue":"science","isMandatory":true,"conditionName":"Class 11/12 Science Stream","sourceClause":"Namo Saraswati Rules 3"}]',
  '[{"id":"doc-saraswati-bonafide","name":"Class 11/12 Science Stream Admission Certificate","description":"Issued by Higher Secondary School Principal","requirementType":"mandatory","issuingAuthority":"School","sourceEvidence":"Saraswati Doc 1"}]',
  '[{"stepNumber":1,"title":"Registration through School on Digital Gujarat Portal","description":"School uploads student Aadhaar and enrollment details.","channel":"college_cell","portalUrl":"https://www.digitalgujarat.gov.in"},{"stepNumber":2,"title":"District Education Officer (DEO) Verification","description":"DEO verifies science stream registration.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Transfer","description":"Stipend credited monthly directly to student''s bank account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'wb-rupashree-prakalpa',
  'west-bengal-rupashree-prakalpa-marriage-grant',
  'West Bengal Rupashree Prakalpa (One-Time Marriage Grant)',
  'One-time cash grant of ₹25,000 transferred to adult girls from economically stressed families before their marriage in West Bengal.',
  'Rupashree Prakalpa provides one-time financial assistance of ₹25,000 to adult girls aged 18+ whose family annual income <= ₹1.5 Lakhs, ensuring poor families do not have to borrow at exorbitant interest rates for marriage arrangements.',
  'welfare',
  'state',
  'West Bengal',
  'Department of Women and Child Development and Social Welfare, Govt of West Bengal',
  'Department of Women and Child Development and Social Welfare, Govt of West Bengal',
  'https://wbrupashree.gov.in',
  'free_verified',
  'One-time grant of ₹25,000 credited directly via DBT to the bride''s personal bank account before the solemnization of marriage.',
  'Unmarried girl aged 18+ resident of West Bengal for at least 5 years, marrying for the first time, family annual income <= ₹1.5 Lakhs.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"West Bengal","isMandatory":true,"conditionName":"West Bengal Domicile","sourceClause":"Rupashree Criteria 1"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":18,"isMandatory":true,"conditionName":"Bride Age 18 Years and Above","sourceClause":"Rupashree Criteria 2"},{"id":"rule-incomeLimit-less_than_or_equal","parameter":"incomeLimit","operator":"LESS_THAN_OR_EQUAL","expectedValue":150000,"isMandatory":true,"conditionName":"Annual Family Income <= ₹1.5 Lakhs","sourceClause":"Rupashree Criteria 3"}]',
  '[{"id":"doc-rupashree-invitation","name":"Wedding Invitation Card / Marriage Declaration","description":"Proof of proposed marriage","requirementType":"mandatory","issuingAuthority":"Priest / Kazi / Family","sourceEvidence":"Rupashree Doc 1"},{"id":"doc-rupashree-age","name":"Age Proof of Bride (Madhyamik Admit Card / Birth Certificate)","description":"Confirming age >= 18","requirementType":"mandatory","issuingAuthority":"WBBSE / Registrar","sourceEvidence":"Rupashree Doc 2"}]',
  '[{"stepNumber":1,"title":"Submit Application at BDO / SDO Office","description":"Apply at least 30 to 60 days before the wedding date.","channel":"district_office"},{"stepNumber":2,"title":"Enquiry by Enquiry Officer","description":"Officer visits residence to verify age of bride and groom and wedding date.","channel":"district_office"},{"stepNumber":3,"title":"Direct Bank Credit before Marriage","description":"₹25,000 transferred directly to bride''s bank account before wedding day.","channel":"online_portal","portalUrl":"https://wbrupashree.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-ysr-nethanna-nestham',
  'andhra-pradesh-ysr-nethanna-nestham-weavers',
  'Andhra Pradesh YSR Nethanna Nestham (Handloom Weavers Livelihood)',
  'Annual financial assistance of ₹24,000 per year directly to every handloom weaver family owning a loom to upgrade equipment and purchase yarn.',
  'Under YSR Nethanna Nestham, the Government of Andhra Pradesh provides ₹24,000 every year directly to every weaver family possessing a handloom to modernize loom infrastructure, purchase raw material yarn, and compete with powerlooms.',
  'livelihood',
  'state',
  'Andhra Pradesh',
  'Department of Handlooms and Textiles, Government of Andhra Pradesh',
  'Department of Handlooms and Textiles, Government of Andhra Pradesh',
  'https://navasakam.ap.gov.in',
  'free_verified',
  '₹24,000 per year direct financial grant credited in one lump sum into the handloom weaver''s bank account via DBT.',
  'Handloom weaver family owning and operating a handloom in Andhra Pradesh, holding BPL Rice Card.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"Nethanna Nestham Clause 1"},{"id":"rule-profession-equals","parameter":"profession","operator":"EQUALS","expectedValue":"handloom_weaver","isMandatory":true,"conditionName":"Loom Owner Weaver","sourceClause":"Nethanna Nestham Clause 2"}]',
  '[{"id":"doc-nethanna-geo","name":"Geotagged Photo of Handloom Unit","description":"Captured by Village Secretariat staff","requirementType":"mandatory","issuingAuthority":"Handlooms Dept AP","sourceEvidence":"Nethanna Doc 1"}]',
  '[{"stepNumber":1,"title":"Survey by Village Welfare Assistant","description":"Village Secretariat assistant geotags loom and registers weaver profile.","channel":"district_office"},{"stepNumber":2,"title":"Social Audit Verification","description":"Draft beneficiary list posted at Gram Sachivalayam for public review.","channel":"district_office"},{"stepNumber":3,"title":"Annual DBT Credit","description":"₹24,000 credited directly into the weaver''s account.","channel":"online_portal","portalUrl":"https://navasakam.ap.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-nethannaku-cheyutha',
  'telangana-nethannaku-cheyutha-weavers-thrift-fund',
  'Telangana Nethannaku Cheyutha (Weavers Thrift Fund & Social Security)',
  'Government matching contribution of 16% (double the weaver''s 8% monthly contribution) in a specialized 3-year lock-in welfare thrift fund.',
  'Nethannaku Cheyutha is Telangana''s dedicated thrift fund scheme for handloom and powerloom weavers. When a weaver deposits 8% of their monthly wage, the Telangana Government contributes double (16% for handloom, 8% for powerloom) into their thrift account, accumulating a substantial financial corpus with loan facilities during crisis.',
  'livelihood',
  'state',
  'Telangana',
  'Department of Handlooms and Textiles, Government of Telangana',
  'Department of Handlooms and Textiles, Government of Telangana',
  'https://telangana.gov.in',
  'free_verified',
  'Government contributes 16% matching grant on handloom weaver earnings (8% on powerloom) credited monthly to the weaver''s thrift bank account, with loan withdrawal facility up to 50% after 3 years.',
  'Active handloom and powerloom weavers, ancillary workers (dyeing, warping, winding) aged 18+ residing in Telangana.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Resident","sourceClause":"Cheyutha Weavers Guidelines 1"},{"id":"rule-occupation-in","parameter":"occupation","operator":"IN","expectedValue":["handloom_weaver","powerloom_weaver","ancillary_textile_worker"],"isMandatory":true,"conditionName":"Weaver or Textile Worker","sourceClause":"Cheyutha Weavers Guidelines 2"}]',
  '[{"id":"doc-tg-weaver-id","name":"Weaver Identity Card / Pehchan Card","description":"Issued by Department of Handlooms","requirementType":"mandatory","issuingAuthority":"Assistant Director Handlooms","sourceEvidence":"Weavers Doc 1"}]',
  '[{"stepNumber":1,"title":"Open Recurring Thrift Account","description":"Open designated thrift deposit account in cooperative bank or commercial bank.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Monthly 8% Wage Deposit","description":"Weaver deposits 8% of earned wages through cooperative society or master weaver.","channel":"district_office"},{"stepNumber":3,"title":"Government 16% Matching Credit","description":"Handlooms department verifies wage records and credits double matching contribution directly.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tg-dalit-bandhu-flagship',
  'telangana-dalit-bandhu-10-lakh-grant',
  'Telangana Dalit Bandhu Scheme (₹10 Lakh 100% Capital Grant)',
  '100% non-repayable direct capital grant of ₹10 Lakhs per Dalit family without bank loan or mortgage to establish self-chosen businesses.',
  'Dalit Bandhu is a revolutionary affirmative economic empowerment scheme by the Government of Telangana providing ₹10,00,000 as a direct 100% grant to every eligible Dalit family to start independent commercial enterprises (dairy, transport, retail, construction, manufacturing) with complete freedom of choice.',
  'livelihood',
  'state',
  'Telangana',
  'Scheduled Castes Development Department, Government of Telangana',
  'Scheduled Castes Development Department, Government of Telangana',
  'https://dalitbandhu.telangana.gov.in',
  'free_verified',
  '₹10,00,000 direct 100% non-repayable grant deposited into a special Dalit Bandhu savings account, with no bank loan linkage or collateral requirement.',
  'Scheduled Caste (SC) families domiciled in Telangana verified through electronic Food Security Card and Integrated Community Certificate.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Telangana","isMandatory":true,"conditionName":"Telangana Domicile","sourceClause":"Dalit Bandhu Guidelines Clause 2"},{"id":"rule-casteCategory-equals","parameter":"casteCategory","operator":"EQUALS","expectedValue":"SC","isMandatory":true,"conditionName":"Scheduled Caste Community","sourceClause":"Dalit Bandhu Guidelines Clause 3"}]',
  '[{"id":"doc-tg-db-caste","name":"MeeSeva Integrated SC Community Certificate","description":"Issued by Tahsildar","requirementType":"mandatory","issuingAuthority":"Revenue Dept","sourceEvidence":"DB Doc 1"},{"id":"doc-tg-db-fsc","name":"Telangana Food Security Card (White Card)","description":"Family verification","requirementType":"mandatory","issuingAuthority":"Civil Supplies","sourceEvidence":"DB Doc 2"}]',
  '[{"stepNumber":1,"title":"Family Selection by District Administration","description":"District Collector approves family list in designated saturation mandals/wards.","channel":"district_office"},{"stepNumber":2,"title":"Business Orientation & Choice Selection","description":"Beneficiary selects preferred enterprise (tractor, medical store, poultry farm, hardware shop).","channel":"district_office"},{"stepNumber":3,"title":"Direct ₹10 Lakh Account Credit","description":"₹10,00,000 transferred to beneficiary''s special Dalit Bandhu bank account for asset acquisition.","channel":"online_portal","portalUrl":"https://dalitbandhu.telangana.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ap-jagananna-thodu',
  'andhra-pradesh-jagananna-thodu-street-vendors',
  'Andhra Pradesh Jagananna Thodu (Interest-Free Loans for Street Vendors)',
  'Collateral-free working capital loan of ₹10,000 to ₹20,000 with 100% interest reimbursed by the Andhra Pradesh Government for street vendors.',
  'Jagananna Thodu frees roadside street vendors, cart pullers, and traditional artisans from ruthless private money lenders by providing ₹10,000 to ₹20,000 bank working capital loans where the AP Government pays 100% of the interest directly to the bank upon prompt repayment.',
  'livelihood',
  'state',
  'Andhra Pradesh',
  'Village and Ward Secretariats Department, Government of Andhra Pradesh',
  'Village and Ward Secretariats Department, Government of Andhra Pradesh',
  'https://navasakam.ap.gov.in',
  'free_verified',
  '₹10,000 initial bank loan (enhanced to ₹20,000 on repayment) with 100% interest subvention credited directly into the vendor''s bank account every 6 months.',
  'Street vendors, footpath traders, pushcart operators, and traditional artisans aged 18+ in AP holding BPL Rice Card.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Andhra Pradesh","isMandatory":true,"conditionName":"AP Domicile","sourceClause":"Thodu Rules 1"},{"id":"rule-occupation-equals","parameter":"occupation","operator":"EQUALS","expectedValue":"street_vendor","isMandatory":true,"conditionName":"Street Vendor / Small Trader","sourceClause":"Thodu Rules 2"}]',
  '[{"id":"doc-thodu-vendor-id","name":"Street Vendor Certificate of Vending / ID","description":"Issued by Municipality or Gram Panchayat","requirementType":"mandatory","issuingAuthority":"ULB / Panchayat","sourceEvidence":"Thodu Checklist 1"}]',
  '[{"stepNumber":1,"title":"Survey by Ward/Village Secretariat Volunteer","description":"Secretariat staff maps vending location and captures photo.","channel":"district_office"},{"stepNumber":2,"title":"Bank Sanction without Security","description":"Partner bank sanctions ₹10,000 working capital loan directly.","channel":"district_office"},{"stepNumber":3,"title":"Bi-annual Interest Refund","description":"State government reimburses complete interest accrued every 6 months.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'ka-anna-bhagya-dbt',
  'karnataka-anna-bhagya-free-rice-dbt-scheme',
  'Karnataka Anna Bhagya Scheme (10 kg Free Foodgrains / Direct DBT Cash)',
  '10 kg free foodgrains per person per month (5 kg central grain + cash DBT of ₹170/person per month in lieu of additional 5 kg grain) for BPL families in Karnataka.',
  'Anna Bhagya guarantees absolute hunger-free living across Karnataka by providing 10 kg free rice per person per month to all BPL and Antyodaya households, transferring ₹34 per kg (₹170 per person per month) directly via DBT into the bank accounts of women heads of households.',
  'welfare',
  'state',
  'Karnataka',
  'Food, Civil Supplies & Consumer Affairs Department, Government of Karnataka',
  'Food, Civil Supplies & Consumer Affairs Department, Government of Karnataka',
  'https://ahara.kar.nic.in',
  'free_verified',
  '5 kg free rice distributed physically at Fair Price Shops + ₹170 direct DBT cash transfer per family member per month credited directly to the woman head''s bank account.',
  'All Antyodaya Anna Yojana (AAY) and Priority Household (PHH / BPL) ration card holders residing in Karnataka.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Karnataka","isMandatory":true,"conditionName":"Karnataka Resident","sourceClause":"Anna Bhagya Rules 1"},{"id":"rule-rationCardType-in","parameter":"rationCardType","operator":"IN","expectedValue":["BPL","AAY"],"isMandatory":true,"conditionName":"BPL / Antyodaya Card Holder","sourceClause":"Anna Bhagya Rules 2"}]',
  '[{"id":"doc-ka-bpl-card","name":"Karnataka BPL / Antyodaya Ration Card","description":"Digital ration card","requirementType":"mandatory","issuingAuthority":"Food & Civil Supplies Kar","sourceEvidence":"Anna Bhagya Doc 1"}]',
  '[{"stepNumber":1,"title":"Aadhaar Seeding of Family Head","description":"Link bank account with family head''s Aadhaar on Ahara portal.","channel":"meeseva_csc","portalUrl":"https://ahara.kar.nic.in"},{"stepNumber":2,"title":"Fair Price Shop Grain Collection","description":"Collect 5 kg free physical rice through biometric POS.","channel":"district_office"},{"stepNumber":3,"title":"Monthly DBT Cash Credit","description":"₹170 per person transferred directly into family head''s bank account on 10th of every month.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'tn-makkalai-thedi-maruthuvam',
  'tamil-nadu-makkalai-thedi-maruthuvam-doorstep-healthcare',
  'Tamil Nadu Makkalai Thedi Maruthuvam (Doorstep Healthcare Scheme)',
  'Doorstep delivery of essential medicines for diabetes and hypertension, home palliative care, and screening for non-communicable diseases across Tamil Nadu.',
  'Makkalai Thedi Maruthuvam delivers comprehensive primary healthcare services right to the doorsteps of over 1 Crore citizens across Tamil Nadu, with Women Health Volunteers visiting homes to test blood pressure, screen blood sugar, and deliver free monthly medicine boxes.',
  'healthcare',
  'state',
  'Tamil Nadu',
  'Health and Family Welfare Department, Government of Tamil Nadu',
  'Health and Family Welfare Department, Government of Tamil Nadu',
  'https://tnhealth.tn.gov.in',
  'free_verified',
  'Free monthly doorstep medicine supply for hypertension and diabetes, free home-based physiotherapy, peritoneal dialysis bags delivery, and palliative nursing care.',
  'All residents of Tamil Nadu, especially elderly individuals aged 45+, bedridden patients, and persons suffering from chronic non-communicable diseases.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Tamil Nadu","isMandatory":true,"conditionName":"Tamil Nadu Resident","sourceClause":"MTM Rules Clause 1"}]',
  '[{"id":"doc-mtm-none","name":"No Prior Documents Required (Doorstep survey by health team)","description":"Universal household visit","requirementType":"mandatory","issuingAuthority":"Health Dept TN","sourceEvidence":"MTM SOP"}]',
  '[{"stepNumber":1,"title":"Doorstep Screening Visit","description":"Women Health Volunteer (WHV) visits residence and checks BP and blood sugar.","channel":"district_office"},{"stepNumber":2,"title":"Doctor Digital Confirmation","description":"Medical Officer at PHC verifies readings and prescribes generic medications.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Doorstep Medicine Delivery","description":"Health volunteer delivers monthly medicine box right to patient''s doorstep.","channel":"district_office","portalUrl":"https://tnhealth.tn.gov.in"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'mh-shravanbal-sewa-pension',
  'maharashtra-shravanbal-seva-rajya-nivruttivetan-yojana',
  'Maharashtra Shravanbal Seva Rajya Nivruttivetan Yojana (Senior Citizen Pension)',
  'Monthly social pension of ₹1,500 per month for elderly citizens aged 65 years and above belonging to low-income families in Maharashtra.',
  'Shravanbal Seva Yojana ensures elderly citizens in Maharashtra do not face abandonment or hunger by providing a dignified monthly cash pension of ₹1,500 transferred directly into their bank accounts.',
  'pension',
  'state',
  'Maharashtra',
  'Social Justice and Special Assistance Department, Government of Maharashtra',
  'Social Justice and Special Assistance Department, Government of Maharashtra',
  'https://sjsa.maharashtra.gov.in',
  'free_verified',
  '₹1,500 per month credited directly to beneficiary''s savings bank account via electronic clearance.',
  'Resident of Maharashtra for 15+ years, age 65 years and above, family annual income <= ₹21,000 (Category A) or BPL listed (Category B).',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Maharashtra","isMandatory":true,"conditionName":"Maharashtra Resident for 15+ Years","sourceClause":"Shravanbal Rules 1"},{"id":"rule-minAge-greater_than_or_equal","parameter":"minAge","operator":"GREATER_THAN_OR_EQUAL","expectedValue":65,"isMandatory":true,"conditionName":"Age 65 Years and Above","sourceClause":"Shravanbal Rules 2"}]',
  '[{"id":"doc-shravan-age","name":"Age Proof (Election Card / Birth Certificate)","description":"Confirming age >= 65","requirementType":"mandatory","issuingAuthority":"Election Commission","sourceEvidence":"Shravanbal Doc 1"},{"id":"doc-shravan-income","name":"Income Certificate from Tehsildar","description":"Showing family income <= ₹21,000/yr","requirementType":"mandatory","issuingAuthority":"Tehsildar","sourceEvidence":"Shravanbal Doc 2"}]',
  '[{"stepNumber":1,"title":"Apply at Setu Suvidha Kendra / Tehsil Office","description":"Submit filled application form with age and residence proof.","channel":"meeseva_csc"},{"stepNumber":2,"title":"Approval by Taluka Sanjay Gandhi Committee","description":"Committee evaluates claims and sanctions pension order.","channel":"district_office"},{"stepNumber":3,"title":"Monthly Bank Account Credit","description":"Pension credited on 1st week of every month directly to savings account.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  'up-gopalak-dairy-loan',
  'uttar-pradesh-mukhyamantri-gopalak-yojana',
  'Uttar Pradesh Mukhyamantri Gopalak Yojana (Dairy Farming Enterprise Loan)',
  'Bank loan up to ₹9 Lakhs with capital subsidy up to ₹1.80 Lakhs (₹40,000/year for 5 years) to set up modern dairy farms with 10-12 milch cows.',
  'Administered by the Animal Husbandry Department in UP, Gopalak Yojana encourages unemployed youth and farmers to establish commercial dairy units with 10-12 indigenous high-yielding cows/buffaloes, providing up to ₹9 Lakhs bank finance and state interest/capital subsidy.',
  'agriculture',
  'state',
  'Uttar Pradesh',
  'Animal Husbandry Department, Government of Uttar Pradesh',
  'Animal Husbandry Department, Government of Uttar Pradesh',
  'https://animalhusb.upsdc.gov.in',
  'free_verified',
  'Bank loan up to ₹9,00,000 with state government subsidy of ₹1,80,000 (paid as ₹40,000/year for 5 years directly to bank loan account).',
  'Unemployed youth or farmer resident of UP having own/leased land for cattle shed and minimum 5 animals to expand to 10-12 milch animals.',
  '[{"id":"rule-state-equals","parameter":"state","operator":"EQUALS","expectedValue":"Uttar Pradesh","isMandatory":true,"conditionName":"UP Domicile","sourceClause":"Gopalak Rules Clause 1"}]',
  '[{"id":"doc-gopalak-dpr","name":"Dairy Farm Detailed Project Report","description":"Prepared with Veterinary Officer","requirementType":"mandatory","issuingAuthority":"Chief Veterinary Officer","sourceEvidence":"Gopalak Form A"},{"id":"doc-gopalak-land","name":"Land Records / Shed Proof","description":"Showing space for cattle shed and fodder","requirementType":"mandatory","issuingAuthority":"Tahsildar","sourceEvidence":"Gopalak Form B"}]',
  '[{"stepNumber":1,"title":"Apply at Chief Veterinary Officer (CVO) Office","description":"Submit application through local Veterinary Hospital in your block.","channel":"district_office"},{"stepNumber":2,"title":"District Level Committee Approval","description":"CDO and CVO committee interviews candidate and forwards file to bank.","channel":"district_office"},{"stepNumber":3,"title":"Bank Sanction & Subsidy Credit","description":"Bank disburses ₹9 Lakh loan to purchase certified milch cows; state credits subsidy annually.","channel":"online_portal"}]',
  CURRENT_TIMESTAMP
);

