"""
scripts/catalog/central_data.py
Comprehensive catalog of verified Central Government of India schemes.
"""

from .builder import make_scheme, make_rule, make_doc, make_step

CENTRAL_SCHEMES = [
    # ----------------------------------------------------
    # EDUCATION, SCHOLARSHIPS & FELLOWSHIPS
    # ----------------------------------------------------
    make_scheme(
        id="central-pmrf-fellowship",
        slug="prime-ministers-research-fellowship-pmrf",
        name="Prime Minister's Research Fellowship (PMRF)",
        short_description="Prestigious doctoral fellowship providing up to ₹80,000/month plus ₹2 Lakh annual research contingency grant for top PhD scholars in science and technology.",
        full_description="The Prime Minister's Research Fellowship (PMRF) is India's most prestigious doctoral fellowship designed to attract the best talent into research in frontier science and technology domains at premier institutions like IITs, IISc, and IISERs. Fellows receive monthly financial assistance of ₹70,000-80,000 and ₹2 Lakh annual research grant.",
        category="fellowship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Education",
        department="Department of Higher Education",
        portal_url="https://www.pmrf.in",
        benefit_details="₹70,000/month for Year 1-2, ₹75,000/month for Year 3, ₹80,000/month for Year 4-5, plus ₹2,00,000 annual contingency grant for 5 years.",
        eligibilitySummary="Completed or pursuing B.Tech/M.Tech/M.Sc with CGPA >= 8.0 from eligible NIRF top institutions or GATE score >= 650 with admission to PhD in PMRF granting institutions.",
        rules=[
            make_rule("degreeLevel", "EQUALS", "phd", "Doctoral Program Enrolment", "PMRF Guidelines Section 2"),
            make_rule("minCgpa", "GREATER_THAN_OR_EQUAL", 8.0, "Minimum Academic CGPA (8.0)", "PMRF Academic Criteria 3.1"),
        ],
        documents=[
            make_doc("doc-pmrf-proposal", "Research Proposal", "Detailed technical statement of purpose & doctoral proposal", "PMRF Portal", "PMRF Annexure A"),
            make_doc("doc-pmrf-transcripts", "Official Academic Transcripts", "Degree certificates with CGPA verification", "University / IIT", "PMRF Annexure B"),
        ],
        steps=[
            make_step(1, "PhD Enrolment", "Secure regular PhD admission in a designated PMRF granting institute (IISc/IITs/IISERs/NITs).", "college_cell"),
            make_step(2, "Nomination & Portal Submission", "Submit research proposal and referee recommendations through the nodal PMRF portal.", "online_portal", "https://www.pmrf.in"),
            make_step(3, "National Review Selection", "Review by National Discipline-wise Review Panel and final award announcement.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-inspire-fellowship",
        slug="dst-inspire-fellowship-doctoral",
        name="Innovation in Science Pursuit for Inspired Research (INSPIRE) Fellowship",
        short_description="Doctoral research fellowship by DST providing monthly JRF/SRF stipend with HRA and contingency grant for basic and applied science research.",
        full_description="INSPIRE Fellowship is a flagship scheme of the Department of Science & Technology (DST) offering contractual financial fellowship equivalent to NET-JRF/SRF to university 1st rank holders and INSPIRE Scholars to pursue PhD in Basic & Applied Sciences, Medicine, and Agriculture.",
        category="fellowship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Science and Technology",
        department="Department of Science and Technology (DST)",
        portal_url="https://online-inspire.gov.in",
        benefit_details="₹37,000/month (JRF) for first two years, ₹42,000/month (SRF) for remaining three years, plus applicable HRA and ₹20,000 annual research contingency.",
        eligibilitySummary="University 1st rank holder in Post-Graduate science stream or INSPIRE Scholar with minimum 70% marks pursuing full-time PhD.",
        rules=[
            make_rule("courseType", "EQUALS", "phd_science", "Full-time PhD in Sciences", "DST INSPIRE Guidelines Clause 4.1"),
            make_rule("universityRank", "EQUALS", 1, "University Gold Medal / 1st Rank", "DST INSPIRE Eligibility 2.2", mandatory=False),
        ],
        documents=[
            make_doc("doc-inspire-rank", "University 1st Rank Certificate", "Issued by Registrar/Controller of Examination", "University Registrar", "DST Form IV"),
            make_doc("doc-inspire-admission", "PhD Admission Endorsement Letter", "Signed by Head of Department and Research Supervisor", "University / Research Institute", "DST Form II"),
        ],
        steps=[
            make_step(1, "Online Registration", "Register on the INSPIRE Web Portal during the national call for applications.", "online_portal", "https://online-inspire.gov.in"),
            make_step(2, "Document Upload & Endorsement", "Upload rank certificate, joining report, and research outline endorsed by supervisor.", "online_portal"),
            make_step(3, "DBT Fellowship Sanction", "Direct monthly credit of fellowship to beneficiary's Aadhaar-linked bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-nsp-csss-2026",
        slug="central-sector-scheme-scholarship-college-university",
        name="Central Sector Scheme of Scholarship for College and University Students (CSSS)",
        short_description="Merit-cum-means scholarship of ₹12,000 to ₹20,000 per year for top 20th percentile 12th board students pursuing regular graduation and post-graduation.",
        full_description="Administered by the Department of Higher Education (MoE), this scheme supports meritorious students from economically weaker sections who score above the 80th percentile in Class 12 board examinations to pursue professional and non-professional college degrees.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Education",
        department="Department of Higher Education",
        portal_url="https://scholarships.gov.in",
        benefit_details="₹12,000 per annum for undergraduate study (1st to 3rd year) and ₹20,000 per annum for post-graduate degree study.",
        eligibilitySummary="Scored above 80th percentile in relevant stream in Class 12 board exam, pursuing regular full-time degree, family income <= ₹4.5 Lakhs per year.",
        rules=[
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 450000, "Annual Family Income <= ₹4,50,000", "CSSS Guidelines Clause 3.1"),
            make_rule("percentile12th", "GREATER_THAN_OR_EQUAL", 80, "Class 12 Board Percentile >= 80th", "CSSS Guidelines Clause 2.1"),
        ],
        documents=[
            make_doc("doc-csss-marksheet", "Class 12 Marksheet", "Official board certificate with roll number and marks", "State Board / CBSE / CISCE", "CSSS Rule 4"),
            make_doc("doc-csss-income", "Income Certificate", "Income certificate from Tahsildar / Revenue officer", "State Revenue Dept", "CSSS Rule 5"),
        ],
        steps=[
            make_step(1, "NSP One-Time Registration", "Register on National Scholarship Portal with OTR (One Time Registration) via Aadhaar.", "online_portal", "https://scholarships.gov.in"),
            make_step(2, "Select CSSS Scheme", "Choose Central Sector Scholarship from Ministry of Education scheme list and submit.", "online_portal"),
            make_step(3, "Institute Level Verification", "Nodal officer at your college/university verifies admission credentials online.", "college_cell"),
        ]
    ),
    make_scheme(
        id="central-national-overseas-scholarship",
        slug="national-overseas-scholarship-sc-st",
        name="National Overseas Scholarship for SC / ST / De-notified Nomadic Tribes",
        short_description="Full overseas tuition fee plus annual living allowance (up to $15,400 / £9,900) for pursuing Master's and PhD in top 500 QS world ranked universities.",
        full_description="The National Overseas Scholarship Scheme provides complete financial coverage for meritorious students belonging to Scheduled Castes, De-notified Nomadic and Semi-Nomadic Tribes, Landless Agricultural Labourers and Traditional Artisans to acquire Master degree or Ph.D. abroad.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Social Justice and Empowerment",
        portal_url="https://nosmsje.gov.in",
        benefit_details="Complete tuition fees, contingency allowance, visa fees, health insurance, and annual living allowance of $15,400 (USA/other countries) or £9,900 (UK).",
        eligibilitySummary="Community certificate of SC/DNT/Landless Labourer; secured admission in top 500 QS-ranked foreign university; family income <= ₹8 Lakhs per annum.",
        rules=[
            make_rule("casteCategory", "IN", ["SC", "DNT", "Traditional_Artisan"], "Eligible Community", "NOS Guidelines Section 3"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Family Income <= ₹8 Lakhs", "NOS Guidelines Section 4"),
            make_rule("qsRank", "LESS_THAN_OR_EQUAL", 500, "Foreign University QS World Ranking <= 500", "NOS Guidelines 2026 update"),
        ],
        documents=[
            make_doc("doc-nos-offer", "Unconditional Foreign University Offer Letter", "Admission confirmation from top 500 QS university", "Foreign University", "NOS Rule 6"),
            make_doc("doc-nos-caste", "Caste / Tribe Certificate", "Authorized community certificate", "Revenue Authority", "NOS Rule 7"),
        ],
        steps=[
            make_step(1, "Check QS Ranking", "Ensure target foreign university is ranked within top 500 in latest QS World Rankings.", "online_portal"),
            make_step(2, "Apply on NOS Portal", "Complete online application with passport details, unconditional admission letter, and income proof.", "online_portal", "https://nosmsje.gov.in"),
            make_step(3, "Selection Committee Evaluation", "National selection committee assesses applications and releases official award letter.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-nmms-scholarship",
        slug="national-means-cum-merit-scholarship-scheme-nmmss",
        name="National Means-cum-Merit Scholarship Scheme (NMMSS)",
        short_description="Scholarship of ₹12,000 per annum (₹1,000/month) for meritorious Class 8 pass students from economically weaker sections from Class 9 to 12.",
        full_description="Centrally Sponsored Scheme to arrest dropout rates at Class 8 and encourage meritorious students of economically weaker sections to continue their secondary and higher secondary education in government, local body, and government-aided schools.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Education",
        department="Department of School Education and Literacy",
        portal_url="https://scholarships.gov.in",
        benefit_details="₹12,000 per year credited directly into student's Aadhaar-linked bank account across Classes 9, 10, 11, and 12.",
        eligibilitySummary="Studying in Govt/Aided school with >= 55% marks in Class 7/8 and selected via state NMMSS exam; parental income <= ₹3.5 Lakhs.",
        rules=[
            make_rule("schoolType", "IN", ["government", "local_body", "government_aided"], "Govt / Local Body School Enrollment", "NMMSS Clause 3"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 350000, "Parental Annual Income <= ₹3,50,000", "NMMSS Clause 4"),
        ],
        documents=[
            make_doc("doc-nmms-admit", "NMMSS Selection Result / Admit Card", "State level NMMS examination result", "State SCERT / DSEL", "NMMSS Clause 5"),
            make_doc("doc-nmms-bank", "Bank Passbook seeded with Aadhaar", "Single account in student's name", "Commercial Bank / Post Office", "NMMSS Clause 6"),
        ],
        steps=[
            make_step(1, "Appear for State NMMS Exam", "Register through school in Class 8 for the state NMMS aptitude & mental ability test.", "college_cell"),
            make_step(2, "Apply on NSP", "Qualified candidates enter roll number on National Scholarship Portal to claim scholarship.", "online_portal", "https://scholarships.gov.in"),
            make_step(3, "Annual Renewal", "Renew annually on NSP by verifying promotion to next higher class with >= 55% marks.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-aicte-swanath",
        slug="aicte-swanath-scholarship-scheme",
        name="AICTE Swanath Scholarship Scheme for Orphans, COVID-Affected & Armed Forces Wards",
        short_description="₹50,000 per annum scholarship for orphans, wards of parents who died of COVID-19, or wards of martyred Armed Forces/CAPF personnel pursuing AICTE approved degrees/diplomas.",
        full_description="AICTE Swanath Scholarship Scheme provides financial aid and social security to students pursuing technical degrees or diplomas who are orphans, whose parents died due to COVID-19, or whose parents are martyred armed forces or central paramilitary personnel.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Education",
        department="All India Council for Technical Education (AICTE)",
        portal_url="https://www.aicte-india.org/schemes/students-development-schemes/Swanath-Scholarship-Scheme",
        benefit_details="₹50,000 per annum lump sum towards college fees, hostel accommodation, computer equipment, and books.",
        eligibilitySummary="Enrolled in 1st year of AICTE approved degree/diploma; must be an orphan, COVID-19 orphan, or ward of martyred soldier; family income <= ₹8 Lakhs.",
        rules=[
            make_rule("institutionType", "EQUALS", "aicte_approved", "Enrolled in AICTE Approved Institute", "Swanath Guidelines Clause 2"),
            make_rule("specialCategory", "IN", ["orphan", "covid_deceased_parents", "armed_forces_martyr_ward"], "Vulnerable / Martyr Background", "Swanath Guidelines Clause 3"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Annual Family Income <= ₹8,00,000", "Swanath Guidelines Clause 4"),
        ],
        documents=[
            make_doc("doc-swanath-death", "Death Certificate / Martyr Certificate", "Official proof of demise / Armed forces martyr certificate", "Municipal Authority / Zila Sainik Board", "Swanath Annexure I"),
            make_doc("doc-swanath-admission", "AICTE College Admission Proof", "Bonafide student certificate", "College Principal", "Swanath Annexure II"),
        ],
        steps=[
            make_step(1, "Apply on National Scholarship Portal", "Select AICTE Swanath Scheme on NSP and complete profile.", "online_portal", "https://scholarships.gov.in"),
            make_step(2, "Upload Category Certificate", "Submit death certificate or martyr documents along with bonafide enrollment.", "online_portal"),
            make_step(3, "Direct Bank Disbursement", "DBT credit of ₹50,000 annually till completion of degree/diploma.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-begum-hazrat-mahal",
        slug="begum-hazrat-mahal-national-scholarship",
        name="Begum Hazrat Mahal National Scholarship for Meritorious Minority Girls",
        short_description="Financial assistance of ₹5,000 to ₹6,000 per year for girl students belonging to 6 notified minority communities studying in Classes 9 to 12.",
        full_description="Implemented by the Maulana Azad Education Foundation (MAEF) under Ministry of Minority Affairs to support meritorious girl students from Muslim, Christian, Sikh, Buddhist, Jain, and Parsi communities studying in Classes IX, X, XI, and XII.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Minority Affairs",
        department="Maulana Azad Education Foundation",
        portal_url="https://scholarships.gov.in",
        benefit_details="₹5,000 per year for Classes 9 & 10; ₹6,000 per year for Classes 11 & 12 towards admission and course fees.",
        eligibilitySummary="Girl student belonging to minority community studying in Class 9-12 with >= 50% marks in previous class; parental annual income <= ₹2 Lakhs.",
        rules=[
            make_rule("gender", "EQUALS", "female", "Female Students Only", "BHMNS Scheme Clause 1"),
            make_rule("minorityCommunity", "IN", ["muslim", "christian", "sikh", "buddhist", "jain", "parsi"], "Notified Minority Community", "BHMNS Scheme Clause 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 200000, "Parental Income <= ₹2 Lakhs", "BHMNS Scheme Clause 3"),
        ],
        documents=[
            make_doc("doc-bhmns-minority", "Minority Community Certificate / Self-Declaration", "Community declaration endorsed by parent", "Revenue Authority / Self-attestation", "BHMNS Clause 5"),
            make_doc("doc-bhmns-marks", "Previous Year Marksheet", "Proof of minimum 50% marks", "School Principal", "BHMNS Clause 6"),
        ],
        steps=[
            make_step(1, "Register on NSP", "Create applicant ID on National Scholarship Portal with Aadhaar and school U-DISE code.", "online_portal", "https://scholarships.gov.in"),
            make_step(2, "Upload Documents", "Attach marksheet, income certificate, and school bonafide verification.", "online_portal"),
            make_step(3, "Direct Fund Transfer", "Scholarship credited straight to the girl student's Aadhaar-seeded bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pm-usha",
        slug="pradhan-mantri-uchchatar-shiksha-abhiyan-pm-usha",
        name="Pradhan Mantri Uchchatar Shiksha Abhiyan (PM-USHA)",
        short_description="Central transformation grant providing up to ₹100 Crore per state university for infrastructure, quality enhancement, and equity initiatives.",
        full_description="PM-USHA (revamped RUSA) is the flagship central scheme for state higher educational institutions focusing on equity, inclusion, employability, and technology upgradation across underserved and aspirational districts in India.",
        category="education_aid",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Education",
        department="Department of Higher Education",
        portal_url="https://pmusha.education.gov.in",
        benefit_details="Institutional grants ranging from ₹20 Crore to ₹100 Crore per state university and college for digital classrooms, laboratories, and student welfare facilities.",
        eligibilitySummary="Accredited State Public Universities and Government / Aided Colleges with NAAC accreditation participating under State Higher Education Plans.",
        rules=[
            make_rule("institutionType", "IN", ["state_university", "government_college"], "State Higher Education Institution", "PM-USHA Guidelines 2.1"),
        ],
        documents=[
            make_doc("doc-usha-dpr", "Institutional Detailed Project Report (IDP)", "Multi-year infrastructure and modernization proposal", "University Vice Chancellor", "PM-USHA Framework"),
        ],
        steps=[
            make_step(1, "State Plan Inclusion", "State Higher Education Council prioritizes eligible institutions.", "district_office"),
            make_step(2, "Online Submission", "University submits proposal on PM-USHA portal for National Project Approval Board.", "online_portal", "https://pmusha.education.gov.in"),
        ]
    ),
    make_scheme(
        id="central-emrs-tribal",
        slug="eklavya-model-residential-schools-emrs",
        name="Eklavya Model Residential Schools (EMRS) Tribal Education Scheme",
        short_description="Completely free CBSE boarding school education (Classes 6 to 12) including uniform, books, meals, and sports training for Scheduled Tribe children.",
        full_description="EMRS is a premier Central Sector initiative under the Ministry of Tribal Affairs establishing quality residential schools across remote tribal blocks, offering completely free quality education, skill training, and career preparation.",
        category="education_aid",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Tribal Affairs",
        department="National Education Society for Tribal Students (NESTS)",
        portal_url="https://emrs.tribal.gov.in",
        benefit_details="100% free residential schooling, lodging, boarding, uniforms, textbooks, computer labs, and national level sports training.",
        eligibilitySummary="Scheduled Tribe (ST) boys and girls seeking admission into Class 6 selected via national / state level entrance test.",
        rules=[
            make_rule("casteCategory", "EQUALS", "ST", "Scheduled Tribe Community", "EMRS Admission Policy Section 2"),
            make_rule("admissionClass", "EQUALS", 6, "Admission into Class 6", "EMRS Admission Policy Section 3"),
        ],
        documents=[
            make_doc("doc-emrs-st", "ST Caste Certificate", "Official Scheduled Tribe verification certificate", "Tahsildar / RDO", "EMRS Rule 4"),
            make_doc("doc-emrs-transfer", "Class 5 School Leaving / Transfer Certificate", "School attendance certificate", "Headmaster", "EMRS Rule 5"),
        ],
        steps=[
            make_step(1, "Entrance Exam Application", "Submit application on state/NESTS portal for EMRS Selection Test (EMRSST).", "online_portal", "https://emrs.tribal.gov.in"),
            make_step(2, "Appear for Entrance Test", "Appear for bilingual mental ability, mathematics, and language test.", "college_cell"),
            make_step(3, "Admission & Allotment", "Counseling and joining allotted EMRS residential campus.", "district_office"),
        ]
    ),

    # ----------------------------------------------------
    # AGRICULTURE, DAIRY, FISHERIES & IRRIGATION
    # ----------------------------------------------------
    make_scheme(
        id="central-pm-kusum",
        slug="pradhan-mantri-kisan-urja-suraksha-evam-utthaan-mahabhiyan-pm-kusum",
        name="PM-KUSUM (Kisan Urja Suraksha evam Utthaan Mahabhiyan)",
        short_description="Up to 60% capital subsidy to install standalone solar water pumps and solarize existing grid-connected agricultural pumps for farmers.",
        full_description="PM-KUSUM enables farmers to generate clean energy, replace diesel irrigation pumps with highly subsidized solar water pumps (Component B), and sell surplus solar power back to state DISCOMs for supplementary agricultural income (Component C).",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of New and Renewable Energy",
        department="Renewable Energy Department",
        portal_url="https://pmkusum.mnre.gov.in",
        benefit_details="30% Central Financial Assistance (CFA) + 30% State Govt subsidy (up to 60% total subsidy). Farmer pays only 10% upfront, remaining 30% via bank loan.",
        eligibilitySummary="Individual farmers, Water User Associations, Primary Agriculture Credit Societies (PACS), and Farmer Producer Organizations (FPOs) having agricultural land requiring irrigation.",
        rules=[
            make_rule("occupation", "EQUALS", "farmer", "Farmer or Agricultural Society", "PM-KUSUM Operational Guidelines 3.1"),
        ],
        documents=[
            make_doc("doc-kusum-land", "Agricultural Land Revenue Records (7/12, RoR, Patta)", "Proof of agricultural land ownership", "Revenue Dept", "PM-KUSUM Checklist 1"),
            make_doc("doc-kusum-bank", "Bank Passbook & Aadhaar Card", "Bank account details for credit/loan tie-up", "Commercial Bank", "PM-KUSUM Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply on State Nodal Portal", "Apply on designated State Renewable Energy Agency portal (e.g. TGREDCO, MEDA, HAREDA).", "online_portal", "https://pmkusum.mnre.gov.in"),
            make_step(2, "Pay Beneficiary Share", "Pay 10% farmer share after site feasibility survey by vendor.", "online_portal"),
            make_step(3, "Solar Pump Installation", "Authorized empanelled vendor installs solar pump and testing certificate issued.", "meeseva_csc"),
        ]
    ),
    make_scheme(
        id="central-kcc-interest-subvention",
        slug="kisan-credit-card-kcc-interest-subvention",
        name="Kisan Credit Card (KCC) with Modified Interest Subvention Scheme (MISS)",
        short_description="Short-term crop loans up to ₹3 Lakhs at an effective concessional interest rate of only 4% per annum upon prompt repayment.",
        full_description="The Kisan Credit Card scheme provides timely institutional credit to farmers for agricultural inputs (seeds, fertilizers, pesticides), post-harvest expenses, animal husbandry, and fisheries at a subsidized base rate of 7%, reduced to 4% upon timely repayment.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Agriculture and Farmers Welfare",
        department="Department of Agriculture and Farmers Welfare",
        portal_url="https://agricoop.nic.in",
        benefit_details="Collateral-free short-term agricultural credit up to ₹1.60 Lakhs (and up to ₹3 Lakhs with land hypothecation) at 4% effective interest rate.",
        eligibilitySummary="All farmers - individuals/joint borrowers, tenant farmers, oral lessees, sharecroppers, and SHG/JLGs of farmers involved in agriculture, dairy, poultry, or fisheries.",
        rules=[
            make_rule("activity", "IN", ["crop_cultivation", "dairy", "fisheries", "poultry"], "Agricultural or Allied Activities", "RBI KCC Master Circular Section 2"),
        ],
        documents=[
            make_doc("doc-kcc-land", "Land Record Extract / Tenancy Agreement", "Record of Rights showing cropping pattern", "Revenue Officer / Patwari", "KCC Master Circular 4"),
            make_doc("doc-kcc-kyc", "Aadhaar Card and PAN / Form 60", "Identity and address verification", "UIDAI", "KCC Master Circular 5"),
        ],
        steps=[
            make_step(1, "Submit One-Page KCC Form", "Submit simplified KCC application at nearest commercial bank, RRB, or CSC center.", "meeseva_csc"),
            make_step(2, "Bank Verification", "Bank verifies land records on state digital revenue portal within 14 working days.", "district_office"),
            make_step(3, "KCC RuPay Card Issuance", "Receive RuPay Kisan Card for ATM withdrawal and point-of-sale agro purchase.", "college_cell"),
        ]
    ),
    make_scheme(
        id="central-pmmsy-fisheries",
        slug="pradhan-mantri-matsya-sampada-yojana-pmmsy",
        name="Pradhan Mantri Matsya Sampada Yojana (PMMSY)",
        short_description="Up to 60% capital subsidy for fish farming ponds, recirculatory aquaculture systems (RAS), biofloc, motorized fishing boats, and cold storage units.",
        full_description="PMMSY is a landmark initiative under the Ministry of Fisheries, Animal Husbandry and Dairying aimed at harnessing India's fisheries potential with ₹20,050 Crore investment, modernizing aquaculture infrastructure, and doubling fishers' income.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Fisheries, Animal Husbandry and Dairying",
        department="Department of Fisheries",
        portal_url="https://pmmsy.dof.gov.in",
        benefit_details="60% project cost subsidy for Women, SC, and ST beneficiaries; 40% subsidy for General category entrepreneurs across freshwater aquaculture, biofloc, and marine crafts.",
        eligibilitySummary="Fishers, fish farmers, fish workers, SHGs, JLGs, fisheries cooperatives, and private entrepreneurs with owned or leased land/water bodies.",
        rules=[
            make_rule("activityType", "EQUALS", "aquaculture_fisheries", "Aquaculture or Fisheries Enterprise", "PMMSY Operational Guidelines 4.1"),
        ],
        documents=[
            make_doc("doc-pmmsy-dpr", "Detailed Project Report (DPR)", "Technical and financial viability report of aquaculture unit", "Chartered Engineer / Self", "PMMSY Annexure III"),
            make_doc("doc-pmmsy-land", "Land / Waterbody Lease Agreement or Title", "Proof of ownership or minimum 10-year registered lease", "Sub-Registrar", "PMMSY Annexure IV"),
        ],
        steps=[
            make_step(1, "Online Project Submission", "Submit project proposal on the PMMSY National Portal.", "online_portal", "https://pmmsy.dof.gov.in"),
            make_step(2, "District Fisheries Review", "District Level Committee (DLC) evaluates technical viability and approves sanction.", "district_office"),
            make_step(3, "Phased Subsidy Release", "Back-ended subsidy released into bank account linked with construction milestones.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-national-livestock-mission",
        slug="national-livestock-mission-nlm-entrepreneurship",
        name="National Livestock Mission (NLM) - Rural Entrepreneurship Scheme",
        short_description="50% capital subsidy up to ₹50 Lakhs for establishing commercial sheep, goat, pig, and poultry breeding farms and feed/fodder plants.",
        full_description="NLM supports rural entrepreneurs, SHGs, and FPOs to establish breed multiplication farms for sheep, goat, pig, and poultry, providing a 50% back-ended capital subsidy to create self-sustaining livestock enterprises and generate rural jobs.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Fisheries, Animal Husbandry and Dairying",
        department="Department of Animal Husbandry and Dairying",
        portal_url="https://nlm.udyamimitra.in",
        benefit_details="50% capital subsidy (up to ₹25 Lakhs for 500-bird poultry / 100-sheep farm, and up to ₹50 Lakhs for 500-sheep/goat breeding units) disbursed in two tranches.",
        eligibilitySummary="Individuals, FPOs, SHGs, JLGs, Section 8 companies having training or experience in animal husbandry with tied-up institutional bank financing.",
        rules=[
            make_rule("minLandArea", "GREATER_THAN_OR_EQUAL", 1, "Minimum Land Availability for Farm Construction", "NLM Guidelines 2026 Clause 3"),
        ],
        documents=[
            make_doc("doc-nlm-bank-inprinciple", "Bank Loan In-Principle Sanction Letter", "Proof of bank loan tie-up for remaining 50% project cost", "Commercial Bank", "NLM Checklist 2"),
            make_doc("doc-nlm-training", "Animal Husbandry Training Certificate", "Training from KVK / State Animal Husbandry Training Institute", "KVK / ICAR", "NLM Checklist 3"),
        ],
        steps=[
            make_step(1, "Apply on NLM Portal", "Submit DPR and land documents on the NLM Udyami Mitra portal.", "online_portal", "https://nlm.udyamimitra.in"),
            make_step(2, "State Implementing Agency Verification", "State Animal Husbandry Department inspects land and issues feasibility certificate.", "district_office"),
            make_step(3, "Subsidy Disbursement", "Central Government credits 50% subsidy to lender bank upon farm completion.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pmksy-per-drop-more-crop",
        slug="pradhan-mantri-krishi-sinchayee-yojana-pdmc",
        name="PM Krishi Sinchayee Yojana (PMKSY) - Per Drop More Crop (Micro Irrigation)",
        short_description="Financial subsidy up to 55% for small/marginal farmers and 45% for other farmers for installing Drip and Sprinkler irrigation systems.",
        full_description="Under PMKSY Per Drop More Crop, the Central Government provides financial subsidies to farmers across all states to adopt water-saving precision micro-irrigation systems (drip and sprinkler), significantly increasing crop yields and conserving groundwater.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Agriculture and Farmers Welfare",
        department="Department of Agriculture and Farmers Welfare",
        portal_url="https://pmksy.gov.in",
        benefit_details="55% subsidy of benchmark installation cost for Small and Marginal farmers (holding <= 2 hectares); 45% subsidy for other landholding farmers.",
        eligibilitySummary="All farmers possessing arable agricultural land with a perennial irrigation source (borewell, open well, or canal).",
        rules=[
            make_rule("waterSourceAvailable", "EQUALS", True, "Availability of Functional Water Source", "PMKSY PDMC Guidelines 2.4"),
        ],
        documents=[
            make_doc("doc-pdmc-ror", "Land Record / Passbook (Pahani / 7/12)", "Demonstrating cultivable land ownership", "Tahsildar / Village Revenue Officer", "PMKSY Annexure 1"),
            make_doc("doc-pdmc-quotation", "Empanelled Manufacturer Micro-Irrigation Estimate", "Technical design blueprint and quotation", "Empanelled Drip Vendor", "PMKSY Annexure 2"),
        ],
        steps=[
            make_step(1, "Registration on State Horticulture Portal", "Register online via state agriculture/horticulture micro-irrigation portal.", "online_portal", "https://pmksy.gov.in"),
            make_step(2, "Field Verification & Work Order", "Horticulture Officer verifies water source and GPS coordinates.", "district_office"),
            make_step(3, "Installation & Subsidy Release", "Vendor installs drip/sprinkler lines; subsidy credited directly via DBT.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-agri-infrastructure-fund",
        slug="agriculture-infrastructure-fund-aif",
        name="Agriculture Infrastructure Fund (AIF)",
        short_description="3% interest subvention and CGTMSE credit guarantee on bank loans up to ₹2 Crore for post-harvest farm infrastructure and cold storage.",
        full_description="AIF provides ₹1 Lakh Crore medium-to-long term debt financing facility for investment in viable post-harvest management infrastructure such as warehouses, cold chains, primary processing units, and smart agriculture IoT hubs.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Agriculture and Farmers Welfare",
        department="Department of Agriculture and Farmers Welfare",
        portal_url="https://agriinfra.dac.gov.in",
        benefit_details="3% per annum interest subvention on loans up to ₹2 Crore for a maximum period of 7 years, plus fee-free CGTMSE credit guarantee coverage.",
        eligibilitySummary="Primary Agricultural Credit Societies (PACS), Marketing Cooperative Societies, FPOs, SHGs, JLGs, Farmers, Agri-entrepreneurs, and Startups.",
        rules=[
            make_rule("projectType", "IN", ["warehouse", "cold_storage", "sorting_grading", "silos", "bio_fertilizer"], "Post-Harvest Infrastructure Project", "AIF Scheme Guidelines 3.1"),
        ],
        documents=[
            make_doc("doc-aif-dpr", "Detailed Project Report (DPR)", "Financial projections and cashflow statement", "Chartered Accountant / Consultant", "AIF Checklist 1"),
            make_doc("doc-aif-kyc", "Entity Registration & Land Title / Lease", "Proof of project site ownership", "Sub-Registrar", "AIF Checklist 2"),
        ],
        steps=[
            make_step(1, "Register on AIF Portal", "Submit basic project information and select preferred lending bank.", "online_portal", "https://agriinfra.dac.gov.in"),
            make_step(2, "Ministry Scrutiny", "Ministry Agriculture team vets DPR within 7-10 days and forwards to chosen bank.", "online_portal"),
            make_step(3, "Bank Sanction & Interest Benefit", "Bank sanctions loan and automatic 3% interest subvention applies from first EMI.", "district_office"),
        ]
    ),

    # ----------------------------------------------------
    # HEALTHCARE, NUTRITION & SOCIAL SECURITY
    # ----------------------------------------------------
    make_scheme(
        id="central-nikshay-poshan-yojana",
        slug="nikshay-poshan-yojana-tb-patient-dbt",
        name="Nikshay Poshan Yojana (Direct Benefit Transfer for TB Patients)",
        short_description="Direct monthly financial support of ₹500 to ₹1,000 per month for nutritional support to all notified Tuberculosis patients throughout treatment.",
        full_description="Implemented under the National Tuberculosis Elimination Programme (NTEP) by Ministry of Health and Family Welfare, Nikshay Poshan Yojana provides direct cash assistance into patients' bank accounts to meet dietary requirements during anti-TB treatment.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Health and Family Welfare",
        department="Central TB Division",
        portal_url="https://nikshay.in",
        benefit_details="₹500 to ₹1,000 per month credited directly through PFMS into beneficiary's bank account for the entire duration of medical anti-TB treatment.",
        eligibilitySummary="All diagnosed Tuberculosis patients notified on the national Ni-kshay portal receiving treatment from either public or private health facilities.",
        rules=[
            make_rule("healthCondition", "EQUALS", "diagnosed_tuberculosis", "Notified TB Patient on Ni-kshay", "NTEP Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-nikshay-id", "Ni-kshay Patient ID / Notification Slip", "Generated by treating physician or DOTS centre", "Government Hospital / RNTCP", "NTEP Clause 3"),
            make_doc("doc-nikshay-bank", "Aadhaar Linked Bank Passbook", "Active single bank account for DBT transfers", "Commercial Bank / Post Office", "NTEP Clause 4"),
        ],
        steps=[
            make_step(1, "Clinical Notification", "Doctor notifies case on Ni-kshay digital portal during diagnosis.", "district_office"),
            make_step(2, "Bank Account Seeding", "Patient provides Aadhaar and bank account number to health worker / DOTS provider.", "district_office"),
            make_step(3, "Monthly DBT Credits", "Cash transferred automatically via PFMS for each month of verified medication compliance.", "online_portal", "https://nikshay.in"),
        ]
    ),
    make_scheme(
        id="central-janani-suraksha-yojana",
        slug="janani-suraksha-yojana-jsy-maternal-health",
        name="Janani Suraksha Yojana (JSY - Safe Motherhood Intervention)",
        short_description="Cash incentive of ₹1,400 (rural) and ₹1,000 (urban) to pregnant women delivering in government or accredited private health facilities.",
        full_description="JSY is a safe motherhood intervention under the National Health Mission (NHM) aimed at reducing maternal and neonatal mortality by promoting institutional delivery among poor pregnant women, particularly in low-performing states.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Health and Family Welfare",
        department="Maternal Health Division",
        portal_url="https://nhm.gov.in",
        benefit_details="₹1,400 cash incentive in rural areas and ₹1,000 in urban areas for mothers, plus ₹600 ASHA incentive for rural institutional delivery support.",
        eligibilitySummary="Pregnant women aged 19 years and above belonging to BPL/SC/ST households delivering in public or accredited private hospitals.",
        rules=[
            make_rule("deliveryLocation", "IN", ["government_hospital", "chc", "phc", "accredited_private_hospital"], "Institutional Delivery Location", "JSY Guidelines Section 2"),
        ],
        documents=[
            make_doc("doc-jsy-mcp", "Mother and Child Protection (MCP) Card", "Issued during antenatal registration", "PHC / ASHA Worker", "JSY Checklist 1"),
            make_doc("doc-jsy-discharge", "Hospital Institutional Delivery Discharge Certificate", "Confirming birth in medical facility", "Medical Officer / Hospital", "JSY Checklist 2"),
        ],
        steps=[
            make_step(1, "Antenatal Registration", "Register pregnancy early with local ASHA / ANM and receive MCP Card.", "district_office"),
            make_step(2, "Institutional Delivery", "Deliver at nearest Primary Health Centre, Community Health Centre, or District Hospital.", "district_office"),
            make_step(3, "Cash Disbursal at Discharge", "Receive cheque or direct bank transfer before discharge from the hospital.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-rashtriya-arogya-nidhi",
        slug="rashtriya-arogya-nidhi-ran-financial-assistance",
        name="Rashtriya Arogya Nidhi (RAN) - Critical Illness Assistance",
        short_description="One-time financial assistance up to ₹15 Lakhs for poor patients suffering from life-threatening major diseases for treatment at government super-specialty hospitals.",
        full_description="RAN provides vital financial aid to indigent patients living below the poverty line suffering from life-threatening conditions (cancer, cardiac, neuro, organ transplants) to receive super-specialty treatment at AIIMS and designated central government institutions.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Health and Family Welfare",
        department="Department of Health and Family Welfare",
        portal_url="https://main.mohfw.gov.in/major-programmes/poor-patients-financial-assistance/rashtriya-arogya-nidhi",
        benefit_details="Direct financial grant up to ₹15,00,000 released directly to the treating government super-specialty hospital (AIIMS, PGI, etc.) for procedures, implants, and medicines.",
        eligibilitySummary="Patient suffering from designated life-threatening illness, family income below state poverty line (BPL / Antyodaya), and not covered under AB-PMJAY.",
        rules=[
            make_rule("hospitalCategory", "IN", ["aiims", "central_super_specialty_hospital"], "Treatment at Designated Apex Institute", "RAN Scheme Rules 3.1"),
            make_rule("bplStatus", "EQUALS", True, "Below Poverty Line Household", "RAN Scheme Rules 3.2"),
        ],
        documents=[
            make_doc("doc-ran-proforma", "RAN Application Proforma & Cost Estimate", "Signed by treating Professor / Head of Department and Medical Superintendent", "Government Hospital", "RAN Form A"),
            make_doc("doc-ran-income", "Valid BPL Ration Card / Income Certificate", "Proof of indigent economic status", "Tahsildar / Food & Civil Supplies", "RAN Form B"),
        ],
        steps=[
            make_step(1, "Medical Evaluation", "Consulting doctor at AIIMS/Govt Apex Hospital certifies disease and prepares estimate.", "district_office"),
            make_step(2, "Hospital Committee Endorsement", "Technical committee of treating hospital forwards application to MoHFW.", "district_office"),
            make_step(3, "Fund Sanction to Hospital", "Ministry sanctions funds directly to patient revolving fund of hospital.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pm-jan-dhan-yojana",
        slug="pradhan-mantri-jan-dhan-yojana-pmjdy",
        name="Pradhan Mantri Jan Dhan Yojana (PMJDY)",
        short_description="Zero-balance basic savings bank account with free RuPay debit card, ₹2 Lakh accidental insurance cover, and ₹10,000 overdraft facility.",
        full_description="PMJDY is the National Mission for Financial Inclusion ensuring universal access to banking services, basic savings accounts, remittance, credit, insurance, and pension in an affordable manner with zero minimum balance requirement.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Finance",
        department="Department of Financial Services",
        portal_url="https://pmjdy.gov.in",
        benefit_details="Zero minimum balance account, free RuPay debit card with ₹2,00,000 accidental insurance, and eligible for ₹10,000 overdraft facility per household (preferable women).",
        eligibilitySummary="Any Indian citizen aged 10 years and above who does not already possess a bank account.",
        rules=[
            make_rule("citizenship", "EQUALS", "indian", "Indian Citizen", "PMJDY Guidelines Section 2"),
        ],
        documents=[
            make_doc("doc-pmjdy-kyc", "Aadhaar Card / Voter ID / MGNREGA Job Card", "Officially Valid Document (OVD) for KYC", "UIDAI / Election Commission", "PMJDY Annexure 1"),
        ],
        steps=[
            make_step(1, "Visit Nearest Bank Branch or Bank Mitra", "Approach any commercial bank branch or Customer Service Point (CSP).", "meeseva_csc"),
            make_step(2, "Complete Simplified Account Opening Form", "Provide Aadhaar number and biometrics for e-KYC instant account creation.", "meeseva_csc"),
            make_step(3, "Receive RuPay Debit Card", "Collect passbook and RuPay ATM card with active accident insurance.", "meeseva_csc"),
        ]
    ),
    make_scheme(
        id="central-pm-suraksha-bima",
        slug="pradhan-mantri-suraksha-bima-yojana-pmsby",
        name="Pradhan Mantri Suraksha Bima Yojana (PMSBY)",
        short_description="Accidental death and permanent disability insurance cover of ₹2 Lakhs for an annual premium of just ₹20 auto-debited from bank account.",
        full_description="PMSBY is a government-backed accident insurance scheme in India providing high-value financial protection against accidental death and permanent total/partial disability for individuals aged 18 to 70 years.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Finance",
        department="Department of Financial Services",
        portal_url="https://financialservices.gov.in/insurance-divisions/Government-Sponsored-Socially-Oriented-Insurance-Schemes/Pradhan-Mantri-Suraksha-Bima-Yojana(PMSBY)",
        benefit_details="₹2,00,000 for accidental death or permanent total disability; ₹1,00,000 for permanent partial disability. Annual premium: ₹20.",
        eligibilitySummary="Individuals aged between 18 and 70 years holding an active bank savings account with auto-debit consent enabled.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Minimum Age 18 Years", "PMSBY Rules Clause 2"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 70, "Maximum Age 70 Years", "PMSBY Rules Clause 3"),
        ],
        documents=[
            make_doc("doc-pmsby-consent", "Auto-Debit Bank Consent Mandate", "Authorization to deduct ₹20 annually in May/June", "Bank Branch / Net Banking", "PMSBY Form 1"),
        ],
        steps=[
            make_step(1, "Consent Submission", "Log in to internet/mobile banking or submit consent form at home bank branch.", "online_portal"),
            make_step(2, "Annual Premium Deduction", "Bank auto-debits ₹20 every year between 25th to 31st May.", "online_portal"),
            make_step(3, "Insurance Certificate", "Policy certificate issued with instant active risk cover from June 1 to May 31.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pm-jeevan-jyoti",
        slug="pradhan-mantri-jeevan-jyoti-bima-yojana-pmjjby",
        name="Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)",
        short_description="Life insurance cover of ₹2 Lakhs in case of death due to any cause for an annual premium of ₹436 auto-debited from bank account.",
        full_description="PMJJBY provides renewable one-year term life insurance coverage of ₹2 Lakhs to people in the age group of 18 to 50 years against death due to any reason, making life insurance accessible to low-income households.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Finance",
        department="Department of Financial Services",
        portal_url="https://financialservices.gov.in/insurance-divisions/Government-Sponsored-Socially-Oriented-Insurance-Schemes/Pradhan-Mantri-Jeevan-Jyoti-Bima-Yojana(PMJJBY)",
        benefit_details="₹2,00,000 payable to nominee in the unfortunate event of the insured member's death due to any cause. Annual premium: ₹436.",
        eligibilitySummary="Indian residents aged 18 to 50 years holding a savings bank account who give consent for auto-debit of premium.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Minimum Age 18 Years", "PMJJBY Rules Clause 2"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 50, "Maximum Age 50 Years", "PMJJBY Rules Clause 3"),
        ],
        documents=[
            make_doc("doc-pmjjby-consent", "PMJJBY Enrolment & Nominee Mandate", "Nominee details and auto-debit authorization", "Bank / Net Banking", "PMJJBY Schedule A"),
        ],
        steps=[
            make_step(1, "Enrolment through Bank", "Submit enrolment form with nominee details at your bank branch or via mobile banking app.", "online_portal"),
            make_step(2, "Auto-Debit of ₹436", "Annual premium auto-debited directly from account.", "online_portal"),
            make_step(3, "Nominee Claim Process", "In case of demise, nominee submits death certificate and claim form for quick DBT settlement.", "meeseva_csc"),
        ]
    ),
    make_scheme(
        id="central-pm-shram-yogi-maandhan",
        slug="pradhan-mantri-shram-yogi-maan-dhan-pmsym",
        name="Pradhan Mantri Shram Yogi Maan-dhan (PM-SYM)",
        short_description="Guaranteed monthly pension of ₹3,000 after attaining 60 years of age for unorganised workers with matching 50% central contribution.",
        full_description="PM-SYM is a voluntary and contributory pension scheme for unorganised workers (street vendors, domestic workers, rickshaw pullers, construction labourers, agricultural workers) earning up to ₹15,000/month, ensuring social security in old age.",
        category="pension",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Labour and Employment",
        department="Social Security Division",
        portal_url="https://maandhan.in",
        benefit_details="Guaranteed monthly pension of ₹3,000 after reaching age 60. Beneficiary contributes ₹55 to ₹200 per month depending on entry age (18-40), with matching 50% contribution by Central Government.",
        eligibilitySummary="Unorganised workers aged 18 to 40 years with monthly income <= ₹15,000, not an income tax payer, and not covered under EPFO/ESIC/NPS.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Entry Age 18-40 Years", "PM-SYM Clause 2.1"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 40, "Maximum Entry Age 40 Years", "PM-SYM Clause 2.2"),
            make_rule("monthlyIncome", "LESS_THAN_OR_EQUAL", 15000, "Monthly Income <= ₹15,000", "PM-SYM Clause 2.3"),
        ],
        documents=[
            make_doc("doc-pmsym-aadhaar", "Aadhaar Card", "Identity proof for e-KYC", "UIDAI", "PM-SYM Checklist 1"),
            make_doc("doc-pmsym-bank", "Savings Bank Passbook / Jan Dhan Account", "With auto-debit facility enabled", "Bank / Post Office", "PM-SYM Checklist 2"),
        ],
        steps=[
            make_step(1, "Visit Nearest CSC Centre", "Carry Aadhaar card and bank passbook to any Common Services Centre.", "meeseva_csc"),
            make_step(2, "Calculate Contribution & e-Sign", "System computes monthly subscription amount based on age; sign auto-debit mandate.", "meeseva_csc"),
            make_step(3, "Receive Shram Yogi Pension Card", "Get instant printed PM-SYM unique pension card with pension ID.", "meeseva_csc"),
        ]
    ),

    # ----------------------------------------------------
    # MSME, STARTUPS, ARTISANS & SKILLING
    # ----------------------------------------------------
    make_scheme(
        id="central-pmegp-subsidy",
        slug="prime-ministers-employment-generation-programme-pmegp",
        name="Prime Minister's Employment Generation Programme (PMEGP)",
        short_description="Credit-linked subsidy program providing 15% to 35% margin money subsidy on bank loans up to ₹50 Lakhs for setting up new manufacturing or service micro-enterprises.",
        full_description="PMEGP is a major credit-linked subsidy scheme administered by KVIC under the Ministry of MSME to generate continuous employment opportunities in rural as well as urban areas by financing new micro-enterprises across manufacturing and service sectors.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Micro, Small and Medium Enterprises",
        department="Khadi and Village Industries Commission (KVIC)",
        portal_url="https://www.kviconline.gov.in/pmegpeportal",
        benefit_details="Project cost up to ₹50 Lakhs for manufacturing and ₹20 Lakhs for services. Margin money subsidy of 25-35% in rural areas and 15-25% in urban areas.",
        eligibilitySummary="Any individual aged 18+ with minimum 8th class pass for projects above ₹10L (manufacturing) or ₹5L (services). Self Help Groups and cooperative societies are also eligible.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Minimum Age 18 Years", "PMEGP Guidelines Clause 3.1"),
            make_rule("newUnitOnly", "EQUALS", True, "New Enterprise Unit Setup Only", "PMEGP Guidelines Clause 3.2"),
        ],
        documents=[
            make_doc("doc-pmegp-dpr", "Detailed Project Report (DPR)", "Project cost, machinery details, and break-even analysis", "Certified CA / Self", "PMEGP Form 1"),
            make_doc("doc-pmegp-edu", "Education Qualification Certificate (8th / 10th / Degree)", "Proof of minimum educational qualification", "School Board / University", "PMEGP Form 2"),
        ],
        steps=[
            make_step(1, "Apply Online on KVIC Portal", "Fill out PMEGP online application and upload DPR and KYC documents.", "online_portal", "https://www.kviconline.gov.in/pmegpeportal"),
            make_step(2, "District Task Force Committee Review", "District Level Task Force Committee (DLTFC) scrutinizes application and forwards to financing bank.", "district_office"),
            make_step(3, "EDP Training & Disbursement", "Undergo mandatory Entrepreneurship Development Programme (EDP) training; bank disburses loan and subsidy is held in TDR.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-startup-india-seed-fund",
        slug="startup-india-seed-fund-scheme-sisfs",
        name="Startup India Seed Fund Scheme (SISFS)",
        short_description="Financial assistance up to ₹20 Lakhs as grant for proof of concept and up to ₹50 Lakhs through convertible debentures/debt for prototype commercialization.",
        full_description="Administered by DPIIT under Ministry of Commerce and Industry, SISFS provides seed funding to early-stage DPIIT-recognized startups for proof of concept, prototype development, product trials, market entry, and commercialization through empanelled incubators across India.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Commerce and Industry",
        department="Department for Promotion of Industry and Internal Trade (DPIIT)",
        portal_url="https://seedfund.startupindia.gov.in",
        benefit_details="Up to ₹20,00,000 as direct grant for prototype / validation, and up to ₹50,00,000 as debt/convertible debentures for commercialization and scaling.",
        eligibilitySummary="DPIIT recognized startup incorporated not more than 2 years ago, with an innovative business idea, shareholding of Indian promoters >= 51%, and not received more than ₹10 Lakhs monetary support under other central/state schemes.",
        rules=[
            make_rule("dpiitRecognized", "EQUALS", True, "DPIIT Recognized Startup", "SISFS Guidelines Clause 4.1"),
            make_rule("incorporationYears", "LESS_THAN_OR_EQUAL", 2, "Incorporated Within Past 2 Years", "SISFS Guidelines Clause 4.2"),
        ],
        documents=[
            make_doc("doc-sisfs-dpiit", "DPIIT Certificate of Recognition", "Issued by Startup India Portal", "DPIIT", "SISFS Checklist 1"),
            make_doc("doc-sisfs-pitch", "Pitch Deck & Financial Model", "Showcasing product novelty, market size, and milestones", "Startup Founder", "SISFS Checklist 2"),
        ],
        steps=[
            make_step(1, "Login with Startup India Credentials", "Apply on the SISFS portal and select up to 3 preferred incubators.", "online_portal", "https://seedfund.startupindia.gov.in"),
            make_step(2, "Incubator Pitch Presentation", "Shortlisted startups present business model and POC to the Incubator Seed Management Committee (ISMC).", "online_portal"),
            make_step(3, "Milestone-Based Fund Release", "Sanctioned grant/debt disbursed directly to startup bank account based on agreed milestones.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-cgtmse-credit-guarantee",
        slug="credit-guarantee-fund-trust-micro-small-enterprises-cgtmse",
        name="Credit Guarantee Fund Trust for Micro and Small Enterprises (CGTMSE)",
        short_description="Collateral-free credit facility up to ₹5 Crore for micro and small enterprises with guarantee coverage up to 85% by the Government of India.",
        full_description="CGTMSE was set up by Ministry of MSME and SIDBI to catalyze flow of institutional credit to micro and small manufacturing and service enterprises without requiring third-party collaterals or asset hypothecations.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Micro, Small and Medium Enterprises",
        department="Department of MSME & SIDBI",
        portal_url="https://www.cgtmse.in",
        benefit_details="Collateral-free term loans and working capital credit up to ₹5,00,00,000 with credit guarantee cover of 75% to 85% for women and SC/ST entrepreneurs.",
        eligibilitySummary="New and existing Micro and Small Enterprises (MSEs) in manufacturing, retail trade, and service sectors (excluding educational institutions, agriculture, and SHGs).",
        rules=[
            make_rule("enterpriseCategory", "IN", ["micro_enterprise", "small_enterprise"], "Registered MSE with Udyam Registration", "CGTMSE Scheme Clause 2"),
        ],
        documents=[
            make_doc("doc-cgtmse-udyam", "Udyam Registration Certificate", "Valid MSME digital registration certificate", "Ministry of MSME", "CGTMSE Checklist A"),
            make_doc("doc-cgtmse-itr", "ITR and Financial Statements (Last 2-3 Years)", "Audited balance sheet or projected financials", "Chartered Accountant", "CGTMSE Checklist B"),
        ],
        steps=[
            make_step(1, "Formulate Business Plan", "Prepare comprehensive project report with financial requirements.", "online_portal"),
            make_step(2, "Apply at Member Lending Bank", "Approach any scheduled commercial bank or NBFC for credit under CGTMSE scheme.", "district_office"),
            make_step(3, "Guarantee Sanction", "Lender bank processes loan without mortgage collateral and obtains guarantee from CGTMSE portal.", "online_portal", "https://www.cgtmse.in"),
        ]
    ),
    make_scheme(
        id="central-samarth-textiles",
        slug="samarth-scheme-for-capacity-building-textile-sector",
        name="SAMARTH (Scheme for Capacity Building in Textile Sector)",
        short_description="Industry-partnered job-oriented skilling program providing 100% free certified training and minimum 70% wage employment placement in textile industries.",
        full_description="SAMARTH is a demand-driven and placement-oriented flagship skilling program under the Ministry of Textiles to train youth and handloom/handicraft artisans in spinning, weaving, garmenting, and technical textiles with verified employment.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Textiles",
        department="Textile Training Division",
        portal_url="https://samarth-textiles.gov.in",
        benefit_details="100% free national NSQF-aligned technical training, biometrically verified attendance, stipend, and guaranteed minimum 70% wage placement in textile factories.",
        eligibilitySummary="Indian youth aged 18 to 45 years seeking employment in textile and apparel manufacturing clusters.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Minimum Age 18 Years", "SAMARTH Scheme Clause 3"),
        ],
        documents=[
            make_doc("doc-samarth-aadhaar", "Aadhaar Card", "Mandatory for AEBAS biometric attendance", "UIDAI", "SAMARTH Checklist 1"),
        ],
        steps=[
            make_step(1, "Enrolment at SAMARTH Training Centre", "Register at nearest accredited textile training facility in your cluster.", "meeseva_csc"),
            make_step(2, "Classroom & Hands-on Training", "Undergo 300-400 hours of NSQF skill curriculum with biometric verification.", "college_cell"),
            make_step(3, "Assessment & Industry Placement", "Third-party assessment by Sector Skill Council followed by campus job placement.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-nhdp-weavers",
        slug="national-handloom-development-programme-nhdp",
        name="National Handloom Development Programme (NHDP)",
        short_description="Concessional yarn supply with 15% price subsidy, financial grant up to ₹25,000 for upgraded looms, and design development for weavers.",
        full_description="NHDP supports handloom weavers across India by ensuring subsidized supply of quality yarn (Raw Material Supply Scheme), upgrading traditional pit looms to modern frame looms, establishing mega handloom clusters, and promoting brand 'India Handloom'.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Textiles",
        department="Office of the Development Commissioner for Handlooms",
        portal_url="https://handlooms.nic.in",
        benefit_details="15% price subsidy on cotton/hank yarn, ₹25,000 financial grant for improved loom accessories, and marketing stalls at national handloom expos.",
        eligibilitySummary="Practicing handloom weavers, master weavers, handloom cooperatives, and Self Help Groups holding Weaver Pehchan Identity Cards.",
        rules=[
            make_rule("profession", "EQUALS", "handloom_weaver", "Verified Handloom Weaver", "NHDP Scheme Clause 2.1"),
        ],
        documents=[
            make_doc("doc-nhdp-pehchan", "Weaver Pehchan Card", "Digital weaver identity card issued by DC Handlooms", "Weavers Service Centre (WSC)", "NHDP Checklist 1"),
        ],
        steps=[
            make_step(1, "Register at Weavers Service Centre", "Submit application at district Weavers Service Centre or state handloom cooperative.", "district_office"),
            make_step(2, "Avail Subsidized Yarn", "Purchase yarn through National Handloom Development Corporation (NHDC) depots with instant subsidy.", "online_portal"),
            make_step(3, "Loom Upgradation Grant", "Inspect and install sanctioned modern loom accessories with assistance from master trainers.", "district_office"),
        ]
    ),

    # ----------------------------------------------------
    # SOCIAL JUSTICE, EMPOWERMENT & DISABILITY
    # ----------------------------------------------------
    make_scheme(
        id="central-adip-assistive-devices",
        slug="assistance-to-disabled-persons-adip-scheme",
        name="Assistance to Disabled Persons for Purchase/Fitting of Aids and Appliances (ADIP)",
        short_description="100% free distribution of sophisticated assistive aids including motorized tricycles, cochlear implants (up to ₹6 Lakhs), and smart vision devices for PwDs.",
        full_description="The ADIP Scheme implemented by ALIMCO under Ministry of Social Justice and Empowerment assists needy persons with disabilities in procuring durable, sophisticated, and scientifically manufactured aids and appliances to promote physical, social, and economic independence.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Empowerment of Persons with Disabilities (DEPwD)",
        portal_url="https://adip.depwd.gov.in",
        benefit_details="100% free assistive aids (up to ₹15,000 for standard aids, ₹50,000 for motorized tricycles, and up to ₹6,00,000 for pediatric cochlear implant surgeries).",
        eligibilitySummary="Indian citizen with minimum 40% disability holding valid UDID card, having monthly family income <= ₹20,000 (100% aid) or ₹20,001-₹30,000 (50% aid).",
        rules=[
            make_rule("disabilityPercentage", "GREATER_THAN_OR_EQUAL", 40, "Minimum 40% Benchmark Disability", "ADIP Scheme Guidelines Clause 3.1"),
            make_rule("monthlyFamilyIncome", "LESS_THAN_OR_EQUAL", 30000, "Monthly Income <= ₹30,000", "ADIP Scheme Guidelines Clause 3.2"),
        ],
        documents=[
            make_doc("doc-adip-udid", "Unique Disability Identity Card (UDID)", "Proof of benchmark disability", "District Medical Board", "ADIP Form 1"),
            make_doc("doc-adip-income", "Income Certificate / BPL Card", "Income proof showing <= ₹30,000 per month", "Revenue Authority / Tahsildar", "ADIP Form 2"),
        ],
        steps=[
            make_step(1, "Assessment at ALIMCO Camp", "Attend district disability assessment camp organized by ALIMCO / District Social Welfare.", "district_office"),
            make_step(2, "Prescription & Measurement", "Medical experts examine clinical need and take measurements for customized prosthetic/orthotic aids.", "district_office"),
            make_step(3, "Free Distribution Mega Camp", "Receive motorized tricycle, wheelchair, hearing aid, or smart cane with warranty and user training.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-pm-janman-tribal",
        slug="pradhan-mantri-janjati-adivasi-nyaya-maha-abhiyan-pm-janman",
        name="Pradhan Mantri Janjati Adivasi Nyaya Maha Abhiyan (PM-JANMAN)",
        short_description="Comprehensive ₹24,000 Crore mission delivering pucca homes, clean piped water, solar power, healthcare, and road connectivity to 75 PVTG tribal communities.",
        full_description="PM-JANMAN is the dedicated mission targeting Particularly Vulnerable Tribal Groups (PVTGs) residing in deep forest and hill terrains across 18 states and UTs, saturated with housing, mobile medical units, clean drinking water, telecommunication, and livelihood centres.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Tribal Affairs",
        department="PVTG Development Cell",
        portal_url="https://tribal.gov.in/PMJANMAN.aspx",
        benefit_details="Free pucca house under PMAY-G (enhanced to ₹2.39 Lakhs), household off-grid solar electricity connection, functional tap water, piped road connectivity, and Van Dhan Vikas Kendra linkages.",
        eligibilitySummary="Households belonging to 75 notified Particularly Vulnerable Tribal Groups (PVTGs) identified through door-to-door saturation survey.",
        rules=[
            make_rule("tribalGroup", "EQUALS", "pvtg", "Notified Particularly Vulnerable Tribal Group", "PM-JANMAN Operational Framework 2.1"),
        ],
        documents=[
            make_doc("doc-janman-survey", "PVTG Identification & Aadhaar Enrolment", "Verified by District Tribal Development Officer", "Integrated Tribal Development Agency (ITDA)", "PM-JANMAN Checklist 1"),
        ],
        steps=[
            make_step(1, "Door-to-Door Saturation Enumeration", "District ITDA field teams enumerate PVTG habitations using mobile application.", "district_office"),
            make_step(2, "On-the-spot Aadhaar & Ayushman Card Creation", "Mobile camps issue Aadhaar, caste certificates, and Jan Dhan accounts on-site.", "district_office"),
            make_step(3, "Infrastructure Sanction & Construction", "Funds released directly into beneficiary accounts for home construction and village micro-grids.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-smile-transgender",
        slug="support-for-marginalised-individuals-smile-scheme",
        name="SMILE (Support for Marginalised Individuals for Livelihood and Enterprise)",
        short_description="Integrated welfare offering comprehensive scholarship, health insurance (₹5 Lakhs PM-JAY cover), Garima Greh shelter, and skill training for Transgender persons.",
        full_description="SMILE is an umbrella initiative formulated by the Ministry of Social Justice and Empowerment covering two sub-schemes: Comprehensive Rehabilitation for Welfare of Transgender Persons and Comprehensive Rehabilitation of Persons engaged in the act of Begging.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Social Justice and Empowerment",
        portal_url="https://transgender.dosje.gov.in",
        benefit_details="Scholarships for transgender students (Classes 9 to Post-Graduation), ₹5,00,000 annual health cover including gender-affirming care, skill training stipend, and shelter at Garima Greh homes.",
        eligibilitySummary="Transgender persons holding Transgender Certificate of Identity issued through the National Portal for Transgender Persons.",
        rules=[
            make_rule("transgenderCertificate", "EQUALS", True, "Registered on National Portal for Transgender Persons", "SMILE Scheme Clause 4"),
        ],
        documents=[
            make_doc("doc-smile-cert", "Transgender Certificate & Identity Card", "Digital certificate issued by District Magistrate", "District Magistrate Portal", "National Portal TG Rules"),
        ],
        steps=[
            make_step(1, "Apply on National Transgender Portal", "Obtain official Transgender Identity Card from District Magistrate with self-perceived gender identity.", "online_portal", "https://transgender.dosje.gov.in"),
            make_step(2, "Select Welfare Module", "Apply for education scholarship, PM-JAY Ayushman Bharat TG card, or skill development program.", "online_portal"),
            make_step(3, "Direct Benefit Disbursement", "Receive monthly education stipend and healthcare insurance card.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pm-ajay",
        slug="pradhan-mantri-anusuchit-jaati-abhyuday-yojana-pm-ajay",
        name="Pradhan Mantri Anusuchit Jaati Abhyuday Yojana (PM-AJAY)",
        short_description="Integrated development of Scheduled Caste dominant villages, income-generation asset grants up to ₹50,000, and construction of hostel facilities.",
        full_description="PM-AJAY merges three earlier schemes (SCA to SCSP, PMAGY, and Babu Jagjivan Ram Chhatrawas Yojana) to reduce poverty among SC communities through generation of additional employment opportunities and saturation of infrastructure in SC-majority villages.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Department of Social Justice and Empowerment",
        portal_url="https://pmajay.dosje.gov.in",
        benefit_details="Financial subsidy up to ₹50,000 or 50% of asset cost for self-employment and micro-enterprises; infrastructure grants of ₹20 Lakhs per Adarsh Gram SC village.",
        eligibilitySummary="Individuals belonging to Scheduled Caste (SC) living below double poverty line limit seeking income generation assets or residing in identified Adarsh Grams.",
        rules=[
            make_rule("casteCategory", "EQUALS", "SC", "Scheduled Caste Community", "PM-AJAY Guidelines 2.1"),
        ],
        documents=[
            make_doc("doc-ajay-caste", "Scheduled Caste Certificate", "Proof of SC status", "Tahsildar", "PM-AJAY Checklist 1"),
            make_doc("doc-ajay-income", "Income Certificate", "Income verification for subsidy entitlement", "Revenue Authority", "PM-AJAY Checklist 2"),
        ],
        steps=[
            make_step(1, "Submit Application at District Welfare Office", "Submit proposal for income-generation asset (poultry, dairy, small retail shop).", "district_office"),
            make_step(2, "District Level Sanction", "District Welfare Officer evaluates beneficiary eligibility and approves capital grant.", "district_office"),
            make_step(3, "Direct Asset / Subsidy Transfer", "Subsidy released to supplier or beneficiary account to purchase verified machinery/stock.", "online_portal"),
        ]
    ),

    # ----------------------------------------------------
    # WOMEN & CHILD EMPOWERMENT
    # ----------------------------------------------------
    make_scheme(
        id="central-mission-shakti-one-stop-centre",
        slug="mission-shakti-sambal-one-stop-centre-sakhi",
        name="Mission Shakti - Sambal: One Stop Centre (Sakhi Centres)",
        short_description="24x7 integrated support providing immediate medical aid, police assistance, psycho-social counseling, legal aid, and temporary shelter for women facing violence.",
        full_description="One Stop Centres (popularly known as Sakhi Centres) are established across all districts under Mission Shakti to facilitate access to an integrated range of services including medical, legal, police assistance, counseling, and 5-day temporary shelter under one roof to women affected by violence.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Women and Child Development",
        department="Women Welfare Division",
        portal_url="https://wcd.nic.in/schemes/mission-shakti",
        benefit_details="100% free emergency medical treatment, police FIR registration facilitation, free legal representation by empanelled advocates, psychological trauma counseling, and free shelter with food and clothing.",
        eligibilitySummary="Any woman or girl facing domestic violence, physical assault, sexual abuse, harassment, or emotional distress in public, private, or workplace spaces.",
        rules=[
            make_rule("gender", "EQUALS", "female", "Women and Girl Children in Distress", "Mission Shakti Sambal Guidelines 4.1"),
        ],
        documents=[
            make_doc("doc-osc-none", "Zero Documentation Required for Emergency Entry", "Immediate admission and care without prior paperwork", "Sakhi Centre", "OSC SOP Section 1"),
        ],
        steps=[
            make_step(1, "Contact 181 Women Helpline or Walk-In", "Dial toll-free national 181 Women Helpline or walk into nearest District Hospital Sakhi Centre.", "meeseva_csc"),
            make_step(2, "Immediate Medical & Shelter Intake", "Paramedical and legal counselor provide immediate emergency safety and trauma relief.", "district_office"),
            make_step(3, "Integrated Redressal & Rehabilitation", "Police facilitate video conferencing statements and legal aid attorney files court petitions.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-mahila-samman-savings",
        slug="mahila-samman-savings-certificate-mssc",
        name="Mahila Samman Savings Certificate (MSSC)",
        short_description="Government guaranteed small savings deposit scheme for women offering high 7.5% interest rate compounded quarterly for a 2-year tenure.",
        full_description="MSSC is a specialized government small savings instrument announced by the Ministry of Finance to encourage financial independence among women and girls, offering an attractive fixed return of 7.5% per annum with partial withdrawal facility.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Finance",
        department="Department of Economic Affairs",
        portal_url="https://www.indiapost.gov.in",
        benefit_details="Guaranteed 7.5% annual interest compounded quarterly. Minimum deposit ₹1,000, maximum deposit ₹2,00,000 for a 2-year maturity period with up to 40% partial withdrawal after 1 year.",
        eligibilitySummary="Account can be opened by an individual woman for herself, or by a guardian on behalf of a minor girl child at any Post Office or authorized commercial bank.",
        rules=[
            make_rule("gender", "EQUALS", "female", "Female Account Holder or Minor Girl Child", "MSSC Rules 2023 Rule 3"),
        ],
        documents=[
            make_doc("doc-mssc-kyc", "Aadhaar Card and PAN Card", "Proof of identity and address", "UIDAI / Income Tax Dept", "MSSC Form 1"),
        ],
        steps=[
            make_step(1, "Visit Post Office or Bank", "Obtain and fill MSSC Account Opening Form at any Head/Sub Post Office or nationalised bank.", "meeseva_csc"),
            make_step(2, "Deposit Amount (₹1,000 to ₹2,00,000)", "Submit KYC documents along with cheque/cash deposit.", "meeseva_csc"),
            make_step(3, "Receive Passbook / Certificate", "Collect official MSSC passbook showing interest calculation and maturity date.", "meeseva_csc"),
        ]
    ),
    make_scheme(
        id="central-working-women-hostel",
        slug="mission-shakti-sakhi-niwas-working-women-hostel",
        name="Mission Shakti - Sakhi Niwas (Working Women Hostel)",
        short_description="Safe, comfortable, and highly subsidized residential hostel accommodation with day-care creche facilities for employed women in urban and semi-urban centres.",
        full_description="Sakhi Niwas provides safe, clean, and conveniently located accommodation for working women, single mothers, and trainees away from their hometowns, charging nominal maintenance fees and featuring 24/7 security and children's day-care.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Women and Child Development",
        department="Mission Shakti Division",
        portal_url="https://wcd.nic.in",
        benefit_details="Subsidized boarding, round-the-clock CCTV security, mess facilities, Wi-Fi, and attached creche for young children of working residents.",
        eligibilitySummary="Working women (single, widowed, divorced, separated, or married women whose families do not reside in the same city) earning up to ₹50,000/month (metropolitan) or ₹35,000/month (other areas).",
        rules=[
            make_rule("gender", "EQUALS", "female", "Employed / Trainee Women", "Sakhi Niwas Guidelines Clause 4.1"),
        ],
        documents=[
            make_doc("doc-sakhi-employment", "Proof of Employment / Appointment Letter", "From employer indicating monthly remuneration", "Employer HR", "Sakhi Niwas Checklist 1"),
        ],
        steps=[
            make_step(1, "Online or Direct Application", "Submit application to District Sakhi Niwas hostel warden.", "district_office"),
            make_step(2, "Document Scrutiny", "Hostel management committee checks employment certificate and verifies seat vacancy.", "district_office"),
            make_step(3, "Room Allotment", "Pay nominal monthly maintenance fee and occupy allotted furnished room.", "district_office"),
        ]
    ),

    # ----------------------------------------------------
    # HOUSING, WATER, SANITATION & CLEAN ENERGY
    # ----------------------------------------------------
    make_scheme(
        id="central-jal-jeevan-mission",
        slug="jal-jeevan-mission-har-ghar-jal",
        name="Jal Jeevan Mission (Har Ghar Jal)",
        short_description="National mission ensuring functional tap water connection providing 55 litres per capita per day of prescribed potability to every rural household.",
        full_description="Jal Jeevan Mission (JJM) is envisioned to provide safe and adequate drinking water through individual household tap connections by 2026 to all households in rural India, managed at the grassroots level by Gram Panchayat Paani Samitis.",
        category="housing",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Jal Shakti",
        department="Department of Drinking Water and Sanitation",
        portal_url="https://jaljeevanmission.gov.in",
        benefit_details="100% free functional household tap water connection (FHTC) providing treated, laboratory-tested potable water at 55 litres per person per day.",
        eligibilitySummary="All permanent rural households without existing piped functional drinking water connections in villages across India.",
        rules=[
            make_rule("locationType", "EQUALS", "rural", "Rural Habitation Residence", "JJM Guidelines Section 2"),
        ],
        documents=[
            make_doc("doc-jjm-residence", "Aadhaar Card / Ration Card", "Proof of household occupancy in village", "Panchayat Secretary", "JJM Village Registry"),
        ],
        steps=[
            make_step(1, "Village Water Action Plan", "Village Water and Sanitation Committee (VWSC / Paani Samiti) surveys uncovered lanes.", "district_office"),
            make_step(2, "Pipeline Laying & Metering", "Contractor lays underground HDPE pipeline and installs meter and household brass bib-cock.", "district_office"),
            make_step(3, "Quality Certification", "Regular water testing by local women using Field Test Kits (FTKs) and geotagged on JJM portal.", "online_portal", "https://jaljeevanmission.gov.in"),
        ]
    ),
    make_scheme(
        id="central-swachh-bharat-grameen",
        slug="swachh-bharat-mission-grameen-phase-2",
        name="Swachh Bharat Mission (Grameen) Phase 2 - IHHL Incentive",
        short_description="Direct financial incentive of ₹12,000 for constructing individual household latrines (IHHL) for rural households with solid and liquid waste management.",
        full_description="SBM-G Phase 2 focuses on sustaining Open Defecation Free (ODF) status and achieving ODF Plus model villages across India, providing ₹12,000 financial support to new left-out households to construct durable twin-pit toilets.",
        category="housing",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Jal Shakti",
        department="Department of Drinking Water and Sanitation",
        portal_url="https://sbm.gov.in/sbmphase2",
        benefit_details="₹12,000 direct financial incentive per household (Central Share ₹7,200 + State Share ₹4,800) paid in DBT installments upon construction and geotagging.",
        eligibilitySummary="All left-out rural households, newly formed families, and BPL / identified vulnerable APL households (SC/ST/women-headed/differently-abled) without a toilet.",
        rules=[
            make_rule("householdToilet", "EQUALS", False, "No Existing Household Toilet", "SBM-G Guidelines Clause 4.1"),
        ],
        documents=[
            make_doc("doc-sbmg-aadhaar", "Aadhaar Card and Bank Passbook", "For DBT incentive transfer", "UIDAI / Bank", "SBM-G Checklist 1"),
        ],
        steps=[
            make_step(1, "Apply Online on SBM Portal", "Citizen registers online on SBM-G portal or via Gram Panchayat Secretary.", "online_portal", "https://sbm.gov.in/sbmphase2"),
            make_step(2, "Construct Twin-Pit Toilet", "Build sanitary toilet according to prescribed technical design.", "meeseva_csc"),
            make_step(3, "Geotagging & Fund Transfer", "Block coordinator captures geotagged photo of completed toilet; ₹12,000 credited to bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-svamitva-property-card",
        slug="svamitva-scheme-drone-survey-property-cards",
        name="SVAMITVA Scheme (Survey of Villages and Mapping with Improvised Technology in Village Areas)",
        short_description="Drone-based demarcation of rural inhabited lands providing official legal Property Cards / Ownership Deeds for rural citizens to secure bank loans.",
        full_description="SVAMITVA is a transformative Central Sector scheme of Ministry of Panchayati Raj using high-resolution drone mapping to provide an integrated property validation solution for rural India, issuing legal 'Property Cards' enabling villagers to use property as a financial asset.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Panchayati Raj",
        department="Survey and Settlement Division",
        portal_url="https://svamitva.nic.in",
        benefit_details="Free legal Property Card / Ownership Deed (Sanad / Ghar Ka Naksha) demarcating exact boundaries, establishing clear ownership and unlocking property loans.",
        eligibilitySummary="All rural property owners having residential plots/houses located within the 'Abadi' (inhabited) area of surveyed villages.",
        rules=[
            make_rule("propertyLocation", "EQUALS", "rural_abadi", "House Located in Village Abadi Area", "SVAMITVA Scheme Guidelines 3.1"),
        ],
        documents=[
            make_doc("doc-svamitva-aadhaar", "Aadhaar Card and Ration Card", "For verification of family ownership", "UIDAI", "SVAMITVA Guidelines 4"),
        ],
        steps=[
            make_step(1, "Chuna Demarcation", "Villagers mark ground boundary lines of individual plots with limestone (chuna).", "district_office"),
            make_step(2, "Survey of India Drone Flying", "Drones capture 5cm resolution ortho-rectified aerial imagery.", "district_office"),
            make_step(3, "Objection Redressal & Card Issuance", "Gram Sabha displays maps for claims; official digital Property Card distributed with QR code.", "online_portal", "https://svamitva.nic.in"),
        ]
    ),

    # ----------------------------------------------------
    # DEFENSE VETERANS & PARAMILITARY WELFARE
    # ----------------------------------------------------
    make_scheme(
        id="central-pmss-capf-paramilitary",
        slug="prime-ministers-scholarship-scheme-capfs-assam-rifles",
        name="Prime Minister's Scholarship Scheme (PMSS) for CAPFs, Assam Rifles & Police Personnel",
        short_description="Scholarship of ₹3,000/month for girls and ₹2,500/month for boys pursuing professional degree courses (Engineering, Medical, MBA) for wards of deceased/ex-CAPF personnel.",
        full_description="PMSS under the Ministry of Home Affairs encourages higher professional and technical education for dependent wards and widows of Central Armed Police Forces (CRPF, BSF, CISF, ITBP, SSB, NSG), Assam Rifles, and State Police personnel martyred during terror/Maoist attacks.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Home Affairs",
        department="Welfare and Rehabilitation Board (WARB)",
        portal_url="https://scholarships.gov.in",
        benefit_details="₹36,000 per annum (₹3,000/month) for female students; ₹30,000 per annum (₹2,500/month) for male students paid annually throughout the degree program.",
        eligibilitySummary="Dependent wards and widows of CAPFs & AR personnel martyred, disabled, or retired; or police personnel martyred in terror attacks, pursuing professional degree with >= 60% in Class 12/Diploma.",
        rules=[
            make_rule("minClass12Marks", "GREATER_THAN_OR_EQUAL", 60, "Minimum 60% in Class 12 / Diploma", "PMSS Guidelines Clause 3.1"),
            make_rule("courseType", "IN", ["btech", "mbbs", "bds", "bpharm", "mba", "mca"], "Recognized Professional Degree", "PMSS Guidelines Clause 3.2"),
        ],
        documents=[
            make_doc("doc-pmss-discharge", "Service / Discharge Certificate (PPO)", "Proof of parent's paramilitary service", "WARB / Force HQ", "PMSS Annexure 1"),
            make_doc("doc-pmss-bonafide", "College Bonafide Student Certificate", "Certifying regular admission in recognized university", "College Registrar", "PMSS Annexure 2"),
        ],
        steps=[
            make_step(1, "Apply Online on National Scholarship Portal", "Select Ministry of Home Affairs - PMSS on NSP portal.", "online_portal", "https://scholarships.gov.in"),
            make_step(2, "Verification by Force Headquarters", "WARB nodal officer at Force HQ verifies parent's service records and priority order.", "district_office"),
            make_step(3, "Direct Bank Disbursement", "Annual scholarship credited straight into student's Aadhaar-linked bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pmss-ex-servicemen",
        slug="prime-ministers-scholarship-scheme-ksb-ex-servicemen",
        name="Prime Minister's Scholarship Scheme (PMSS) for Wards of Ex-Servicemen (Army, Navy, Air Force)",
        short_description="Scholarship of ₹36,000/year for girls and ₹30,000/year for boys for dependent wards and widows of retired/disabled defense personnel.",
        full_description="Administered by the Kendriya Sainik Board (KSB), Department of Ex-Servicemen Welfare, Ministry of Defence, this scheme provides financial support for professional graduate degree courses (BE/BTech, MBBS, BDS, BPharm, BSc Nursing, BBA, BCA, LLB).",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Defence",
        department="Department of Ex-Servicemen Welfare / Kendriya Sainik Board",
        portal_url="https://ksb.gov.in",
        benefit_details="₹3,000 per month for girls (₹36,000 annually) and ₹2,500 per month for boys (₹30,000 annually) disbursed by DBT.",
        eligibilitySummary="Wards and widows of Ex-Servicemen / Ex-Coast Guard personnel who served in Indian Army, Navy, or Air Force with minimum 60% marks in Minimum Educational Qualification (MEQ).",
        rules=[
            make_rule("minMeqMarks", "GREATER_THAN_OR_EQUAL", 60, "Minimum 60% in Class 12 / Degree", "KSB PMSS Criteria 2"),
        ],
        documents=[
            make_doc("doc-ksb-esmc", "Ex-Servicemen Identity Card & ESM Certificate", "Signed by Zila Sainik Welfare Officer", "Zila Sainik Board", "KSB Annexure A"),
            make_doc("doc-ksb-ppo", "Pension Payment Order (PPO) or Discharge Book", "Record of defense service and family details", "Defence Records Office", "KSB Annexure B"),
        ],
        steps=[
            make_step(1, "Register on KSB Portal", "Create applicant profile on the Kendriya Sainik Board portal.", "online_portal", "https://ksb.gov.in"),
            make_step(2, "Verification by Zila Sainik Board (ZSB)", "Secretary ZSB verifies ESM credentials and signs recommendation online.", "district_office"),
            make_step(3, "Disbursal into Student Account", "Funds directly transferred through electronic clearing to student's bank account.", "online_portal"),
        ]
    ),
]
