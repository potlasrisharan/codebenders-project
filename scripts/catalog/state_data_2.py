"""
scripts/catalog/state_data_2.py
Part 2 of comprehensive State Government flagship schemes (North, East, Central & North East India).
"""

from .builder import make_scheme, make_rule, make_doc, make_step

STATE_SCHEMES_PART2 = [
    # ==========================================
    # UTTAR PRADESH (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="up-swami-vivekanand-tablets",
        slug="up-swami-vivekanand-yuva-sashaktikaran-smartphones-tablets",
        name="Uttar Pradesh Swami Vivekanand Yuva Sashaktikaran Yojana (Free Tablets & Smartphones)",
        short_description="100% free distribution of branded Android tablets and smartphones to higher education and diploma college students across Uttar Pradesh.",
        full_description="To digitally empower students pursuing higher education, technical courses (ITI, Polytechnic), medical, and skill development programs, Government of Uttar Pradesh provides free high-performance tablets and smartphones with preloaded educational applications.",
        category="education_aid",
        jurisdiction="state",
        state="Uttar Pradesh",
        department="Department of IT and Electronics, Government of Uttar Pradesh",
        portal_url="https://digishakti.up.gov.in",
        benefit_details="Free branded Android Tablet (for professional/technical students) or Smartphone (for general graduation students) with 1-year warranty and free digital learning content.",
        eligibilitySummary="Student enrolled in final year or pursuing graduation, post-graduation, ITI, polytechnic, medical, nursing, or skill certification in an accredited college in Uttar Pradesh.",
        rules=[
            make_rule("state", "EQUALS", "Uttar Pradesh", "UP Resident", "DigiShakti Rules 1"),
            make_rule("collegeEnrolled", "EQUALS", True, "Enrolled in Higher Education College in UP", "DigiShakti Rules 2"),
        ],
        documents=[
            make_doc("doc-up-bonafide", "College Student Identity Card & Enrollment Slip", "Uploaded by college on DigiShakti", "College Principal", "DigiShakti Doc 1"),
        ],
        steps=[
            make_step(1, "Data Upload by College", "College nodal officer uploads verified student database onto the DigiShakti portal.", "college_cell"),
            make_step(2, "District Level Screening", "District Magistrate led committee approves device distribution rosters.", "district_office"),
            make_step(3, "Device Distribution Camp", "Students receive free tablet/smartphone during campus distribution event.", "college_cell"),
        ]
    ),
    make_scheme(
        id="up-abhyudaya-free-coaching",
        slug="up-mukhyamantri-abhyudaya-free-coaching-scheme",
        name="Uttar Pradesh Mukhyamantri Abhyudaya Yojana (Free Competitive Coaching)",
        short_description="100% free classroom and online coaching by IAS/IPS officers and subject experts for UPSC, UPPSC, JEE, NEET, CDS, and NDA with free tablet grant.",
        full_description="Mukhyamantri Abhyudaya Yojana provides free state-level guidance, study materials, physical classroom lectures by serving civil servants, and virtual e-learning platforms for talented youth preparing for competitive examinations who cannot afford costly private coaching.",
        category="education_aid",
        jurisdiction="state",
        state="Uttar Pradesh",
        department="Social Welfare Department, Government of Uttar Pradesh",
        portal_url="https://abhyuday.up.gov.in",
        benefit_details="Free physical and virtual coaching, free mock tests, access to digital e-library, and tablet grant for top performing enrolled aspirants.",
        eligibilitySummary="Resident of Uttar Pradesh preparing for competitive entrance examinations (Civil Services, JEE, NEET, Defense, Banking) selected through state eligibility test.",
        rules=[
            make_rule("state", "EQUALS", "Uttar Pradesh", "UP Domicile", "Abhyudaya Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-abhyudaya-domicile", "UP Domicile / Aadhaar Card", "Proof of residency", "Revenue Dept", "Abhyudaya Checklist 1"),
        ],
        steps=[
            make_step(1, "Online Registration on Abhyudaya Portal", "Register profile and choose target examination coaching track.", "online_portal", "https://abhyuday.up.gov.in"),
            make_step(2, "Appear for Online Screening Exam", "Take state entrance test to qualify for physical classroom batch.", "online_portal"),
            make_step(3, "Attend Offline / Online Classes", "Attend daily evening classes at divisional headquarters.", "district_office"),
        ]
    ),
    make_scheme(
        id="up-bc-sakhi-yojana",
        slug="uttar-pradesh-bc-sakhi-banking-correspondent-yojana",
        name="Uttar Pradesh BC Sakhi Yojana (Banking Correspondent Women Livelihood)",
        short_description="Direct monthly stipend of ₹4,000 for 6 months + ₹75,000 subsidized loan for POS device and micro-ATM equipment for rural women banking correspondents.",
        full_description="BC Sakhi Yojana trains rural women Self Help Group members to operate as doorstep banking correspondents in every Gram Panchayat of Uttar Pradesh, providing cash withdrawals, DBT pensions, bill payments, and doorstep savings services while earning commission and stipends.",
        category="livelihood",
        jurisdiction="state",
        state="Uttar Pradesh",
        department="Rural Development Department / UPSRLM, Government of Uttar Pradesh",
        portal_url="https://upsrlm.up.gov.in",
        benefit_details="₹4,000/month stipend for the first 6 months, ₹75,000 loan assistance for micro-ATM hardware/laptop, IIBF banking certification, and transaction commission.",
        eligibilitySummary="Woman resident of target Gram Panchayat aged 18 to 50 years, minimum 10th class pass, proficient in operating smartphones and electronic transactions.",
        rules=[
            make_rule("state", "EQUALS", "Uttar Pradesh", "UP Gram Panchayat Resident", "BC Sakhi Clause 2.1"),
            make_rule("gender", "EQUALS", "female", "Female Candidate", "BC Sakhi Clause 2.2"),
            make_rule("minClass10Pass", "EQUALS", True, "Minimum 10th Class Pass", "BC Sakhi Clause 2.3"),
        ],
        documents=[
            make_doc("doc-bcsakhi-edu", "Class 10 Marksheet & Certificate", "Proof of educational qualification", "UP Board / CBSE", "BC Sakhi Checklist 1"),
            make_doc("doc-bcsakhi-aadhaar", "Aadhaar Card and Mobile Number", "Identity proof", "UIDAI", "BC Sakhi Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply on UP BC Sakhi Mobile App", "Download official mobile app from Google Play and complete psychometric survey.", "online_portal"),
            make_step(2, "RSETI Training & IIBF Certification", "Undergo mandatory 6-day residential banking training and clear IIBF exam.", "college_cell"),
            make_step(3, "Deployment in Village", "Receive Micro-ATM terminal and commence doorstep banking in allotted Gram Panchayat.", "district_office"),
        ]
    ),

    # ==========================================
    # MADHYA PRADESH
    # ==========================================
    make_scheme(
        id="mp-ladli-behna",
        slug="madhya-pradesh-mukhyamantri-ladli-behna-yojana",
        name="Madhya Pradesh Mukhyamantri Ladli Behna Yojana",
        short_description="Direct monthly financial support of ₹1,250 per month (₹15,000/year) transferred on the 10th of every month to eligible married women in MP.",
        full_description="Ladli Behna Yojana is MP's flagship socio-economic transformation initiative providing monthly DBT cash transfers of ₹1,250 to married, widowed, and divorced women to foster nutritional self-sufficiency, financial autonomy, and decision-making.",
        category="welfare",
        jurisdiction="state",
        state="Madhya Pradesh",
        department="Women and Child Development Department, Government of Madhya Pradesh",
        portal_url="https://cmladlibehna.mp.gov.in",
        benefit_details="₹1,250 per month (paid on the 10th of every month) credited directly to beneficiary's Aadhaar-linked DBT bank account.",
        eligibilitySummary="Married woman resident of MP aged 21 to 60 years, whose family annual income <= ₹2.5 Lakhs, owning less than 5 acres of agricultural land, and not paying income tax.",
        rules=[
            make_rule("state", "EQUALS", "Madhya Pradesh", "MP Domicile", "Ladli Behna Criteria 1"),
            make_rule("gender", "EQUALS", "female", "Female Resident", "Ladli Behna Criteria 2"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 21, "Minimum Age 21 Years", "Ladli Behna Criteria 3"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 250000, "Annual Family Income <= ₹2.5 Lakhs", "Ladli Behna Criteria 4"),
        ],
        documents=[
            make_doc("doc-mp-samagra", "Samagra Family ID (9-Digit Samagra ID)", "E-KYC verified Samagra profile", "Panchayat / Samagra Portal", "Ladli Behna Checklist 1"),
            make_doc("doc-mp-aadhaar-dbt", "Aadhaar Card Linked Bank Account", "Active Aadhaar Payment Bridge (APB) seeding", "Bank Branch", "Ladli Behna Checklist 2"),
        ],
        steps=[
            make_step(1, "Complete Samagra e-KYC", "Link Aadhaar with Samagra ID via OTP or biometric at CSC or Gram Panchayat.", "meeseva_csc"),
            make_step(2, "Submit Form at Camp", "Village secretary / Anganwadi worker enters form and takes live photo.", "district_office"),
            make_step(3, "Monthly Transfer on 10th", "Automatic ₹1,250 DBT credit to bank account on the 10th of every month.", "online_portal", "https://cmladlibehna.mp.gov.in"),
        ]
    ),
    make_scheme(
        id="mp-medhavi-vidyarthi",
        slug="madhya-pradesh-mukhyamantri-medhavi-vidyarthi-yojana-mmvy",
        name="Madhya Pradesh Mukhyamantri Medhavi Vidyarthi Yojana (MMVY)",
        short_description="100% full tuition fee payment for meritorious students securing admission in IITs, AIIMS, NITs, NLUs, Medical, and Engineering colleges.",
        full_description="MMVY ensures that no talented student in Madhya Pradesh is deprived of premier higher education due to financial constraints. The MP Government pays 100% of the tuition fees for students securing admission to IITs, AIIMS, premier NLUs, government medical colleges, or engineering colleges.",
        category="scholarship",
        jurisdiction="state",
        state="Madhya Pradesh",
        department="Department of Technical Education, Skill Development and Employment, Govt of MP",
        portal_url="https://scholarshipportal.mp.nic.in/MedhaviChhatra",
        benefit_details="100% government payment of actual college tuition fees (up to ₹1.5 Lakhs in private engineering, full in government medical and national institutes like IITs).",
        eligibilitySummary="MP domicile who scored >= 70% (MP Board) or >= 85% (CBSE/ICSE) in Class 12, family income <= ₹6 Lakhs, admitted to recognized degree courses.",
        rules=[
            make_rule("state", "EQUALS", "Madhya Pradesh", "MP Domicile", "MMVY Rules Clause 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 600000, "Annual Family Income <= ₹6 Lakhs", "MMVY Rules Clause 2"),
        ],
        documents=[
            make_doc("doc-mmvy-marksheet", "Class 12 Marksheet (>= 70% MPBSE or >= 85% CBSE)", "Showing merit percentile", "State Board / CBSE", "MMVY Checklist 1"),
            make_doc("doc-mmvy-admission", "Allotment Letter & College Fee Structure", "Admission proof for engineering/medical/degree", "College Principal", "MMVY Checklist 2"),
        ],
        steps=[
            make_step(1, "Register on MP Scholarship Portal", "Login to portal and choose Mukhyamantri Medhavi Vidyarthi Scheme.", "online_portal", "https://scholarshipportal.mp.nic.in/MedhaviChhatra"),
            make_step(2, "Upload Admission & Marksheet Details", "Provide entrance exam rank (JEE/NEET/CLAT) and college fee structure.", "online_portal"),
            make_step(3, "Treasury Fee Reimbursement", "State sanctioning authority transfers tuition fees directly to the institution bank account.", "college_cell"),
        ]
    ),
    make_scheme(
        id="mp-seekho-kamao-yojana",
        slug="madhya-pradesh-mukhyamantri-seekho-kamao-yojana-mmsky",
        name="Madhya Pradesh Mukhyamantri Seekho Kamao Yojana (Learn and Earn)",
        short_description="Monthly stipend of ₹8,000 to ₹10,000 per month for youth undergoing on-the-job industrial skill training across 700+ sectors in MP.",
        full_description="Seekho Kamao Yojana bridges the industry-academia skill gap by placing youth in registered enterprises for live on-the-job training (OJT), with the MP Government co-funding 75% of the monthly stipend directly into the trainee's bank account via DBT.",
        category="livelihood",
        jurisdiction="state",
        state="Madhya Pradesh",
        department="Madhya Pradesh State Skill Development and Employment Generation Board",
        portal_url="https://mmsky.mp.gov.in",
        benefit_details="Monthly stipend: ₹8,000 (Class 12 pass), ₹8,500 (ITI pass), ₹9,000 (Diploma pass), and ₹10,000 (Graduate/Post-Graduate) for up to 1 year.",
        eligibilitySummary="MP domicile youth aged 18 to 29 years, passed Class 12 / ITI / Diploma / Degree, not currently in regular government or formal wage employment.",
        rules=[
            make_rule("state", "EQUALS", "Madhya Pradesh", "MP Domicile", "MMSKY Clause 2.1"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Age 18-29 Years", "MMSKY Clause 2.2"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 29, "Maximum Age 29 Years", "MMSKY Clause 2.3"),
        ],
        documents=[
            make_doc("doc-mmsky-samagra", "Samagra ID and Aadhaar Card", "E-KYC verified identity", "Panchayat / UIDAI", "MMSKY Doc 1"),
            make_doc("doc-mmsky-degree", "Educational Qualification Degree / Diploma / ITI", "Certificate of highest education", "University / ITI", "MMSKY Doc 2"),
        ],
        steps=[
            make_step(1, "Candidate Registration on MMSKY Portal", "Create candidate profile, select vocational interests and target district.", "online_portal", "https://mmsky.mp.gov.in"),
            make_step(2, "Apply to Registered Industry Vacancies", "Choose from available on-the-job training openings in private/public firms.", "online_portal"),
            make_step(3, "Contract Execution & Monthly DBT", "Sign training agreement; state government transfers 75% stipend directly via DBT.", "district_office"),
        ]
    ),

    # ==========================================
    # RAJASTHAN
    # ==========================================
    make_scheme(
        id="rj-ayushman-swasthya-bima",
        slug="rajasthan-mukhya-mantri-ayushman-arogya-yojana",
        name="Rajasthan Mukhya Mantri Ayushman Arogya Yojana (MAA Yojana)",
        short_description="Cashless hospital treatment up to ₹25 Lakhs per family per year and organ transplant coverage across private and government hospitals in Rajasthan.",
        full_description="Rajasthan's universal health insurance scheme (formerly Chiranjeevi) provides unprecedented health coverage of up to ₹25,00,000 per family per year across 1,800+ medical and surgical packages, including cochlear implants, heart, liver, and bone marrow transplants.",
        category="healthcare",
        jurisdiction="state",
        state="Rajasthan",
        department="Rajasthan State Health Assurance Agency (RSHAA)",
        portal_url="https://health.rajasthan.gov.in",
        benefit_details="Cashless medical and surgical cover up to ₹25,00,000 per family per year in empanelled hospitals, plus ₹10 Lakh accidental insurance cover.",
        eligibilitySummary="All residents of Rajasthan enrolled via Jan Aadhaar Card. Free for NFSA, SECC, small farmers, and contract workers; other families can enroll at nominal ₹850/year premium.",
        rules=[
            make_rule("state", "EQUALS", "Rajasthan", "Rajasthan Resident with Jan Aadhaar", "MAA Yojana Guidelines 1"),
        ],
        documents=[
            make_doc("doc-rj-janaadhaar", "Jan Aadhaar Card", "Mandatory Rajasthan resident family digital card", "Jan Aadhaar Authority", "MAA Doc 1"),
        ],
        steps=[
            make_step(1, "Approach Empanelled Hospital Swasthya Margdarshak", "Visit help desk at any empaneled government or private hospital in Rajasthan.", "district_office"),
            make_step(2, "Jan Aadhaar Authentication", "Instant biometric/OTP verification of family membership.", "online_portal"),
            make_step(3, "Cashless Treatment & Medication", "Hospital provides complete cashless surgery, medications, and diagnostics up to ₹25 Lakhs.", "district_office"),
        ]
    ),
    make_scheme(
        id="rj-anupriti-free-coaching",
        slug="rajasthan-mukhyamantri-anupriti-coaching-yojana",
        name="Rajasthan Mukhyamantri Anupriti Coaching Yojana",
        short_description="100% free coaching at top coaching institutes for UPSC, RAS, JEE, NEET, CLAT, REET, and CA with ₹40,000 annual boarding allowance for outstation students.",
        full_description="Anupriti Coaching Yojana sponsors 30,000 meritorious underprivileged students every year for premier coaching for professional entrance exams, paying the entire coaching fees directly to premier private institutes like Allen, Resonance, Drishti IAS, etc., plus living costs.",
        category="education_aid",
        jurisdiction="state",
        state="Rajasthan",
        department="Social Justice and Empowerment Department, Government of Rajasthan",
        portal_url="https://sje.rajasthan.gov.in",
        benefit_details="Full coaching fees paid directly to top institute + ₹40,000 per annum living/boarding allowance for outstation students admitted to coaching in major cities (Jaipur, Kota, Jodhpur).",
        eligibilitySummary="Rajasthan domicile belonging to SC, ST, OBC, MBC, EWS, or Minority, with family annual income <= ₹8 Lakhs, selected on merit of Class 10/12 marks.",
        rules=[
            make_rule("state", "EQUALS", "Rajasthan", "Rajasthan Domicile", "Anupriti Criteria 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Annual Family Income <= ₹8 Lakhs", "Anupriti Criteria 2"),
        ],
        documents=[
            make_doc("doc-rj-janaadhaar-id", "Jan Aadhaar Card", "Identity and residence proof", "Jan Aadhaar Portal", "Anupriti Checklist 1"),
            make_doc("doc-rj-marksheet", "Class 10 / 12 Marksheet", "For merit ranking", "RBSE / CBSE", "Anupriti Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online on SJMS Portal", "Login via Rajasthan SSO and submit Anupriti online application.", "online_portal", "https://sso.rajasthan.gov.in"),
            make_step(2, "Merit List Generation", "Department publishes course-wise and category-wise cut-off merit lists.", "online_portal"),
            make_step(3, "Join Empanelled Coaching Centre", "Join allotted coaching institute; fees paid by state treasury and living allowance credited via DBT.", "college_cell"),
        ]
    ),
    make_scheme(
        id="rj-palanhar-yojana",
        slug="rajasthan-palanhar-yojana-child-care",
        name="Rajasthan Palanhar Yojana (Vulnerable Children Care Assistance)",
        short_description="Monthly financial allowance of ₹1,500 to ₹2,500 per child plus ₹2,000 annual clothing/school kit grant for relatives caring for orphan children.",
        full_description="Palanhar Yojana provides institutional family-care assistance by paying monthly allowances to foster parents, relatives, or guardians caring for orphans, children of life imprisonment convicts, AIDS patients, or widows, ensuring the child receives continuous education.",
        category="welfare",
        jurisdiction="state",
        state="Rajasthan",
        department="Social Justice and Empowerment Department, Government of Rajasthan",
        portal_url="https://sje.rajasthan.gov.in/Default.aspx?PageID=41",
        benefit_details="Monthly allowance: ₹1,500/child (ages 0-6 years) and ₹2,500/child (ages 6-18 years enrolled in school) + ₹2,000 annual lump sum for shoes, books, and clothing.",
        eligibilitySummary="Caregiver (Palanhar) residing in Rajasthan taking care of orphan children or children of eligible vulnerable categories, family income <= ₹1.2 Lakhs/year.",
        rules=[
            make_rule("state", "EQUALS", "Rajasthan", "Rajasthan Domicile", "Palanhar Rules Clause 2"),
            make_rule("childSchoolEnrollment", "EQUALS", True, "Mandatory School Enrollment (for ages 6+)", "Palanhar Rules Clause 3"),
        ],
        documents=[
            make_doc("doc-palanhar-death", "Parents' Death Certificate / Judicial Order", "Proof of orphan status or conviction order", "Municipal Authority / Court", "Palanhar Form A"),
            make_doc("doc-palanhar-school", "Annual School Bonafide Certificate", "Showing regular attendance in school", "School Headmaster", "Palanhar Form B"),
        ],
        steps=[
            make_step(1, "Apply on E-Mitra / SSO Portal", "Submit Palanhar application online through any E-Mitra kiosk.", "meeseva_csc", "https://sso.rajasthan.gov.in"),
            make_step(2, "Verification by Child Development Project Officer", "Field inspection confirms child is living with guardian and attending school.", "district_office"),
            make_step(3, "Monthly DBT Transfer", "Direct benefit credited into caregiver's bank account every month.", "online_portal"),
        ]
    ),

    # ==========================================
    # BIHAR
    # ==========================================
    make_scheme(
        id="br-kanya-utthan",
        slug="bihar-mukhyamantri-kanya-utthan-yojana",
        name="Bihar Mukhyamantri Kanya Utthan Yojana (Complete Girl Child Empowerment)",
        short_description="Cumulative financial assistance up to ₹54,100 from birth up to college graduation (including ₹50,000 on graduating) for girl students in Bihar.",
        full_description="Mukhyamantri Kanya Utthan Yojana provides graded cash incentives at every milestone of a girl's life (birth, vaccination, intermediate pass ₹25,000, and college graduation ₹50,000) to eliminate female foeticide, stop child marriage, and achieve 100% higher education among girls.",
        category="welfare",
        jurisdiction="state",
        state="Bihar",
        department="Education Department & Social Welfare Department, Government of Bihar",
        portal_url="https://medhasoft.bih.nic.in",
        benefit_details="₹54,100 cumulative support: ₹2,000 on birth, ₹1,000 on Aadhaar linking, ₹2,000 on full immunization, ₹25,000 on passing Class 12 (unmarried), and ₹50,000 upon passing Graduation degree.",
        eligibilitySummary="Girl student resident of Bihar passing intermediate (unmarried) or graduating (married or unmarried) from a recognized university in Bihar.",
        rules=[
            make_rule("state", "EQUALS", "Bihar", "Bihar Domicile", "Kanya Utthan Rules 1"),
            make_rule("gender", "EQUALS", "female", "Female Beneficiary", "Kanya Utthan Rules 2"),
        ],
        documents=[
            make_doc("doc-br-grad-marksheet", "Graduation Degree Marksheet & Certificate", "Passed from recognized Bihar university", "University Registrar", "Medhasoft Doc 1"),
            make_doc("doc-br-residential", "Bihar Residential / Domicile Certificate", "Proof of Bihar permanent residence", "Circle Officer (CO)", "Medhasoft Doc 2"),
        ],
        steps=[
            make_step(1, "Register on Medhasoft Portal", "Enter University registration number and Aadhaar details.", "online_portal", "https://medhasoft.bih.nic.in"),
            make_step(2, "University Result Validation", "University verifies marksheet and enrollment data online.", "college_cell"),
            make_step(3, "₹50,000 Direct DBT Credit", "State treasury directly credits ₹50,000 into the girl student's personal bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="br-student-credit-card",
        slug="bihar-student-credit-card-yojana-bsccy",
        name="Bihar Student Credit Card Yojana (BSCCY)",
        short_description="State-guaranteed education loan up to ₹4 Lakhs at a nominal 1% interest rate for girls/transgender and 4% for boys for 40+ professional courses.",
        full_description="Part of Bihar's 'Saat Nischay' initiative, BSCCY provides education loans up to ₹4,00,000 with 100% Bihar Government guarantee for pursuing polytechnic, engineering, management, nursing, and general degrees without requiring any mortgage collateral.",
        category="education_aid",
        jurisdiction="state",
        state="Bihar",
        department="Bihar State Education Finance Corporation (BSEFC)",
        portal_url="https://www.7nishchay-yuvaupmission.bihar.gov.in",
        benefit_details="Loan up to ₹4,00,000 at 1% simple interest for women, PwD, and transgender students (4% simple interest for men). Repayment begins 1 year after course completion or getting a job.",
        eligibilitySummary="Resident of Bihar aged up to 25 years who passed Class 12 and gained admission into recognized higher education courses in Bihar or anywhere in India.",
        rules=[
            make_rule("state", "EQUALS", "Bihar", "Bihar Domicile", "BSCCY Rules Clause 2"),
            make_rule("maxAgeYears", "LESS_THAN_OR_EQUAL", 25, "Maximum Age 25 Years at Application", "BSCCY Rules Clause 3"),
        ],
        documents=[
            make_doc("doc-bsccy-allotment", "College Admission Proof & Fee Schedule", "Prospectus and detailed annual fee schedule", "College Principal", "BSCCY Checklist 1"),
            make_doc("doc-bsccy-domicile", "Residential Certificate of Bihar", "Issued by Circle Officer", "Revenue Dept Bihar", "BSCCY Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online on MNSSBY Portal", "Register on Mukhyamantri Nishchay Swayam Sahayata Bhatta portal.", "online_portal", "https://www.7nishchay-yuvaupmission.bihar.gov.in"),
            make_step(2, "Visit District Registration and Counseling Centre (DRCC)", "Submit self-attested copies of documents for physical counter verification.", "district_office"),
            make_step(3, "Sanction & Direct Fee Disbursal", "BSEFC sanctions card and disburses course fees directly to college semester by semester.", "online_portal"),
        ]
    ),
    make_scheme(
        id="br-mukhyamantri-udyami",
        slug="bihar-mukhyamantri-udyami-yojana",
        name="Bihar Mukhyamantri Udyami Yojana (SC/ST/EBC/Women/Youth)",
        short_description="₹10 Lakhs financial package (₹5 Lakhs free grant + ₹5 Lakhs loan at 0% to 1% interest) to start manufacturing or processing micro-enterprises.",
        full_description="Administered by the Department of Industries in Bihar, this flagship industrial entrepreneurship scheme gives ₹10,00,000 to new entrepreneurs, with 50% (₹5 Lakhs) as 100% non-repayable grant and remaining ₹5 Lakhs as interest-free loan (0% for SC/ST/Women, 1% for General/OBC youth) repayable in 84 installments.",
        category="livelihood",
        jurisdiction="state",
        state="Bihar",
        department="Department of Industries, Government of Bihar",
        portal_url="https://udyami.bihar.gov.in",
        benefit_details="₹10,00,000 project capital: ₹5,00,000 direct non-repayable government grant + ₹5,00,000 soft loan at 0% (SC/ST/Women/EBC) or 1% (Youth) repayable over 7 years.",
        eligibilitySummary="Permanent resident of Bihar, minimum 10+2 / Intermediate / ITI / Polytechnic / Diploma passed, aged 18 to 50 years, intending to setup an enterprise in approved 102 project trades.",
        rules=[
            make_rule("state", "EQUALS", "Bihar", "Bihar Resident", "Udyami Guidelines Clause 2.1"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Age 18 to 50 Years", "Udyami Guidelines Clause 2.2"),
            make_rule("minEducation10Plus2", "EQUALS", True, "Minimum Intermediate / ITI Pass", "Udyami Guidelines Clause 2.3"),
        ],
        documents=[
            make_doc("doc-udyami-current-account", "Firm / Sole Proprietorship Current Account", "Active current bank account in name of enterprise", "Commercial Bank", "Udyami Checklist 1"),
            make_doc("doc-udyami-caste-domicile", "Caste and Residential Certificate", "Digital certificate issued by Circle Officer", "CO / Revenue Officer", "Udyami Checklist 2"),
        ],
        steps=[
            make_step(1, "Online Application on Udyami Portal", "Submit DPR and select from 102 approved manufacturing trades.", "online_portal", "https://udyami.bihar.gov.in"),
            make_step(2, "Computerized Lottery Selection", "Transparent randomized computerized lottery selects beneficiaries.", "online_portal"),
            make_step(3, "Mandatory Training & Tranche Disbursal", "Complete 2-week training at prestigious institute; receive ₹10 Lakhs in three tranches.", "district_office"),
        ]
    ),

    # ==========================================
    # ODISHA
    # ==========================================
    make_scheme(
        id="od-subhadra-yojana",
        slug="odisha-subhadra-yojana-women-empowerment",
        name="Odisha Subhadra Yojana (Flagship Women Empowerment Mission)",
        short_description="Financial grant of ₹50,000 over 5 years (₹10,000/year in 2 equal installments on Rakhi Purnima & International Women's Day) for 1 Crore women in Odisha.",
        full_description="Subhadra Yojana is Odisha's transformative women's welfare guarantee providing ₹50,000 directly via DBT to over 1 Crore women aged 21-60 years to foster entrepreneurship, financial inclusion, and social dignity.",
        category="welfare",
        jurisdiction="state",
        state="Odisha",
        department="Women and Child Development Department, Government of Odisha",
        portal_url="https://subhadra.odisha.gov.in",
        benefit_details="₹50,000 direct financial assistance disbursed in 10 installments of ₹5,000 each over 5 years (paid on Raksha Bandhan and International Women's Day), plus ₹500 digital transaction incentive for top digital payees.",
        eligibilitySummary="Woman resident of Odisha aged 21 to 60 years whose family does not pay income tax and does not own more than 5 acres of irrigated or 10 acres of un-irrigated land.",
        rules=[
            make_rule("state", "EQUALS", "Odisha", "Odisha Domicile", "Subhadra Guidelines Section 2"),
            make_rule("gender", "EQUALS", "female", "Female Beneficiary", "Subhadra Guidelines Section 3"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 21, "Age 21-60 Years", "Subhadra Guidelines Section 4"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 60, "Maximum Age 60 Years", "Subhadra Guidelines Section 5"),
        ],
        documents=[
            make_doc("doc-od-aadhaar-dbt", "Aadhaar Card Linked Bank Account", "Active single savings account with DBT mandate", "Commercial Bank", "Subhadra Doc 1"),
            make_doc("doc-od-ration", "National Food Security Card / Ration Card", "Household verification", "Civil Supplies Odisha", "Subhadra Doc 2"),
        ],
        steps=[
            make_step(1, "Apply Online on Subhadra Portal or Mo Seva Kendra", "Fill offline or digital application with Aadhaar authentication.", "meeseva_csc", "https://subhadra.odisha.gov.in"),
            make_step(2, "Field Verification & Approval", "Block Development Officer (BDO) validates land and income eligibility.", "district_office"),
            make_step(3, "Direct Bank Transfer of Installments", "₹5,000 credited automatically on Rakhi Purnima and Women's Day.", "online_portal"),
        ]
    ),
    make_scheme(
        id="od-kalia-farmers",
        slug="odisha-kalia-scheme-krushak-assistance",
        name="Odisha KALIA Scheme (Krushak Assistance for Livelihood and Income Augmentation)",
        short_description="Financial assistance of ₹10,000 per year for small/marginal farmers and ₹12,500 one-time livelihood grant for landless agricultural households.",
        full_description="KALIA provides comprehensive financial support for cultivation inputs to small and marginal farmers, financial assistance to landless agricultural labourers, and interest-free crop loans up to ₹1,00,000 across Odisha.",
        category="agriculture",
        jurisdiction="state",
        state="Odisha",
        department="Department of Agriculture and Farmers' Empowerment, Government of Odisha",
        portal_url="https://kalia.odisha.gov.in",
        benefit_details="₹10,000 per family per year for small and marginal farmers (₹5,000 each for Kharif and Rabi); ₹12,500 livelihood package for landless households.",
        eligibilitySummary="Small & marginal farmers, landless agricultural labourers, and vulnerable agricultural households domiciled in Odisha.",
        rules=[
            make_rule("state", "EQUALS", "Odisha", "Odisha Domicile", "KALIA Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-kalia-land", "Record of Rights (RoR / Patta)", "Proof of agricultural land for small farmers", "Revenue Dept Odisha", "KALIA Checklist 1"),
        ],
        steps=[
            make_step(1, "Enrolment through KALIA Portal or PACS", "Submit self-declaration and bank details.", "online_portal", "https://kalia.odisha.gov.in"),
            make_step(2, "Gram Panchayat Vetting", "Panchayat nodal committee displays draft list in village.", "district_office"),
            make_step(3, "Seasonal Direct Benefit Transfer", "Funds deposited in bank account before sowing seasons.", "online_portal"),
        ]
    ),

    # ==========================================
    # WEST BENGAL (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="wb-student-credit-card",
        slug="west-bengal-student-credit-card-scheme-wbscc",
        name="West Bengal Student Credit Card Scheme (WBSCC)",
        short_description="Collateral-free soft education loan up to ₹10 Lakhs at 4% simple interest with 100% West Bengal State Government guarantee.",
        full_description="WBSCC enables students from West Bengal to pursue secondary, higher secondary, diploma, undergraduate, postgraduate, and professional doctoral degrees in India or abroad, with loan repayment spread over 15 years.",
        category="education_aid",
        jurisdiction="state",
        state="West Bengal",
        department="Higher Education Department, Government of West Bengal",
        portal_url="https://wbscc.wb.gov.in",
        benefit_details="Loan up to ₹10,00,000 with 4% simple interest (interest subvention provided by state if interest paid regularly during study period); 15-year repayment tenure.",
        eligibilitySummary="Indian citizen resident of West Bengal for at least 10 years, aged up to 40 years, enrolled in recognized educational institution in India or abroad.",
        rules=[
            make_rule("state", "EQUALS", "West Bengal", "West Bengal Resident for 10+ Years", "WBSCC Clause 2.1"),
            make_rule("maxAgeYears", "LESS_THAN_OR_EQUAL", 40, "Maximum Age 40 Years", "WBSCC Clause 2.2"),
        ],
        documents=[
            make_doc("doc-wbscc-admission", "College Admission Proof & Fee Schedule", "Showing course fee breakdown", "College / University", "WBSCC Form 1"),
            make_doc("doc-wbscc-residence", "10 Years Residence Proof (Ration Card / Voter ID)", "Confirming 10 years continuous domicile", "Competent Authority", "WBSCC Form 2"),
        ],
        steps=[
            make_step(1, "Online Application on WBSCC Portal", "Register student and co-borrower profile and upload admission documents.", "online_portal", "https://wbscc.wb.gov.in"),
            make_step(2, "Forwarding by Higher Education Department", "College and State Higher Education Department forward approved file to partner bank.", "college_cell"),
            make_step(3, "Credit Card Issuance & Fee Sanction", "Bank issues WBSCC physical/digital card and disburses fee directly to college.", "district_office"),
        ]
    ),
    make_scheme(
        id="wb-krishak-bandhu",
        slug="west-bengal-krishak-bandhu-scheme",
        name="West Bengal Krishak Bandhu (Assured Farm Income & Life Insurance)",
        short_description="Assured financial assistance of ₹10,000/year per acre (min ₹4,000/yr) for all farmers and sharecroppers + ₹2 Lakh life insurance benefit.",
        full_description="Krishak Bandhu provides assured financial assistance in two seasonal installments (Kharif and Rabi) to all farmers and recorded bargadars (sharecroppers), along with death compensation of ₹2,00,000 to the nominee upon farmer's death.",
        category="agriculture",
        jurisdiction="state",
        state="West Bengal",
        department="Department of Agriculture, Government of West Bengal",
        portal_url="https://krishakbandhu.wb.gov.in",
        benefit_details="Financial assistance of ₹10,000 per acre per year (minimum ₹4,000 per year for fractional holdings) paid in two installments, plus ₹2,00,000 life insurance coverage (age 18-60).",
        eligibilitySummary="All farmers, land owners, and recorded bargadars (sharecroppers) holding agricultural land in West Bengal.",
        rules=[
            make_rule("state", "EQUALS", "West Bengal", "West Bengal Domicile", "Krishak Bandhu Criteria 1"),
        ],
        documents=[
            make_doc("doc-kb-ror", "Land Record / RoR (Khatian)", "Proof of cultivable land or bargadar record", "Block Land & Land Reforms Office (BL&LRO)", "Krishak Bandhu Doc 1"),
        ],
        steps=[
            make_step(1, "Submit Application at Duare Sarkar Camp", "Submit Krishak Bandhu form with land record at grassroots Duare Sarkar camp.", "meeseva_csc"),
            make_step(2, "Verification by Assistant Director of Agriculture (ADA)", "Agricultural officers verify land khatian on digital revenue portal.", "district_office"),
            make_step(3, "Direct Bank Transfer", "Funds deposited directly into farmer's bank account before sowing season.", "online_portal", "https://krishakbandhu.wb.gov.in"),
        ]
    ),

    # ==========================================
    # GUJARAT
    # ==========================================
    make_scheme(
        id="gj-vhali-dikri-yojana",
        slug="gujarat-vhali-dikri-yojana-girl-child",
        name="Gujarat Vhali Dikri Yojana (Dear Daughter Empowerment Scheme)",
        short_description="Financial assistance of ₹1,10,000 in three stages (Class 1 admission ₹4,000, Class 9 admission ₹6,000, and ₹1,00,000 at age 18) for girls in Gujarat.",
        full_description="Vhali Dikri Yojana promotes girl child education, prevents child marriage, and enhances female sex ratio in Gujarat by providing financial grants at key educational milestones and a ₹1,00,000 lump sum grant on turning 18.",
        category="welfare",
        jurisdiction="state",
        state="Gujarat",
        department="Women and Child Development Department, Government of Gujarat",
        portal_url="https://wcd.gujarat.gov.in",
        benefit_details="Total ₹1,10,000 assistance: ₹4,000 on admission in Class 1, ₹6,000 on admission in Class 9, and ₹1,00,000 upon reaching 18 years for higher education or marriage.",
        eligibilitySummary="First two daughters of a family residing in Gujarat, family annual income <= ₹2 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Gujarat", "Gujarat Domicile", "Vhali Dikri Rules 1"),
            make_rule("gender", "EQUALS", "female", "Girl Child", "Vhali Dikri Rules 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 200000, "Annual Family Income <= ₹2 Lakhs", "Vhali Dikri Rules 3"),
        ],
        documents=[
            make_doc("doc-gj-birth", "Birth Certificate of Girl Child", "Issued by Municipal Corporation / Gram Panchayat", "Registrar of Births", "Vhali Dikri Form 1"),
            make_doc("doc-gj-income", "Mamlatdar Income Certificate", "Income verification certificate", "Mamlatdar Office", "Vhali Dikri Form 2"),
        ],
        steps=[
            make_step(1, "Apply within 1 Year of Birth", "Submit application at Anganwadi Centre or Taluka Mamlatdar office.", "district_office"),
            make_step(2, "CDPO Verification", "Child Development Project Officer verifies birth and parity of daughter.", "district_office"),
            make_step(3, "Direct Cash Credit & Bond Issuance", "State releases stage installments via DBT and issues maturity bond.", "online_portal"),
        ]
    ),
    make_scheme(
        id="gj-mysy-scholarship",
        slug="gujarat-mukhyamantri-yuva-swavalamban-yojana-mysy",
        name="Gujarat Mukhyamantri Yuva Swavalamban Yojana (MYSY)",
        short_description="50% tuition fee assistance (up to ₹2 Lakhs/year in medical, ₹50,000 in engineering) + ₹12,000 hostel allowance for meritorious students in Gujarat.",
        full_description="MYSY supports students of all categories scoring >= 80 percentile in Class 10/12 to pursue higher professional studies in Gujarat, covering 50% tuition fees, hostel allowance, and book grants.",
        category="scholarship",
        jurisdiction="state",
        state="Gujarat",
        department="Education Department, Government of Gujarat",
        portal_url="https://mysy.guj.nic.in",
        benefit_details="50% tuition fee waiver up to ₹2,00,000/year (Medical/Dental) or ₹50,000/year (Engineering/Pharmacy/Degree), plus ₹12,000 annual hostel allowance and ₹10,000 book grant.",
        eligibilitySummary="Gujarat student scoring >= 80 percentile in Class 10/12 board exam, pursuing regular college degree, family income <= ₹6 Lakhs per year.",
        rules=[
            make_rule("state", "EQUALS", "Gujarat", "Gujarat Domicile", "MYSY Criteria 1"),
            make_rule("percentileMarks", "GREATER_THAN_OR_EQUAL", 80, "Class 10/12 Percentile >= 80", "MYSY Criteria 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 600000, "Annual Family Income <= ₹6 Lakhs", "MYSY Criteria 3"),
        ],
        documents=[
            make_doc("doc-mysy-marksheet", "Class 10 / 12 Board Marksheet with Percentile", "Showing >= 80 percentile", "GSEB / CBSE", "MYSY Checklist 1"),
            make_doc("doc-mysy-income", "Mamlatdar / TDO Income Certificate", "Income proof showing <= ₹6 Lakhs/year", "Mamlatdar", "MYSY Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online on MYSY Portal", "Register with board seat number and admission details.", "online_portal", "https://mysy.guj.nic.in"),
            make_step(2, "Help Centre Document Verification", "Present original documents at empaneled government college help centre.", "college_cell"),
            make_step(3, "Direct Treasury Disbursal", "Tuition subsidy deposited directly into student's bank account.", "online_portal"),
        ]
    ),

    # ==========================================
    # ASSAM & NORTH EAST
    # ==========================================
    make_scheme(
        id="as-orunodoi-3",
        slug="assam-orunodoi-3-flagship-dbt-women",
        name="Assam Orunodoi 3.0 Scheme (Flagship Poverty Alleviation & Nutrition)",
        short_description="Direct unconditional monthly cash transfer of ₹1,250 per month directly to the female head of over 27 Lakh poor households in Assam.",
        full_description="Orunodoi is the largest direct benefit transfer scheme in Assam's history, transferring ₹1,250 on the 10th of every month to nominated female family members to buy essential medicines, pulses, fruits, and sugar.",
        category="welfare",
        jurisdiction="state",
        state="Assam",
        department="Finance Department, Government of Assam",
        portal_url="https://finance.assam.gov.in",
        benefit_details="₹1,250 per month credited directly to the nominated female head of the family's bank account via DBT on the 10th of each month.",
        eligibilitySummary="Permanent resident of Assam whose composite family income is less than ₹2 Lakhs per annum, prioritizing widows, divorced women, un-married women aged 45+, and families with disabled members.",
        rules=[
            make_rule("state", "EQUALS", "Assam", "Assam Domicile", "Orunodoi Guidelines Clause 2"),
            make_rule("gender", "EQUALS", "female", "Nominated Female Beneficiary", "Orunodoi Guidelines Clause 3"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 200000, "Annual Family Income <= ₹2 Lakhs", "Orunodoi Guidelines Clause 4"),
        ],
        documents=[
            make_doc("doc-as-ration", "National Food Security Card / Ration Card", "Ration card proof", "Food & Civil Supplies Assam", "Orunodoi Doc 1"),
            make_doc("doc-as-bank", "Aadhaar Linked Bank Passbook", "Single account in female head's name", "Commercial Bank", "Orunodoi Doc 2"),
        ],
        steps=[
            make_step(1, "Verification by Gaonburah & VCDC", "Gaonburah and Village Council Development Committee identify eligible women.", "district_office"),
            make_step(2, "District Level Committee (DLC) Finalization", "District Commissioner approves finalized beneficiary roll.", "district_office"),
            make_step(3, "Monthly Transfer on 10th", "State finance department releases ₹1,250 DBT on the 10th of every month.", "online_portal", "https://finance.assam.gov.in"),
        ]
    ),
    make_scheme(
        id="as-pragyan-bharati-scooty",
        slug="assam-pragyan-bharati-dr-banikanta-kakati-merit-scooty",
        name="Assam Pragyan Bharati - Dr. Banikanta Kakati Merit Award (Free Scooty)",
        short_description="100% free petrol / electric two-wheeler scooty to meritorious girl students scoring >= 60% and boy students scoring >= 75% in Class 12 exams.",
        full_description="Under the Pragyan Bharati initiative, the Government of Assam distributes free two-wheeler scooties to meritorious students who excel in Higher Secondary examinations conducted by AHSEC to facilitate mobility to college universities.",
        category="education_aid",
        jurisdiction="state",
        state="Assam",
        department="Higher Education Department, Government of Assam",
        portal_url="https://directorateofhighereducation.assam.gov.in",
        benefit_details="Free brand-new two-wheeler Scooty (choice of petrol or electric scooter) with registration, helmet, and 5-year insurance paid by the Assam Government.",
        eligibilitySummary="Students passing Class 12 Higher Secondary from AHSEC with >= 60% (girls) or >= 75% (boys) enrolled in regular degree courses in Assam.",
        rules=[
            make_rule("state", "EQUALS", "Assam", "Assam Domicile", "Pragyan Bharati Criteria 1"),
        ],
        documents=[
            make_doc("doc-scooty-marksheet", "AHSEC Class 12 Marksheet", "Official marksheet showing first division", "AHSEC", "Scooty Checklist 1"),
            make_doc("doc-scooty-college", "Degree College Admission Receipt", "Proof of continuing higher education", "College Principal", "Scooty Checklist 2"),
        ],
        steps=[
            make_step(1, "Selection on SEBA / DHE Portal", "Eligible students select petrol or electric scooter model on portal.", "online_portal"),
            make_step(2, "District Distribution Ceremony", "Collect allocation token and vehicle chassis allotment.", "district_office"),
            make_step(3, "Vehicle Handover from Authorized Dealer", "Take delivery of registered two-wheeler with helmet and insurance documents.", "district_office"),
        ]
    ),

    # ==========================================
    # PUNJAB & HARYANA
    # ==========================================
    make_scheme(
        id="pb-free-power-300-units",
        slug="punjab-free-electricity-300-units-scheme",
        name="Punjab Free Power Scheme (300 Units Zero-Bill Electricity)",
        short_description="100% free domestic electricity up to 300 units per month (600 units bimonthly) resulting in zero electricity bills for over 90% of Punjab households.",
        full_description="The Government of Punjab provides 300 units of completely free domestic electricity every month to domestic electricity consumers across all districts, generating zero bills for millions of households while encouraging solar net-metering.",
        category="welfare",
        jurisdiction="state",
        state="Punjab",
        department="Department of Power, Government of Punjab",
        portal_url="https://pspcl.in",
        benefit_details="100% waiver of electricity bill if bimonthly consumption <= 600 units (300 units/month), including complete waiver of energy charges, meter rent, and electricity duty.",
        eligibilitySummary="All domestic category (DS) electricity consumers in Punjab possessing a residential electricity meter connected with PSPCL.",
        rules=[
            make_rule("state", "EQUALS", "Punjab", "Punjab Domestic Electricity Connection", "PSPCL Tariff Order Clause 4"),
        ],
        documents=[
            make_doc("doc-pb-elec-bill", "PSPCL Consumer Electricity Account Number", "Proof of active domestic connection", "PSPCL", "PSPCL Checklist 1"),
        ],
        steps=[
            make_step(1, "Automatic Application on Meter Reading", "No form required; meter reader records bimonthly consumption.", "meeseva_csc"),
            make_step(2, "Zero Bill Generation", "If consumption <= 600 units in bimonthly cycle, bill is automatically generated at ₹0.", "online_portal", "https://pspcl.in"),
        ]
    ),
    make_scheme(
        id="hr-chirayu-ayushman",
        slug="haryana-chirayu-ayushman-bharat-extension",
        name="Haryana CHIRAYU (Comprehensive Health Insurance Extension)",
        short_description="Cashless hospital treatment up to ₹5 Lakhs per year for all families earning up to ₹3 Lakhs/year integrated with Parivar Pehchan Patra (PPP).",
        full_description="CHIRAYU Haryana expands the Ayushman Bharat PM-JAY entitlement to cover all families in Haryana with verified annual income up to ₹3,00,000 in Parivar Pehchan Patra (PPP), offering cashless secondary and tertiary hospital treatment.",
        category="healthcare",
        jurisdiction="state",
        state="Haryana",
        department="Haryana State Health Authority",
        portal_url="https://chirayuayushman.haryana.gov.in",
        benefit_details="Cashless hospital treatment up to ₹5,00,000 per family per year in empanelled private and civil hospitals across Haryana.",
        eligibilitySummary="Haryana resident family with verified annual family income up to ₹3,00,000 in Parivar Pehchan Patra (PPP).",
        rules=[
            make_rule("state", "EQUALS", "Haryana", "Haryana Resident with PPP", "CHIRAYU Rules 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 300000, "PPP Verified Family Income <= ₹3 Lakhs", "CHIRAYU Rules 2"),
        ],
        documents=[
            make_doc("doc-hr-ppp", "Parivar Pehchan Patra (PPP / Family ID)", "Mandatory family ID card with verified income", "Citizen Resources Information Dept", "CHIRAYU Checklist 1"),
        ],
        steps=[
            make_step(1, "Check Eligibility on Chirayu Portal", "Enter PPP Family ID to verify income verification status.", "online_portal", "https://chirayuayushman.haryana.gov.in"),
            make_step(2, "Generate Golden Card", "Generate Ayushman-Chirayu digital golden card online or at CSC kiosk.", "meeseva_csc"),
            make_step(3, "Avail Cashless Hospitalization", "Show Chirayu card at any empanelled hospital for cashless treatment.", "district_office"),
        ]
    ),

    # ==========================================
    # DELHI & UTs
    # ==========================================
    make_scheme(
        id="dl-jai-bhim-coaching",
        slug="delhi-jai-bhim-mukhyamantri-pratibha-vikas-yojana",
        name="Delhi Jai Bhim Mukhyamantri Pratibha Vikas Yojana",
        short_description="100% free coaching at top private institutes for UPSC, IIT-JEE, NEET, CLAT, and Banking exams with ₹2,500/month stipend for Delhi students.",
        full_description="Administered by the Department of SC/ST Welfare in Delhi, this scheme finances 100% coaching fees at premier institutes in Delhi for students belonging to SC, ST, OBC, and EWS categories, plus provides ₹2,500 monthly travel/study stipend.",
        category="education_aid",
        jurisdiction="state",
        state="Delhi",
        department="Department for Welfare of SC/ST/OBC, Government of NCT of Delhi",
        portal_url="https://scstwelfare.delhi.gov.in",
        benefit_details="100% tuition fees paid directly to empaneled coaching institute (up to ₹1.5 Lakhs) + ₹2,500 monthly stipend paid to student account for travel and books.",
        eligibilitySummary="Resident of Delhi who passed Class 10 and 12 in Delhi, belonging to SC, ST, OBC, or EWS, with family annual income <= ₹8 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Delhi", "Delhi Resident", "Jai Bhim Criteria 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Annual Family Income <= ₹8 Lakhs", "Jai Bhim Criteria 2"),
        ],
        documents=[
            make_doc("doc-delhi-caste", "Caste / EWS Certificate issued by GNCTD", "Issued by Delhi Revenue Dept", "SDM / Tehsildar Delhi", "Jai Bhim Checklist 1"),
            make_doc("doc-delhi-schooling", "Class 10 & 12 Passing Marksheets from Delhi School", "Proof of continuous schooling in Delhi", "CBSE / ICSE", "Jai Bhim Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online on Delhi e-District Portal", "Register using Delhi e-District portal or with empaneled coaching institute.", "online_portal", "https://edistrict.delhigovt.nic.in"),
            make_step(2, "Institute Verification", "Empaneled coaching centre confirms merit ranking and batch schedule.", "college_cell"),
            make_step(3, "Fee Sanction & Monthly Stipend", "Delhi Government pays full course fees directly to coaching institute and credits ₹2,500 monthly stipend.", "online_portal"),
        ]
    ),
    make_scheme(
        id="jk-mumkin-youth-vehicles",
        slug="jammu-kashmir-mission-youth-mumkin-scheme",
        name="Jammu & Kashmir Mission Youth - MUMKIN Scheme (Commercial Vehicles)",
        short_description="100% on-road commercial vehicle financing with 10% upfront subsidy from vehicle manufacturer and 10% cash subsidy from J&K Government.",
        full_description="Under Mission Youth J&K, MUMKIN enables unemployed youth aged 18-35 to become self-reliant transport entrepreneurs by providing financial assistance to acquire commercial small commercial vehicles (mini-trucks, pick-up vans) without initial capital investment.",
        category="livelihood",
        jurisdiction="state",
        state="Jammu and Kashmir",
        department="Mission Youth, Government of Jammu and Kashmir",
        portal_url="https://missionyouth.jk.gov.in",
        benefit_details="20% upfront subsidy (10% from vehicle manufacturer like Tata/Mahindra + 10% or ₹80,000 from Mission Youth J&K); remaining 80% financed via subsidized bank loan.",
        eligibilitySummary="Domicile of Jammu & Kashmir aged between 18 and 35 years registered with district employment exchange, holding commercial driving licence.",
        rules=[
            make_rule("state", "EQUALS", "Jammu and Kashmir", "J&K Domicile", "MUMKIN Clause 2.1"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Age 18 to 35 Years", "MUMKIN Clause 2.2"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 35, "Maximum Age 35 Years", "MUMKIN Clause 2.3"),
        ],
        documents=[
            make_doc("doc-jk-domicile", "J&K Domicile Certificate", "Proof of permanent residence", "Tehsildar", "MUMKIN Doc 1"),
            make_doc("doc-jk-dl", "Commercial Driving Licence", "Valid LMV/commercial transport licence", "RTO J&K", "MUMKIN Doc 2"),
        ],
        steps=[
            make_step(1, "Apply on Mission Youth JK Portal", "Submit online application selecting vehicle brand (Tata, Mahindra, Ashok Leyland).", "online_portal", "https://missionyouth.jk.gov.in"),
            make_step(2, "District Level Task Force Screening", "Deputy Commissioner led committee interviews candidates and approves allocation.", "district_office"),
            make_step(3, "Vehicle Delivery at Dealership", "Collect brand new commercial vehicle with zero down payment.", "district_office"),
        ]
    ),
]
