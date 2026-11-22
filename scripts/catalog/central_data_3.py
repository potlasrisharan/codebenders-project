"""
scripts/catalog/central_data_3.py
Part 3 of Central Government schemes (Clean Tech, Advanced Skilling, Industry & Frontier Missions).
"""

from .builder import make_scheme, make_rule, make_doc, make_step

CENTRAL_SCHEMES_3 = [
    make_scheme(
        id="central-pm-vishwakarma-toolkit",
        slug="pm-vishwakarma-toolkit-incentive-credit-support",
        name="PM Vishwakarma Scheme (Toolkit Incentive & Concessional Credit)",
        short_description="₹15,000 digital toolkit incentive + collateral-free loans up to ₹3 Lakhs at 5% interest + ₹500/day training stipend for 18 traditional artisan trades.",
        full_description="PM Vishwakarma provides end-to-end holistic support to traditional artisans and craftspeople (carpenters, blacksmiths, goldsmiths, potters, sculptors, cobblers, tailors, boat builders) with skill upgradation, ₹15,000 digital toolkit grant, and low-interest credit without collateral.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Micro, Small and Medium Enterprises",
        department="Department of MSME",
        portal_url="https://pmvishwakarma.gov.in",
        benefit_details="Free PM Vishwakarma Certificate & ID, basic 5-7 days training with ₹500/day stipend, ₹15,000 e-voucher for modern tools, and loans up to ₹1 Lakh (Tranche 1) and ₹2 Lakhs (Tranche 2) at 5% concessional interest.",
        eligibilitySummary="Practicing artisan in one of 18 traditional family trades, minimum age 18 years, not availed PMEGP/MUDRA loan in past 5 years, one member per family.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Minimum Age 18 Years", "PM Vishwakarma Section 3.1"),
            make_rule("tradeCategory", "IN", ["carpenter", "blacksmith", "armourer", "sculptor", "potter", "cobbler", "tailor", "boat_builder", "goldsmith", "locksmith", "barber", "washerman"], "18 Traditional Trades", "PM Vishwakarma Section 3.2"),
        ],
        documents=[
            make_doc("doc-vishwakarma-aadhaar", "Aadhaar Card and Mobile Number", "Identity authentication", "UIDAI", "Vishwakarma Checklist 1"),
            make_doc("doc-vishwakarma-trade-proof", "Trade Self-Declaration / Gram Panchayat Verification", "Proof of working in traditional trade", "Gram Panchayat / ULB", "Vishwakarma Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply at Common Services Centre (CSC)", "Artisan registers biometrics at CSC choosing traditional trade.", "meeseva_csc", "https://pmvishwakarma.gov.in"),
            make_step(2, "3-Tier Verification (Panchayat, District, State)", "Gram Panchayat verifies traditional artisan status.", "district_office"),
            make_step(3, "Skill Training & ₹15,000 Toolkit Voucher", "Attend basic training and receive ₹15,000 e-RUPI voucher for tools.", "college_cell"),
        ]
    ),
    make_scheme(
        id="central-pli-electronics-manufacturing",
        slug="production-linked-incentive-pli-large-scale-electronics",
        name="Production Linked Incentive (PLI) Scheme for Large Scale Electronics Manufacturing",
        short_description="4% to 6% production incentive on incremental sales of manufactured mobile phones and electronic components in India.",
        full_description="PLI Scheme for Large Scale Electronics Manufacturing under MeitY positions India as a global manufacturing hub by offering financial incentives of 4% to 6% on incremental sales over base year to domestic and global electronics manufacturers.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Electronics and Information Technology",
        department="Electronics Hardware Manufacturing Division",
        portal_url="https://www.meity.gov.in/esdm/pli",
        benefit_details="Incentive of 4% to 6% on incremental sales of manufactured goods (mobile phones, specified electronic components, semiconductors) for a period of 5 years.",
        eligibilitySummary="Companies incorporated in India meeting specified minimum threshold investments and incremental sales targets in electronic components or mobile manufacturing.",
        rules=[
            make_rule("incorporationCountry", "EQUALS", "India", "Company Incorporated in India", "PLI Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-pli-approval", "PLI Approval Letter from MeitY / IFCI", "Designating approved manufacturing entity", "MeitY / IFCI", "PLI Annexure 1"),
        ],
        steps=[
            make_step(1, "Submit Application on MeitY ESDM Portal", "Submit detailed investment and domestic value addition proposal.", "online_portal", "https://www.meity.gov.in"),
            make_step(2, "Investment Audit & Factory Commissioning", "Project Management Agency (IFCI) audits plant and machinery investments.", "district_office"),
            make_step(3, "Annual Incentive Claim Disbursement", "Direct treasury credit based on audited incremental commercial turnover.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-green-hydrogen-mission",
        slug="national-green-hydrogen-mission-sight-incentive",
        name="National Green Hydrogen Mission - SIGHT Programme",
        short_description="Direct production incentive up to ₹50/kg for Green Hydrogen production and ₹4,440/kW capital incentive for domestic Electrolyser manufacturing.",
        full_description="The Strategic Interventions for Green Hydrogen Transition (SIGHT) under MNRE offers financial incentives for domestic electrolyser manufacturing (₹4,440 Crore outlay) and green hydrogen production (₹13,050 Crore outlay) to make India a global green energy exporter.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of New and Renewable Energy",
        department="Hydrogen Division",
        portal_url="https://mnre.gov.in",
        benefit_details="Green hydrogen production subsidy: ₹50/kg (Year 1), ₹40/kg (Year 2), and ₹30/kg (Year 3); Electrolyser manufacturing subsidy up to ₹4,440 per kW base incentive.",
        eligibilitySummary="Producers of green hydrogen and manufacturers of electrolysers bidding through Solar Energy Corporation of India (SECI) competitive auctions.",
        rules=[
            make_rule("technologyType", "IN", ["green_hydrogen", "electrolyser_manufacturing"], "Eligible Clean Tech Energy Enterprise", "SIGHT Guidelines Clause 3"),
        ],
        documents=[
            make_doc("doc-sight-seci", "SECI Award of Bid Letter", "Selection in competitive reverse auction", "SECI", "SIGHT Doc 1"),
        ],
        steps=[
            make_step(1, "Participate in SECI Reverse Auction", "Submit technical and financial bids on SECI e-procurement portal.", "online_portal"),
            make_step(2, "Establish Green Hydrogen Plant", "Set up capacity using renewable energy power purchase agreements.", "district_office"),
            make_step(3, "Claim Production Incentive", "Quarterly submission of certified green hydrogen mass output for DBT incentive credit.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pm-ebus-sewa",
        slug="pm-ebus-sewa-urban-mobility",
        name="PM-eBus Sewa (Green Urban Bus Operation Scheme)",
        short_description="Central operational subsidy to deploy 10,000 electric city buses across 169 tier-2 and tier-3 cities with depot charging infrastructure.",
        full_description="PM-eBus Sewa deploys 10,000 electric buses on Public-Private Partnership (PPP) model in cities with population between 3 Lakh and 40 Lakhs lacking organized public bus transport, providing per-kilometer operational viability gap funding for 10 years.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Housing and Urban Affairs",
        department="Urban Transport Division",
        portal_url="https://mohua.gov.in",
        benefit_details="Central operational subsidy of ₹20 to ₹24 per bus-km for 10 years, plus 100% capital grant for power infrastructure behind the meter for bus charging stations.",
        eligibilitySummary="Municipal Corporations and Urban Local Bodies of non-metro cities without adequate bus fleet, operating through empanelled bus operators.",
        rules=[
            make_rule("cityCategory", "IN", ["tier_2", "tier_3", "aspirational_district"], "Eligible Urban Local Body", "PM-eBus Guidelines 2.1"),
        ],
        documents=[
            make_doc("doc-ebus-mou", "Tripartite Agreement (MoHUA, State Govt, City Bus SPV)", "Framework agreement", "MoHUA", "eBus Form 1"),
        ],
        steps=[
            make_step(1, "City Bus Proposal Submission", "Urban Local Body submits city mobility DPR and depot land availability.", "district_office"),
            make_step(2, "Aggregated Tender by CESL", "National bulk procurement of electric buses at competitive tariffs.", "online_portal"),
            make_step(3, "Depot Electrification & Bus Rollout", "Buses commence commercial zero-emission daily passenger service.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-pm-mitra-textiles",
        slug="pm-mega-integrated-textile-regions-and-apparel-pm-mitra",
        name="PM Mega Integrated Textile Region and Apparel (PM MITRA) Parks",
        short_description="Development grant of ₹500 Crore per greenfield mega textile park + ₹300 Crore Competitiveness Incentive Support (CIS) for textile factories.",
        full_description="PM MITRA establishes 7 world-class integrated modern textile manufacturing ecosystems in Telangana, Tamil Nadu, Gujarat, Karnataka, Madhya Pradesh, Uttar Pradesh, and Maharashtra, covering farm to fiber, factory, fashion, and foreign trade under one roof.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Textiles",
        department="Infrastructure Development Division",
        portal_url="https://textiles.nic.in/pm-mitra",
        benefit_details="Up to ₹500 Crore per park for core common infrastructure, and up to ₹300 Crore per park as Competitiveness Incentive Support (CIS) up to 3% of turnover for manufacturing units.",
        eligibilitySummary="Textile manufacturing companies establishing spinning, weaving, processing, garmenting, or technical textile factories in notified PM MITRA parks.",
        rules=[
            make_rule("unitLocation", "EQUALS", "pm_mitra_park", "Located in PM MITRA Park", "PM MITRA Rules Clause 4"),
        ],
        documents=[
            make_doc("doc-mitra-allotment", "Industrial Land Allotment Letter in PM MITRA Park", "Issued by Park SPV", "Park Development SPV", "MITRA Doc 1"),
        ],
        steps=[
            make_step(1, "Apply for Plot Allocation", "Apply through state single window clearance for factory land in PM MITRA park.", "district_office"),
            make_step(2, "Factory Commissioning", "Construct automated manufacturing unit and commence commercial textile production.", "district_office"),
            make_step(3, "Avail CIS Turnover Incentive", "Receive Competitiveness Incentive Support based on annual export and domestic turnover.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-vibrant-villages",
        slug="vibrant-villages-programme-border-transformation",
        name="Vibrant Villages Programme (Border Area Transformation)",
        short_description="Comprehensive infrastructure and livelihood funding for border villages across Himachal, Uttarakhand, Sikkim, Arunachal, and Ladakh.",
        full_description="Vibrant Villages Programme transforms northern border habitations into thriving eco-tourism and agri-processing centres, providing 100% all-weather road access, 24x7 solar electricity, high-speed broadband, and community tourism homestay grants.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Home Affairs",
        department="Border Management Division",
        portal_url="https://mha.gov.in",
        benefit_details="Up to ₹5 Lakhs capital grant for establishing eco-tourism homestays, free off-grid solar mini-grids, all-weather road connectivity, and optical fiber broadband.",
        eligibilitySummary="Permanent residents and Gram Panchayats in notified border blocks of Arunachal Pradesh, Himachal Pradesh, Sikkim, Uttarakhand, and UT of Ladakh.",
        rules=[
            make_rule("locationType", "EQUALS", "notified_border_village", "Notified Northern Border Village", "VVP Scheme Guidelines 2"),
        ],
        documents=[
            make_doc("doc-vvp-residence", "Border Area Permanent Resident Certificate", "Issued by District Magistrate", "District Magistrate", "VVP Checklist 1"),
        ],
        steps=[
            make_step(1, "Village Action Plan Formulation", "Gram Sabha formulates Village Development Plan (VDP) with ITBP and district administration.", "district_office"),
            make_step(2, "Homestay & Enterprise Sanction", "District Level Committee approves tourism and agricultural processing units.", "district_office"),
            make_step(3, "Fund Disbursal & Tourist Linkage", "Grant disbursed directly to resident bank account; village onboarded to national tourism portal.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-national-ayush-mission",
        slug="national-ayush-mission-nam-wellness-centres",
        name="National Ayush Mission (NAM) - Ayush Wellness & Treatment Subsidy",
        short_description="100% free outpatient and inpatient Ayurvedic, Yoga, Unani, Siddha, and Homeopathy healthcare and subsidized medicinal plant cultivation.",
        full_description="NAM upgrades primary healthcare by establishing 12,500 Ayush Health and Wellness Centres (AHWCs), distributing free essential Ayush medicines, and providing financial subsidies up to 50% for farmers cultivating prioritized medicinal herbs and aromatic plants.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Ayush",
        department="National Ayush Mission Division",
        portal_url="https://ayush.gov.in",
        benefit_details="100% free Ayush consultation, panchakarma therapies, and generic Ayush medicines at wellness centres; 30-50% subsidy for cultivating rare medicinal plants.",
        eligibilitySummary="All citizens seeking holistic traditional medical care; farmers cultivating medicinal plants in designated agro-climatic clusters.",
        rules=[
            make_rule("citizenship", "EQUALS", "indian", "Indian Resident", "NAM Guidelines 1"),
        ],
        documents=[
            make_doc("doc-ayush-none", "No Prior Documentation Required for OPD Treatment", "Open walk-in consultation", "Ayush Health Centre", "NAM SOP"),
        ],
        steps=[
            make_step(1, "Walk in to Nearest Ayush Wellness Centre", "Visit registered Ayush Health & Wellness Centre in your block or district.", "district_office"),
            make_step(2, "Consult Registered Ayush Physician", "Get pulse diagnosis, herbal medicine prescription, and yoga lifestyle guidance.", "district_office"),
            make_step(3, "Receive Free Certified Medicines", "Collect free certified Ayurvedic/Homeopathic medications from hospital dispensary.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-mission-vatsalya",
        slug="mission-vatsalya-child-protection-foster-care",
        name="Mission Vatsalya (Child Protection & Non-Institutional Care Sponsorship)",
        short_description="Monthly sponsorship grant of ₹4,000 per month per child for foster care or vulnerable families to prevent child abandonment and ensure education.",
        full_description="Mission Vatsalya secures healthy, happy childhoods for children in need of care and protection, providing a direct family sponsorship grant of ₹4,000 per child per month for education, healthcare, and nutrition to prevent institutionalization.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Women and Child Development",
        department="Child Protection Services",
        portal_url="https://wcd.nic.in/schemes/mission-vatsalya",
        benefit_details="₹4,000 per child per month transferred directly to the bank account of the mother, foster parent, or kinship caregiver until the child attains 18 years of age.",
        eligibilitySummary="Children orphaned, abandoned, whose parents are terminally ill, or living in extreme economic distress (family income <= ₹72,000/yr rural, ₹96,000/yr urban).",
        rules=[
            make_rule("childAgeYears", "LESS_THAN_OR_EQUAL", 18, "Child Under 18 Years of Age", "Mission Vatsalya Rules 3"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 96000, "Annual Family Income <= ₹96,000", "Mission Vatsalya Rules 4"),
        ],
        documents=[
            make_doc("doc-vatsalya-cwc", "Child Welfare Committee (CWC) Recommendation Order", "Mandatory legal order placing child under sponsorship", "Child Welfare Committee", "Vatsalya Form A"),
            make_doc("doc-vatsalya-school", "Active School Enrollment Certificate", "Proof of continuous schooling", "School Headmaster", "Vatsalya Form B"),
        ],
        steps=[
            make_step(1, "Referral to Child Welfare Committee (CWC)", "Report case to District Child Protection Officer (DCPO) or CWC.", "district_office"),
            make_step(2, "Social Investigation Report (SIR)", "Child Protection Officer visits family and prepares socio-economic assessment.", "district_office"),
            make_step(3, "Monthly DBT Sponsorship Transfer", "CWC passes sponsorship order; ₹4,000/month credited to mother/caregiver's account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-pmgsy-rural-roads",
        slug="pradhan-mantri-gram-sadak-yojana-pmgsy",
        name="Pradhan Mantri Gram Sadak Yojana (PMGSY - All-Weather Rural Roads)",
        short_description="100% centrally funded construction of durable all-weather blacktopped roads connecting unconnected rural habitations.",
        full_description="PMGSY connects all unconnected rural habitations with population >= 500 in plains (>= 250 in hill/tribal states) with durable, all-weather blacktopped paved roads, unlocking access to schools, primary healthcare, and agricultural markets.",
        category="housing",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Rural Development",
        department="National Rural Infrastructure Development Agency (NRIDA)",
        portal_url="https://omms.nic.in",
        benefit_details="100% Central Government grant to construct engineered blacktop paved roads with bridges, cross-drainage, and 5-year post-construction maintenance guarantee.",
        eligibilitySummary="Rural habitations without existing all-weather road connectivity according to Census data.",
        rules=[
            make_rule("habitationStatus", "EQUALS", "unconnected_rural", "Unconnected Habitation", "PMGSY Operational Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-pmgsy-dpr", "Detailed Project Report & GIS Alignment", "Road engineering survey", "State Rural Roads Agency", "OMMS Doc 1"),
        ],
        steps=[
            make_step(1, "District Rural Roads Plan", "District administration identifies unconnected village habitations on GIS portal.", "district_office"),
            make_step(2, "Central Sanction by Empowered Committee", "NRIDA approves technical project DPR and sanctions central funding.", "online_portal"),
            make_step(3, "Road Construction & Mobile Geotagging", "Contractor constructs road with quality monitoring inspected via Meri Sadak mobile app.", "district_office", "https://omms.nic.in"),
        ]
    ),
    make_scheme(
        id="central-dr-ambedkar-overseas-subsidy",
        slug="dr-ambedkar-interest-subsidy-scheme-overseas-studies-obc-ebc",
        name="Dr. Ambedkar Central Sector Scheme of Interest Subsidy for Overseas Studies (OBC/EBC)",
        short_description="100% government payment of interest payable on educational loans taken for pursuing Master's, MPhil, and PhD courses abroad.",
        full_description="Under Ministry of Social Justice and Empowerment, this scheme reimburses 100% of the interest charged during the moratorium period (course duration plus one year) on education loans up to ₹20 Lakhs for OBC and EBC students studying abroad.",
        category="scholarship",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Social Justice and Empowerment",
        department="Backward Classes Division",
        portal_url="https://socialjustice.gov.in",
        benefit_details="100% interest subsidy on bank educational loan during course study period plus one year or six months after securing a job, saving students up to ₹5-8 Lakhs.",
        eligibilitySummary="Student belonging to OBC or EBC community admitted to Master's, M.Phil, or Ph.D abroad, family annual income <= ₹8 Lakhs for OBC (<= ₹5 Lakhs for EBC).",
        rules=[
            make_rule("casteCategory", "IN", ["OBC", "EBC"], "OBC or EBC Community", "Dr Ambedkar Guidelines Clause 3.1"),
            make_rule("courseLevel", "IN", ["masters", "mphil", "phd"], "Postgraduate / Doctoral Degree Abroad", "Dr Ambedkar Guidelines Clause 3.2"),
        ],
        documents=[
            make_doc("doc-ambedkar-loan", "Bank Education Loan Sanction Letter", "From scheduled commercial bank under IBA scheme", "Lending Bank", "Ambedkar Checklist 1"),
            make_doc("doc-ambedkar-caste", "OBC / EBC Certificate", "Issued by competent revenue authority", "Tahsildar", "Ambedkar Checklist 2"),
        ],
        steps=[
            make_step(1, "Avail Bank Education Loan", "Secure education loan from scheduled commercial bank under IBA model scheme.", "meeseva_csc"),
            make_step(2, "Bank Claims Subsidy on Canara Bank Portal", "Lending bank submits claim on the nodal Canara Bank subsidy portal.", "district_office"),
            make_step(3, "Interest Credit to Loan Account", "Government credits full accrued interest directly to student's loan account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-annapurna-food-grains",
        slug="annapurna-scheme-free-food-grains-senior-citizens",
        name="Annapurna Scheme (Free Food Grains for Indigent Senior Citizens)",
        short_description="100% free supply of 10 kg food grains (rice/wheat) per month for indigent senior citizens aged 65+ not receiving any other social pension.",
        full_description="The Annapurna Scheme provides food security to meet the requirement of those senior citizens aged 65 years and above who are destitute, having no source of livelihood and who are not covered under the National Old Age Pension Scheme (NOAPS).",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Consumer Affairs, Food and Public Distribution",
        department="Department of Food and Public Distribution",
        portal_url="https://dfpd.gov.in",
        benefit_details="10 kg of food grains (wheat or rice) per month free of cost provided through Fair Price Shops (ration shops).",
        eligibilitySummary="Senior citizens aged 65 years and above who are destitute, with no regular income, and not receiving any other old age pension.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 65, "Age 65 Years and Above", "Annapurna Guidelines Section 2"),
            make_rule("otherPensionReceived", "EQUALS", False, "No Other Pension Received", "Annapurna Guidelines Section 3"),
        ],
        documents=[
            make_doc("doc-annapurna-card", "Annapurna Green / Yellow Ration Card", "Issued by Food & Civil Supplies", "Civil Supplies Dept", "Annapurna Form 1"),
        ],
        steps=[
            make_step(1, "Apply at Block Food Supply Office", "Submit age proof and destitute self-declaration at Tehsil/Block office.", "meeseva_csc"),
            make_step(2, "Gram Sabha Ratification", "Panchayat confirms destitute status and lack of family support.", "district_office"),
            make_step(3, "Monthly Free Grain Collection", "Collect 10 kg grain free from local Fair Price Shop using biometric POS.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-craftsmen-training-iti",
        slug="craftsmen-training-scheme-cts-industrial-training-institutes",
        name="Craftsmen Training Scheme (CTS) through ITIs",
        short_description="100% free or nominal fee vocational engineering and non-engineering trade courses in Government ITIs with national NCVT certification.",
        full_description="Craftsmen Training Scheme (CTS) implemented by DGT under Ministry of Skill Development & Entrepreneurship provides structured vocational training in 150+ high-demand industrial trades (Electrician, Fitter, Turner, Machinist, Welder, COPA) across 15,000+ ITIs in India.",
        category="education_aid",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Skill Development and Entrepreneurship",
        department="Directorate General of Training (DGT)",
        portal_url="https://dgt.gov.in/CTS",
        benefit_details="Free/subsidized vocational training, free tool kits, monthly stipend in government ITIs, and National Trade Certificate (NTC) recognized globally for technician jobs.",
        eligibilitySummary="Candidates aged 14 years and above who have passed Class 8th, 10th, or 12th depending on the chosen vocational trade.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 14, "Minimum Age 14 Years", "CTS Rules Clause 2"),
        ],
        documents=[
            make_doc("doc-iti-marksheet", "Class 8th / 10th Passing Marksheet", "Proof of minimum educational qualification", "School Board", "CTS Checklist 1"),
        ],
        steps=[
            make_step(1, "Online ITI Admission Portal", "Apply on state ITI admission single-window portal.", "online_portal"),
            make_step(2, "Merit Counseling & Trade Allotment", "Choose preferred trade (Electrician, Fitter, Diesel Mechanic) based on merit rank.", "college_cell"),
            make_step(3, "Hands-on Workshop Training", "Complete 1-2 years training, pass AITT exam, and receive NCVT National Trade Certificate.", "college_cell"),
        ]
    ),
    make_scheme(
        id="central-rseti-rural-entrepreneurship",
        slug="rural-self-employment-training-institutes-rseti",
        name="Rural Self Employment Training Institutes (RSETI) Free Residential Training",
        short_description="100% free short-term residential skill training with free lodging, boarding, and bank credit linkage for rural youth to launch self-employment.",
        full_description="RSETIs are dedicated district-level training centres managed by lead commercial banks with Ministry of Rural Development, offering short-term residential courses (mobile repairing, plumbing, tailoring, dairy farming, bakery, beauty care) with 70%+ self-employment conversion.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Rural Development",
        department="Rural Livelihoods Division",
        portal_url="https://nrrseti.in",
        benefit_details="100% free residential training, free hostel stay, wholesome meals, study kits, and direct credit linkage with Mudra/PMEGP bank loans upon graduation.",
        eligibilitySummary="Rural youth aged 18 to 45 years possessing basic literacy and motivation to start a micro-enterprise or trade.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Minimum Age 18 Years", "RSETI Norms Clause 2.1"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 45, "Maximum Age 45 Years", "RSETI Norms Clause 2.2"),
        ],
        documents=[
            make_doc("doc-rseti-aadhaar", "Aadhaar Card and Passport Photographs", "Identity verification", "UIDAI", "RSETI Form A"),
        ],
        steps=[
            make_step(1, "Enrol at District RSETI", "Walk into your district lead bank RSETI or apply through village SHG.", "meeseva_csc"),
            make_step(2, "10-30 Days Residential Course", "Undergo intensive practical skill training and business planning.", "college_cell"),
            make_step(3, "Bank Loan & Business Launch", "RSETI credit officer assists in obtaining collateral-free bank loan to start business.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-national-career-service",
        slug="national-career-service-ncs-portal-jobs",
        name="National Career Service (NCS) Portal",
        short_description="Free nationwide digital employment exchange offering 50+ Lakh verified private and public job vacancies, career counseling, and job fairs.",
        full_description="NCS is a Mission Mode Project by Ministry of Labour and Employment connecting job seekers, employers, career counselors, and skill training providers through a free, transparent national digital platform with regular job melas.",
        category="livelihood",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Labour and Employment",
        department="Directorate General of Employment",
        portal_url="https://www.ncs.gov.in",
        benefit_details="Free national job seeker ID card, free video-proctored career counseling, free soft skills training, and direct invitations to national job fairs.",
        eligibilitySummary="Any Indian citizen aged 14+ years seeking employment, internship, or career counseling.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 14, "Minimum Age 14 Years", "NCS Guidelines Clause 1"),
        ],
        documents=[
            make_doc("doc-ncs-aadhaar", "Aadhaar Card or PAN Card", "For instant e-KYC profile verification", "UIDAI", "NCS Doc 1"),
        ],
        steps=[
            make_step(1, "Register on NCS Portal", "Create jobseeker profile with educational qualifications and skills.", "online_portal", "https://www.ncs.gov.in"),
            make_step(2, "Career Counseling & Aptitude Test", "Book free session with accredited national career counselor.", "online_portal"),
            make_step(3, "Direct Job Application & Interviews", "Apply to verified vacancies and attend Model Career Centre job melas.", "district_office"),
        ]
    ),
    make_scheme(
        id="central-atal-bhujal-yojana",
        slug="atal-bhujal-yojana-groundwater-management",
        name="Atal Bhujal Yojana (Atal Jal - Community Groundwater Security)",
        short_description="Community-led groundwater management scheme in 8,220 water-stressed Gram Panchayats with participatory water budgets and recharge funding.",
        full_description="Atal Jal is a World Bank supported ₹6,000 Crore scheme under Ministry of Jal Shakti empowering community institutions (Water User Associations, Panchayats) to plan demand-side water management, construct artificial recharge structures, and conserve declining aquifers.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Jal Shakti",
        department="Department of Water Resources, River Development and Ganga Rejuvenation",
        portal_url="https://ataljal.mowr.gov.in",
        benefit_details="Incentive grants to Gram Panchayats for water conservation, micro-irrigation installation, rooftop rainwater harvesting, and groundwater monitoring piezometers.",
        eligibilitySummary="Gram Panchayats located in 80 water-stressed districts across Gujarat, Haryana, Karnataka, Madhya Pradesh, Maharashtra, Rajasthan, and Uttar Pradesh.",
        rules=[
            make_rule("panchayatStatus", "EQUALS", "water_stressed_atal_jal", "Notified Water-Stressed Gram Panchayat", "Atal Jal Guidelines 2"),
        ],
        documents=[
            make_doc("doc-ataljal-panchayat", "Gram Panchayat Water Security Plan (WSP)", "Approved by Gram Sabha", "Gram Sabha", "Atal Jal Form 1"),
        ],
        steps=[
            make_step(1, "Formulate Water Security Plan", "Gram Sabha assesses village water availability and drafts water budget.", "district_office"),
            make_step(2, "State Level Steering Committee Approval", "State groundwater board approves proposed recharge structures.", "district_office"),
            make_step(3, "Incentive Grant Disbursement", "Financial incentives credited directly to Gram Panchayat account upon verified water table improvement.", "online_portal", "https://ataljal.mowr.gov.in"),
        ]
    ),
    make_scheme(
        id="central-pm-matsya-kisan",
        slug="pradhan-mantri-matsya-kisan-samridhi-sah-yojana-pmmssy",
        name="Pradhan Mantri Matsya Kisan Samridhi Sah-Yojana (PMMKSSY)",
        short_description="Central micro-enterprise support providing up to 50% capital subsidy and performance grants for formalizing fish farmers and aquaculture workers.",
        full_description="PMMKSSY is a Central Sector sub-scheme under PMMSY providing ₹6,000 Crore focused funding to formalize the unorganized fisheries sector, facilitate institutional credit, and provide aquaculture insurance incentives.",
        category="agriculture",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Fisheries, Animal Husbandry and Dairying",
        department="Department of Fisheries",
        portal_url="https://pmmsy.dof.gov.in",
        benefit_details="Up to 50% performance grant (up to ₹25 Lakhs) for micro-enterprises in fish supply chain, plus 20-30% premium subsidy on aquaculture crop insurance.",
        eligibilitySummary="Fishers, fish vendors, fish workers, micro-enterprises, and fish farmer producer organizations registered on the National Fisheries Digital Platform.",
        rules=[
            make_rule("sector", "EQUALS", "fisheries", "Registered Fisher or Fish Enterprise", "PMMKSSY Rules 2.1"),
        ],
        documents=[
            make_doc("doc-pmmks-reg", "NFDP Digital Registration ID", "Issued by National Fisheries Development Board", "NFDB", "PMMKSSY Doc 1"),
        ],
        steps=[
            make_step(1, "Register on National Fisheries Digital Platform", "Create digital profile as fish farmer or vendor.", "online_portal", "https://nfdp.dof.gov.in"),
            make_step(2, "Submit Project Proposal", "Apply for working capital support or post-harvest cold unit.", "online_portal"),
            make_step(3, "Receive Performance Grant", "Grant disbursed via DBT linked with verified production milestones.", "online_portal"),
        ]
    ),
    make_scheme(
        id="central-poshan-abhiyan",
        slug="poshan-abhiyan-national-nutrition-mission",
        name="POSHAN Abhiyaan (National Nutrition Mission)",
        short_description="Integrated nutrition support providing free supplementary hot meals, take-home rations, and growth monitoring for children and pregnant mothers.",
        full_description="POSHAN Abhiyaan (National Nutrition Mission) is the Government of India's flagship programme to improve nutritional outcomes for children under 6 years, adolescent girls, pregnant women, and lactating mothers using tech-driven Poshan Tracker monitoring across 14 Lakh Anganwadis.",
        category="healthcare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Women and Child Development",
        department="Poshan Abhiyaan Division",
        portal_url="https://poshantracker.in",
        benefit_details="Free fortified Take Home Ration (THR), daily hot cooked morning snacks/meals at Anganwadis, growth faltering monitoring, and micronutrient supplementation.",
        eligibilitySummary="Children aged 6 months to 6 years, pregnant women, and lactating mothers registered at Anganwadi Centres.",
        rules=[
            make_rule("ageGroup", "IN", ["infant_child", "pregnant_mother", "lactating_mother"], "Target Nutrition Group", "Poshan Guidelines Section 2"),
        ],
        documents=[
            make_doc("doc-poshan-mcp", "Mother and Child Protection (MCP) Card", "Issued by local Anganwadi Worker", "WCD Dept", "Poshan Doc 1"),
        ],
        steps=[
            make_step(1, "Registration on Poshan Tracker", "Anganwadi worker captures beneficiary details on Poshan Tracker mobile app.", "district_office"),
            make_step(2, "Receive Supplementary Nutrition", "Collect weekly fortified food packets and hot cooked morning meals.", "district_office"),
            make_step(3, "Monthly Growth Monitoring", "Worker measures height and weight to track healthy developmental milestones.", "district_office", "https://poshantracker.in"),
        ]
    ),
    make_scheme(
        id="central-pm-laghu-vyapari-maandhan",
        slug="national-pension-scheme-for-traders-and-self-employed-pm-nps-traders",
        name="National Pension Scheme for Traders and Self-Employed Persons (PM-NPS-Traders)",
        short_description="Guaranteed monthly pension of ₹3,00,000/year (₹3,000/month) after age 60 for retail shopkeepers and small traders with 50% central matching contribution.",
        full_description="A voluntary and contributory pension scheme for small shopkeepers, retail traders, rice millers, commission agents, and self-employed professionals with annual turnover up to ₹1.5 Crore, offering ₹3,000 guaranteed monthly pension upon reaching age 60.",
        category="pension",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Labour and Employment",
        department="Social Security Division",
        portal_url="https://maandhan.in",
        benefit_details="Guaranteed ₹3,000 per month pension after age 60. Monthly contribution of ₹55 to ₹200 (depending on entry age 18-40) matched 50:50 by the Central Government.",
        eligibilitySummary="Retail shopkeepers, traders, and self-employed individuals aged 18 to 40 years with annual turnover <= ₹1.5 Crore, not covered under EPFO/ESIC/NPS.",
        rules=[
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Entry Age 18 to 40 Years", "PM-NPS-Traders Clause 2"),
            make_rule("maxAge", "LESS_THAN_OR_EQUAL", 40, "Maximum Age 40 Years", "PM-NPS-Traders Clause 3"),
            make_rule("annualTurnoverLimit", "LESS_THAN_OR_EQUAL", 15000000, "Annual GST/Turnover <= ₹1.5 Crore", "PM-NPS-Traders Clause 4"),
        ],
        documents=[
            make_doc("doc-traders-gst", "GSTIN or Trade Licence / Udyam Certificate", "Proof of retail shop or trading business", "GSTN / Municipality", "Traders Checklist 1"),
            make_doc("doc-traders-bank", "Aadhaar Card and Savings Bank Passbook", "For auto-debit of subscription", "Bank", "Traders Checklist 2"),
        ],
        steps=[
            make_step(1, "Enrol at Common Services Centre (CSC)", "Carry GSTIN/Udyam certificate and Aadhaar to nearest CSC kiosk.", "meeseva_csc", "https://maandhan.in"),
            make_step(2, "Set Up Auto-Debit Mandate", "Authenticate bank account for monthly auto-debit of prescribed subscription.", "meeseva_csc"),
            make_step(3, "Download Vyapari Pension Card", "Receive instant printed PM-NPS Traders Pension Card.", "meeseva_csc"),
        ]
    ),
    make_scheme(
        id="central-pm-devine-northeast",
        slug="prime-ministers-development-initiative-for-north-east-pm-devine",
        name="PM-DevINE (Prime Minister's Development Initiative for North-East)",
        short_description="100% centrally funded infrastructure and social development grant for transformative projects across all 8 North Eastern states.",
        full_description="PM-DevINE is a 100% Central Sector scheme under Ministry of Development of North Eastern Region (MDoNER) with an outlay of ₹6,600 Crore, funding strategic infrastructure, healthcare networks, bamboo value chains, and youth employment projects in the North East.",
        category="welfare",
        jurisdiction="central",
        state="All India",
        ministry="Ministry of Development of North Eastern Region",
        department="MDoNER Projects Division",
        portal_url="https://mdoner.gov.in",
        benefit_details="100% Central Government grant for high-impact regional connectivity, healthcare super-specialties, livelihood clusters, and youth sports academies.",
        eligibilitySummary="State Governments, North Eastern Council (NEC), and autonomous regional councils across the 8 North Eastern states.",
        rules=[
            make_rule("region", "EQUALS", "north_eastern_region", "North Eastern State Project", "PM-DevINE Guidelines Clause 3"),
        ],
        documents=[
            make_doc("doc-devine-dpr", "Project DPR and Inter-Departmental Feasibility", "Endorsed by State Chief Secretary", "State Planning Dept", "DevINE Doc 1"),
        ],
        steps=[
            make_step(1, "Project Prioritization by State", "State government submits flagship regional proposal to MDoNER.", "district_office"),
            make_step(2, "Empowered Committee Approval", "Inter-ministerial committee evaluates developmental impact and sanctions budget.", "online_portal"),
            make_step(3, "Fund Release & Project Execution", "Funds released directly to designated state implementing agency.", "online_portal", "https://mdoner.gov.in"),
        ]
    ),
]
