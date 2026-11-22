"""
scripts/catalog/state_data_3.py
Part 3 of State Government flagship schemes (Himachal, Uttarakhand, Chhattisgarh, Jharkhand, Goa, NE & UTs).
"""

from .builder import make_scheme, make_rule, make_doc, make_step

STATE_SCHEMES_PART3 = [
    # ==========================================
    # HIMACHAL PRADESH
    # ==========================================
    make_scheme(
        id="hp-himcare-health",
        slug="himachal-pradesh-himcare-health-scheme",
        name="Himachal Pradesh HIMCARE Health Scheme",
        short_description="Cashless hospital treatment up to ₹5 Lakhs per family per year for all families in Himachal Pradesh not covered under Ayushman Bharat.",
        full_description="HIMCARE ensures universal health protection in Himachal Pradesh by extending ₹5 Lakhs annual cashless healthcare coverage in government and empanelled private hospitals to all families outside Ayushman Bharat PM-JAY.",
        category="healthcare",
        jurisdiction="state",
        state="Himachal Pradesh",
        department="Department of Health and Family Welfare, Government of Himachal Pradesh",
        portal_url="https://hpsbys.in",
        benefit_details="Cashless hospital treatment up to ₹5,00,000 per family per year covering secondary and tertiary medical treatments, diagnostic tests, and surgeries.",
        eligibilitySummary="Permanent residents of Himachal Pradesh who are not government employees/retirees and not covered under AB-PMJAY.",
        rules=[
            make_rule("state", "EQUALS", "Himachal Pradesh", "HP Domicile", "HIMCARE Rules 1"),
        ],
        documents=[
            make_doc("doc-hp-ration", "Digital Ration Card / Parivar Register Copy", "Household family record", "Food & Civil Supplies HP", "HIMCARE Doc 1"),
        ],
        steps=[
            make_step(1, "Enrolment on HIMCARE Portal or LokMitra Kendra", "Submit digital ration card and pay nominal annual fee (free for BPL/street vendors).", "meeseva_csc", "https://hpsbys.in"),
            make_step(2, "Receive HIMCARE Digital Card", "Download electronic health card with unique HIMCARE ID.", "online_portal"),
            make_step(3, "Cashless Medical Treatment", "Present card at any hospital across HP and PGI Chandigarh for 100% cashless care.", "district_office"),
        ]
    ),
    make_scheme(
        id="hp-mukhyamantri-kanyadan",
        slug="himachal-pradesh-mukhyamantri-kanyadan-yojana",
        name="Himachal Pradesh Mukhyamantri Kanyadan Yojana",
        short_description="Financial marriage grant of ₹51,000 for destitute girls, widows' daughters, and girls with disabilities in Himachal Pradesh.",
        full_description="Provides direct financial assistance of ₹51,000 for the marriage of adult daughters of helpless widows, destitute parents, or orphan girls residing in Himachal Pradesh.",
        category="welfare",
        jurisdiction="state",
        state="Himachal Pradesh",
        department="Women and Child Development Department, Government of Himachal Pradesh",
        portal_url="https://wcd.hp.gov.in",
        benefit_details="One-time financial grant of ₹51,000 transferred via DBT directly into the bride's bank account.",
        eligibilitySummary="Girl aged 18+ resident of HP whose parents are destitute, or mother is a widow, with family income <= ₹50,000/year.",
        rules=[
            make_rule("state", "EQUALS", "Himachal Pradesh", "HP Domicile", "Kanyadan Rules 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 50000, "Annual Family Income <= ₹50,000", "Kanyadan Rules 2"),
        ],
        documents=[
            make_doc("doc-hp-kanyadan-income", "Income Certificate from Tehsildar", "Income proof showing <= ₹50,000/year", "Tehsildar", "Kanyadan Doc 1"),
        ],
        steps=[
            make_step(1, "Apply at Child Development Project Office (CDPO)", "Submit application before or within 6 months of marriage.", "district_office"),
            make_step(2, "Tehsil Verification", "Social education coordinator verifies economic status.", "district_office"),
            make_step(3, "Direct Cash Transfer", "₹51,000 credited to bride's bank account.", "online_portal"),
        ]
    ),

    # ==========================================
    # UTTARAKHAND
    # ==========================================
    make_scheme(
        id="uk-gaura-devi-kanya-dhan",
        slug="uttarakhand-nanda-gaura-devi-kanya-dhan-yojana",
        name="Uttarakhand Nanda Gaura Yojana (Girl Child Protection & Higher Education)",
        short_description="Financial grant of ₹11,000 on birth of girl child and ₹51,000 upon passing Class 12 for pursuing higher education in Uttarakhand.",
        full_description="Nanda Gaura Yojana protects girl children, prevents female foeticide, and encourages girls to complete 12th grade and enter university in Uttarakhand by providing ₹11,000 at birth and ₹51,000 after 12th class.",
        category="welfare",
        jurisdiction="state",
        state="Uttarakhand",
        department="Women Empowerment and Child Development Department, Govt of Uttarakhand",
        portal_url="https://nandagaura.uk.gov.in",
        benefit_details="₹11,000 upon birth of daughter and ₹51,000 upon passing Class 12 board examination credited directly to the girl's bank account.",
        eligibilitySummary="Permanent resident of Uttarakhand belonging to BPL or annual family income <= ₹72,000, girl child unmarried and enrolled in higher education.",
        rules=[
            make_rule("state", "EQUALS", "Uttarakhand", "Uttarakhand Domicile", "Nanda Gaura Rules 1"),
            make_rule("gender", "EQUALS", "female", "Female Child", "Nanda Gaura Rules 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 72000, "Annual Family Income <= ₹72,000", "Nanda Gaura Rules 3"),
        ],
        documents=[
            make_doc("doc-uk-marksheet", "Class 12 Marksheet & Passing Certificate", "From UK Board / CBSE", "School Principal", "Nanda Gaura Doc 1"),
            make_doc("doc-uk-income", "Tehsildar Income Certificate", "Family income <= ₹72,000", "Tehsildar", "Nanda Gaura Doc 2"),
        ],
        steps=[
            make_step(1, "Online Application on Nanda Gaura Portal", "Apply on portal with 12th marksheet and college admission receipt.", "online_portal", "https://nandagaura.uk.gov.in"),
            make_step(2, "District Probation Officer Scrutiny", "DPO inspects documents and verifies institutional admission.", "district_office"),
            make_step(3, "Direct Treasury Transfer", "₹51,000 credited to girl student's account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="uk-atal-ayushman",
        slug="uttarakhand-atal-ayushman-universal-health",
        name="Uttarakhand Atal Ayushman Yojana (Universal Cashless Healthcare)",
        short_description="100% universal cashless healthcare coverage up to ₹5 Lakhs per family per year for all 27 Lakh households in Uttarakhand.",
        full_description="Uttarakhand is one of the few states providing 100% universal cashless health coverage of ₹5,00,000 per family per year across all citizens regardless of income, covering secondary and tertiary treatments at top hospitals in Dehradun, Rishikesh AIIMS, and nationwide.",
        category="healthcare",
        jurisdiction="state",
        state="Uttarakhand",
        department="Uttarakhand State Health Authority",
        portal_url="https://ayushmanuttarakhand.org",
        benefit_details="Cashless treatment up to ₹5,00,000 per family per year across 1,700+ medical and surgical procedures in over 300 empanelled hospitals.",
        eligibilitySummary="All permanent residents of Uttarakhand holding an active digital ration card or voter ID in Uttarakhand.",
        rules=[
            make_rule("state", "EQUALS", "Uttarakhand", "Uttarakhand Domicile", "Atal Ayushman Rules 1"),
        ],
        documents=[
            make_doc("doc-uk-ration", "Uttarakhand Ration Card", "National Food Security / State Ration Card", "Civil Supplies UK", "Ayushman UK Doc 1"),
        ],
        steps=[
            make_step(1, "Create Golden Card at CSC or Hospital", "Visit nearest Common Service Centre or Ayushman kiosk at District Hospital.", "meeseva_csc"),
            make_step(2, "Biometric e-KYC Verification", "Authenticate with Aadhaar and family ration card.", "meeseva_csc"),
            make_step(3, "Avail Free Hospital Treatment", "Show card for 100% cashless admission, surgery, and post-discharge medication.", "district_office"),
        ]
    ),

    # ==========================================
    # CHHATTISGARH
    # ==========================================
    make_scheme(
        id="cg-mahtari-vandan",
        slug="chhattisgarh-mahtari-vandan-yojana-women-dbt",
        name="Chhattisgarh Mahtari Vandan Yojana (Monthly Women Financial Guarantee)",
        short_description="Direct unconditional monthly financial assistance of ₹1,000 per month (₹12,000 per year) directly to married women across Chhattisgarh.",
        full_description="Mahtari Vandan Yojana provides monthly financial independence and social security to over 70 Lakh married women in Chhattisgarh by transferring ₹1,000 on the first week of every month into their DBT bank accounts.",
        category="welfare",
        jurisdiction="state",
        state="Chhattisgarh",
        department="Women and Child Development Department, Government of Chhattisgarh",
        portal_url="https://mahtarivandan.cgstate.gov.in",
        benefit_details="₹1,000 per month (₹12,000 per annum) directly credited into the woman's personal Aadhaar-linked bank account.",
        eligibilitySummary="Married woman resident of Chhattisgarh aged 21 years and above as of 1st January of application year, whose family does not pay income tax.",
        rules=[
            make_rule("state", "EQUALS", "Chhattisgarh", "Chhattisgarh Domicile", "Mahtari Vandan Rules 1"),
            make_rule("gender", "EQUALS", "female", "Female Resident", "Mahtari Vandan Rules 2"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 21, "Minimum Age 21 Years", "Mahtari Vandan Rules 3"),
        ],
        documents=[
            make_doc("doc-cg-marriage", "Marriage Certificate / Ration Card Showing Spouse", "Proof of marriage", "Gram Panchayat / Municipal Authority", "Mahtari Doc 1"),
            make_doc("doc-cg-aadhaar", "Aadhaar Card with Bank Seeding", "Proof of identity", "UIDAI", "Mahtari Doc 2"),
        ],
        steps=[
            make_step(1, "Submit Application at Anganwadi or Portal", "Apply online on Mahtari Vandan portal or submit physical form to Anganwadi worker.", "online_portal", "https://mahtarivandan.cgstate.gov.in"),
            make_step(2, "Verification & Claims Redressal", "Provisional list published in Gram Panchayat; objections resolved within 7 days.", "district_office"),
            make_step(3, "Monthly DBT Transfer", "Direct benefit of ₹1,000 credited on the 1st week of every month.", "online_portal"),
        ]
    ),
    make_scheme(
        id="cg-krishak-unnati",
        slug="chhattisgarh-krishak-unnati-yojana-paddy-procurement",
        name="Chhattisgarh Krishak Unnati Yojana (₹3,100/Quintal Paddy Support)",
        short_description="Guaranteed paddy procurement at ₹3,100 per quintal (up to 21 quintals per acre) with difference amount paid directly via DBT to farmers.",
        full_description="Chhattisgarh's flagship farm transformation scheme purchases paddy from farmers at a historic high price of ₹3,100 per quintal up to 21 quintals per acre, paying the differential amount over MSP directly to farmers via DBT.",
        category="agriculture",
        jurisdiction="state",
        state="Chhattisgarh",
        department="Department of Agriculture and Farmers Welfare, Government of Chhattisgarh",
        portal_url="https://agriportal.cg.nic.in",
        benefit_details="Input assistance paying the difference between Central MSP and ₹3,100 per quintal, resulting in net transfers of up to ₹19,000+ per acre into farmer accounts.",
        eligibilitySummary="All registered farmers in Chhattisgarh cultivating paddy on owned or leased land registered on the Integrated Farmer Portal (Kisan Panjiyan).",
        rules=[
            make_rule("state", "EQUALS", "Chhattisgarh", "Chhattisgarh Farmer", "Krishak Unnati Criteria 1"),
            make_rule("kisanPortalRegistered", "EQUALS", True, "Registered on CG Kisan Portal", "Krishak Unnati Criteria 2"),
        ],
        documents=[
            make_doc("doc-cg-bhu-naksha", "Khasra / B-1 Kistabandi Revenue Records", "Proof of land acreage under paddy", "Revenue Dept CG (Bhuiyan)", "Krishak Unnati Doc 1"),
        ],
        steps=[
            make_step(1, "Kisan Panjiyan on Portal", "Register agricultural land and bank account on the CG Kisan Portal before October.", "meeseva_csc", "https://kisan.cg.nic.in"),
            make_step(2, "Sell Paddy at Primary Cooperative Society (PACS)", "Sell paddy crop at local procurement centre (Mandi/Samiti).", "district_office"),
            make_step(3, "Lump Sum DBT Difference Payment", "Receive base MSP at procurement and difference up to ₹3,100/quintal via direct DBT.", "online_portal"),
        ]
    ),

    # ==========================================
    # JHARKHAND
    # ==========================================
    make_scheme(
        id="jh-marang-gomke-scholarship",
        slug="jharkhand-marang-gomke-jaipal-singh-munda-overseas-scholarship",
        name="Jharkhand Marang Gomke Jaipal Singh Munda Overseas Scholarship",
        short_description="100% full tuition fees and living expenses for tribal, SC, OBC, and minority youth to pursue Master's/MPhil degrees in top UK universities (Oxford, Cambridge, LSE).",
        full_description="Named after legendary Adivasi leader Jaipal Singh Munda, this landmark scheme fully finances 25 brilliant youth every year from Jharkhand to pursue postgraduate degrees in premier British and Irish universities across 31 subject fields.",
        category="scholarship",
        jurisdiction="state",
        state="Jharkhand",
        department="Scheduled Tribe, Scheduled Caste, Minority and Backward Class Welfare Dept, Govt of Jharkhand",
        portal_url="https://mgjsoverseas.jharkhand.gov.in",
        benefit_details="100% tuition fees, airfare, visa fees, health insurance, and annual living allowance of £9,900 to £15,000 for Master's degree at top UK universities.",
        eligibilitySummary="Resident of Jharkhand belonging to ST, SC, OBC, or Minority community, aged <= 35 years, with unconditional offer letter from empaneled UK/Ireland universities.",
        rules=[
            make_rule("state", "EQUALS", "Jharkhand", "Jharkhand Domicile", "MGJS Guidelines Clause 2"),
            make_rule("casteCategory", "IN", ["ST", "SC", "OBC", "Minority"], "Eligible Backward Community", "MGJS Guidelines Clause 3"),
            make_rule("maxAgeYears", "LESS_THAN_OR_EQUAL", 35, "Maximum Age 35 Years", "MGJS Guidelines Clause 4"),
        ],
        documents=[
            make_doc("doc-uk-uni-offer", "Unconditional Foreign University Offer Letter", "From Oxford, Cambridge, LSE, Edinburgh, etc.", "Foreign University", "MGJS Checklist 1"),
            make_doc("doc-jh-caste", "Jharkhand Caste Certificate", "Issued by SDO / DC", "Welfare Dept Jharkhand", "MGJS Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online with University Offer Letter", "Submit application on Marang Gomke portal during annual application window.", "online_portal", "https://mgjsoverseas.jharkhand.gov.in"),
            make_step(2, "State High Level Selection Committee Interview", "Appear before expert committee of academics and senior bureaucrats.", "district_office"),
            make_step(3, "Full Scholarship Award & Visa Sponsorship", "Government pays university directly and releases flight tickets and living stipend.", "online_portal"),
        ]
    ),
    make_scheme(
        id="jh-mukhyamantri-maiyan-samman",
        slug="jharkhand-mukhyamantri-maiyan-samman-yojana-jmmsy",
        name="Jharkhand Mukhyamantri Maiyan Samman Yojana (JMMSY)",
        short_description="Monthly financial assistance of ₹1,000 per month (₹12,000/year) directly to women aged 18 to 50 years across Jharkhand.",
        full_description="JMMSY empowers women aged 18 to 50 in Jharkhand with a guaranteed direct cash transfer of ₹1,000 per month deposited on the 15th of every month into their Aadhaar-linked bank accounts to ensure social self-reliance.",
        category="welfare",
        jurisdiction="state",
        state="Jharkhand",
        department="Women, Child Development and Social Security Department, Govt of Jharkhand",
        portal_url="https://mmmsy.jharkhand.gov.in",
        benefit_details="₹1,000 per month direct financial grant credited to the beneficiary's single bank account via Aadhaar Payment Bridge.",
        eligibilitySummary="Woman resident of Jharkhand aged 18 to 50 years whose family holds a green/yellow/pink ration card or family income <= ₹8 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Jharkhand", "Jharkhand Domicile", "JMMSY Criteria 1"),
            make_rule("gender", "EQUALS", "female", "Female Resident", "JMMSY Criteria 2"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Age 18-50 Years", "JMMSY Criteria 3"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 50, "Maximum Age 50 Years", "JMMSY Criteria 4"),
        ],
        documents=[
            make_doc("doc-jh-ration-card", "Ration Card / Voter ID", "Household residency verification", "Civil Supplies Jharkhand", "JMMSY Doc 1"),
            make_doc("doc-jh-aadhaar", "Aadhaar Card Linked Bank Account", "Active DBT mandate", "UIDAI / Bank", "JMMSY Doc 2"),
        ],
        steps=[
            make_step(1, "Apply at Aapki Yojana Aapki Sarkar Camp", "Submit form at special camp in your Panchayat.", "meeseva_csc"),
            make_step(2, "BDO Scrutiny & Sanction Order", "Block Development Officer approves eligible applications online.", "district_office"),
            make_step(3, "Monthly Transfer on 15th", "Funds credited to bank account on 15th of each month.", "online_portal", "https://mmmsy.jharkhand.gov.in"),
        ]
    ),

    # ==========================================
    # GOA
    # ==========================================
    make_scheme(
        id="ga-griha-aadhaar-scheme",
        slug="goa-griha-aadhaar-scheme-homemakers",
        name="Goa Griha Aadhaar Scheme (Homemakers Financial Assistance)",
        short_description="Monthly financial assistance of ₹1,500 per month directly to homemakers from middle and lower income families in Goa.",
        full_description="The Griha Aadhaar Scheme implemented by Directorate of Women and Child Development in Goa provides a monthly financial allowance of ₹1,500 to housewives to compensate for price inflation and maintain family living standards.",
        category="welfare",
        jurisdiction="state",
        state="Goa",
        department="Directorate of Women and Child Development, Government of Goa",
        portal_url="https://dwcd.goa.gov.in",
        benefit_details="₹1,500 per month credited directly into the homemaker's savings bank account via DBT.",
        eligibilitySummary="Married woman resident of Goa for at least 15 years, family annual income <= ₹3 Lakhs, husband residing with family.",
        rules=[
            make_rule("state", "EQUALS", "Goa", "Goa Resident for 15+ Years", "Griha Aadhaar Section 1"),
            make_rule("gender", "EQUALS", "female", "Female Homemaker", "Griha Aadhaar Section 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 300000, "Annual Family Income <= ₹3 Lakhs", "Griha Aadhaar Section 3"),
        ],
        documents=[
            make_doc("doc-goa-15yr-domicile", "15 Years Domicile / Residence Certificate", "Issued by Mamlatdar", "Mamlatdar Office", "Griha Aadhaar Form 1"),
            make_doc("doc-goa-marriage", "Marriage Registration Certificate", "Issued by Civil Registrar", "Sub-Registrar Goa", "Griha Aadhaar Form 2"),
        ],
        steps=[
            make_step(1, "Apply Online on Goa Online Portal", "Submit application on goaonline.gov.in portal or through Citizen Service Centre.", "online_portal", "https://goaonline.gov.in"),
            make_step(2, "Mamlatdar Income & Domicile Inquiry", "Mamlatdar verifies 15-year residence and income proof.", "district_office"),
            make_step(3, "Monthly Benefit Credit", "Directorate releases ₹1,500 every month via electronic clearance.", "online_portal"),
        ]
    ),
    make_scheme(
        id="ga-dayanand-social-security",
        slug="goa-dayanand-social-security-scheme-dsss",
        name="Goa Dayanand Social Security Scheme (DSSS - Senior & Disability Pension)",
        short_description="Monthly pension of ₹2,000 to ₹3,500 per month for senior citizens, widows, disabled persons, and single women in Goa.",
        full_description="DSSS is Goa's comprehensive universal pension program delivering direct financial support of ₹2,000/month (enhanced up to ₹3,500/month for severe disability and terminal diseases) to vulnerable seniors and widows.",
        category="pension",
        jurisdiction="state",
        state="Goa",
        department="Directorate of Social Welfare, Government of Goa",
        portal_url="https://socialwelfare.goa.gov.in",
        benefit_details="₹2,000 per month for elderly and widows; ₹2,500 to ₹3,500 per month for persons with severe disabilities, HIV/cancer patients, and children with special needs.",
        eligibilitySummary="Resident of Goa for 15+ years, age 60+ for elderly, or widows/disabled of any age, family annual income <= ₹1.5 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Goa", "Goa Domicile (15+ Years)", "DSSS Guidelines Section 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 150000, "Annual Family Income <= ₹1.5 Lakhs", "DSSS Guidelines Section 3"),
        ],
        documents=[
            make_doc("doc-dsss-15yr", "15 Years Residence Certificate from Mamlatdar", "Proof of continuous residence", "Mamlatdar", "DSSS Form A"),
            make_doc("doc-dsss-income", "Income Certificate", "Income verification certificate", "Tahsildar / Mamlatdar", "DSSS Form B"),
        ],
        steps=[
            make_step(1, "Submit Application on Goa Online Portal", "Fill DSSS application with bank account details.", "online_portal", "https://goaonline.gov.in"),
            make_step(2, "Verification by Social Welfare Inspector", "Inspector checks living status and eligibility.", "district_office"),
            make_step(3, "Monthly Pension Direct Transfer", "Monthly pension credited directly to bank account on the 1st of every month.", "online_portal"),
        ]
    ),
]
