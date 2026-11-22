"""
scripts/catalog/state_data_4.py
Part 4 of State Government flagship schemes (North-East, Mountain States, and Union Territories).
"""

from .builder import make_scheme, make_rule, make_doc, make_step

STATE_SCHEMES_PART4 = [
    # ==========================================
    # SIKKIM
    # ==========================================
    make_scheme(
        id="sk-aama-yojana",
        slug="sikkim-aama-yojana-unemployed-mothers",
        name="Sikkim Aama Yojana (Annual Financial Assistance for Non-Working Mothers)",
        short_description="Annual financial grant of ₹40,000 transferred directly to non-working rural and urban mothers across Sikkim.",
        full_description="Aama Yojana is a pioneering maternal welfare scheme by the Government of Sikkim providing an annual financial grant of ₹40,000 to all unemployed, non-working mothers to recognise their unpaid domestic labour and ensure economic dignity.",
        category="welfare",
        jurisdiction="state",
        state="Sikkim",
        department="Social Welfare Department, Government of Sikkim",
        portal_url="https://sikkim.gov.in",
        benefit_details="₹40,000 per year credited directly to the mother's individual savings bank account via DBT in two seasonal installments.",
        eligibilitySummary="Mothers resident in Sikkim who are not employed in any regular government or private formal job, appearing in the Sikkim state electoral roll.",
        rules=[
            make_rule("state", "EQUALS", "Sikkim", "Sikkim Subject / COI Holder", "Aama Yojana Rules 1"),
            make_rule("gender", "EQUALS", "female", "Mother Status", "Aama Yojana Rules 2"),
            make_rule("employmentStatus", "EQUALS", "unemployed", "Non-Working Mother", "Aama Yojana Rules 3"),
        ],
        documents=[
            make_doc("doc-sk-coi", "Certificate of Identification (COI) / Residential Certificate", "Proof of Sikkim domicile", "District Collectorate", "Aama Checklist 1"),
            make_doc("doc-sk-unemp", "Unemployment Certificate / Self-Declaration", "Certified by Gram Panchayat", "Panchayat President", "Aama Checklist 2"),
        ],
        steps=[
            make_step(1, "Submit Application at Block Administrative Centre (BAC)", "Fill application form at nearest BAC or Ward level office.", "district_office"),
            make_step(2, "Gram Panchayat Vetting", "Panchayat Secretary confirms non-working status and residence.", "district_office"),
            make_step(3, "Direct Treasury DBT Transfer", "₹40,000 credited directly into beneficiary's bank account.", "online_portal"),
        ]
    ),

    # ==========================================
    # TRIPURA
    # ==========================================
    make_scheme(
        id="tr-mukhyamantri-matru-pushti-upahar",
        slug="tripura-mukhyamantri-matru-pushti-upahar-nutrition-kits",
        name="Tripura Mukhyamantri Matru Pushti Uphar (Maternal Nutrition Kits)",
        short_description="Free nutritional food kits (peanut butter, ghee, milk powder, horlicks, dates) worth ₹1,500 in 4 tranches during pregnancy and lactation.",
        full_description="Provides special nutritional food baskets containing protein and micronutrient supplements to pregnant and lactating mothers across Tripura during periodic antenatal checkups to combat maternal anaemia and infant stunting.",
        category="healthcare",
        jurisdiction="state",
        state="Tripura",
        department="Social Welfare and Social Education Department, Government of Tripura",
        portal_url="https://socialwelfare.tripura.gov.in",
        benefit_details="Free comprehensive nutritional grocery kit worth ₹1,500 distributed 4 times during pregnancy and postpartum checkups at Anganwadi Centres.",
        eligibilitySummary="Pregnant and lactating women registered at any Anganwadi Centre across Tripura attending periodic ANC checkups.",
        rules=[
            make_rule("state", "EQUALS", "Tripura", "Tripura Domicile", "Matru Pushti Rules 1"),
        ],
        documents=[
            make_doc("doc-tr-mcp", "Mother & Child Protection (MCP) Card", "Issued by Health Worker", "Sub-Centre / PHC", "Tripura MCP Doc"),
        ],
        steps=[
            make_step(1, "Register Pregnancy at Anganwadi", "Register within 12 weeks of pregnancy with local Anganwadi worker.", "district_office"),
            make_step(2, "Attend Antenatal Checkup (ANC)", "Complete medical checkup at Primary Health Centre.", "district_office"),
            make_step(3, "Collect Nutrition Basket", "Receive sealed high-nutrition food kit free of charge at Anganwadi centre.", "district_office"),
        ]
    ),

    # ==========================================
    # MEGHALAYA
    # ==========================================
    make_scheme(
        id="ml-focus-farmers-producers",
        slug="meghalaya-focus-farmers-collectivisation-scheme",
        name="Meghalaya FOCUS (Farmers' Collectivisation for Upscaling of Production and Marketing Systems)",
        short_description="Direct financial assistance of ₹5,000 per member (up to ₹50,000 to ₹1 Lakh per producer group) for agri-horticultural input and marketing.",
        full_description="FOCUS is Meghalaya's flagship rural farmer collectivisation program mobilizing small tribal farmers into Producer Groups (PGs) and providing seed capital grants directly to groups for seeds, organic fertilizers, mini-processing units, and market aggregation.",
        category="agriculture",
        jurisdiction="state",
        state="Meghalaya",
        department="Agriculture and Farmers' Welfare Department, Government of Meghalaya",
        portal_url="https://focus.meghalaya.gov.in",
        benefit_details="Direct grant of ₹5,000 per farming household distributed as group capital to registered Producer Groups of 10-20 farmers (up to ₹1,00,000 per group).",
        eligibilitySummary="Farming households residing in Meghalaya cultivating spices (Lakadong turmeric, ginger), horticulture, or floriculture organized into Producer Groups.",
        rules=[
            make_rule("state", "EQUALS", "Meghalaya", "Meghalaya Resident", "FOCUS Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-ml-voter", "EPIC / Aadhaar Card", "Identity proof in Meghalaya", "Election Commission", "FOCUS Doc 1"),
            make_doc("doc-ml-pg-resolution", "Producer Group Formation Resolution", "Certified by Headman / Nokma", "Traditional Dorbar / Nokma", "FOCUS Doc 2"),
        ],
        steps=[
            make_step(1, "Form Producer Group", "10 to 20 farmers form an interest group under village extension worker guidance.", "district_office"),
            make_step(2, "Open Joint Group Bank Account", "Open savings bank account in nearest bank branch.", "meeseva_csc"),
            make_step(3, "Receive Seed Grant", "State agriculture department transfers group capital directly into bank account.", "online_portal", "https://focus.meghalaya.gov.in"),
        ]
    ),

    # ==========================================
    # ARUNACHAL PRADESH
    # ==========================================
    make_scheme(
        id="ar-deendayal-swavalamban",
        slug="arunachal-pradesh-deendayal-upadhyaya-swavalamban-yojana",
        name="Arunachal Pradesh Deen Dayal Upadhyaya Swavalamban Yojana",
        short_description="Front-ended capital investment subsidy of 30% to 40% (up to ₹20 Lakhs) for unemployed youth setting up enterprises in agriculture, tourism, and services.",
        full_description="Swavalamban Yojana promotes entrepreneurship among Arunachalee youth, providing a 30% back-ended capital subsidy (enhanced to 40% for women entrepreneurs) on institutional bank loans from ₹10 Lakhs up to ₹50 Lakhs for eco-tourism, homestays, and agri-processing.",
        category="livelihood",
        jurisdiction="state",
        state="Arunachal Pradesh",
        department="Department of Finance, Investment and State Lotteries, Government of Arunachal Pradesh",
        portal_url="https://financialservices.arunachal.gov.in",
        benefit_details="30% capital subsidy (40% for women entrepreneurs) on bank loans between ₹10 Lakhs and ₹50 Lakhs (maximum subsidy up to ₹20,00,000).",
        eligibilitySummary="Unemployed youth possessing Arunachal Pradesh Scheduled Tribe (APST) certificate or permanent resident certificate.",
        rules=[
            make_rule("state", "EQUALS", "Arunachal Pradesh", "Arunachal Domicile / APST", "Swavalamban Rules 2"),
        ],
        documents=[
            make_doc("doc-ar-apst", "Arunachal Pradesh Scheduled Tribe (APST) Certificate", "Proof of indigenous residency", "Deputy Commissioner", "APST Doc 1"),
            make_doc("doc-ar-dpr", "Detailed Project Report for Business Unit", "Financial projections and cost estimates", "Chartered Accountant", "DPR Doc 2"),
        ],
        steps=[
            make_step(1, "Online Application on State Finance Portal", "Submit DPR and land documents online.", "online_portal", "https://financialservices.arunachal.gov.in"),
            make_step(2, "District Level Screening Committee (DLSC) Review", "Deputy Commissioner evaluates interview and project viability.", "district_office"),
            make_step(3, "Subsidy Front-Ending in Bank Loan", "Subsidy parked in escrow with financing bank; loan disbursed for construction.", "district_office"),
        ]
    ),

    # ==========================================
    # MANIPUR & MIZORAM & NAGALAND
    # ==========================================
    make_scheme(
        id="mn-cmyang-health",
        slug="manipur-chief-ministers-gi-hakshelgi-tengbang-cmht",
        name="Manipur Chief Minister-gi Hakshelgi Tengbang (CMHT - Cashless Health Scheme)",
        short_description="Cashless hospitalisation coverage up to ₹5 Lakhs per family per year for secondary and tertiary care for poor and low-income families in Manipur.",
        full_description="CMHT is Manipur's pioneering cashless healthcare assurance program covering critical care, cardiology, neurosurgery, and burns in empaneled state hospitals and super-specialty hospitals in Guwahati and Delhi.",
        category="healthcare",
        jurisdiction="state",
        state="Manipur",
        department="State Health Agency, Health and Family Welfare Department, Government of Manipur",
        portal_url="https://cmhtmanipur.gov.in",
        benefit_details="Cashless hospital treatment up to ₹5,00,000 per family per year for BPL families, media professionals, village chiefs, and disabled persons.",
        eligibilitySummary="BPL, Antyodaya, or low-income household in Manipur not covered under central Ayushman Bharat scheme.",
        rules=[
            make_rule("state", "EQUALS", "Manipur", "Manipur Domicile", "CMHT Rules Clause 1"),
        ],
        documents=[
            make_doc("doc-mn-ration", "Manipur NFSA Ration Card / Income Certificate", "Proof of family economic category", "DC / SDO", "CMHT Checklist 1"),
        ],
        steps=[
            make_step(1, "Enrolment at District Hospital CMHT Kiosk", "Biometric capture and digital photograph at district hospital.", "district_office"),
            make_step(2, "Receive CMHT Health Card", "Collect biometric smart health card.", "district_office"),
            make_step(3, "Cashless Treatment", "Swipe card at hospital reception for completely cashless admission and surgery.", "district_office"),
        ]
    ),
    make_scheme(
        id="mz-sedp-entrepreneurship",
        slug="mizoram-socio-economic-development-policy-sedp",
        name="Mizoram Socio-Economic Development Policy (SEDP)",
        short_description="Direct family financial grant of ₹50,000 to ₹1 Lakh to develop household livelihoods in ginger, turmeric, piggery, and handloom weaving.",
        full_description="SEDP is the flagship multi-sectoral transformation program in Mizoram providing direct family capital grants and technical mentoring to transition traditional jhum (shifting) cultivators to sustainable cash crops, piggery, and eco-tourism.",
        category="livelihood",
        jurisdiction="state",
        state="Mizoram",
        department="Planning and Programme Implementation Department, Government of Mizoram",
        portal_url="https://sedp.mizoram.gov.in",
        benefit_details="Direct financial assistance of ₹50,000 to ₹1,00,000 per family disbursed via DBT for identified household economic activities.",
        eligibilitySummary="Permanent indigenous families of Mizoram possessing Mizoram Tribal Certificate and family ration card.",
        rules=[
            make_rule("state", "EQUALS", "Mizoram", "Mizoram Domicile", "SEDP Guidelines Clause 2"),
        ],
        documents=[
            make_doc("doc-mz-tribal", "Mizo Scheduled Tribe Certificate", "Issued by DC", "Deputy Commissioner Mizoram", "SEDP Form 1"),
        ],
        steps=[
            make_step(1, "Selection by Village Level SEDP Committee", "Village Council identifies beneficiary families in Gram Sabha.", "district_office"),
            make_step(2, "Activity Vetting by Nodal Department", "Animal husbandry / agriculture officers inspect proposed livelihood activity.", "district_office"),
            make_step(3, "Direct Bank Account Credit", "Assistance released directly into head of family's bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="nl-cm-microfinance-initiative",
        slug="nagaland-chief-ministers-microfinance-initiative-cmmfi",
        name="Nagaland Chief Minister's Microfinance Initiative (CMMFI)",
        short_description="Subsidized credit with 30% capital subsidy and 4% interest subvention up to ₹15 Lakhs for agri-allied, micro-enterprises, and SHGs in Nagaland.",
        full_description="CMMFI accelerates flow of institutional credit to farmers, agri-entrepreneurs, and self-help groups in Nagaland, providing a 30% capital subsidy, 4% interest subvention for timely repayment, and moratorium up to 12 months.",
        category="livelihood",
        jurisdiction="state",
        state="Nagaland",
        department="Finance Department, Government of Nagaland",
        portal_url="https://cmmfi.nagaland.gov.in",
        benefit_details="Loans up to ₹15,00,000 with 30% capital subsidy back-ended by the state government and 4% interest subvention for 5 years.",
        eligibilitySummary="Indigenous inhabitants of Nagaland, SHGs, Joint Liability Groups, and Farmer Producer Organizations.",
        rules=[
            make_rule("state", "EQUALS", "Nagaland", "Indigenous Inhabitant of Nagaland", "CMMFI Guidelines Clause 1"),
        ],
        documents=[
            make_doc("doc-nl-iic", "Indigenous Inhabitant Certificate (IIC)", "Proof of indigenous Nagaland citizenship", "Deputy Commissioner", "CMMFI Checklist 1"),
        ],
        steps=[
            make_step(1, "Apply on CMMFI Online Portal", "Fill online application with project plan.", "online_portal", "https://cmmfi.nagaland.gov.in"),
            make_step(2, "District Level Screening Committee (DLSC) Sanction", "DC-led committee approves business feasibility.", "district_office"),
            make_step(3, "Bank Loan Disbursement with Subsidy", "Partner bank releases credit with state subsidy adjustment.", "district_office"),
        ]
    ),

    # ==========================================
    # UNION TERRITORIES (LADAKH & PUDUCHERRY)
    # ==========================================
    make_scheme(
        id="la-revamped-subsidy-solar",
        slug="ladakh-solar-greenhouse-and-pashmina-subsidy",
        name="Ladakh Green Energy, Solar Greenhouse & Pashmina De-hairing Scheme",
        short_description="Up to 75% capital subsidy for passive solar greenhouses, sheep sheds, and solar water pumps for high-altitude farmers in Leh and Kargil.",
        full_description="The Union Territory Administration of Ladakh provides specialized climate-resilient capital subsidies up to 75% for modern Ladakh-type passive solar greenhouses enabling fresh vegetable cultivation during harsh -30°C winters, alongside mechanized de-hairing for Changthangi Pashmina goat herders.",
        category="agriculture",
        jurisdiction="state",
        state="Ladakh",
        department="Department of Agriculture, UT Administration of Ladakh",
        portal_url="https://ladakh.nic.in",
        benefit_details="75% subsidy (up to ₹3 Lakhs) for commercial passive solar greenhouses, ₹50,000 grant for pashmina goat shearing equipment, and free poly-carbonate solar drying sheds.",
        eligibilitySummary="Permanent residents of Leh and Kargil districts holding agricultural land or registered with Pashmina Goat Wool Growers Cooperative Society.",
        rules=[
            make_rule("state", "EQUALS", "Ladakh", "Ladakh Domicile / Resident", "Ladakh Agri Guidelines Section 3"),
        ],
        documents=[
            make_doc("doc-la-prc", "Resident Certificate of Ladakh / PRC", "Issued by Tehsildar Leh / Kargil", "Revenue Dept Ladakh", "Ladakh Checklist 1"),
        ],
        steps=[
            make_step(1, "Submit Application at Block Agriculture Office", "Apply at Block Development Office in Leh or Kargil.", "district_office"),
            make_step(2, "Technical Site Feasibility", "Agriculture officer inspects sun exposure and winter water availability.", "district_office"),
            make_step(3, "Greenhouse Construction & Subsidy", "Department supplies prefabricated materials; balance cash subsidy released upon completion.", "district_office"),
        ]
    ),
    make_scheme(
        id="py-free-rice-dbt",
        slug="puducherry-free-rice-dbt-scheme",
        name="Puducherry Universal Free Rice & Essential Commodities DBT Scheme",
        short_description="Direct monthly cash transfer of ₹300 per person directly into the bank accounts of all ration card holders in lieu of 10-20 kg free rice.",
        full_description="The Union Territory of Puducherry provides a convenient, cash-out Direct Benefit Transfer (DBT) model giving beneficiaries direct monthly cash transfers equivalent to 10-20 kg of free quality rice directly into their bank accounts to eliminate ration leakage.",
        category="welfare",
        jurisdiction="state",
        state="Puducherry",
        department="Department of Civil Supplies and Consumer Affairs, Government of Puducherry",
        portal_url="https://py.gov.in",
        benefit_details="Direct monthly cash transfer of ₹300 per beneficiary (up to ₹1,200 to ₹1,500/month for family of 4-5 members) credited directly via DBT.",
        eligibilitySummary="All red (BPL) and yellow (APL) ration card holders residing in Puducherry, Karaikal, Mahe, and Yanam regions.",
        rules=[
            make_rule("state", "EQUALS", "Puducherry", "Puducherry Resident", "PY Rice Rules Clause 1"),
        ],
        documents=[
            make_doc("doc-py-ration", "Puducherry Family Ration Card", "Red / Yellow card", "Civil Supplies Puducherry", "PY Ration Checklist"),
        ],
        steps=[
            make_step(1, "Aadhaar & Bank Linking with Ration Card", "Link bank account with Civil Supplies portal.", "meeseva_csc", "https://py.gov.in"),
            make_step(2, "Automatic Monthly Cash Credit", "Funds deposited directly on the first week of every month into family head account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="pb-ashirwad-scheme",
        slug="punjab-ashirwad-scheme-shagun-daughters-marriage",
        name="Punjab Ashirwad Scheme (Shagun Financial Assistance for Daughters' Marriage)",
        short_description="Financial grant of ₹51,000 for the marriage of daughters belonging to SC, BC, and economically weaker families in Punjab.",
        full_description="Administered by the Social Justice, Empowerment and Minorities Department in Punjab, this scheme provides direct financial assistance of ₹51,000 on the marriage of adult daughters from low-income families to support wedding expenses.",
        category="welfare",
        jurisdiction="state",
        state="Punjab",
        department="Department of Social Justice, Empowerment and Minorities, Government of Punjab",
        portal_url="https://welfare.punjab.gov.in",
        benefit_details="Direct lump-sum bank transfer of ₹51,000 deposited into the bride's personal savings account.",
        eligibilitySummary="Resident of Punjab belonging to SC, BC, Christian, or EWS category, daughter aged 18+ years, family annual income <= ₹32,790.",
        rules=[
            make_rule("state", "EQUALS", "Punjab", "Punjab Domicile", "Ashirwad Scheme Rules 1"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 32790, "Annual Family Income <= ₹32,790", "Ashirwad Scheme Rules 2"),
        ],
        documents=[
            make_doc("doc-pb-ashirwad-caste", "SC / BC / EWS Caste Certificate", "Issued by competent revenue authority", "Tehsildar", "Ashirwad Checklist 1"),
            make_doc("doc-pb-ashirwad-income", "Tehsildar Income Certificate", "Income verification", "Tehsildar", "Ashirwad Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online on Punjab Welfare Portal", "Submit application 30 days before or within 30 days after marriage.", "online_portal", "https://welfare.punjab.gov.in"),
            make_step(2, "District Social Justice Officer Scrutiny", "Official scrutinizes age and family income documents.", "district_office"),
            make_step(3, "Direct Bank Transfer", "₹51,000 credited to bride's bank account before marriage.", "online_portal"),
        ]
    ),
    make_scheme(
        id="hr-bhavantar-bharpayee",
        slug="haryana-bhavantar-bharpayee-yojana-horticulture",
        name="Haryana Bhavantar Bharpayee Yojana (BBY - Crop Price Deficit Protection)",
        short_description="Direct compensation for price deficit below protected base price for 21 horticulture and vegetable crops for farmers in Haryana.",
        full_description="BBY protects farmers in Haryana from market price crashes by setting protected base prices for 21 vegetables and fruits (potato, tomato, onion, cauliflower, carrots, kinnow, guava), paying the difference directly into farmers' accounts via DBT when wholesale mandi prices fall below the base price.",
        category="agriculture",
        jurisdiction="state",
        state="Haryana",
        department="Haryana State Agricultural Marketing Board (HSAMB)",
        portal_url="https://fasal.haryana.gov.in",
        benefit_details="Direct price deficit compensation (difference between average mandi selling price and protected base price) per quintal credited via DBT.",
        eligibilitySummary="Farmers cultivating notified horticulture/vegetable crops in Haryana registered on the 'Meri Fasal Mera Byora' portal.",
        rules=[
            make_rule("state", "EQUALS", "Haryana", "Haryana Resident Farmer", "BBY Scheme Clause 2"),
        ],
        documents=[
            make_doc("doc-hr-mfmb", "Meri Fasal Mera Byora Registration Slip", "Proof of crop sowing verification", "HSAMB", "BBY Doc 1"),
        ],
        steps=[
            make_step(1, "Register Sowing on Meri Fasal Mera Byora", "Register acreage and crop variety on the portal before designated deadline.", "online_portal", "https://fasal.haryana.gov.in"),
            make_step(2, "Sell at Notified APMC Mandi", "Sell vegetable/fruit produce through J-Form in regulated grain/vegetable markets.", "district_office"),
            make_step(3, "Automatic Price Deficit DBT", "System calculates difference from base price and transfers compensation automatically.", "online_portal"),
        ]
    ),
    make_scheme(
        id="rj-indira-smartphone",
        slug="rajasthan-indira-gandhi-smartphone-yojana-igsy",
        name="Rajasthan Indira Gandhi Smartphone Yojana (Free Smartphone & 3-Year Internet)",
        short_description="Free Android 4G/5G smartphone + ₹6,800 DBT wallet for 3 years of free voice calling and 20 GB monthly data for women family heads in Rajasthan.",
        full_description="IGSY provides free 4G/5G smartphones with preloaded government welfare apps and 3 years of free high-speed internet to women heads of families enrolled under Chiranjeevi / Jan Aadhaar and girl students studying in higher education.",
        category="welfare",
        jurisdiction="state",
        state="Rajasthan",
        department="Department of Information Technology and Communication (DoIT&C), Govt of Rajasthan",
        portal_url="https://igsy.rajasthan.gov.in",
        benefit_details="Free 4G/5G smartphone device (₹6,125 voucher) + ₹675 direct wallet credit for 9 months initial internet + ₹900/year for next 2 years.",
        eligibilitySummary="Women head of family holding Jan Aadhaar who worked 100 days in MGNREGA / 50 days in Indira Gandhi Urban Employment, or girl students in Class 9-12/College.",
        rules=[
            make_rule("state", "EQUALS", "Rajasthan", "Rajasthan Resident with Jan Aadhaar", "IGSY Guidelines Clause 2"),
            make_rule("gender", "EQUALS", "female", "Female Head / Student", "IGSY Guidelines Clause 3"),
        ],
        documents=[
            make_doc("doc-igsy-janaadhaar", "Jan Aadhaar Card", "Digital family identity", "Jan Aadhaar Authority", "IGSY Doc 1"),
        ],
        steps=[
            make_step(1, "Receive SMS Invitation for Camp", "Eligible women receive SMS alert with camp token date and location.", "online_portal"),
            make_step(2, "Camp e-KYC & Mobile Selection", "Visit district camp, choose telecom operator (Airtel, Jio, BSNL) and handset brand.", "district_office"),
            make_step(3, "Receive Configured Smartphone", "Wallet credit transferred instantly to purchase phone and activate SIM card.", "district_office", "https://igsy.rajasthan.gov.in"),
        ]
    ),
    make_scheme(
        id="mp-sambal-card",
        slug="madhya-pradesh-mukhyamantri-jan-kalyan-sambal-2-yojana",
        name="Madhya Pradesh Mukhyamantri Jan Kalyan (Sambal 2.0) Yojana",
        short_description="Integrated social security card offering ₹4 Lakh accidental death cover, ₹2 Lakh natural death cover, ₹16,000 maternity assistance, and free electricity.",
        full_description="Sambal 2.0 is an umbrella social security system for millions of unorganised workers in Madhya Pradesh, delivering cradle-to-grave financial protection: antenatal assistance, institutional maternity cash, scholarships for children, accidental insurance, and funeral aid.",
        category="welfare",
        jurisdiction="state",
        state="Madhya Pradesh",
        department="Labour Department, Government of Madhya Pradesh",
        portal_url="https://sambal.mp.gov.in",
        benefit_details="₹4,00,000 accidental death relief; ₹2,00,000 natural death relief; ₹16,000 maternity aid; ₹5,000 funeral grant; 100% free higher education fees for children.",
        eligibilitySummary="Unorganised workers resident in MP aged 18 to 60 years whose family does not own more than 1 hectare of land and does not pay income tax.",
        rules=[
            make_rule("state", "EQUALS", "Madhya Pradesh", "MP Resident", "Sambal Guidelines 1"),
            make_rule("workerType", "EQUALS", "unorganised_worker", "Unorganised Sector Worker", "Sambal Guidelines 2"),
        ],
        documents=[
            make_doc("doc-mp-sambal-samagra", "Samagra ID and Aadhaar", "Verified family profile", "Samagra Portal", "Sambal Doc 1"),
        ],
        steps=[
            make_step(1, "Apply Online on Sambal Portal", "Register using 9-digit Samagra Member ID.", "online_portal", "https://sambal.mp.gov.in"),
            make_step(2, "Inquiry by Gram Panchayat / Ward Officer", "Secretary verifies unorganised worker status within 15 days.", "district_office"),
            make_step(3, "Download Sambal Digital Card", "Receive QR-coded Sambal Card unlocking all 12 converged state welfare schemes.", "online_portal"),
        ]
    ),
    make_scheme(
        id="br-gram-parivahan",
        slug="bihar-mukhyamantri-gram-parivahan-yojana-mgpy",
        name="Bihar Mukhyamantri Gram Parivahan Yojana (Rural Commercial Vehicle Subsidy)",
        short_description="50% capital subsidy up to ₹1,00,000 for purchasing 4 to 10-seater commercial passenger vehicles (auto, e-rickshaw, magic) in rural Bihar.",
        full_description="Administered by the Transport Department in Bihar, this scheme provides 50% capital grant up to ₹1 Lakh to rural youth belonging to SC, ST, and EBC categories to buy commercial passenger vehicles, linking remote panchayats with block and district headquarters.",
        category="livelihood",
        jurisdiction="state",
        state="Bihar",
        department="Transport Department, Government of Bihar",
        portal_url="https://transport.bihar.gov.in",
        benefit_details="50% subsidy of purchase price (up to ₹1,00,000) for buying new 4 to 10-seater commercial vehicles (Tata Magic, Mahindra Bolero Camper, Auto-rickshaws, or E-Rickshaws).",
        eligibilitySummary="Permanent resident of rural Panchayat in Bihar, minimum age 21 years, belonging to SC, ST, or EBC, possessing a valid commercial driving licence.",
        rules=[
            make_rule("state", "EQUALS", "Bihar", "Bihar Rural Resident", "MGPY Rules 2.1"),
            make_rule("casteCategory", "IN", ["SC", "ST", "EBC"], "SC, ST, or EBC Category", "MGPY Rules 2.2"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 21, "Minimum Age 21 Years", "MGPY Rules 2.3"),
        ],
        documents=[
            make_doc("doc-mgpy-dl", "Commercial Driving Licence", "Valid driver licence", "DTO Bihar", "MGPY Checklist 1"),
            make_doc("doc-mgpy-caste", "SC / ST / EBC Caste Certificate", "Issued by Circle Officer", "Revenue Dept", "MGPY Checklist 2"),
        ],
        steps=[
            make_step(1, "Apply Online on Bihar Transport Portal", "Fill application selecting Panchayat and preferred vehicle model.", "online_portal", "https://transport.bihar.gov.in"),
            make_step(2, "Block & Sub-Divisional Selection Committee", "SDO and BDO select 5 beneficiaries per Panchayat (3 SC/ST and 2 EBC).", "district_office"),
            make_step(3, "Vehicle Purchase & 50% Subsidy Credit", "Purchase vehicle from authorized dealer; ₹1 Lakh subsidy credited to loan account.", "district_office"),
        ]
    ),
    make_scheme(
        id="od-madhu-babu-pension",
        slug="odisha-madhu-babu-pension-yojana-mbpy",
        name="Odisha Madhu Babu Pension Yojana (MBPY - Universal Social Pension)",
        short_description="Monthly social security pension of ₹500 to ₹900 per month for elderly, widows, persons with disabilities, and transgender persons in Odisha.",
        full_description="MBPY provides monthly direct pensions to destitute elderly citizens, widows, individuals with disabilities, and destitute transgender persons across Odisha, delivered on the 15th of each month under the 'Jana Seva Diwas' through cash-at-doorstep or DBT.",
        category="pension",
        jurisdiction="state",
        state="Odisha",
        department="Social Security and Empowerment of Persons with Disabilities (SSEPD) Dept, Govt of Odisha",
        portal_url="https://ssepd.odisha.gov.in",
        benefit_details="₹500 per month (for age up to 79) and ₹700 to ₹900 per month (for age 80+ and severe disability) delivered transparently every month.",
        eligibilitySummary="Resident of Odisha aged 60+ (or widow/disabled of any age), family annual income <= ₹24,000, not receiving any other central/state pension.",
        rules=[
            make_rule("state", "EQUALS", "Odisha", "Odisha Domicile", "MBPY Rules Clause 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 24000, "Annual Family Income <= ₹24,000", "MBPY Rules Clause 3"),
        ],
        documents=[
            make_doc("doc-mbpy-income", "Income Certificate from Tahsildar", "Showing family income <= ₹24,000/year", "Tahsildar", "MBPY Form 1"),
        ],
        steps=[
            make_step(1, "Apply at Block Development Office or Mo Seva Kendra", "Submit MBPY application form.", "meeseva_csc"),
            make_step(2, "Gram Panchayat Enquiry", "Social security officer verifies residency and non-pensioner status.", "district_office"),
            make_step(3, "Monthly Pension Distribution", "Receive monthly cash directly in Gram Panchayat on 15th or through DBT.", "district_office", "https://ssepd.odisha.gov.in"),
        ]
    ),
    make_scheme(
        id="gj-namo-saraswati-girls",
        slug="gujarat-namo-saraswati-yojana-science-education",
        name="Gujarat Namo Saraswati Yojana (Class 11-12 Science Stream Incentive)",
        short_description="Scholarship of ₹25,000 over two years (₹10,000 in Class 11 and ₹15,000 in Class 12) to encourage girl students to pursue Science stream.",
        full_description="Namo Saraswati Yojana incentivizes girl students across Gujarat to opt for Science, Technology, Engineering, and Mathematics (STEM) streams in secondary school, paying ₹25,000 across Classes 11 and 12 to build female representation in engineering and medicine.",
        category="scholarship",
        jurisdiction="state",
        state="Gujarat",
        department="Education Department, Government of Gujarat",
        portal_url="https://gujaratindia.gov.in",
        benefit_details="₹25,000 direct bank transfer: ₹10,000 in Class 11 (₹1,000/month for 10 months) and ₹15,000 in Class 12 (₹1,500/month for 10 months).",
        eligibilitySummary="Girl students studying in Class 11 or 12 in Science stream in any government, grant-in-aid, or recognized private school in Gujarat, family income <= ₹6 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "Gujarat", "Gujarat Domicile", "Namo Saraswati Rules 1"),
            make_rule("gender", "EQUALS", "female", "Girl Student", "Namo Saraswati Rules 2"),
            make_rule("schoolStream", "EQUALS", "science", "Class 11/12 Science Stream", "Namo Saraswati Rules 3"),
        ],
        documents=[
            make_doc("doc-saraswati-bonafide", "Class 11/12 Science Stream Admission Certificate", "Issued by Higher Secondary School Principal", "School", "Saraswati Doc 1"),
        ],
        steps=[
            make_step(1, "Registration through School on Digital Gujarat Portal", "School uploads student Aadhaar and enrollment details.", "college_cell", "https://www.digitalgujarat.gov.in"),
            make_step(2, "District Education Officer (DEO) Verification", "DEO verifies science stream registration.", "district_office"),
            make_step(3, "Monthly DBT Transfer", "Stipend credited monthly directly to student's bank account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="wb-rupashree-prakalpa",
        slug="west-bengal-rupashree-prakalpa-marriage-grant",
        name="West Bengal Rupashree Prakalpa (One-Time Marriage Grant)",
        short_description="One-time cash grant of ₹25,000 transferred to adult girls from economically stressed families before their marriage in West Bengal.",
        full_description="Rupashree Prakalpa provides one-time financial assistance of ₹25,000 to adult girls aged 18+ whose family annual income <= ₹1.5 Lakhs, ensuring poor families do not have to borrow at exorbitant interest rates for marriage arrangements.",
        category="welfare",
        jurisdiction="state",
        state="West Bengal",
        department="Department of Women and Child Development and Social Welfare, Govt of West Bengal",
        portal_url="https://wbrupashree.gov.in",
        benefit_details="One-time grant of ₹25,000 credited directly via DBT to the bride's personal bank account before the solemnization of marriage.",
        eligibilitySummary="Unmarried girl aged 18+ resident of West Bengal for at least 5 years, marrying for the first time, family annual income <= ₹1.5 Lakhs.",
        rules=[
            make_rule("state", "EQUALS", "West Bengal", "West Bengal Domicile", "Rupashree Criteria 1"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 18, "Bride Age 18 Years and Above", "Rupashree Criteria 2"),
            make_rule("incomeLimit", "LESS_THAN_OR_EQUAL", 150000, "Annual Family Income <= ₹1.5 Lakhs", "Rupashree Criteria 3"),
        ],
        documents=[
            make_doc("doc-rupashree-invitation", "Wedding Invitation Card / Marriage Declaration", "Proof of proposed marriage", "Priest / Kazi / Family", "Rupashree Doc 1"),
            make_doc("doc-rupashree-age", "Age Proof of Bride (Madhyamik Admit Card / Birth Certificate)", "Confirming age >= 18", "WBBSE / Registrar", "Rupashree Doc 2"),
        ],
        steps=[
            make_step(1, "Submit Application at BDO / SDO Office", "Apply at least 30 to 60 days before the wedding date.", "district_office"),
            make_step(2, "Enquiry by Enquiry Officer", "Officer visits residence to verify age of bride and groom and wedding date.", "district_office"),
            make_step(3, "Direct Bank Credit before Marriage", "₹25,000 transferred directly to bride's bank account before wedding day.", "online_portal", "https://wbrupashree.gov.in"),
        ]
    ),
    make_scheme(
        id="ap-ysr-nethanna-nestham",
        slug="andhra-pradesh-ysr-nethanna-nestham-weavers",
        name="Andhra Pradesh YSR Nethanna Nestham (Handloom Weavers Livelihood)",
        short_description="Annual financial assistance of ₹24,000 per year directly to every handloom weaver family owning a loom to upgrade equipment and purchase yarn.",
        full_description="Under YSR Nethanna Nestham, the Government of Andhra Pradesh provides ₹24,000 every year directly to every weaver family possessing a handloom to modernize loom infrastructure, purchase raw material yarn, and compete with powerlooms.",
        category="livelihood",
        jurisdiction="state",
        state="Andhra Pradesh",
        department="Department of Handlooms and Textiles, Government of Andhra Pradesh",
        portal_url="https://navasakam.ap.gov.in",
        benefit_details="₹24,000 per year direct financial grant credited in one lump sum into the handloom weaver's bank account via DBT.",
        eligibilitySummary="Handloom weaver family owning and operating a handloom in Andhra Pradesh, holding BPL Rice Card.",
        rules=[
            make_rule("state", "EQUALS", "Andhra Pradesh", "AP Domicile", "Nethanna Nestham Clause 1"),
            make_rule("profession", "EQUALS", "handloom_weaver", "Loom Owner Weaver", "Nethanna Nestham Clause 2"),
        ],
        documents=[
            make_doc("doc-nethanna-geo", "Geotagged Photo of Handloom Unit", "Captured by Village Secretariat staff", "Handlooms Dept AP", "Nethanna Doc 1"),
        ],
        steps=[
            make_step(1, "Survey by Village Welfare Assistant", "Village Secretariat assistant geotags loom and registers weaver profile.", "district_office"),
            make_step(2, "Social Audit Verification", "Draft beneficiary list posted at Gram Sachivalayam for public review.", "district_office"),
            make_step(3, "Annual DBT Credit", "₹24,000 credited directly into the weaver's account.", "online_portal", "https://navasakam.ap.gov.in"),
        ]
    ),
    make_scheme(
        id="tg-nethannaku-cheyutha",
        slug="telangana-nethannaku-cheyutha-weavers-thrift-fund",
        name="Telangana Nethannaku Cheyutha (Weavers Thrift Fund & Social Security)",
        short_description="Government matching contribution of 16% (double the weaver's 8% monthly contribution) in a specialized 3-year lock-in welfare thrift fund.",
        full_description="Nethannaku Cheyutha is Telangana's dedicated thrift fund scheme for handloom and powerloom weavers. When a weaver deposits 8% of their monthly wage, the Telangana Government contributes double (16% for handloom, 8% for powerloom) into their thrift account, accumulating a substantial financial corpus with loan facilities during crisis.",
        category="livelihood",
        jurisdiction="state",
        state="Telangana",
        department="Department of Handlooms and Textiles, Government of Telangana",
        portal_url="https://telangana.gov.in",
        benefit_details="Government contributes 16% matching grant on handloom weaver earnings (8% on powerloom) credited monthly to the weaver's thrift bank account, with loan withdrawal facility up to 50% after 3 years.",
        eligibilitySummary="Active handloom and powerloom weavers, ancillary workers (dyeing, warping, winding) aged 18+ residing in Telangana.",
        rules=[
            make_rule("state", "EQUALS", "Telangana", "Telangana Resident", "Cheyutha Weavers Guidelines 1"),
            make_rule("occupation", "IN", ["handloom_weaver", "powerloom_weaver", "ancillary_textile_worker"], "Weaver or Textile Worker", "Cheyutha Weavers Guidelines 2"),
        ],
        documents=[
            make_doc("doc-tg-weaver-id", "Weaver Identity Card / Pehchan Card", "Issued by Department of Handlooms", "Assistant Director Handlooms", "Weavers Doc 1"),
        ],
        steps=[
            make_step(1, "Open Recurring Thrift Account", "Open designated thrift deposit account in cooperative bank or commercial bank.", "meeseva_csc"),
            make_step(2, "Monthly 8% Wage Deposit", "Weaver deposits 8% of earned wages through cooperative society or master weaver.", "district_office"),
            make_step(3, "Government 16% Matching Credit", "Handlooms department verifies wage records and credits double matching contribution directly.", "online_portal"),
        ]
    ),
    make_scheme(
        id="tg-dalit-bandhu-flagship",
        slug="telangana-dalit-bandhu-10-lakh-grant",
        name="Telangana Dalit Bandhu Scheme (₹10 Lakh 100% Capital Grant)",
        short_description="100% non-repayable direct capital grant of ₹10 Lakhs per Dalit family without bank loan or mortgage to establish self-chosen businesses.",
        full_description="Dalit Bandhu is a revolutionary affirmative economic empowerment scheme by the Government of Telangana providing ₹10,00,000 as a direct 100% grant to every eligible Dalit family to start independent commercial enterprises (dairy, transport, retail, construction, manufacturing) with complete freedom of choice.",
        category="livelihood",
        jurisdiction="state",
        state="Telangana",
        department="Scheduled Castes Development Department, Government of Telangana",
        portal_url="https://dalitbandhu.telangana.gov.in",
        benefit_details="₹10,00,000 direct 100% non-repayable grant deposited into a special Dalit Bandhu savings account, with no bank loan linkage or collateral requirement.",
        eligibilitySummary="Scheduled Caste (SC) families domiciled in Telangana verified through electronic Food Security Card and Integrated Community Certificate.",
        rules=[
            make_rule("state", "EQUALS", "Telangana", "Telangana Domicile", "Dalit Bandhu Guidelines Clause 2"),
            make_rule("casteCategory", "EQUALS", "SC", "Scheduled Caste Community", "Dalit Bandhu Guidelines Clause 3"),
        ],
        documents=[
            make_doc("doc-tg-db-caste", "MeeSeva Integrated SC Community Certificate", "Issued by Tahsildar", "Revenue Dept", "DB Doc 1"),
            make_doc("doc-tg-db-fsc", "Telangana Food Security Card (White Card)", "Family verification", "Civil Supplies", "DB Doc 2"),
        ],
        steps=[
            make_step(1, "Family Selection by District Administration", "District Collector approves family list in designated saturation mandals/wards.", "district_office"),
            make_step(2, "Business Orientation & Choice Selection", "Beneficiary selects preferred enterprise (tractor, medical store, poultry farm, hardware shop).", "district_office"),
            make_step(3, "Direct ₹10 Lakh Account Credit", "₹10,00,000 transferred to beneficiary's special Dalit Bandhu bank account for asset acquisition.", "online_portal", "https://dalitbandhu.telangana.gov.in"),
        ]
    ),
    make_scheme(
        id="ap-jagananna-thodu",
        slug="andhra-pradesh-jagananna-thodu-street-vendors",
        name="Andhra Pradesh Jagananna Thodu (Interest-Free Loans for Street Vendors)",
        short_description="Collateral-free working capital loan of ₹10,000 to ₹20,000 with 100% interest reimbursed by the Andhra Pradesh Government for street vendors.",
        full_description="Jagananna Thodu frees roadside street vendors, cart pullers, and traditional artisans from ruthless private money lenders by providing ₹10,000 to ₹20,000 bank working capital loans where the AP Government pays 100% of the interest directly to the bank upon prompt repayment.",
        category="livelihood",
        jurisdiction="state",
        state="Andhra Pradesh",
        department="Village and Ward Secretariats Department, Government of Andhra Pradesh",
        portal_url="https://navasakam.ap.gov.in",
        benefit_details="₹10,000 initial bank loan (enhanced to ₹20,000 on repayment) with 100% interest subvention credited directly into the vendor's bank account every 6 months.",
        eligibilitySummary="Street vendors, footpath traders, pushcart operators, and traditional artisans aged 18+ in AP holding BPL Rice Card.",
        rules=[
            make_rule("state", "EQUALS", "Andhra Pradesh", "AP Domicile", "Thodu Rules 1"),
            make_rule("occupation", "EQUALS", "street_vendor", "Street Vendor / Small Trader", "Thodu Rules 2"),
        ],
        documents=[
            make_doc("doc-thodu-vendor-id", "Street Vendor Certificate of Vending / ID", "Issued by Municipality or Gram Panchayat", "ULB / Panchayat", "Thodu Checklist 1"),
        ],
        steps=[
            make_step(1, "Survey by Ward/Village Secretariat Volunteer", "Secretariat staff maps vending location and captures photo.", "district_office"),
            make_step(2, "Bank Sanction without Security", "Partner bank sanctions ₹10,000 working capital loan directly.", "district_office"),
            make_step(3, "Bi-annual Interest Refund", "State government reimburses complete interest accrued every 6 months.", "online_portal"),
        ]
    ),
    make_scheme(
        id="ka-anna-bhagya-dbt",
        slug="karnataka-anna-bhagya-free-rice-dbt-scheme",
        name="Karnataka Anna Bhagya Scheme (10 kg Free Foodgrains / Direct DBT Cash)",
        short_description="10 kg free foodgrains per person per month (5 kg central grain + cash DBT of ₹170/person per month in lieu of additional 5 kg grain) for BPL families in Karnataka.",
        full_description="Anna Bhagya guarantees absolute hunger-free living across Karnataka by providing 10 kg free rice per person per month to all BPL and Antyodaya households, transferring ₹34 per kg (₹170 per person per month) directly via DBT into the bank accounts of women heads of households.",
        category="welfare",
        jurisdiction="state",
        state="Karnataka",
        department="Food, Civil Supplies & Consumer Affairs Department, Government of Karnataka",
        portal_url="https://ahara.kar.nic.in",
        benefit_details="5 kg free rice distributed physically at Fair Price Shops + ₹170 direct DBT cash transfer per family member per month credited directly to the woman head's bank account.",
        eligibilitySummary="All Antyodaya Anna Yojana (AAY) and Priority Household (PHH / BPL) ration card holders residing in Karnataka.",
        rules=[
            make_rule("state", "EQUALS", "Karnataka", "Karnataka Resident", "Anna Bhagya Rules 1"),
            make_rule("rationCardType", "IN", ["BPL", "AAY"], "BPL / Antyodaya Card Holder", "Anna Bhagya Rules 2"),
        ],
        documents=[
            make_doc("doc-ka-bpl-card", "Karnataka BPL / Antyodaya Ration Card", "Digital ration card", "Food & Civil Supplies Kar", "Anna Bhagya Doc 1"),
        ],
        steps=[
            make_step(1, "Aadhaar Seeding of Family Head", "Link bank account with family head's Aadhaar on Ahara portal.", "meeseva_csc", "https://ahara.kar.nic.in"),
            make_step(2, "Fair Price Shop Grain Collection", "Collect 5 kg free physical rice through biometric POS.", "district_office"),
            make_step(3, "Monthly DBT Cash Credit", "₹170 per person transferred directly into family head's bank account on 10th of every month.", "online_portal"),
        ]
    ),
    make_scheme(
        id="tn-makkalai-thedi-maruthuvam",
        slug="tamil-nadu-makkalai-thedi-maruthuvam-doorstep-healthcare",
        name="Tamil Nadu Makkalai Thedi Maruthuvam (Doorstep Healthcare Scheme)",
        short_description="Doorstep delivery of essential medicines for diabetes and hypertension, home palliative care, and screening for non-communicable diseases across Tamil Nadu.",
        full_description="Makkalai Thedi Maruthuvam delivers comprehensive primary healthcare services right to the doorsteps of over 1 Crore citizens across Tamil Nadu, with Women Health Volunteers visiting homes to test blood pressure, screen blood sugar, and deliver free monthly medicine boxes.",
        category="healthcare",
        jurisdiction="state",
        state="Tamil Nadu",
        department="Health and Family Welfare Department, Government of Tamil Nadu",
        portal_url="https://tnhealth.tn.gov.in",
        benefit_details="Free monthly doorstep medicine supply for hypertension and diabetes, free home-based physiotherapy, peritoneal dialysis bags delivery, and palliative nursing care.",
        eligibilitySummary="All residents of Tamil Nadu, especially elderly individuals aged 45+, bedridden patients, and persons suffering from chronic non-communicable diseases.",
        rules=[
            make_rule("state", "EQUALS", "Tamil Nadu", "Tamil Nadu Resident", "MTM Rules Clause 1"),
        ],
        documents=[
            make_doc("doc-mtm-none", "No Prior Documents Required (Doorstep survey by health team)", "Universal household visit", "Health Dept TN", "MTM SOP"),
        ],
        steps=[
            make_step(1, "Doorstep Screening Visit", "Women Health Volunteer (WHV) visits residence and checks BP and blood sugar.", "district_office"),
            make_step(2, "Doctor Digital Confirmation", "Medical Officer at PHC verifies readings and prescribes generic medications.", "district_office"),
            make_step(3, "Monthly Doorstep Medicine Delivery", "Health volunteer delivers monthly medicine box right to patient's doorstep.", "district_office", "https://tnhealth.tn.gov.in"),
        ]
    ),
    make_scheme(
        id="mh-shravanbal-sewa-pension",
        slug="maharashtra-shravanbal-seva-rajya-nivruttivetan-yojana",
        name="Maharashtra Shravanbal Seva Rajya Nivruttivetan Yojana (Senior Citizen Pension)",
        short_description="Monthly social pension of ₹1,500 per month for elderly citizens aged 65 years and above belonging to low-income families in Maharashtra.",
        full_description="Shravanbal Seva Yojana ensures elderly citizens in Maharashtra do not face abandonment or hunger by providing a dignified monthly cash pension of ₹1,500 transferred directly into their bank accounts.",
        category="pension",
        jurisdiction="state",
        state="Maharashtra",
        department="Social Justice and Special Assistance Department, Government of Maharashtra",
        portal_url="https://sjsa.maharashtra.gov.in",
        benefit_details="₹1,500 per month credited directly to beneficiary's savings bank account via electronic clearance.",
        eligibilitySummary="Resident of Maharashtra for 15+ years, age 65 years and above, family annual income <= ₹21,000 (Category A) or BPL listed (Category B).",
        rules=[
            make_rule("state", "EQUALS", "Maharashtra", "Maharashtra Resident for 15+ Years", "Shravanbal Rules 1"),
            make_rule("minAge", "GREATER_THAN_OR_EQUAL", 65, "Age 65 Years and Above", "Shravanbal Rules 2"),
        ],
        documents=[
            make_doc("doc-shravan-age", "Age Proof (Election Card / Birth Certificate)", "Confirming age >= 65", "Election Commission", "Shravanbal Doc 1"),
            make_doc("doc-shravan-income", "Income Certificate from Tehsildar", "Showing family income <= ₹21,000/yr", "Tehsildar", "Shravanbal Doc 2"),
        ],
        steps=[
            make_step(1, "Apply at Setu Suvidha Kendra / Tehsil Office", "Submit filled application form with age and residence proof.", "meeseva_csc"),
            make_step(2, "Approval by Taluka Sanjay Gandhi Committee", "Committee evaluates claims and sanctions pension order.", "district_office"),
            make_step(3, "Monthly Bank Account Credit", "Pension credited on 1st week of every month directly to savings account.", "online_portal"),
        ]
    ),
    make_scheme(
        id="up-gopalak-dairy-loan",
        slug="uttar-pradesh-mukhyamantri-gopalak-yojana",
        name="Uttar Pradesh Mukhyamantri Gopalak Yojana (Dairy Farming Enterprise Loan)",
        short_description="Bank loan up to ₹9 Lakhs with capital subsidy up to ₹1.80 Lakhs (₹40,000/year for 5 years) to set up modern dairy farms with 10-12 milch cows.",
        full_description="Administered by the Animal Husbandry Department in UP, Gopalak Yojana encourages unemployed youth and farmers to establish commercial dairy units with 10-12 indigenous high-yielding cows/buffaloes, providing up to ₹9 Lakhs bank finance and state interest/capital subsidy.",
        category="agriculture",
        jurisdiction="state",
        state="Uttar Pradesh",
        department="Animal Husbandry Department, Government of Uttar Pradesh",
        portal_url="https://animalhusb.upsdc.gov.in",
        benefit_details="Bank loan up to ₹9,00,000 with state government subsidy of ₹1,80,000 (paid as ₹40,000/year for 5 years directly to bank loan account).",
        eligibilitySummary="Unemployed youth or farmer resident of UP having own/leased land for cattle shed and minimum 5 animals to expand to 10-12 milch animals.",
        rules=[
            make_rule("state", "EQUALS", "Uttar Pradesh", "UP Domicile", "Gopalak Rules Clause 1"),
        ],
        documents=[
            make_doc("doc-gopalak-dpr", "Dairy Farm Detailed Project Report", "Prepared with Veterinary Officer", "Chief Veterinary Officer", "Gopalak Form A"),
            make_doc("doc-gopalak-land", "Land Records / Shed Proof", "Showing space for cattle shed and fodder", "Tahsildar", "Gopalak Form B"),
        ],
        steps=[
            make_step(1, "Apply at Chief Veterinary Officer (CVO) Office", "Submit application through local Veterinary Hospital in your block.", "district_office"),
            make_step(2, "District Level Committee Approval", "CDO and CVO committee interviews candidate and forwards file to bank.", "district_office"),
            make_step(3, "Bank Sanction & Subsidy Credit", "Bank disburses ₹9 Lakh loan to purchase certified milch cows; state credits subsidy annually.", "online_portal"),
        ]
    ),
]
