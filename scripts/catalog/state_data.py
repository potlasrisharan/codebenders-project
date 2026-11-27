"""
scripts/catalog/state_data.py
Part 1 of comprehensive State Government flagship schemes (South & West India).
"""

from .builder import make_scheme, make_rule, make_doc, make_step

STATE_SCHEMES_PART1 = [
    # ==========================================
    # TELANGANA (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="tg-yuva-vikasam",
        slug="telangana-yuva-vikasam-vidya-bharosa-card",
        name="Telangana Yuva Vikasam (Vidya Bharosa Card)",
        short_description="Financial assistance card up to ₹5 Lakhs for students to cover college admission fees, coaching, and international exams.",
        full_description="Yuva Vikasam is part of Telangana Government's Six Guarantees providing Vidya Bharosa financial assistance cards of up to ₹5,00,000 for students to pursue higher education, specialized skill development, and competitive examination coaching.",
        category="education_aid",
        jurisdiction="state",
        state="Telangana",
        department="Higher Education Department, Government of Telangana",
        portal_url="https://telangana.gov.in",
        benefit_details="Financial guarantee card covering up to ₹5,00,000 for college admission, coaching fees, and professional certification courses.",
        eligibilitySummary="Resident of Telangana, enrolled in accredited intermediate, undergraduate, or postgraduate college with family annual income <= ₹2 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Telangana", "Telangana Domicile", "Yuva Vikasam Rules 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 200000, "Annual Family Income <= ₹2 Lakhs", "Yuva Vikasam Rules 2"),
        ],
        documents=[
            make_doc("doc-tg-yv-residence", "Telangana Residence / Domicile Certificate", "Proof of continuous residence", "MeeSeva / Tahsildar", "YV Checklist 1"),
            make_doc("doc-tg-yv-income", "Latest MeeSeva Income Certificate", "Digitally signed current year certificate", "Revenue Dept", "YV Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply on Praja Palana / MeeSeva Portal", "Submit application with college enrollment details.", "meeseva_csc"),
            make_step(2, "Institutional Endorsement", "College Principal verifies student bonafide details on portal.", "college_cell"),
            make_step(3, "Vidya Bharosa Card Issuance", "Digital card issued with credit line for verified educational expenses.", "online_portal"),
        ]
    ),
    make_scheme(
        id="tg-cheyutha-pension",
        slug="telangana-cheyutha-social-security-pension",
        name="Telangana Cheyutha Social Security Pension Scheme",
        short_description="Monthly social security pension of ₹4,000 per month for senior citizens, widows, single women, beedi workers, and weavers in Telangana.",
        full_description="Under the Cheyutha Guarantee, the Government of Telangana provides enhanced social security pensions of ₹4,000 per month (and ₹6,000/month for persons with severe disabilities) to ensure vulnerable and elderly citizens live with security and self-respect.",
        category="pension",
        jurisdiction="state",
        state="Telangana",
        department="Panchayat Raj & Rural Development Department, Government of Telangana",
        portal_url="https://epensions.telangana.gov.in",
        benefit_details="₹4,000 per month direct bank transfer for elderly, widows, toddy tappers, weavers, and beedi workers; ₹6,000 per month for differently abled persons.",
        eligibilitySummary="Telangana resident, age 57+ for elderly pension; or verified widow / beedi worker / disabled person holding white ration card.",
        rules=[
            make_rule("state", "EQUALS", "Telangana", "Telangana Domicile", "Cheyutha Rules Clause 1"),
            make_rule("rationCardType", "EQUALS", "white_food_security_card", "BPL White Ration Card Holder", "Cheyutha Rules Clause 2"),
        ],
        documents=[
            make_doc("doc-tg-cheyutha-fsc", "Telangana Food Security Card (White Ration Card)", "Proof of BPL status", "Civil Supplies Dept", "Cheyutha Doc 1"),
            make_doc("doc-tg-cheyutha-age", "Aadhaar Card / Voter ID", "Age verification document", "UIDAI", "Cheyutha Doc 2"),
        ],
        steps=[
            make_step(1, "Submit Application via Praja Palana / MeeSeva", "Fill Cheyutha application at nearest MeeSeva or Gram Panchayat office.", "meeseva_csc"),
            make_step(2, "Field Verification by MPDO / Municipal Commissioner", "Verification of BPL status and biometric authentication.", "district_office"),
            make_step(3, "Monthly DBT Credit", "Pension deposited on 1st of every month directly into postal/bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="tg-tpride-dalit-entrepreneurship",
        slug="telangana-tpride-sc-st-entrepreneurship-incentives",
        name="Telangana T-PRIDE (Program for Rapid Incubation of Dalit Entrepreneurs)",
        short_description="Up to 45% investment subsidy (max ₹75 Lakhs) and 5% interest subvention for SC and ST entrepreneurs setting up industrial units or commercial transport.",
        full_description="T-PRIDE is a targeted affirmative initiative by Government of Telangana providing preferential capital subsidies, stamp duty reimbursements, subsidized power, and 45% capital investment subsidy for Dalit and Adivasi entrepreneurs.",
        category="livelihood",
        jurisdiction="state",
        state="Telangana",
        department="Industries and Commerce Department, Government of Telangana",
        portal_url="https://ipass.telangana.gov.in",
        benefit_details="35% to 45% capital investment subsidy on plant & machinery (up to ₹75 Lakhs), 5% interest subvention for 5 years, 100% stamp duty refund, and ₹1.50/unit power tariff subsidy.",
        eligibilitySummary="Enterprises owned 100% by Scheduled Caste (SC) or Scheduled Tribe (ST) entrepreneurs located within Telangana state.",
        rules=[
            make_rule("state", "EQUALS", "Telangana", "Located in Telangana", "T-PRIDE Policy Section 2"),
            make_rule("casteCategory", "IN", ["SC", "ST"], "SC or ST Entrepreneur 100% Ownership", "T-PRIDE Policy Section 3"),
        ],
        documents=[
            make_doc("doc-tpride-caste", "MeeSeva Integrated SC/ST Community Certificate", "Issued by Revenue Dept", "Tahsildar", "T-PRIDE Checklist 1"),
            make_doc("doc-tpride-ipass", "TS-iPASS Industrial Approval & Udyam Certificate", "State single window clearance", "District Industries Centre (DIC)", "T-PRIDE Checklist 2"),
        ],
        steps=[
            make_step(1, "TS-iPASS Single Window Registration", "Apply on TS-iPASS digital industrial clearance portal.", "online_portal", "https://ipass.telangana.gov.in"),
            make_step(2, "District Level Committee (DLC) Inspection", "General Manager DIC inspects factory site, machinery, and commercial production commencement.", "district_office"),
            make_step(3, "Direct Subsidy Sanction", "State Investment Promotion Board credits 45% investment subsidy into term loan account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="tg-kcr-kit-nutrition",
        slug="telangana-mother-and-child-kcr-nutrition-kit",
        name="Telangana Mother & Child Nutrition Kit (KCR Kit)",
        short_description="₹12,000 cash incentive (₹13,000 for girl child) in 4 installments plus 16-item mother and baby care kit for deliveries in government hospitals.",
        full_description="Government of Telangana provides comprehensive maternity protection including ₹12,000 financial support (₹13,000 for girl infant) disbursed across pregnancy stages and a baby kit comprising baby bed, clothes, mosquito net, baby soap, and oil.",
        category="healthcare",
        jurisdiction="state",
        state="Telangana",
        department="Health, Medical & Family Welfare Department, Government of Telangana",
        portal_url="https://kcrkit.telangana.gov.in",
        benefit_details="₹12,000 (boy) or ₹13,000 (girl) direct bank transfer in 4 stages (antenatal checkup, delivery, vaccination at 14 weeks, vaccination at 9 months) + 16-item baby kit.",
        eligibilitySummary="Pregnant women domiciled in Telangana delivering in government hospitals (Primary Health Centres, Area Hospitals, Teaching Hospitals) up to two deliveries.",
        rules=[
            make_rule("deliveryHospital", "EQUALS", "government_hospital", "Delivery in Telangana Government Hospital", "KCR Kit Rules 2"),
        ],
        documents=[
            make_doc("doc-kcr-anc", "MCP Card & Antenatal Registration", "Issued by ANM / PHC", "Government Hospital", "KCR Kit Doc 1"),
        ],
        steps=[
            make_step(1, "ANC Registration on KCR Kit Portal", "Register pregnancy with local ANM before 12 weeks of gestation.", "district_office"),
            make_step(2, "Institutional Delivery", "Deliver in government hospital; receive baby kit and Phase 2 cash transfer on discharge.", "district_office"),
            make_step(3, "Post-Natal Immunization Stages", "Bring infant for scheduled vaccines; remaining installments credited via DBT.", "online_portal", "https://kcrkit.telangana.gov.in"),
        ]
    ),

    # ==========================================
    # ANDHRA PRADESH (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="ap-ysr-aasara",
        slug="ap-ysr-aasara-shg-debt-relief",
        name="Andhra Pradesh YSR Aasara (SHG Women Debt Relief Scheme)",
        short_description="Reimbursement of outstanding bank loan amounts of DWCRA Self Help Groups in 4 annual installments to empower rural and urban women.",
        full_description="YSR Aasara reimburses the outstanding bank loan dues of women DWCRA Self Help Groups directly into their individual savings accounts, eliminating debt distress and fostering micro-enterprises.",
        category="welfare",
        jurisdiction="state",
        state="Andhra Pradesh",
        department="Society for Elimination of Rural Poverty (SERP), Government of Andhra Pradesh",
        portal_url="https://navasakam.ap.gov.in",
        benefit_details="Direct reimbursement of total bank loan outstanding of SHG group divided among members and paid annually directly via DBT.",
        eligibilitySummary="Women members of recognized DWCRA Self Help Groups (SHGs) in rural and urban areas of Andhra Pradesh.",
        rules=[
            make_rule("state", "EQUALS", "Andhra Pradesh", "Andhra Pradesh Domicile", "YSR Aasara Guidelines 2.1"),
            make_rule("shgMember", "EQUALS", True, "Active DWCRA SHG Member", "YSR Aasara Guidelines 2.2"),
        ],
        documents=[
            make_doc("doc-aasara-shg", "SHG Group Passbook & Resolution", "Issued by Village Organisation (VO)", "SERP / MEPMA", "Aasara Checklist 1"),
        ],
        steps=[
            make_step(1, "Verification by Village / Ward Secretariat", "Welfare & Education Assistant cross-verifies SHG bank loan records.", "district_office"),
            make_step(2, "Social Audit Display", "Beneficiary list displayed at Gram Sachivalayam for social audit.", "district_office"),
            make_step(3, "DBT Credit", "Funds credited directly into members' personal savings accounts.", "online_portal"),
        ]
    ),
    make_scheme(
        id="ap-ysr-bima",
        slug="ap-ysr-bima-accident-natural-death-insurance",
        name="Andhra Pradesh YSR Bima (Social Security Insurance Scheme)",
        short_description="100% state-paid insurance of ₹5 Lakhs for accidental death/permanent disability and ₹1 Lakh for natural death of primary breadwinners.",
        full_description="YSR Bima provides 100% government-funded life and accidental insurance protection to unorganised sector breadwinners belonging to BPL families with immediate ₹10,000 cash relief within 24 hours.",
        category="welfare",
        jurisdiction="state",
        state="Andhra Pradesh",
        department="Department of Labour, Employment, Training and Factories, Govt of AP",
        portal_url="https://ysrbima.ap.gov.in",
        benefit_details="₹5,00,000 for accidental death (age 18-70); ₹1,00,000 for natural death (age 18-50); ₹10,000 immediate funeral cash delivered by Village Secretariat within 24 hours.",
        eligibilitySummary="Primary breadwinner of BPL household holding Rice Card in Andhra Pradesh aged 18 to 70 years.",
        rules=[
            make_rule("state", "EQUALS", "Andhra Pradesh", "AP Domicile", "YSR Bima Rules 1"),
            make_rule("riceCardHolder", "EQUALS", True, "Rice Card Holder (BPL)", "YSR Bima Rules 2"),
        ],
        documents=[
            make_doc("doc-bima-rice", "AP Rice Card", "Electronic BPL food security card", "Civil Supplies Dept AP", "Bima Checklist 1"),
        ],
        steps=[
            make_step(1, "Automatic Enrolment via Volunteer Survey", "Village/Ward Volunteer captures household breadwinner and nominee details.", "district_office"),
            make_step(2, "Immediate Claim Registration on Demise", "Village Secretariat Welfare Assistant visits bereaved family upon incident.", "district_office"),
            make_step(3, "Instant Funeral Cash & Insurance Settlement", "₹10,000 handed in cash immediately; balance DBT settled by Insurance Company.", "online_portal", "https://ysrbima.ap.gov.in"),
        ]
    ),
    make_scheme(
        id="ap-ysr-matsyakara-bharosa",
        slug="ap-ysr-matsyakara-bharosa-fishing-ban-relief",
        name="Andhra Pradesh YSR Matsyakara Bharosa (Fishermen Welfare Scheme)",
        short_description="Annual financial relief of ₹10,000 during the marine fishing ban period plus subsidized diesel at ₹9/litre rebate for motorized boats.",
        full_description="Provides direct livelihood compensation of ₹10,000 during the annual marine fishing conservation ban (April 15 to June 14) and enhanced diesel subsidy of ₹9/litre for registered mechanized and motorized boat owners.",
        category="agriculture",
        jurisdiction="state",
        state="Andhra Pradesh",
        department="Department of Fisheries, Government of Andhra Pradesh",
        portal_url="https://fisheries.ap.gov.in",
        benefit_details="₹10,000 annual DBT cash transfer during 61-day fishing ban; diesel rebate of ₹9 per litre credited directly into smart cards at designated fishing harbours.",
        eligibilitySummary="Traditional marine fishers operating motorized and non-motorized crafts with valid biometric fisher card in coastal districts of Andhra Pradesh.",
        rules=[
            make_rule("state", "EQUALS", "Andhra Pradesh", "AP Domicile", "Matsyakara Bharosa Section 2"),
            make_rule("occupation", "EQUALS", "marine_fisherman", "Marine Fisher / Boat Crew", "Matsyakara Bharosa Section 3"),
        ],
        documents=[
            make_doc("doc-fisher-biometric", "Marine Fishermen Biometric Card / Registration", "Issued by Fisheries Dept", "Assistant Director Fisheries", "Fisheries Form A"),
        ],
        steps=[
            make_step(1, "Enumeration by Fisheries Assistant", "Village Fisheries Assistant surveys active fishing crews at landing centres.", "district_office"),
            make_step(2, "Social Audit Verification", "Draft list displayed at coastal Gram Sachivalayam.", "district_office"),
            make_step(3, "Direct DBT Release", "₹10,000 credited to bank account at the start of ban period.", "online_portal"),
        ]
    ),
    make_scheme(
        id="ap-ysr-vahana-mitra",
        slug="ap-ysr-vahana-mitra-auto-taxi-drivers",
        name="Andhra Pradesh YSR Vahana Mitra (Self-Owned Auto & Taxi Drivers)",
        short_description="Annual financial grant of ₹10,000 for self-employed auto, taxi, and maxi-cab driver-owners to meet insurance, fitness certificate, and repair costs.",
        full_description="YSR Vahana Mitra provides ₹10,000 every year to owner-drivers of auto-rickshaws, metered taxis, and maxi cabs to cover recurring vehicle insurance, fitness certificates, and maintenance expenses.",
        category="welfare",
        jurisdiction="state",
        state="Andhra Pradesh",
        department="Transport Department, Government of Andhra Pradesh",
        portal_url="https://aptransport.org",
        benefit_details="₹10,000 per year direct financial grant credited to the driver-cum-owner's bank account via DBT.",
        eligibilitySummary="Resident of AP, owning and driving an Auto-rickshaw, light motor vehicle (Taxi/Cab) holding valid driving licence and vehicle registration certificate.",
        rules=[
            make_rule("state", "EQUALS", "Andhra Pradesh", "AP Domicile", "Vahana Mitra Section 1"),
            make_rule("vehicleOwnerDriver", "EQUALS", True, "Vehicle Owner-cum-Driver Status", "Vahana Mitra Section 2"),
        ],
        documents=[
            make_doc("doc-vahana-rc", "Vehicle Registration Certificate (RC)", "Showing applicant as registered owner", "RTO Andhra Pradesh", "Vahana Checklist 1"),
            make_doc("doc-vahana-dl", "Driving Licence (Commercial / LMV)", "Valid driving licence", "RTO", "Vahana Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online via Village Secretariat", "Submit RC, DL, and Aadhaar on Navasakam portal.", "district_office", "https://navasakam.ap.gov.in"),
            make_step(2, "Transport Department Verification", "Motor Vehicle Inspector verifies vehicle ownership and active fitness certificate.", "district_office"),
            make_step(3, "Annual Cash Transfer", "₹10,000 credited directly into the applicant's account.", "online_portal"),
        ]
    ),

    # ==========================================
    # KARNATAKA (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="ka-vidyasiri-scholarship",
        slug="karnataka-vidyasiri-food-accommodation-scholarship",
        name="Karnataka Vidyasiri (Food & Accommodation Scholarship Scheme)",
        short_description="Monthly financial stipend of ₹1,500/month (₹15,000/year) for SC, ST, OBC students from rural areas pursuing post-matric courses without hostel admission.",
        full_description="Vidyasiri (Karepass) is a flagship welfare program by Karnataka Backward Classes Welfare Department providing food and accommodation assistance of ₹1,500 per month for 10 months to rural college students who could not secure admission in government hostels.",
        category="scholarship",
        jurisdiction="state",
        state="Karnataka",
        department="Backward Classes Welfare Department, Government of Karnataka",
        portal_url="https://karepass.cgg.gov.in",
        benefit_details="₹1,500 per month for 10 academic months (total ₹15,000 per year) credited straight to the student's bank account.",
        eligibilitySummary="Karnataka student from SC/ST/OBC category, studying in post-matric college located at least 5 km away from hometown, not admitted in any government hostel, family income <= ₹2.5 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Karnataka", "Karnataka Domicile", "Vidyasiri Rules Clause 2.1"),
            make_rule("minDistanceKm", "GREATER_THAN_OR_EQUAL", 5, "College Distance >= 5 km from Residence", "Vidyasiri Rules Clause 2.2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 250000, "Annual Family Income <= ₹2.5 Lakhs", "Vidyasiri Rules Clause 2.3"),
        ],
        documents=[
            make_doc("doc-ka-caste-rd", "Caste & Income Certificate (RD Number)", "Digitally signed RD certificate from Nada Kacheri", "Revenue Dept Karnataka", "Karepass Doc 1"),
            make_doc("doc-ka-hostel-non", "Non-Hostel Admission Certificate", "Proof that student was not allotted government hostel", "Taluk BCM Officer", "Karepass Doc 2"),
        ],
        steps=[
            make_step(1, "Apply on Karepass / SSP Portal", "Login to State Scholarship Portal (SSP) using Aadhaar and enter SATS ID.", "online_portal", "https://ssp.postmatric.karnataka.gov.in"),
            make_step(2, "College E-Attestation", "College principal e-attests admission and attendance records on SSP.", "college_cell"),
            make_step(3, "Direct Monthly DBT", "₹1,500 monthly stipend transferred via Aadhaar Payment Bridge.", "online_portal"),
        ]
    ),
    make_scheme(
        id="ka-ganga-kalyana-borewell",
        slug="karnataka-ganga-kalyana-scheme-irrigation",
        name="Karnataka Ganga Kalyana Scheme (Free Irrigation Borewells)",
        short_description="100% free drilling of agricultural borewells, submersible pump installation, and electrical energization for small/marginal SC, ST, and minority farmers.",
        full_description="Under the Ganga Kalyana Scheme, the Government of Karnataka provides dedicated individual or collective irrigation facilities by drilling free borewells, installing pumpsets, and energizing them for small and marginal farmers belonging to SC, ST, and OBC communities.",
        category="agriculture",
        jurisdiction="state",
        state="Karnataka",
        department="Dr. B.R. Ambedkar Development Corporation, Government of Karnataka",
        portal_url="https://adcl.karnataka.gov.in",
        benefit_details="100% free borewell drilling up to 500+ feet, submersible pump, motor, pipelines, and free electrical power line connection (worth up to ₹3.5 Lakhs per borewell).",
        eligibilitySummary="Small or marginal farmer belonging to SC/ST/OBC in Karnataka owning minimum 1 to 5 acres of agricultural land without perennial water source; family income <= ₹96,000/yr (rural).",
        rules=[
            make_rule("state", "EQUALS", "Karnataka", "Karnataka Domicile", "Ganga Kalyana Rules 1"),
            make_rule("casteCategory", "IN", ["SC", "ST", "OBC_Cat1", "OBC_2A"], "Eligible Backward Community", "Ganga Kalyana Rules 2"),
        ],
        documents=[
            make_doc("doc-ka-rtc", "Land Records (RTC / Pahani)", "Demonstrating cultivable dry agricultural land", "Revenue Dept (Bhoomi)", "Ganga Kalyana Checklist 1"),
            make_doc("doc-ka-small-farmer", "Small / Marginal Farmer Certificate", "Issued by Tahsildar", "Tahsildar", "Ganga Kalyana Checklist 2"),
        ],
        steps=[
            make_step(1, "Online Application on Seva Sindhu", "Submit application on Karnataka Seva Sindhu portal or at Grama One centre.", "online_portal", "https://sevasindhu.karnataka.gov.in"),
            make_step(2, "Hydrogeologist Ground Survey", "Groundwater department geologists survey land and mark drilling point.", "district_office"),
            make_step(3, "Drilling & Energization by Corporation", "Corporation rigs drill borewell and DISCOM (BESCOM/HESCOM) connects power.", "district_office"),
        ]
    ),

    # ==========================================
    # TAMIL NADU (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="tn-tamil-pudhalvan",
        slug="tamil-nadu-tamil-pudhalvan-college-boys-stipend",
        name="Tamil Nadu Tamil Pudhalvan Scheme (College Boys Higher Education Incentive)",
        short_description="Monthly financial assistance of ₹1,000 per month for male students from government schools pursuing undergraduate degrees, engineering, or polytechnic diplomas.",
        full_description="Complementing the Pudhumai Penn scheme for girls, Tamil Pudhalvan provides a direct monthly stipend of ₹1,000 to boys who studied in government schools (Classes 6 to 12) to pursue college degrees and technical education without dropping out due to economic pressures.",
        category="scholarship",
        jurisdiction="state",
        state="Tamil Nadu",
        department="Social Welfare and Women Empowerment Department, Government of Tamil Nadu",
        portal_url="https://tamilpudhalvan.tn.gov.in",
        benefit_details="₹1,000 per month credited directly into the student's bank account every month until completion of degree/diploma course.",
        eligibilitySummary="Male students who studied from Class 6 to 12 in Tamil Nadu Government schools, enrolled in full-time regular undergraduate, engineering, medical, or polytechnic course.",
        rules=[
            make_rule("state", "EQUALS", "Tamil Nadu", "Tamil Nadu Domicile", "Tamil Pudhalvan Criteria 1"),
            make_rule("gender", "EQUALS", "male", "Male Student", "Tamil Pudhalvan Criteria 2"),
            make_rule("schoolingGovtClass6to12", "EQUALS", True, "Class 6-12 in TN Govt School", "Tamil Pudhalvan Criteria 3"),
        ],
        documents=[
            make_doc("doc-tn-emits", "School EMIS Number / Transfer Certificate", "Proof of studying in TN Govt School Class 6-12", "School Headmaster", "Tamil Pudhalvan Doc 1"),
            make_doc("doc-tn-college-bonafide", "College Admission Bonafide", "Confirming regular college enrollment", "College Principal", "Tamil Pudhalvan Doc 2"),
        ],
        steps=[
            make_step(1, "College Level Registration Camp", "Nodal officer at college enters student EMIS number on Tamil Pudhalvan portal.", "college_cell"),
            make_step(2, "Departmental Verification", "Education department verifies government school schooling record via EMIS.", "online_portal"),
            make_step(3, "Monthly DBT Transfer", "₹1,000 credited every month into student's Aadhaar-seeded bank account.", "online_portal", "https://tamilpudhalvan.tn.gov.in"),
        ]
    ),
    make_scheme(
        id="tn-naan-mudhalvan",
        slug="tamil-nadu-naan-mudhalvan-upskilling-employment",
        name="Tamil Nadu Naan Mudhalvan Scheme (Flagship Career Upskilling)",
        short_description="100% free industry-certified skill training in AI/ML, Cloud Computing, Robotics, and Foreign Languages with top MNC hiring linkages for college students.",
        full_description="Naan Mudhalvan is Tamil Nadu's umbrella skill and career guidance platform empowering over 10 Lakh college youth annually with cutting-edge curriculum delivered by industry leaders (Microsoft, Google, Infosys, L&T) integrated into semester timetables.",
        category="livelihood",
        jurisdiction="state",
        state="Tamil Nadu",
        department="Tamil Nadu Skill Development Corporation (TNSDC)",
        portal_url="https://naanmudhalvan.tn.gov.in",
        benefit_details="100% free industry courses, cloud lab credits, mandatory semester credits, mentorship, hackathons, and placement drives in top tech and engineering companies.",
        eligibilitySummary="All students currently studying in Arts & Science, Engineering, Polytechnic, and ITI colleges in Tamil Nadu.",
        rules=[
            make_rule("state", "EQUALS", "Tamil Nadu", "College Enrolled in Tamil Nadu", "Naan Mudhalvan Guidelines 2"),
        ],
        documents=[
            make_doc("doc-naan-id", "College Student ID Card & Registration Number", "Current active enrollment", "College", "NM Checklist 1"),
        ],
        steps=[
            make_step(1, "Login to Naan Mudhalvan Portal", "Student logs in with university register number and accesses skill dashboard.", "online_portal", "https://naanmudhalvan.tn.gov.in"),
            make_step(2, "Complete Semester Skill Module", "Undergo hands-on project training as part of curriculum.", "college_cell"),
            make_step(3, "Industry Certification & Placement", "Earn global industry certificate and participate in campus job drives.", "district_office"),
        ]
    ),
    make_scheme(
        id="tn-cm-breakfast-scheme",
        slug="tamil-nadu-chief-ministers-breakfast-scheme",
        name="Tamil Nadu Chief Minister's Breakfast Scheme (Mudhalvarin Kaalai Unavu Thittam)",
        short_description="Free nutritious hot cooked breakfast (pongal, kichadi, idli, upma with sambar) every school morning for all primary school children across Tamil Nadu.",
        full_description="Pioneered by Tamil Nadu, this flagship school nutrition scheme provides freshly prepared, healthy hot breakfast to over 17 Lakh children in Grades 1 to 5 across all 31,000+ government primary schools to eliminate morning hunger and improve classroom attention.",
        category="welfare",
        jurisdiction="state",
        state="Tamil Nadu",
        department="Social Welfare and Women Empowerment Department, Government of Tamil Nadu",
        portal_url="https://cmbreakfast.tn.gov.in",
        benefit_details="Free hot cooked nutritious breakfast every school working day (variety menu: rava upma, pongal, semiya kichadi, wheat upma, and vegetable sambar).",
        eligibilitySummary="All children studying in Classes 1 to 5 in government primary and middle schools in Tamil Nadu.",
        rules=[
            make_rule("schoolClass", "LESS_THAN_OR_EQUAL", 5, "Class 1 to 5 in Government School", "CM Breakfast Policy 1"),
        ],
        documents=[
            make_doc("doc-breakfast-none", "No Application Required (Universal for all enrolled students)", "Automatic school entitlement", "Primary School Headmaster", "CMBS Guidelines"),
        ],
        steps=[
            make_step(1, "School Enrolment", "Enrol in any government primary school in Tamil Nadu.", "college_cell"),
            make_step(2, "Daily Breakfast Serving", "Served hot breakfast every school morning between 8:00 AM and 8:45 AM.", "district_office"),
        ]
    ),

    # ==========================================
    # MAHARASHTRA (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="mh-rajarshi-shahu-maharaj-fee",
        slug="maharashtra-rajarshi-chhatrapati-shahu-maharaj-fee-reimbursement",
        name="Maharashtra Rajarshi Chhatrapati Shahu Maharaj Shikshan Shulkh Shishyavrutti",
        short_description="50% to 100% tuition and exam fee reimbursement for EBC, OBC, and SEBC students pursuing professional engineering, medical, and pharmacy degrees.",
        full_description="This flagship higher education scheme by Government of Maharashtra pays 50% of tuition and exam fees for EBC/OBC students (and 100% for girl students from families earning <= ₹8 Lakhs) admitted through CAP in government-approved professional colleges.",
        category="scholarship",
        jurisdiction="state",
        state="Maharashtra",
        department="Directorate of Higher / Technical / Medical Education, Govt of Maharashtra",
        portal_url="https://mahadbt.maharashtra.gov.in",
        benefit_details="50% reimbursement of sanctioned tuition fees and examination fees (100% for girl students under revised state policy) credited directly to college/student account.",
        eligibilitySummary="Maharashtra domicile, admitted through Centralized Admission Process (CAP) in approved degree/diploma course, family income <= ₹8 Lakhs per year.",
        rules=[
            make_rule("state", "EQUALS", "Maharashtra", "Maharashtra Domicile", "RCSM Scheme Rules 2.1"),
            make_rule("capAdmission", "EQUALS", True, "Admission through CAP Round", "RCSM Scheme Rules 2.2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 800000, "Annual Family Income <= ₹8 Lakhs", "RCSM Scheme Rules 2.3"),
        ],
        documents=[
            make_doc("doc-mh-domicile", "Maharashtra Domicile Certificate", "Proof of continuous residence", "Tahsildar / Setu Centre", "MahaDBT Doc 1"),
            make_doc("doc-mh-income-tehsil", "Tehsildar Income Certificate", "Income verification for current year", "Tahsildar", "MahaDBT Doc 2"),
            make_doc("doc-mh-cap-allotment", "CAP Allotment Letter", "Proof of merit seat via CET Cell", "State CET Cell", "MahaDBT Doc 3"),
        ],
        steps=[
            make_step(1, "Create Profile on MahaDBT Portal", "Register on Aaple Sarkar DBT portal with Aadhaar e-KYC.", "online_portal", "https://mahadbt.maharashtra.gov.in"),
            make_step(2, "Upload CAP Allotment & Income Proof", "Select Directorate of Technical/Higher Education and apply for Shahu Maharaj Scheme.", "online_portal"),
            make_step(3, "College Scrutiny & Direct Credit", "College verifies form and state treasury releases fee reimbursement.", "college_cell"),
        ]
    ),
    make_scheme(
        id="mh-sanjay-gandhi-niradhar",
        slug="maharashtra-sanjay-gandhi-niradhar-anudan-yojana",
        name="Maharashtra Sanjay Gandhi Niradhar Anudan Yojana",
        short_description="Monthly financial pension of ₹1,500/month for destitute persons, widows, divorced women, orphan children, and patients with critical illnesses.",
        full_description="Administered by Social Justice and Special Assistance Department of Maharashtra, this scheme provides a vital social safety net of ₹1,500 per month for persons with no regular source of income who are aged 65+, destitute, disabled, or suffering from critical conditions.",
        category="pension",
        jurisdiction="state",
        state="Maharashtra",
        department="Social Justice and Special Assistance Department, Govt of Maharashtra",
        portal_url="https://sjsa.maharashtra.gov.in",
        benefit_details="₹1,500 per month for single beneficiary (₹2,000 per month if family has two or more beneficiaries) credited directly to bank account.",
        eligibilitySummary="Resident of Maharashtra for 15+ years, age 65+ (or destitute widow/divorcee/disabled of any age), family income <= ₹50,000 per annum.",
        rules=[
            make_rule("state", "EQUALS", "Maharashtra", "Maharashtra Resident for 15+ Years", "SGNAY Clause 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 50000, "Annual Family Income <= ₹50,000", "SGNAY Clause 2"),
        ],
        documents=[
            make_doc("doc-sgnay-income", "Tehsildar Income & Destitute Certificate", "Showing income below ₹50,000/yr", "Tahsildar", "SGNAY Form A"),
            make_doc("doc-sgnay-residence", "15 Years Residence Domicile Proof", "Ration card or election voter ID", "Competent Authority", "SGNAY Form B"),
        ],
        steps=[
            make_step(1, "Apply at Tahsil Office or Setu Suvidha Kendra", "Submit filled SGNAY form with residence and income proof.", "meeseva_csc"),
            make_step(2, "Sanjay Gandhi Committee Sanction", "Taluka Level Sanjay Gandhi Committee headed by MLA/Tahsildar approves pension list.", "district_office"),
            make_step(3, "Monthly DBT Disbursal", "Sanctioned monthly pension credited straight into savings bank account.", "online_portal"),
        ]
    ),

    # ==========================================
    # KERALA (NEW ADDITIONS)
    # ==========================================
    make_scheme(
        id="kl-karunya-health-scheme",
        slug="kerala-karunya-arogya-suraksha-paddhati-kasp",
        name="Kerala Karunya Arogya Suraksha Paddhati (KASP) & Karunya Benevolent Fund",
        short_description="Comprehensive cashless hospitalisation health cover up to ₹5 Lakhs per family per year across 600+ empanelled government and private hospitals.",
        full_description="KASP is Kerala's flagship converged health care scheme providing ₹5,00,000 per family per year for secondary and tertiary care hospitalization, complemented by the Karunya Benevolent Fund (KBF) offering one-time grants up to ₹3 Lakhs for rare diseases.",
        category="healthcare",
        jurisdiction="state",
        state="Kerala",
        department="State Health Agency (SHA), Health and Family Welfare Department, Govt of Kerala",
        portal_url="https://sha.kerala.gov.in",
        benefit_details="₹5,00,000 per family per year cashless treatment for 1,600+ surgical and medical packages in empanelled hospitals, covering pre-existing conditions without waiting period.",
        eligibilitySummary="All ration card holders categorized as Antyodaya Anna Yojana (AAY) and Priority Household (PHH - Pink and Yellow cards), and enrolled Non-Priority Subsidy families.",
        rules=[
            make_rule("state", "EQUALS", "Kerala", "Kerala Resident", "KASP Scheme Rules Section 2"),
            make_rule("rationCardCategory", "IN", ["AAY", "PHH", "BPL"], "Priority Ration Card Holder", "KASP Scheme Rules Section 3"),
        ],
        documents=[
            make_doc("doc-kl-ration", "Kerala Electronic Ration Card", "Pink / Yellow / Blue card", "Civil Supplies Dept Kerala", "KASP Checklist 1"),
            make_doc("doc-kl-aadhaar", "Aadhaar Card", "For biometric patient verification", "UIDAI", "KASP Checklist 2"),
        ],
        steps=[
            make_step(1, "Approach KASP Helpdesk at Hospital", "Visit Karunya Arogya Mitra (KAM) counter at any empanelled hospital.", "district_office"),
            make_step(2, "Instant Biometric Authentication", "Verify Aadhaar and ration card on SHA Kerala portal.", "online_portal", "https://sha.kerala.gov.in"),
            make_step(3, "100% Cashless Treatment & Discharge", "Diagnostic tests, surgeries, medicines, and food covered without paying any cash.", "district_office"),
        ]
    ),
    make_scheme(
        id="kl-life-mission-housing",
        slug="kerala-life-mission-housing-for-all",
        name="Kerala LIFE Mission (Livelihood Inclusion and Financial Empowerment)",
        short_description="₹4 Lakhs direct grant to construct 400 sq.ft. pucca house for all landless and homeless families in Kerala with livelihood convergence.",
        full_description="LIFE Mission is Kerala's revolutionary housing mission providing pucca, climate-resilient houses of minimum 400 sq.ft. with ₹4,00,000 financial grant to homeless families having land, and turnkey apartment complexes for landless-homeless families.",
        category="housing",
        jurisdiction="state",
        state="Kerala",
        department="Local Self Government Department, Government of Kerala",
        portal_url="https://lifemission.kerala.gov.in",
        benefit_details="₹4,00,000 financial grant disbursed in 4 construction milestones (foundation, lintel, roof, completion) for homeless families, plus skill training and livelihood assistance.",
        eligibilitySummary="Homeless individuals/families domiciled in Kerala holding pink/yellow ration card without a pucca house in their name anywhere in India.",
        rules=[
            make_rule("state", "EQUALS", "Kerala", "Kerala Domicile", "LIFE Mission Guidelines Clause 3"),
            make_rule("ownPuccaHouse", "EQUALS", False, "No Existing Pucca House", "LIFE Mission Guidelines Clause 4"),
        ],
        documents=[
            make_doc("doc-kl-life-land", "Land Tax Receipt / Possession Certificate", "Proof of minimum 1-3 cents of land", "Village Officer", "LIFE Mission Form 1"),
            make_doc("doc-kl-life-ration", "Ration Card & Aadhaar", "Proof of BPL status", "Civil Supplies", "LIFE Mission Form 2"),
        ],
        steps=[
            make_step(1, "Online Application on LIFE Mission Portal", "Apply online with land details through Akshaya Centre or Grama Panchayat.", "meeseva_csc", "https://lifemission.kerala.gov.in"),
            make_step(2, "Field Verification & Grama Sabha Approval", "Grama Panchayat secretary inspects site; beneficiary list ratified by Grama Sabha.", "district_office"),
            make_step(3, "Milestone-Based Fund Credit", "Grant released in 4 installments directly to bank account based on engineer geotagged photos.", "online_portal"),
        ]
    ),
]
