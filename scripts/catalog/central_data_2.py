"""
scripts/catalog/central_data_2.py
Additional comprehensive Central Government of India schemes.
"""

from .builder import make_scheme, make_rule, make_doc, make_step

CENTRAL_SCHEMES_2 = [
    # ----------------------------------------------------
    # EDUCATION, SCHOLARSHIPS & RESEARCH
    # ----------------------------------------------------
    make_scheme(
        id="central-top-class-sc",
        slug="top-class-education-scheme-sc-students",
        name="Top Class Education Scheme for SC Students",
        short_description="Full tuition fee reimbursement (up to ₹7 Lakhs/yr in private, actual in govt) + ₹86,000 living/books/computer grant for SC students in premier institutes (IITs, IIMs, NLUs, AIIMS).",
        full_description="Administered by the Ministry of Social Justice and Empowerment, this scheme covers full non-refundable tuition fees, living expenses of ₹3,000/month, ₹5,000/year for books, and a one-time ₹45,000 grant for computer equipment for SC students admitted into top-ranked institutions across India.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Social Justice and Empowerment",
        portal_url="https://scholarships.gov.in",
        benefit_details="Full tuition fee payment, ₹36,000 annual living expense allowance, ₹5,000 annual books/stationery grant, and ₹45,000 one-time computer/laptop purchase grant.",
        eligibilitySummary="SC student who has secured admission in an empaneled Top Class Institution (IIT, IIM, NIT, AIIMS, NLU, etc.) with total family annual income <= ₹8 Lakhs.",
        rules=[
            make_rule("casteCategory", "EQUALS", "SC", "Scheduled Caste Community", "Top Class SC Rules Clause 2.1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Annual Family Income <= ₹8 Lakhs", "Top Class SC Rules Clause 2.2"),
            make_rule("instituteType", "EQUALS", "notified_premier_institute", "Admission in Notified Premier Institute", "Top Class SC Rules Clause 2.3"),
        ],
        documents=[
            make_doc("doc-sc-caste", "Caste Certificate", "Issued by competent revenue authority", "Tahsildar / RDO", "SC Checklist 1"),
            make_doc("doc-sc-income", "Income Certificate / ITR", "Showing family income <= ₹8 Lakhs", "Revenue Officer / IT Dept", "SC Checklist 2"),
            make_doc("doc-sc-fee-receipt", "Institute Admission Fee Receipt", "Showing actual fee schedule of premier institute", "IIT / IIM / AIIMS", "SC Checklist 3"),
        ],
        steps=[
            make_step(1, "Admission in Premier Institute", "Secure admission in IIT, IIM, AIIMS, or other empaneled premier institute.", "college_cell"),
            make_step(2, "Apply on NSP", "Select Top Class Education Scheme for SC on National Scholarship Portal.", "online_portal", "https://scholarships.gov.in"),
            make_step(3, "Direct Institution & DBT Disbursal", "Tuition fee paid directly to institute; living and computer allowance sent to student account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-csir-net-jrf",
        slug="csir-ugc-junior-research-fellowship-jrf",
        name="CSIR-UGC Junior Research Fellowship (JRF) in Sciences",
        short_description="Monthly doctoral fellowship of ₹37,000 (JRF) and ₹42,000 (SRF) plus HRA and ₹20,000 annual contingency for science research.",
        full_description="Council of Scientific and Industrial Research (CSIR) awards Junior Research Fellowships through the Joint CSIR-UGC NET examination for pursuing PhD in Chemical Sciences, Earth Sciences, Life Sciences, Mathematical Sciences, and Physical Sciences.",
        category="fellowship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Science and Technology",
        department="Council of Scientific and Industrial Research (CSIR)",
        portal_url="https://csirhrdg.res.in",
        benefit_details="₹37,000/month for first two years (JRF), ₹42,000/month for next three years (SRF), HRA (8-24%), and ₹20,000 annual contingency.",
        eligibilitySummary="M.Sc. or equivalent degree with minimum 55% marks (50% for SC/ST/PwD) and qualified CSIR-JRF in National Eligibility Test; age limit 28 years (relaxable).",
        rules=[
            make_rule("qualifyingExam", "EQUALS", "csir_net_jrf", "Qualified CSIR-UGC NET JRF Rank", "CSIR HRDG Criteria 1"),
            make_rule("minMscMarks", "GREATER_THAN_OR_EQUAL", 55, "Minimum 55% in Master of Science", "CSIR HRDG Criteria 2"),
        ],
        documents=[
            make_doc("doc-csir-award", "CSIR-UGC NET JRF Award Letter", "Official JRF rank qualification certificate", "NTA / CSIR", "HRDG Annexure I"),
            make_doc("doc-csir-joining", "PhD Joining Report", "From recognized university or CSIR national laboratory", "University / CSIR Lab", "HRDG Annexure II"),
        ],
        steps=[
            make_step(1, "Clear Joint CSIR-UGC NET", "Appear for and qualify JRF rank in Joint CSIR-UGC NET exam.", "online_portal"),
            make_step(2, "PhD Registration & Joining", "Join PhD program at any recognized Indian university, IIT, IISER, or CSIR lab.", "college_cell"),
            make_step(3, "Submit Joining Proforma", "Submit joining documents on CSIR New Enterprise portal for DBT monthly fellowship.", "online_portal", "https://csirhrdg.res.in"),
        ]
    ),
    make_scheme(
        id="central-free-coaching-sc-obc",
        slug="free-coaching-scheme-sc-obc-students",
        name="Free Coaching Scheme for SC and OBC Students",
        short_description="100% free coaching at top institutes for UPSC, State PSCs, JEE, NEET, GATE, CAT, and Banking exams with ₹4,000 monthly living stipend.",
        full_description="Implemented by Ministry of Social Justice and Empowerment, this scheme enables economically disadvantaged SC and OBC students to acquire quality coaching from premier coaching institutes to compete successfully in competitive and entrance examinations.",
        category="education_aid",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Social Justice and Empowerment",
        portal_url="https://coaching.dosje.gov.in",
        benefit_details="Full coaching course fee paid directly to the empaneled coaching institute, plus monthly stipend of ₹4,000 for local students and ₹6,000 for outstation students for lodging.",
        eligibilitySummary="Student belonging to SC or OBC community, passed qualifying board/degree exam, family annual income <= ₹8 Lakhs.",
        rules=[
            make_rule("casteCategory", "IN", ["SC", "OBC"], "SC or OBC Category", "Free Coaching Scheme Guidelines 3.1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Annual Family Income <= ₹8,00,000", "Free Coaching Scheme Guidelines 3.2"),
        ],
        documents=[
            make_doc("doc-coaching-caste", "Caste Certificate", "Issued by competent revenue authority", "Tahsildar", "Coaching Checklist 1"),
            make_doc("doc-coaching-income", "Income Certificate", "Income proof of current financial year", "Revenue Authority", "Coaching Checklist 2"),
        ],
        steps=[
            make_step(1, "Online Portal Registration", "Register on the Free Coaching Portal of Ministry of Social Justice.", "online_portal", "https://coaching.dosje.gov.in"),
            make_step(2, "Select Exam & Empaneled Institute", "Choose competitive exam (UPSC, JEE, NEET) and preferred accredited coaching center.", "online_portal"),
            make_step(3, "Seat Allotment & Class Commencement", "Ministry releases merit list and confirms seat with direct fee payment to institute.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-post-matric-disabilities",
        slug="post-matric-scholarship-students-with-disabilities",
        name="Post-Matric Scholarship for Students with Disabilities",
        short_description="Comprehensive maintenance allowance up to ₹1,600/month + book grant + disability escort/transport allowance for higher education.",
        full_description="Centrally Sponsored Scheme by DEPwD under Ministry of Social Justice to support students with disabilities pursuing Post-Matriculation or post-secondary courses from Class 11 up to Ph.D. level in recognized institutions.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Empowerment of Persons with Disabilities",
        portal_url="https://scholarships.gov.in",
        benefit_details="Maintenance allowance of ₹900 to ₹1,600/month, book grant of ₹1,500/year, reader allowance for visually impaired, and disability escort allowance.",
        eligibilitySummary="Student with >= 40% benchmark disability holding UDID card, enrolled in Class 11 to PhD, family income <= ₹2.5 Lakhs per year.",
        rules=[
            make_rule("disabilityPercentage", "GREATER_THAN_OR_EQUAL", 40, "Minimum 40% Disability (UDID)", "DEPwD Guidelines 2.1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 250000, "Parental Income <= ₹2.5 Lakhs", "DEPwD Guidelines 2.2"),
        ],
        documents=[
            make_doc("doc-pwd-udid", "Unique Disability ID (UDID) Card", "Disability certification", "District Medical Board", "DEPwD Form A"),
            make_doc("doc-pwd-bonafide", "College Admission Bonafide Certificate", "Showing enrolled post-matric course", "Principal / Registrar", "DEPwD Form B"),
        ],
        steps=[
            make_step(1, "Apply on NSP Portal", "Register on National Scholarship Portal and choose DEPwD Post-Matric Scheme.", "online_portal", "https://scholarships.gov.in"),
            make_step(2, "College Verification", "Institute nodal officer verifies course enrollment and hostel status online.", "college_cell"),
            make_step(3, "Direct Benefit Transfer", "Disability allowance and maintenance allowance credited directly to student bank account.", "online_portal"),
        ]
    ),

    # ----------------------------------------------------
    # AGRICULTURE, ALLIED & CLIMATE ACTION
    # ----------------------------------------------------
    make_scheme(
        id="central-paramparagat-krishi-pkvy",
        slug="paramparagat-krishi-vikas-yojana-pkvy-organic-farming",
        name="Paramparagat Krishi Vikas Yojana (PKVY) - Organic Farming",
        short_description="Financial assistance of ₹50,000 per hectare over 3 years for organic farming clusters, PGS certification, bio-fertilizers, and marketing.",
        full_description="PKVY is an extended component of Soil Health Management under National Mission for Sustainable Agriculture (NMSA) promoting chemical-free organic farming through cluster approach and Participatory Guarantee System (PGS-India) certification.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Agriculture and Farmers Welfare",
        department="Department of Agriculture and Farmers Welfare",
        portal_url="https://pgsindia-ncof.gov.in",
        benefit_details="₹50,000 per hectare for 3 years (₹31,000/ha provided directly via DBT for organic seeds, bio-inputs, vermicompost; remainder for value addition and packaging).",
        eligibilitySummary="Farmers willing to form organic farming clusters of minimum 20 hectares (50 or more farmers) and practice chemical-free agriculture.",
        rules=[
            make_rule("farmingType", "EQUALS", "organic", "Commitment to Chemical-Free Cultivation", "PKVY Guidelines 3.1"),
        ],
        documents=[
            make_doc("doc-pkvy-land", "Land Title / Revenue Record (Pahani / Khasra)", "Proof of agricultural land", "Revenue Dept", "PKVY Checklist 1"),
            make_doc("doc-pkvy-cluster", "Cluster Farmer Group Resolution", "Signed by minimum 50 cluster farmers", "Gram Panchayat / Lead Farmer", "PKVY Checklist 2"),
        ],
        steps=[
            make_step(1, "Form Farmer Cluster", "Form a cluster of 50 or more farmers covering minimum 20 hectares in contiguous area.", "district_office"),
            make_step(2, "Register with Regional Council", "Register cluster under PGS-India Portal for organic conversion monitoring.", "online_portal", "https://pgsindia-ncof.gov.in"),
            make_step(3, "Receive Direct Input Subsidies", "Three-year phased DBT funding released for bio-inputs, soil testing, and green manure.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-sub-mission-agri-mechanization",
        slug="sub-mission-on-agricultural-mechanization-smam",
        name="Sub-Mission on Agricultural Mechanization (SMAM)",
        short_description="40% to 50% capital subsidy on agricultural machinery (tractors, power tillers, rotavators, combine harvesters) and up to 80% for Custom Hiring Centres.",
        full_description="SMAM promotes the use of mechanized agricultural equipment to offset labor shortages, increase cropping intensity, and lower cultivation costs. It provides up to 50% subsidy to individual farmers and up to 80% capital grant for establishing village-level Custom Hiring Centres (CHCs).",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Agriculture and Farmers Welfare",
        department="Mechanization and Technology Division",
        portal_url="https://agrimachinery.nic.in",
        benefit_details="40-50% subsidy on purchase of tractors, laser land levelers, seed drills, and power weeders (max ₹1.25L to ₹4L depending on machine type); 80% subsidy (up to ₹8L) for village cooperative CHCs.",
        eligibilitySummary="Individual farmers (priority to SC, ST, small & marginal farmers, and women farmers), FPOs, cooperatives, and rural youth entrepreneurs.",
        rules=[
            make_rule("occupation", "EQUALS", "farmer", "Practicing Farmer or Custom Hiring Society", "SMAM Guidelines Section 4"),
        ],
        documents=[
            make_doc("doc-smam-land", "Land Records (7/12, RoR, Patta)", "Showing agricultural holding", "Tahsildar", "SMAM Checklist 1"),
            make_doc("doc-smam-quotation", "Authorized Machinery Manufacturer Quotation", "Technical specification and quotation from empanelled dealer", "Registered Tractor Dealer", "SMAM Checklist 2"),
        ],
        steps=[
            make_step(1, "Online Application on DBT Agrimachinery Portal", "Register on the Ministry DBT Agrimachinery portal.", "online_portal", "https://agrimachinery.nic.in"),
            make_step(2, "Select Machine & Dealer", "Select approved machinery model, manufacturer, and nearest dealer.", "online_portal"),
            make_step(3, "Verification & Subsidy Disbursal", "Agriculture department inspects delivery and serial number; subsidy directly credited via DBT.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-rashtriya-gokul-mission",
        slug="rashtriya-gokul-mission-indigenous-cattle",
        name="Rashtriya Gokul Mission (RGM) - Cattle Breed Productivity",
        short_description="Up to 50% capital subsidy (up to ₹2 Crore) for establishing high-yielding indigenous cow breed multiplication farms and subsidized sex-sorted semen.",
        full_description="RGM aims to genetically upgrade and conserve indigenous bovine breeds (Gir, Sahiwal, Red Sindhi, Tharparkar, Ongole) and enhance milk productivity across India, providing subsidized IVF technology, sex-sorted semen, and 50% capital grants for modern dairy cattle farms.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Fisheries, Animal Husbandry and Dairying",
        department="Department of Animal Husbandry and Dairying",
        portal_url="https://dahd.nic.in",
        benefit_details="50% capital subsidy up to ₹2,00,00,000 for establishing a Breed Multiplication Farm of minimum 200 indigenous cows/buffaloes, plus subsidized artificial insemination at ₹100 per straw.",
        eligibilitySummary="Private entrepreneurs, FPOs, Section 8 companies, Dairy Cooperatives with minimum 3-5 acres land and experience in dairy herd management.",
        rules=[
            make_rule("minHerdSize", "GREATER_THAN_OR_EQUAL", 200, "Minimum 200 Indigenous Cattle Farm Proposal", "RGM Guidelines Clause 5.1"),
        ],
        documents=[
            make_doc("doc-rgm-dpr", "Detailed Project Report for Dairy Farm", "Including bio-security, cow sheds, silage, and automated milking units", "Chartered Engineer", "RGM Annexure I"),
            make_doc("doc-rgm-land", "Clear Land Ownership Deeds (Minimum 5 Acres)", "Freehold or minimum 25-year lease", "Sub-Registrar", "RGM Annexure II"),
        ],
        steps=[
            make_step(1, "Submit DPR on NLM/RGM Portal", "Submit project proposal and bank loan sanction on the national portal.", "online_portal", "https://dahd.nic.in"),
            make_step(2, "State Implementing Agency Scrutiny", "State Livestock Development Board verifies project site and infrastructure.", "district_office"),
            make_step(3, "Central Subsidy Release in Tranches", "50% capital subsidy disbursed in milestones linked with civil construction and cow procurement.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-national-beekeeping-mission",
        slug="national-beekeeping-and-honey-mission-nbhm",
        name="National Beekeeping & Honey Mission (NBHM)",
        short_description="Up to 50% subsidy for commercial beekeeping (bee boxes, honey extraction units, queen bee rearing, and honey testing labs).",
        full_description="Under the Sweet Revolution, NBHM under Ministry of Agriculture provides capital subsidies and technical handholding to farmers and beekeepers to adopt scientific beekeeping, increase crop pollination yields, and generate high-value commercial honey exports.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Agriculture and Farmers Welfare",
        department="National Bee Board (NBB)",
        portal_url="https://nbhm.gov.in",
        benefit_details="Up to 50% financial subsidy on bee colonies and modern beehives (up to ₹2,000 per bee box), custom extraction equipment, and ₹5,00,000 for queen rearing stations.",
        eligibilitySummary="Small & marginal farmers, beekeepers, SHGs, FPOs registered with the National Bee Board practicing or intending to start scientific apiary.",
        rules=[
            make_rule("registration", "EQUALS", "national_bee_board", "Registered on Madhukranti Portal", "NBHM Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-nbhm-reg", "Madhukranti Portal Registration Certificate", "Beekeeper ID on NBB system", "National Bee Board", "NBHM Form 1"),
        ],
        steps=[
            make_step(1, "Register on Madhukranti Portal", "Register profile and details of existing/proposed colonies.", "online_portal", "https://nbhm.gov.in"),
            make_step(2, "Undertake Scientific Training", "Complete 7-day beekeeping training at KVK or National Bee Board center.", "college_cell"),
            make_step(3, "Avail Equipment Subsidy", "Purchase certified bee boxes from empanelled suppliers; subsidy credited directly via DBT.", "district_office"),
        ]
    ),

    # ----------------------------------------------------
    # HEALTHCARE, SANITATION & SENIOR CITIZENS
    # ----------------------------------------------------
    make_scheme(
        id="central-abdm-digital-health",
        slug="ayushman-bharat-digital-mission-abdm-abha-card",
        name="Ayushman Bharat Digital Mission (ABDM) - ABHA Card",
        short_description="Free 14-digit digital health account (ABHA ID) for every Indian citizen providing seamless, paperless access to lifetime medical records.",
        full_description="ABHA (Ayushman Bharat Health Account) is the foundational digital health backbone enabling citizens to digitally store, manage, and share health records (lab reports, prescriptions, discharge summaries) with doctors across public and private hospitals seamlessly.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Health and Family Welfare",
        department="National Health Authority (NHA)",
        portal_url="https://abha.abdm.gov.in",
        benefit_details="Free instant 14-digit digital health account, interoperable health records storage, paperless hospital OPD registrations, and consent-based health record sharing.",
        eligibilitySummary="All Indian citizens of any age with an Aadhaar or mobile number.",
        rules=[
            make_rule("citizenship", "EQUALS", "indian", "Indian Resident", "ABDM Policy Section 1"),
        ],
        documents=[
            make_doc("doc-abha-aadhaar", "Aadhaar Number or Mobile Number", "For instant OTP verification", "UIDAI", "ABDM Registration"),
        ],
        steps=[
            make_step(1, "Visit ABHA Online Portal or App", "Access the official ABHA website or download the ABHA mobile app.", "online_portal", "https://abha.abdm.gov.in"),
            make_step(2, "Instant Aadhaar OTP Authentication", "Enter 12-digit Aadhaar and verify via OTP sent to registered mobile.", "online_portal"),
            make_step(3, "Download Digital ABHA Card", "Download digital card with QR code; show at any hospital for instant OPD token.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-mission-indradhanush",
        slug="intensified-mission-indradhanush-imi-immunization",
        name="Intensified Mission Indradhanush (IMI 5.0) Universal Immunization",
        short_description="100% free immunization against 12 vaccine-preventable life-threatening diseases for all children up to 5 years and pregnant mothers.",
        full_description="Mission Indradhanush ensures full immunization coverage for unvaccinated and partially vaccinated children and pregnant women against 12 deadly diseases: Polio, Measles, Rubella, Diphtheria, Pertussis, Tetanus, Hepatitis B, Meningitis, TB, Pneumococcal, and Rotavirus.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Health and Family Welfare",
        department="Immunization Division",
        portal_url="https://uwin.mohfw.gov.in",
        benefit_details="100% free WHO-standard vaccines administered at all government primary health centres and special door-to-door immunization camps.",
        eligibilitySummary="All children from birth up to 5 years of age and pregnant women who missed routine immunization doses.",
        rules=[
            make_rule("maxAgeYears", "LESS_THAN_OR_EQUAL", 5, "Child Age 0 to 5 Years or Pregnant Mother", "UIP Guidelines Section 2"),
        ],
        documents=[
            make_doc("doc-imi-none", "No Prior Documents Required (U-WIN Registration on spot)", "Instant entry on digital U-WIN vaccine registry", "Health Worker / ANM", "U-WIN SOP"),
        ],
        steps=[
            make_step(1, "Locate Nearest Immunization Camp", "Check dates for Wednesday/Saturday Village Health Sanitation and Nutrition Day (VHSND).", "district_office"),
            make_step(2, "Vaccine Administration", "Trained ANM administers prescribed age-appropriate vaccines.", "district_office"),
            make_step(3, "Download U-WIN Digital Certificate", "Get digital vaccine passport with QR code instantly on mobile via U-WIN.", "online_portal", "https://uwin.mohfw.gov.in"),
        ]
    ),
    make_scheme(
        id="central-ignwps-widow-pension",
        slug="indira-gandhi-national-widow-pension-scheme-ignwps",
        name="Indira Gandhi National Widow Pension Scheme (IGNWPS)",
        short_description="Monthly social security pension of ₹300 to ₹1,500/month (with state top-up) for widows aged 40 to 79 living below the poverty line.",
        full_description="Part of the National Social Assistance Programme (NSAP), IGNWPS provides life-long monthly financial pensions directly into the bank accounts of indigent widows to prevent destitution and ensure dignity.",
        category="pension",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Rural Development",
        department="NSAP Social Assistance Division",
        portal_url="https://nsap.nic.in",
        benefit_details="Central monthly pension of ₹300 supplemented by state governments (reaching ₹1,000 to ₹3,000/month in many states) credited directly via DBT.",
        eligibilitySummary="Widow aged between 40 and 79 years belonging to a household living below the poverty line according to SECC/BPL criteria.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 40, "Minimum Age 40 Years", "IGNWPS Guidelines Clause 1"),
            make_rule("maritalStatus", "EQUALS", "widow", "Widow", "IGNWPS Guidelines Clause 2"),
            make_rule("bplStatus", "EQUALS", True, "Below Poverty Line Household", "IGNWPS Guidelines Clause 3"),
        ],
        documents=[
            make_doc("doc-ignwps-death", "Husband's Death Certificate", "Official death certificate issued by registrar of births and deaths", "Municipality / Panchayat", "NSAP Form 1"),
            make_doc("doc-ignwps-bpl", "BPL Ration Card / Income Certificate", "Confirming household below poverty line", "Food & Civil Supplies", "NSAP Form 2"),
        ],
        steps=[
            make_step(1, "Submit Application to Tahsildar / Panchayat", "Submit filled NSAP form with husband's death certificate at local revenue office.", "meeseva_csc"),
            make_step(2, "Gram Sabha / Municipal Verification", "Local body verifies applicant residence and economic condition.", "district_office"),
            make_step(3, "Monthly Pension Direct Transfer", "Sanctioned pension deposited automatically every month into savings bank account.", "online_portal", "https://nsap.nic.in"),
        ]
    ),
    make_scheme(
        id="central-igndps-disability-pension",
        slug="indira-gandhi-national-disability-pension-scheme-igndps",
        name="Indira Gandhi National Disability Pension Scheme (IGNDPS)",
        short_description="Monthly pension for persons with severe and multiple disabilities (80%+ disability) living below the poverty line.",
        full_description="Administered under NSAP, IGNDPS extends monthly cash pensions to persons with severe disabilities, dwarfism, or multiple disabilities belonging to BPL households to support their fundamental living and medical needs.",
        category="pension",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Rural Development",
        department="NSAP Social Assistance Division",
        portal_url="https://nsap.nic.in",
        benefit_details="Monthly direct pension of ₹300 to ₹1,500/month (enhanced with state contribution up to ₹4,000/month in progressive states) deposited directly into beneficiary's account.",
        eligibilitySummary="Individuals aged 18 to 79 years having minimum 80% severe disability or multiple disabilities belonging to BPL households.",
        rules=[
            make_rule("disabilityPercentage", "GREATER_THAN_OR_EQUAL", 80, "Minimum 80% Severe Disability", "IGNDPS Criteria Clause 2"),
            make_rule("bplStatus", "EQUALS", True, "BPL Family Member", "IGNDPS Criteria Clause 3"),
        ],
        documents=[
            make_doc("doc-igndps-medical", "Disability Certificate / UDID Card showing >= 80%", "Issued by District Medical Board / Civil Surgeon", "District Hospital", "IGNDPS Checklist 1"),
            make_doc("doc-igndps-bpl", "BPL Ration Card / Income Certificate", "Proof of economic status", "Tahsildar", "IGNDPS Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply at Local Revenue Office", "Submit application at Block Development Office (BDO) or Municipal Ward Office.", "meeseva_csc"),
            make_step(2, "Medical Board Record Check", "Verifying UDID disability percentage and residency.", "district_office"),
            make_step(3, "Direct Monthly Credit", "Monthly pension credited to Aadhaar-linked savings account.", "online_portal", "https://nsap.nic.in"),
        ]
    ),
    make_scheme(
        id="central-nfbs-family-benefit",
        slug="national-family-benefit-scheme-nfbs",
        name="National Family Benefit Scheme (NFBS)",
        short_description="Lump sum cash assistance of ₹20,000 to the bereaved BPL household on the death of the primary breadwinner.",
        full_description="NFBS provides emergency one-time cash assistance of ₹20,000 to indigent families below the poverty line upon the sudden death of the primary male or female breadwinner aged 18 to 59 years, preventing family starvation and debt traps.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Rural Development",
        department="Social Assistance Division",
        portal_url="https://nsap.nic.in",
        benefit_details="₹20,000 lump sum direct bank transfer paid to the surviving spouse or eldest surviving family member.",
        eligibilitySummary="Death of primary breadwinner aged between 18 and 59 years in a below-poverty-line household; application submitted within 1 year of demise.",
        rules=[
            make_rule("bplStatus", "EQUALS", True, "Below Poverty Line Household", "NFBS Scheme Rule 1"),
        ],
        documents=[
            make_doc("doc-nfbs-death", "Death Certificate of Breadwinner", "Showing age between 18 and 59 at time of death", "Registrar of Deaths", "NFBS Checklist 1"),
            make_doc("doc-nfbs-bpl", "BPL Certificate / Food Security Card", "Proof of household poverty status", "Tahsildar", "NFBS Checklist 2"),
        ],
        steps=[
            make_step(1, "Submit Application within 12 Months", "Apply at Tahsil / Block Development Office within one year of demise.", "meeseva_csc"),
            make_step(2, "Verification of Breadwinner Status", "Revenue Inspector verifies family dependency and cause of demise.", "district_office"),
            make_step(3, "Instant Lump Sum Transfer", "Direct transfer of ₹20,000 into the surviving nominee's bank account.", "online_portal", "https://nsap.nic.in"),
        ]
    ),
    make_scheme(
        id="central-ddu-gky-skilling",
        slug="deen-dayal-upadhyaya-grameen-kaushalya-yojana-ddu-gky",
        name="Deen Dayal Upadhyaya Grameen Kaushalya Yojana (DDU-GKY)",
        short_description="100% free residential skill training, free uniforms, lodging, tablet computer, and guaranteed minimum 70% job placement for rural poor youth.",
        full_description="DDU-GKY is a demand-driven placement-linked skill initiative under Ministry of Rural Development for rural youth aged 15-35 years, providing completely free training with industry partners in IT, Healthcare, Retail, Logistics, and Electronics with post-placement tracking.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Rural Development",
        department="Rural Skills Division",
        portal_url="https://ddugky.gov.in",
        benefit_details="Completely free residential training, free hostel accommodation, meals, tablet computer/books, and mandatory minimum 70% placement with salary >= statutory minimum wages.",
        eligibilitySummary="Rural youth aged 15 to 35 years (up to 45 for women, SC, ST, and PwD) belonging to poor rural households (BPL / SECC / MGNREGA workers).",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 15, "Minimum Age 15 Years", "DDU-GKY Clause 3.1"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 35, "Maximum Age 35 Years", "DDU-GKY Clause 3.2"),
            make_rule("residence", "EQUALS", "rural", "Rural Resident", "DDU-GKY Clause 3.3"),
        ],
        documents=[
            make_doc("doc-gky-aadhaar", "Aadhaar Card", "Proof of identity and age", "UIDAI", "DDU-GKY Form 1"),
            make_doc("doc-gky-bpl", "BPL Card / MGNREGA Job Card / SECC Household Name", "Proof of rural poor background", "Gram Panchayat", "DDU-GKY Form 2"),
        ],
        steps=[
            make_step(1, "Mobilization Camp or Portal Registration", "Register at Gram Panchayat skill mela or on the Kaushal Panjee portal.", "online_portal", "https://ddugky.gov.in"),
            make_step(2, "Counseling & Trade Selection", "Counselor assesses aptitude and assigns student to certified Project Implementing Agency (PIA).", "college_cell"),
            make_step(3, "Training & Guaranteed Job Placement", "Complete 3-12 months residential course, earn NCVET certificate, and receive appointment letter.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-van-dhan-vikas",
        slug="van-dhan-vikas-karyakram-trifed",
        name="Van Dhan Vikas Karyakram (TRIFED) - Forest Produce Value Addition",
        short_description="₹15 Lakhs infrastructure grant per Van Dhan Vikas Kendra for tribal gathering SHGs to process, package, and brand Minor Forest Produce.",
        full_description="Launched by the Ministry of Tribal Affairs and TRIFED, the Van Dhan scheme mobilizes tribal forest gatherers into SHGs and provides ₹15 Lakhs capital grant per cluster of 300 gatherers to establish value-addition processing units for forest produce (tamarind, mahua, wild honey, herbs) to multiply tribal incomes.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Tribal Affairs",
        department="Tribal Cooperative Marketing Development Federation of India (TRIFED)",
        portal_url="https://trifed.tribal.gov.in",
        benefit_details="₹15,00,000 infrastructure and working capital grant per Van Dhan Kendra (300 tribal gatherers), access to TRIFED 'Tribes India' national retail marketing network.",
        eligibilitySummary="Forest-dwelling Scheduled Tribe (ST) gatherers and traditional artisans residing in scheduled and forest areas formed into 15-member SHGs.",
        rules=[
            make_rule("casteCategory", "EQUALS", "ST", "Scheduled Tribe Community", "Van Dhan Guidelines 3.1"),
        ],
        documents=[
            make_doc("doc-vandhan-st", "ST Certificate & Forest Habitation Proof", "Verified by Gram Sabha / ITDA", "Tahsildar", "Van Dhan Form A"),
        ],
        steps=[
            make_step(1, "SHG Formation by ITDA", "Form a 15-member Van Dhan Self Help Group under Gram Sabha guidance.", "district_office"),
            make_step(2, "Cluster Sanction by TRIFED", "Cluster of 20 SHGs (300 members) recognized as a Van Dhan Vikas Kendra.", "district_office"),
            make_step(3, "Establish Value-Addition Centre", "Utilize ₹15 Lakh grant for packaging, drying, and testing machinery; sell through Tribes India.", "online_portal", "https://trifed.tribal.gov.in"),
        ]
    ),
]
