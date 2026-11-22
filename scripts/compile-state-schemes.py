import json
import os

schemes = [
    # ==========================================
    # 1. TELANGANA (10 SCHEMES)
    # ==========================================
    {
        "id": "tg-rythu-bharosa",
        "slug": "telangana-rythu-bharosa",
        "name": "Telangana Rythu Bharosa Scheme (Farmers & Agricultural Labourers)",
        "shortDescription": "Annual direct investment support of ₹15,000 per acre to landowning farmers and ₹12,000 per year to landless agricultural labourers in Telangana.",
        "fullDescription": "The Government of Telangana implemented the Rythu Bharosa scheme as a flagship agricultural transformation guarantee. It offers ₹15,000 per acre per year (₹7,500 each for Kharif and Rabi crop seasons) to all eligible farmers holding patta passbooks or RoFR forest title deeds. Additionally, it extends ₹12,000 per year to verified landless agricultural families to ensure financial resilience and eliminate agrarian distress.",
        "category": "agriculture",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Department of Agriculture and Cooperation, Government of Telangana",
        "portalUrl": "https://rythubharosa.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹15,00,000 financial security net across seasons: ₹15,000 per acre per year for farmers (paid in two seasonal installments of ₹7,500 each); ₹12,000 per year for landless agricultural labourers via direct bank transfer (DBT).",
        "eligibilitySummary": "Resident farmer owning agricultural land in Telangana with updated Dharani / Bhumatha patta title or RoFR patta; or landless agricultural labourer household with valid Food Security Card.",
        "rules": [
            {
                "id": "rule-tg-rb-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "State Domicile",
                "sourceClause": "Telangana Rythu Bharosa Guidelines Clause 2.1"
            },
            {
                "id": "rule-tg-rb-land",
                "parameter": "farmerCategory",
                "operator": "IN",
                "expectedValue": ["landowner", "rofr_patta_holder", "agricultural_labourer"],
                "isMandatory": True,
                "conditionName": "Agricultural Land or Farm Labourer Status",
                "sourceClause": "Telangana Rythu Bharosa Guidelines Clause 3.2"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-rb-passbook",
                "name": "Pattadar Passbook / Dharani Title",
                "description": "Digitally verified Dharani portal Patta passbook or RoFR record.",
                "requirementType": "conditional",
                "issuingAuthority": "Revenue Department, Govt of Telangana",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-rb-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar linked to bank account for NPCI direct benefit transfer.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tg-rb-ration",
                "name": "Food Security Card (White Ration Card)",
                "description": "For landless agricultural labourer verification.",
                "requirementType": "conditional",
                "issuingAuthority": "Civil Supplies Dept, Telangana",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Land Record Verification on Dharani",
                "description": "Ensure agricultural land parcel is properly mapped and Aadhaar-seeded in Dharani / Bhumatha records.",
                "portalUrl": "https://dharani.telangana.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Enrollment via Agriculture Extension Officer",
                "description": "AEO conducts field verification of the cultivator or farm labourer during Gram Sabha / Praja Palana drives.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "DBT Fund Disbursement",
                "description": "Assistance is credited directly into the bank account linked via Aadhaar Payment Bridge before each cropping season.",
                "portalUrl": "https://rythubharosa.telangana.gov.in",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-mahalakshmi-free-bus",
        "slug": "telangana-mahalakshmi-free-bus-travel",
        "name": "Telangana Mahalakshmi Scheme (Free TSRTC Bus Travel for Women)",
        "shortDescription": "100% free bus travel for all domicile women, girls, and transgender persons across Telangana in TGS-RTC buses.",
        "fullDescription": "Launched under the Six Guarantees, the Mahalakshmi Free Bus Travel Scheme provides unrestricted free travel to girls, women of all ages, and transgender persons resident in Telangana on State-owned public transport corporation buses (Palle Velugu, Express, City Ordinary, and Metro Express within the state borders).",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Transport Department & TSRTC (TGS-RTC), Government of Telangana",
        "portalUrl": "https://tgsrtc.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Zero-fare tickets issued across Palle Velugu, Express, and City buses within Telangana state boundaries.",
        "eligibilitySummary": "Girls and women of all ages and transgender persons domiciled in Telangana. Must produce valid government photo ID card proving Telangana domicile upon boarding.",
        "rules": [
            {
                "id": "rule-tg-mb-gender",
                "parameter": "gender",
                "operator": "IN",
                "expectedValue": ["female", "transgender"],
                "isMandatory": True,
                "conditionName": "Gender Eligibility",
                "sourceClause": "Mahalakshmi Bus Scheme Notification G.O.Ms.No.37"
            },
            {
                "id": "rule-tg-mb-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "Telangana Residence",
                "sourceClause": "Mahalakshmi Bus Scheme Clause 3"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-mb-id",
                "name": "Telangana Domicile Photo ID",
                "description": "Aadhaar Card, Voter ID, or Resident Certificate with Telangana address.",
                "requirementType": "mandatory",
                "issuingAuthority": "Govt of India / Govt of Telangana",
                "sourceEvidence": "Notification G.O.Ms.No.37"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Board Eligible Bus",
                "description": "Board any TSRTC (TGS-RTC) Palle Velugu, Express, or City Ordinary/Metro bus within Telangana.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Present ID to Conductor",
                "description": "Show Aadhaar card or valid government ID with Telangana residence address.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Receive Zero-Fare Ticket",
                "description": "Conductor issues an instant zero-fare Mahalakshmi paper ticket for the intended destination.",
                "channel": "district_office"
            }
        ]
    },
    {
        "id": "tg-mahalakshmi-500-gas",
        "slug": "telangana-mahalakshmi-500-rupees-gas-cylinder",
        "name": "Telangana Mahalakshmi Scheme (LPG Cylinder Refill at ₹500)",
        "shortDescription": "Domestic LPG cylinder refills at a subsidized rate of ₹500 for eligible BPL families in Telangana.",
        "fullDescription": "Under the Mahalakshmi Guarantee, the Telangana Government provides domestic LPG cooking gas cylinders to Food Security Card (White Ration Card) holder families at an effective cost of ₹500 per cylinder. Consumers pay the cylinder price at delivery, and the excess amount above ₹500 is directly credited by the State Government into the beneficiary woman's Aadhaar-linked bank account.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Civil Supplies Department, Government of Telangana",
        "portalUrl": "https://prajapalana.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Direct bank transfer (DBT) subsidy covering the entire retail difference above ₹500 per cylinder refill for up to eligible quota per year.",
        "eligibilitySummary": "Telangana resident holding an active White Ration Card (Food Security Card) with active domestic LPG connection in the name of the woman of the family.",
        "rules": [
            {
                "id": "rule-tg-mg-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "State Domicile",
                "sourceClause": "G.O.Ms.No.9 Consumer Affairs, Food & Civil Supplies"
            },
            {
                "id": "rule-tg-mg-ration",
                "parameter": "rationCardType",
                "operator": "EQUALS",
                "expectedValue": "white_food_security_card",
                "isMandatory": True,
                "conditionName": "Food Security Card Holder",
                "sourceClause": "G.O.Ms.No.9 Clause 2.2"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-mg-ration",
                "name": "Food Security Card (White Ration Card)",
                "description": "Active FSC card copy with beneficiary woman name.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies Dept, Govt of Telangana",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-mg-lpg",
                "name": "LPG Consumer Connection Passbook",
                "description": "Domestic gas connection booklet or subscription receipt.",
                "requirementType": "mandatory",
                "issuingAuthority": "IOCL / BPCL / HPCL Agency",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tg-mg-aadhaar",
                "name": "Aadhaar Card",
                "description": "Beneficiary woman Aadhaar linked to bank account.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Submit Praja Palana Application",
                "description": "Submit Praja Palana form or apply online linking Food Security Card and LPG Consumer ID.",
                "portalUrl": "https://prajapalana.telangana.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Book Gas Cylinder",
                "description": "Book LPG refill through regular distributor channels and pay standard delivery price.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Receive Balance Refund via DBT",
                "description": "State government automatically credits the subsidy amount (bill amount minus ₹500) into the Aadhaar-seeded bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-gruha-jyothi",
        "slug": "telangana-gruha-jyothi-free-electricity",
        "name": "Telangana Gruha Jyothi Scheme (200 Units Free Electricity)",
        "shortDescription": "Free domestic electricity up to 200 units per month for all eligible residential households in Telangana.",
        "fullDescription": "Telangana Gruha Jyothi scheme fulfills the promise of providing up to 200 units of free power per month to residential consumers possessing Food Security Cards (White Ration Cards). The scheme exempts households from energy charges, customer charges, and electricity duties for consumption up to 200 kWh per billing cycle.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Energy Department, TGSPDCL & TGNPDCL, Government of Telangana",
        "portalUrl": "https://prajapalana.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Zero electricity bill for consumption up to 200 units per month for domestic connections.",
        "eligibilitySummary": "Resident domestic electricity consumer in Telangana with active Food Security Card (White Ration Card), unique Service Connection Number linked to Aadhaar.",
        "rules": [
            {
                "id": "rule-tg-gj-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "State Domicile",
                "sourceClause": "Gruha Jyothi Policy Guidelines Clause 2.1"
            },
            {
                "id": "rule-tg-gj-consumption",
                "parameter": "monthlyElectricityUnits",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 200,
                "isMandatory": True,
                "conditionName": "Monthly Power Consumption Limit",
                "sourceClause": "Gruha Jyothi Policy Guidelines Clause 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-gj-bill",
                "name": "Domestic Electricity Bill / USC No",
                "description": "Recent electricity bill showing domestic Category-I service connection.",
                "requirementType": "mandatory",
                "issuingAuthority": "TGSPDCL / TGNPDCL",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-gj-fsc",
                "name": "Food Security Card (White Ration Card)",
                "description": "Active White Ration Card registered in Telangana.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies Department, Telangana",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tg-gj-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar of consumer matching ration card records.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Submit Application via Praja Palana / MeeSeva",
                "description": "Provide Consumer USC Number, White Ration Card number, and Aadhaar on Praja Palana or DISCOM portal.",
                "portalUrl": "https://prajapalana.telangana.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Database Linking and Verification",
                "description": "DISCOM links service meter to Civil Supplies ration card registry.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Issuance of Zero Electricity Bill",
                "description": "Meter reader issues a monthly zero bill showing full subsidy for units consumed under 200 units.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-indiramma-indlu",
        "slug": "telangana-indiramma-indlu-housing",
        "name": "Telangana Indiramma Indlu Housing Scheme",
        "shortDescription": "Financial assistance of ₹5,00,000 for constructing a permanent house for homeless poor and plot owners in Telangana.",
        "fullDescription": "The Indiramma Indlu Scheme provides housing assistance of ₹5,00,000 to economically disadvantaged homeless families in Telangana. For families who already own a residential plot of land, ₹5 lakh is provided in four construction milestone stages. For shelterless families without land, a residential house site plot along with ₹5 lakh financial assistance is sanctioned.",
        "category": "housing",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Telangana State Housing Corporation Limited (TSHCL), Government of Telangana",
        "portalUrl": "https://housing.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹5,00,000 financial grant released in 4 stages (Basement, Roof Level, Roof Slab, and Completion) + MGNREGS wage component and SBM toilet assistance.",
        "eligibilitySummary": "Homeless families or those residing in katcha huts in Telangana holding a White Ration Card; priority given to SC, ST, minority, and female-headed households.",
        "rules": [
            {
                "id": "rule-tg-ii-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "Telangana Domicile",
                "sourceClause": "Indiramma Housing Operational Guidelines Section 2"
            },
            {
                "id": "rule-tg-ii-housing",
                "parameter": "housingStatus",
                "operator": "IN",
                "expectedValue": ["homeless", "katcha_house", "open_plot_only"],
                "isMandatory": True,
                "conditionName": "Lack of Pucca House",
                "sourceClause": "Indiramma Housing Operational Guidelines Section 3"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-ii-plot",
                "name": "Plot Title Deed / Possession Certificate",
                "description": "Registered document, Gram Panchayat / Municipal patta, or possession certificate.",
                "requirementType": "conditional",
                "issuingAuthority": "Registration Dept / Tahsildar",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-ii-ration",
                "name": "White Food Security Card",
                "description": "Proof of BPL status in Telangana.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies Dept",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tg-ii-bank",
                "name": "Aadhaar-Seeded Bank Account Passbook",
                "description": "Bank account details of the woman head of household for stage-wise DBT.",
                "requirementType": "mandatory",
                "issuingAuthority": "Scheduled Commercial Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Application through Praja Palana or Gram Sabha",
                "description": "Apply during Praja Palana ward/village assemblies or via MeeSeva.",
                "portalUrl": "https://prajapalana.telangana.gov.in",
                "channel": "meeseva_csc"
            },
            {
                "stepNumber": 2,
                "title": "Field Verification & Geotagging",
                "description": "Housing engineer conducts physical inspection and geotags the plot location.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Sanction Order & Stage-Wise Fund Release",
                "description": "District Collector sanctions approval; funds disbursed at basement, roof level, slab, and completion.",
                "portalUrl": "https://housing.telangana.gov.in",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-dalit-bandhu",
        "slug": "telangana-dalit-bandhu",
        "name": "Telangana Dalit Bandhu Scheme",
        "shortDescription": "Direct financial grant of ₹10,00,000 per eligible Scheduled Caste (SC) family for enterprise creation with 100% subsidy.",
        "fullDescription": "Telangana Dalit Bandhu is an economic empowerment initiative offering ₹10,00,000 direct one-time grant to eligible SC families to start businesses, trade, manufacturing, or service enterprises. The assistance is a 100% direct grant with no bank linkage, collateral, or repayment requirement, designed to foster Dalit entrepreneurship and financial autonomy.",
        "category": "livelihood",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Scheduled Castes Development Department, Government of Telangana",
        "portalUrl": "https://dalitbandhu.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹10,00,000 direct financial grant credited into dedicated Dalit Bandhu bank account for starting approved enterprise or business activity.",
        "eligibilitySummary": "Permanent resident of Telangana belonging to Scheduled Caste (SC) community with valid caste certificate and Food Security Card.",
        "rules": [
            {
                "id": "rule-tg-db-caste",
                "parameter": "socialCategory",
                "operator": "EQUALS",
                "expectedValue": "SC",
                "isMandatory": True,
                "conditionName": "Scheduled Caste Community",
                "sourceClause": "Dalit Bandhu Operational Rules Clause 2"
            },
            {
                "id": "rule-tg-db-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "Telangana Domicile",
                "sourceClause": "Dalit Bandhu Operational Rules Clause 3"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-db-caste",
                "name": "Integrated Caste Certificate (MeeSeva)",
                "description": "Valid SC community certificate issued by Revenue Department.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via MeeSeva",
                "sourceEvidence": "Clause 5.1"
            },
            {
                "id": "doc-tg-db-ration",
                "name": "Food Security Card",
                "description": "White ration card confirming family composition.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies Dept",
                "sourceEvidence": "Clause 5.2"
            },
            {
                "id": "doc-tg-db-project",
                "name": "Business / Enterprise Profile",
                "description": "Detailed business idea or asset selection statement.",
                "requirementType": "mandatory",
                "issuingAuthority": "Beneficiary / District Scrutiny Committee",
                "sourceEvidence": "Clause 5.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Identification and Verification by District Committee",
                "description": "District Collectorate and SC Corporation identify beneficiaries in assembly constituencies.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Selection of Business Sector",
                "description": "Beneficiary chooses enterprise (agriculture, transport, retail, manufacturing, services) with guidance.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Account Opening & Fund Disbursal",
                "description": "Special Dalit Bandhu bank account opened and ₹10 lakh deposited directly for asset creation.",
                "portalUrl": "https://dalitbandhu.telangana.gov.in",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-kalyana-lakshmi-shaadi-mubarak",
        "slug": "telangana-kalyana-lakshmi-shaadi-mubarak",
        "name": "Telangana Kalyana Lakshmi / Shaadi Mubarak Scheme",
        "shortDescription": "One-time financial assistance of ₹1,00,116 for the marriage of brides from SC, ST, BC, EBC, and Minority families in Telangana.",
        "fullDescription": "Kalyana Lakshmi (for SC, ST, BC, and EBC brides) and Shaadi Mubarak (for Minority brides) provide one-time financial aid of ₹1,00,116 directly deposited into the unmarried bride's mother's or bride's bank account before marriage, preventing child marriage and alleviating financial stress on poor families.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Scheduled Castes, ST, BC & Minority Welfare Departments, Government of Telangana",
        "portalUrl": "https://telanganaepass.cgg.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹1,00,116 one-time direct bank transfer for marriage expenses.",
        "eligibilitySummary": "Unmarried girl resident in Telangana aged 18 years or above; annual family income not exceeding ₹2,00,000 (urban) or ₹1,50,000 (rural); belonging to SC, ST, BC, EBC, or Minority communities.",
        "rules": [
            {
                "id": "rule-tg-kl-age",
                "parameter": "age",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 18,
                "isMandatory": True,
                "conditionName": "Minimum Legal Age of Bride",
                "sourceClause": "ePASS Kalyana Lakshmi Guidelines Section 2"
            },
            {
                "id": "rule-tg-kl-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 200000,
                "isMandatory": True,
                "conditionName": "Income Ceiling",
                "sourceClause": "ePASS Kalyana Lakshmi Guidelines Section 3"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-kl-birth",
                "name": "Bride Age Proof / SSC Certificate",
                "description": "SSC marks memo or Birth Certificate issued by competent authority.",
                "requirementType": "mandatory",
                "issuingAuthority": "Registrar of Births / BSE Telangana",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-kl-caste",
                "name": "Caste Certificate from MeeSeva",
                "description": "Integrated community certificate.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via MeeSeva",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tg-kl-income",
                "name": "Income Certificate from MeeSeva",
                "description": "Income certificate issued within last 6 months.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via MeeSeva",
                "sourceEvidence": "Clause 4.3"
            },
            {
                "id": "doc-tg-kl-card",
                "name": "Wedding Invitation Card (Lagna Patrika)",
                "description": "Wedding invitation or certificate from religious authority / Jamaat.",
                "requirementType": "mandatory",
                "issuingAuthority": "Religious Institution / Gram Panchayat",
                "sourceEvidence": "Clause 4.4"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Online Registration on ePASS Portal",
                "description": "Upload bride and groom details, MeeSeva certificates, and wedding date.",
                "portalUrl": "https://telanganaepass.cgg.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Field Verification by Mandal Revenue Officer (MRO)",
                "description": "Revenue Inspector and Tahsildar physically verify age, eligibility, and marriage details.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Sanction and Direct Bank Credit",
                "description": "Amount of ₹1,00,116 is credited directly into the bride's/mother's bank account.",
                "portalUrl": "https://telanganaepass.cgg.gov.in",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-epass-rtf",
        "slug": "telangana-epass-post-matric-rtf",
        "name": "Telangana ePASS Post-Matric Scholarship (Reimbursement of Tuition Fee - RTF)",
        "shortDescription": "100% or sanctioned tuition fee reimbursement for eligible SC, ST, BC, EBC, and Minority college students in Telangana.",
        "fullDescription": "Telangana ePASS RTF pays college tuition fees directly to colleges on behalf of eligible post-matric students (Intermediate, ITI, Polytechnic, Degree, Engineering, Medicine, MBA, MCA, and Ph.D.). Admitted under the convenor quota through standard entrance tests (TG EAPCET, ICET, ECET, etc.), the program ensures zero out-of-pocket tuition expense for disadvantaged communities.",
        "category": "scholarship",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "BC Welfare & SC Development Departments, Government of Telangana",
        "portalUrl": "https://telanganaepass.cgg.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Full sanctioned tuition fee reimbursed directly to the educational institution as notified by the Telangana Admission and Fee Regulatory Committee (TAFRC).",
        "eligibilitySummary": "Telangana domicile student enrolled in recognized post-matric course under convenor quota with family income <= ₹2,00,000 (SC/ST/Rural BC) or ₹1,50,000 (Urban BC/EBC) and minimum 75% attendance.",
        "rules": [
            {
                "id": "rule-tg-rtf-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "Telangana Domicile",
                "sourceClause": "ePASS RTF Regulation 3.1"
            },
            {
                "id": "rule-tg-rtf-attendance",
                "parameter": "minimumAttendancePercentage",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 75,
                "isMandatory": True,
                "conditionName": "Minimum Attendance",
                "sourceClause": "ePASS RTF Regulation 4.2"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-rtf-caste",
                "name": "Integrated Caste Certificate",
                "description": "Permanent MeeSeva caste certificate.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via MeeSeva",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-rtf-income",
                "name": "Latest Income Certificate",
                "description": "MeeSeva income certificate issued in the current financial year.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via MeeSeva",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tg-rtf-allotment",
                "name": "CET Allotment Order",
                "description": "Convenor quota admission order with hall ticket number.",
                "requirementType": "mandatory",
                "issuingAuthority": "TG EAPCET / TG ICET Convenor",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Register on ePASS Portal",
                "description": "Submit fresh/renewal post-matric scholarship application on telanganaepass.cgg.gov.in.",
                "portalUrl": "https://telanganaepass.cgg.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "College Principal Verification",
                "description": "College verification officer confirms bonafide admission, certificates, and biometrics.",
                "channel": "college_cell"
            },
            {
                "stepNumber": 3,
                "title": "District Welfare Officer (DWO) Sanction",
                "description": "DWO verifies and approves fee disbursement directly to the college treasury account.",
                "channel": "district_office"
            }
        ]
    },
    {
        "id": "tg-epass-mtf",
        "slug": "telangana-epass-post-matric-mtf",
        "name": "Telangana ePASS Post-Matric Maintenance Fee & Mess Charges (MTF)",
        "shortDescription": "Monthly hostel and maintenance stipend of up to ₹1,400 per month for SC, ST, BC, and Minority college students in Telangana.",
        "fullDescription": "Telangana ePASS MTF (Maintenance Fee) provides monthly living allowances and mess charges to eligible post-matric college students. Disbursed quarterly, it supports College Attached Hostels (CAH), Department Attached Hostels (DAH), and Day Scholars with fixed monthly stipends deposited directly into students' bank accounts.",
        "category": "scholarship",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "BC Welfare & SC Development Departments, Government of Telangana",
        "portalUrl": "https://telanganaepass.cgg.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Up to ₹1,400 per month for hostellers (CAH/DSWH) and ₹650 per month for day scholars, disbursed on a quarterly basis.",
        "eligibilitySummary": "Students eligible for Telangana ePASS RTF residing in attached hostels or attending as day scholars with regular 75% biometric attendance.",
        "rules": [
            {
                "id": "rule-tg-mtf-attendance",
                "parameter": "minimumAttendancePercentage",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 75,
                "isMandatory": True,
                "conditionName": "Minimum 75% Attendance",
                "sourceClause": "ePASS MTF Guidelines Clause 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-mtf-bank",
                "name": "Aadhaar-Seeded Bank Passbook",
                "description": "Bank account copy of student with IFSC and NPCI mapping.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-mtf-bonafide",
                "name": "Hostel Stay Certificate / Bonafide",
                "description": "Warden/Principal certificate confirming hostel stay or day-scholar status.",
                "requirementType": "mandatory",
                "issuingAuthority": "College / Hostel Warden",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Select MTF in ePASS Application",
                "description": "Check MTF hostel option while submitting ePASS Post-Matric registration.",
                "portalUrl": "https://telanganaepass.cgg.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Biometric Attendance Authentication",
                "description": "Authenticate via Aadhaar-enabled biometric attendance system (AEBAS) in college.",
                "channel": "college_cell"
            },
            {
                "stepNumber": 3,
                "title": "Quarterly DBT Transfer",
                "description": "Welfare department credits maintenance stipend into student's Aadhaar-linked bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tg-aarogyasri",
        "slug": "telangana-rajiv-aarogyasri",
        "name": "Telangana Rajiv Aarogyasri Health Scheme",
        "shortDescription": "Cashless hospitalization healthcare cover up to ₹10,00,000 per family per year in empaneled network hospitals across Telangana.",
        "fullDescription": "Rajiv Aarogyasri is Telangana's premier universal health assurance scheme providing comprehensive cashless inpatient care up to ₹10,00,000 per family per year. Covering over 1,672 medical and surgical procedures across heart disease, cancer, nephrology, neurosurgery, orthopedics, and polytrauma, it ensures end-to-end cashless treatment including diagnostics, medicines, implants, and post-discharge follow-ups.",
        "category": "healthcare",
        "jurisdiction": "state",
        "state": "Telangana",
        "department": "Aarogyasri Health Care Trust, Department of Health, Medical and Family Welfare, Govt of Telangana",
        "portalUrl": "https://aarogyasri.telangana.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Cashless in-patient treatment up to ₹10,00,000 per family per year across 1,672 secondary and tertiary medical therapies in empaneled hospitals.",
        "eligibilitySummary": "Resident families in Telangana holding valid Food Security Card (White Ration Card) or Rajiv Aarogyasri Card.",
        "rules": [
            {
                "id": "rule-tg-as-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Telangana",
                "isMandatory": True,
                "conditionName": "State Domicile",
                "sourceClause": "Aarogyasri Guidelines Clause 2.1"
            },
            {
                "id": "rule-tg-as-ration",
                "parameter": "rationCardType",
                "operator": "EQUALS",
                "expectedValue": "white_food_security_card",
                "isMandatory": True,
                "conditionName": "Food Security Card Holder",
                "sourceClause": "Aarogyasri Guidelines Clause 2.2"
            }
        ],
        "documents": [
            {
                "id": "doc-tg-as-fsc",
                "name": "White Food Security Card / Aarogyasri Card",
                "description": "Ration card or Aarogyasri health card with family member names.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies / Aarogyasri Trust",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tg-as-aadhaar",
                "name": "Aadhaar Card of Patient",
                "description": "Aadhaar card for biometric authentication at hospital Aarogya Mithra desk.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Visit Empaneled Network Hospital",
                "description": "Visit any government or empaneled private hospital in Telangana.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Approach Aarogya Mithra Desk",
                "description": "Aarogya Mithra verifies Food Security Card and Aadhaar, registers patient, and initiates pre-authorization.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Avail Cashless Treatment & Discharge",
                "description": "Hospital delivers cashless surgery/treatment, free diagnostic tests, medicines, and food.",
                "portalUrl": "https://aarogyasri.telangana.gov.in",
                "channel": "online_portal"
            }
        ]
    },

    # ==========================================
    # 2. ANDHRA PRADESH (6 SCHEMES)
    # ==========================================
    {
        "id": "ap-talliki-vandanam",
        "slug": "andhra-pradesh-talliki-vandanam",
        "name": "Andhra Pradesh Talliki Vandanam Scheme (Amma Vodi)",
        "shortDescription": "Annual financial aid of ₹15,000 per school-going child directly credited to the mother's bank account in Andhra Pradesh.",
        "fullDescription": "Talliki Vandanam (the enhanced iteration of the Amma Vodi scheme under Andhra Pradesh's Super Six guarantees) supports education from Class 1 to 12. It provides ₹15,000 annually per school-going child directly into the mother's bank account, ensuring that poverty never prevents a parent from educating their children.",
        "category": "education_aid",
        "jurisdiction": "state",
        "state": "Andhra Pradesh",
        "department": "Department of School Education, Government of Andhra Pradesh",
        "portalUrl": "https://gsws.ap.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹15,000 per year per school-going child directly credited into the mother's or guardian's Aadhaar-enabled bank account.",
        "eligibilitySummary": "Mother or legal guardian of children studying in Class 1 to 12 in recognized schools/junior colleges in AP; family holding Rice Card with student attendance >= 75%.",
        "rules": [
            {
                "id": "rule-ap-tv-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Andhra Pradesh",
                "isMandatory": True,
                "conditionName": "AP Domicile",
                "sourceClause": "Talliki Vandanam Guidelines Section 1"
            },
            {
                "id": "rule-ap-tv-attendance",
                "parameter": "minimumAttendancePercentage",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 75,
                "isMandatory": True,
                "conditionName": "Minimum 75% Attendance",
                "sourceClause": "Talliki Vandanam Guidelines Section 2"
            }
        ],
        "documents": [
            {
                "id": "doc-ap-tv-ricecard",
                "name": "AP Rice Card / BPL Proof",
                "description": "Valid Rice Card issued by Civil Supplies Dept AP.",
                "requirementType": "mandatory",
                "issuingAuthority": "Gram/Ward Sachivalayam",
                "sourceEvidence": "Clause 3.1"
            },
            {
                "id": "doc-ap-tv-aadhaar",
                "name": "Mother & Child Aadhaar Cards",
                "description": "Aadhaar cards linked to student ChildInfo / U-DISE ID.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 3.2"
            },
            {
                "id": "doc-ap-tv-bank",
                "name": "Mother's NPCI-Mapped Bank Passbook",
                "description": "Active bank account linked with Aadhaar.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 3.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "School Enrollment and U-DISE ChildInfo Entry",
                "description": "School headmaster enters and verifies student attendance and mother's Aadhaar in the ChildInfo portal.",
                "channel": "college_cell"
            },
            {
                "stepNumber": 2,
                "title": "Gram/Ward Sachivalayam Social Audit",
                "description": "Village/Ward Education Secretary displays beneficiary lists for social audit and biometric eKYC.",
                "portalUrl": "https://gsws.ap.gov.in",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Annual DBT Transfer",
                "description": "Funds are credited directly to the mother's bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ap-annadata-sukhibhava",
        "slug": "andhra-pradesh-annadata-sukhibhava",
        "name": "Andhra Pradesh Annadata Sukhibhava Scheme (Rythu Bharosa)",
        "shortDescription": "Annual input financial assistance of ₹20,000 per farmer family per year in Andhra Pradesh.",
        "fullDescription": "Annadata Sukhibhava provides ₹20,000 annual income support to farmer families in Andhra Pradesh (combining the Central PM-KISAN ₹6,000 and the State Government contribution of ₹14,000). The assistance is disbursed in three seasonal installments to landowning farmers, tenant farmers holding Crop Cultivator Rights Cards (CCRC), and forest land cultivators under RoFR.",
        "category": "agriculture",
        "jurisdiction": "state",
        "state": "Andhra Pradesh",
        "department": "Department of Agriculture & Cooperation, Government of Andhra Pradesh",
        "portalUrl": "https://apagrisnet.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹20,000 per year per farmer family disbursed in three installments (Kharif sowing, Rabi sowing, and harvest/Sankranti).",
        "eligibilitySummary": "Farmer families cultivating agricultural land in Andhra Pradesh with registered land records, tenant farmers with CCRC cards, or RoFR forest title holders.",
        "rules": [
            {
                "id": "rule-ap-as-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Andhra Pradesh",
                "isMandatory": True,
                "conditionName": "AP Domicile",
                "sourceClause": "Annadata Sukhibhava Guidelines Section 2"
            },
            {
                "id": "rule-ap-as-farmer",
                "parameter": "farmerCategory",
                "operator": "IN",
                "expectedValue": ["landowner", "tenant_ccrc", "rofr_cultivator"],
                "isMandatory": True,
                "conditionName": "Farmer Category",
                "sourceClause": "Annadata Sukhibhava Guidelines Section 3"
            }
        ],
        "documents": [
            {
                "id": "doc-ap-as-patta",
                "name": "Webland Patta Passbook / 1B Adangal",
                "description": "Digitally certified Webland revenue record copy.",
                "requirementType": "conditional",
                "issuingAuthority": "Revenue Dept, AP",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ap-as-ccrc",
                "name": "Crop Cultivator Rights Card (CCRC)",
                "description": "Valid CCRC card for tenant farmers.",
                "requirementType": "conditional",
                "issuingAuthority": "Tahsildar / Village Revenue Officer",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-ap-as-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar linked to bank account and e-Crop booking.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "e-Crop Booking at Rythu Bharosa Kendras (RBKs)",
                "description": "Village Agriculture Assistant registers crop details and geo-tags farmland in the e-Crop portal.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "eKYC Biometric Verification",
                "description": "Farmer completes biometric or facial eKYC at the local Rythu Bharosa Kendra / Sachivalayam.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Direct Benefit Transfer",
                "description": "Seasonal installments are deposited directly into the farmer's bank account.",
                "portalUrl": "https://apagrisnet.gov.in",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ap-vidya-deevena",
        "slug": "andhra-pradesh-jagananna-vidya-deevena",
        "name": "Andhra Pradesh Jagananna Vidya Deevena (RTF - Full Fee Reimbursement)",
        "shortDescription": "100% full tuition fee reimbursement for college and professional students from low-income families in Andhra Pradesh.",
        "fullDescription": "Jagananna Vidya Deevena ensures complete higher education access by providing 100% college tuition fee reimbursement for students pursuing Polytechnic, ITI, Degree, Engineering, Medicine, Pharmacy, MBA, and MCA courses. The sanctioned tuition fee is credited on a quarterly basis directly into the mother's bank account to promote financial oversight.",
        "category": "scholarship",
        "jurisdiction": "state",
        "state": "Andhra Pradesh",
        "department": "Department of Higher Education & Social Welfare, Government of Andhra Pradesh",
        "portalUrl": "https://jnanabhumi.ap.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "100% college tuition fee reimbursement as determined by the AP Higher Education Regulatory and Monitoring Commission (APHERMC).",
        "eligibilitySummary": "Resident of Andhra Pradesh; annual family income <= ₹2.5 Lakhs; landholding <= 10 wet acres or 25 dry acres; no four-wheeler; minimum 75% attendance.",
        "rules": [
            {
                "id": "rule-ap-vd-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 250000,
                "isMandatory": True,
                "conditionName": "Income Ceiling",
                "sourceClause": "Jnanabhumi Vidya Deevena Rules Section 3"
            },
            {
                "id": "rule-ap-vd-attendance",
                "parameter": "minimumAttendancePercentage",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 75,
                "isMandatory": True,
                "conditionName": "75% Attendance",
                "sourceClause": "Jnanabhumi Vidya Deevena Rules Section 4"
            }
        ],
        "documents": [
            {
                "id": "doc-ap-vd-rice",
                "name": "Rice Card / BPL Certificate",
                "description": "AP Civil Supplies Rice Card.",
                "requirementType": "mandatory",
                "issuingAuthority": "Gram/Ward Sachivalayam",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ap-vd-cet",
                "name": "Convenor Allotment Letter",
                "description": "Admission allotment order from AP EAPCET / ICET / ECET / POLYCET.",
                "requirementType": "mandatory",
                "issuingAuthority": "Admissions Convenor",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-ap-vd-motherbank",
                "name": "Mother's Aadhaar-Seeded Bank Passbook",
                "description": "Bank account where tuition fee is credited quarterly.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Online Registration on Jnanabhumi",
                "description": "College nodal officer registers student admission and enters mother's Aadhaar and bank details.",
                "portalUrl": "https://jnanabhumi.ap.gov.in",
                "channel": "college_cell"
            },
            {
                "stepNumber": 2,
                "title": "Sachivalayam Verification & eKYC",
                "description": "Welfare and Education Assistant verifies family eligibility parameters and completes biometric eKYC.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Quarterly Fee Credit",
                "description": "Tuition fees released into mother's account, which is then paid to the college.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ap-vasathi-deevena",
        "slug": "andhra-pradesh-jagananna-vasathi-deevena",
        "name": "Andhra Pradesh Jagananna Vasathi Deevena (MTF - Hostel & Boarding Aid)",
        "shortDescription": "Annual food and hostel maintenance allowance up to ₹20,000 for college students in Andhra Pradesh.",
        "fullDescription": "Jagananna Vasathi Deevena assists college students from economically vulnerable backgrounds with boarding, food, and accommodation costs. It sanctions ₹10,000/year for ITI students, ₹15,000/year for Polytechnic students, and ₹20,000/year for Degree, Engineering, and PG students, credited in two installments into the mother's bank account.",
        "category": "education_aid",
        "jurisdiction": "state",
        "state": "Andhra Pradesh",
        "department": "Department of Higher Education & Social Welfare, Government of Andhra Pradesh",
        "portalUrl": "https://jnanabhumi.ap.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹10,000/yr for ITI, ₹15,000/yr for Polytechnic, and ₹20,000/yr for Degree/PG students in two installments.",
        "eligibilitySummary": "Same criteria as Vidya Deevena: AP domicile, family income <= ₹2.5 Lakhs, enrolled in recognized post-matric course with >= 75% attendance.",
        "rules": [
            {
                "id": "rule-ap-vas-attendance",
                "parameter": "minimumAttendancePercentage",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 75,
                "isMandatory": True,
                "conditionName": "Minimum 75% Attendance",
                "sourceClause": "Vasathi Deevena Guidelines Section 2"
            }
        ],
        "documents": [
            {
                "id": "doc-ap-vas-study",
                "name": "Bonafide Study Certificate",
                "description": "College bonafide confirming regular attendance.",
                "requirementType": "mandatory",
                "issuingAuthority": "College Principal",
                "sourceEvidence": "Clause 3.1"
            },
            {
                "id": "doc-ap-vas-bank",
                "name": "Mother's Bank Account Passbook",
                "description": "Active bank passbook linked to Aadhaar.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 3.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Integrated Jnanabhumi Application",
                "description": "Integrated automatically when submitting Jnanabhumi Vidya Deevena application.",
                "portalUrl": "https://jnanabhumi.ap.gov.in",
                "channel": "college_cell"
            },
            {
                "stepNumber": 2,
                "title": "Sachivalayam Social Audit",
                "description": "Local Sachivalayam checks attendance and approves eligibility.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Direct Account Credit",
                "description": "Funds released directly to the mother's account in two equal installments.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ap-aarogyasri",
        "slug": "andhra-pradesh-dr-ysr-aarogyasri",
        "name": "Andhra Pradesh Dr. YSR Aarogyasri Health Scheme",
        "shortDescription": "Cashless hospitalization healthcare cover up to ₹25,00,000 per family per year covering 3,257 procedures in Andhra Pradesh.",
        "fullDescription": "Dr. YSR Aarogyasri is Andhra Pradesh's flagship healthcare program providing cashless medical treatment up to ₹25,00,000 per eligible family per year across 3,257 listed procedures. In addition to in-hospital treatment, beneficiaries receive post-operative financial assistance under Aarogya Aasara (up to ₹5,000 per month or ₹225 per day during recovery).",
        "category": "healthcare",
        "jurisdiction": "state",
        "state": "Andhra Pradesh",
        "department": "Dr. YSR Aarogyasri Health Care Trust, Government of Andhra Pradesh",
        "portalUrl": "https://aarogyasri.ap.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Cashless in-patient healthcare coverage up to ₹25,00,000 per family per year, plus post-operative recovery allowance up to ₹5,00,000 total medical security.",
        "eligibilitySummary": "Resident of Andhra Pradesh holding a valid Rice Card or Aarogyasri Card, or families with annual income up to ₹5.0 Lakhs.",
        "rules": [
            {
                "id": "rule-ap-as-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 500000,
                "isMandatory": True,
                "conditionName": "Income Ceiling",
                "sourceClause": "Aarogyasri Health Trust Operational Guidelines Clause 2.1"
            }
        ],
        "documents": [
            {
                "id": "doc-ap-as-card",
                "name": "Dr. YSR Aarogyasri Health Card / Rice Card",
                "description": "Health card with QR code or Rice card.",
                "requirementType": "mandatory",
                "issuingAuthority": "Aarogyasri Trust / GSWS",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ap-as-aadhaar",
                "name": "Aadhaar Card of Patient",
                "description": "Aadhaar for biometric hospital admission.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Admission at Network Hospital",
                "description": "Visit any empaneled government or private network hospital across AP, Hyderabad, Chennai, or Bengaluru.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Aarogya Mithra Assistance",
                "description": "Aarogya Mithra conducts biometric verification and uploads medical pre-authorization request.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Cashless Treatment & Post-Operative Aid",
                "description": "Avail cashless therapy and discharge; Aarogya Aasara recovery allowance disbursed via DBT.",
                "portalUrl": "https://aarogyasri.ap.gov.in",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ap-ysr-cheyutha",
        "slug": "andhra-pradesh-ysr-cheyutha",
        "name": "Andhra Pradesh YSR Cheyutha Scheme",
        "shortDescription": "Direct financial aid of ₹75,000 over 4 years (₹18,750 per year) for SC, ST, BC, and Minority women aged 45-60 in AP.",
        "fullDescription": "YSR Cheyutha provides financial assistance of ₹75,000 in four equal tranches of ₹18,750 per year to women aged between 45 and 60 years belonging to Scheduled Caste (SC), Scheduled Tribe (ST), Backward Class (BC), and Minority communities. In partnership with commercial leaders like Amul, ITC, and HUL, it equips women to set up sustainable retail, dairy, and grocery enterprises.",
        "category": "livelihood",
        "jurisdiction": "state",
        "state": "Andhra Pradesh",
        "department": "Department of Social Welfare & SERP, Government of Andhra Pradesh",
        "portalUrl": "https://navasakam.ap.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹18,750 per year for 4 years (total ₹75,000) directly into the woman's bank account, plus technical and supply-chain linkages.",
        "eligibilitySummary": "Women resident in AP aged between 45 to 60 years belonging to SC, ST, BC, or Minority communities with valid Rice Card.",
        "rules": [
            {
                "id": "rule-ap-ch-age",
                "parameter": "age",
                "operator": "BETWEEN",
                "expectedValue": [45, 60],
                "isMandatory": True,
                "conditionName": "Age Between 45 and 60 Years",
                "sourceClause": "YSR Cheyutha Guidelines Section 2"
            },
            {
                "id": "rule-ap-ch-category",
                "parameter": "socialCategory",
                "operator": "IN",
                "expectedValue": ["SC", "ST", "BC", "Minority"],
                "isMandatory": True,
                "conditionName": "Target Community",
                "sourceClause": "YSR Cheyutha Guidelines Section 3"
            }
        ],
        "documents": [
            {
                "id": "doc-ap-ch-caste",
                "name": "Integrated Caste Certificate",
                "description": "MeeSeva / Sachivalayam issued caste certificate.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via GSWS",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ap-ch-rice",
                "name": "AP Rice Card",
                "description": "Valid Rice Card demonstrating BPL status.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies Dept",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-ap-ch-bank",
                "name": "Aadhaar-Seeded Bank Passbook",
                "description": "Beneficiary single bank account.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Identification by Village/Ward Volunteers",
                "description": "Volunteer / Welfare Assistant conducts door-to-door verification of eligible age and caste.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Social Audit at Gram/Ward Sachivalayam",
                "description": "Eligible list displayed on notice boards and biometric eKYC collected.",
                "portalUrl": "https://navasakam.ap.gov.in",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Annual Fund Crediting",
                "description": "Annual installment of ₹18,750 credited directly into the woman's bank account.",
                "channel": "online_portal"
            }
        ]
    },

    # ==========================================
    # 3. KARNATAKA (5 SCHEMES)
    # ==========================================
    {
        "id": "ka-gruha-lakshmi",
        "slug": "karnataka-gruha-lakshmi",
        "name": "Karnataka Gruha Lakshmi Scheme",
        "shortDescription": "Direct benefit transfer of ₹2,000 every month to the woman head of household in Karnataka.",
        "fullDescription": "Gruha Lakshmi is Karnataka's landmark guarantee providing monthly direct benefit transfer of ₹2,000 (₹24,000 annually) into the bank accounts of women recognized as the head (Yajamani) of Antyodaya (AAY), BPL, or APL families. The scheme empowers women with continuous financial independence and helps meet household expenses.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Karnataka",
        "department": "Department of Women and Child Development, Government of Karnataka",
        "portalUrl": "https://sevasindhuservices.karnataka.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹2,000 per month directly transferred into the beneficiary woman's Aadhaar-linked bank account.",
        "eligibilitySummary": "Resident woman in Karnataka designated as the head of family on Antyodaya, BPL, or APL ration cards. Neither the woman nor her spouse can be an income-tax payer or GST-registered taxpayer.",
        "rules": [
            {
                "id": "rule-ka-gl-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Karnataka",
                "isMandatory": True,
                "conditionName": "Karnataka Resident",
                "sourceClause": "Gruha Lakshmi Notification Clause 2.1"
            },
            {
                "id": "rule-ka-gl-tax",
                "parameter": "isIncomeTaxPayer",
                "operator": "BOOLEAN",
                "expectedValue": False,
                "isMandatory": True,
                "conditionName": "Non-Income Tax Payer",
                "sourceClause": "Gruha Lakshmi Notification Clause 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-ka-gl-ration",
                "name": "Ration Card (BPL / Antyodaya / APL)",
                "description": "Ration card showing the applicant as the head of the family (Yajamani).",
                "requirementType": "mandatory",
                "issuingAuthority": "Food, Civil Supplies Dept Karnataka",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ka-gl-aadhaar",
                "name": "Applicant & Husband's Aadhaar Card",
                "description": "Aadhaar cards for demographic and tax verification.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-ka-gl-bank",
                "name": "Aadhaar-Seeded Bank Passbook",
                "description": "Active bank account linked via NPCI mapping.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Visit Karnataka One / Grama One Center",
                "description": "Apply for free at any Karnataka One, Grama One, Bangalore One, or Bapuji Seva Kendra.",
                "portalUrl": "https://sevasindhuservices.karnataka.gov.in",
                "channel": "meeseva_csc"
            },
            {
                "stepNumber": 2,
                "title": "Authentication & Verification",
                "description": "Operator verifies ration card number and completes OTP/biometric Aadhaar authentication.",
                "channel": "meeseva_csc"
            },
            {
                "stepNumber": 3,
                "title": "Monthly DBT Credit",
                "description": "Department releases ₹2,000 every month directly to the verified bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ka-shakti-scheme",
        "slug": "karnataka-shakti-scheme",
        "name": "Karnataka Shakti Scheme (Free Bus Travel for Women)",
        "shortDescription": "100% free bus travel for all women and girl students domiciled in Karnataka across state RTC buses.",
        "fullDescription": "The Shakti Scheme grants free public bus travel to all women, girl students, and transgender persons resident in Karnataka. Applicable across all ordinary, express, and city bus services operated by the four state transport corporations (KSRTC, BMTC, NWKRTC, and KKRTC) within Karnataka state limits.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Karnataka",
        "department": "Transport Department, Government of Karnataka",
        "portalUrl": "https://transport.karnataka.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Zero-fare tickets on all non-premium state buses across Karnataka without any journey count limitation.",
        "eligibilitySummary": "Women, girl students, and transgender persons domiciled in Karnataka presenting valid photo ID with Karnataka address or Shakti Smart Card.",
        "rules": [
            {
                "id": "rule-ka-sh-gender",
                "parameter": "gender",
                "operator": "IN",
                "expectedValue": ["female", "transgender"],
                "isMandatory": True,
                "conditionName": "Gender Eligibility",
                "sourceClause": "Shakti Scheme Guidelines Section 1"
            },
            {
                "id": "rule-ka-sh-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Karnataka",
                "isMandatory": True,
                "conditionName": "Karnataka Domicile",
                "sourceClause": "Shakti Scheme Guidelines Section 2"
            }
        ],
        "documents": [
            {
                "id": "doc-ka-sh-id",
                "name": "Government Photo Identity Card",
                "description": "Aadhaar Card, Voter ID, Driving Licence, or Karnataka Smart Card.",
                "requirementType": "mandatory",
                "issuingAuthority": "Govt of India / Govt of Karnataka",
                "sourceEvidence": "Section 3.1"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Board Eligible RTC Bus",
                "description": "Board any KSRTC, BMTC, NWKRTC, or KKRTC non-luxury bus within Karnataka.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Display Karnataka ID",
                "description": "Show Aadhaar card or government photo ID verifying Karnataka domicile to the conductor.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Obtain Free Shakti Ticket",
                "description": "Conductor issues an electronic zero-value Shakti ticket.",
                "channel": "district_office"
            }
        ]
    },
    {
        "id": "ka-gruha-jyothi",
        "slug": "karnataka-gruha-jyothi-free-power",
        "name": "Karnataka Gruha Jyothi Scheme (Up to 200 Units Free Electricity)",
        "shortDescription": "Up to 200 units of free monthly electricity for residential households in Karnataka.",
        "fullDescription": "Karnataka Gruha Jyothi ensures free domestic electricity for residential consumers whose monthly consumption falls within their calculated entitlement quota (calculated as average consumption of the previous 12 months + 10% buffer, subject to a maximum cap of 200 units). Tenants and homeowners alike are eligible.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Karnataka",
        "department": "Energy Department, Government of Karnataka (BESCOM, HESCOM, MESCOM, GESCOM, CESC)",
        "portalUrl": "https://sevasindhuservices.karnataka.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Zero electricity bill when monthly residential consumption is within the entitlement quota (up to 200 units).",
        "eligibilitySummary": "Domestic residential electricity consumers residing in Karnataka; meter account number linked with Aadhaar.",
        "rules": [
            {
                "id": "rule-ka-gj-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Karnataka",
                "isMandatory": True,
                "conditionName": "Karnataka Resident",
                "sourceClause": "Gruha Jyothi Order EN 42 PSR 2023"
            },
            {
                "id": "rule-ka-gj-units",
                "parameter": "monthlyElectricityUnits",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 200,
                "isMandatory": True,
                "conditionName": "Consumption Cap",
                "sourceClause": "Gruha Jyothi Order Clause 3"
            }
        ],
        "documents": [
            {
                "id": "doc-ka-gj-account",
                "name": "Electricity Bill Account ID",
                "description": "Account ID / Connection ID from the power utility bill.",
                "requirementType": "mandatory",
                "issuingAuthority": "ESCOMs (BESCOM / HESCOM / MESCOM / GESCOM / CESC)",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ka-gj-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar of the occupant (owner or tenant).",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Register on Seva Sindhu Portal",
                "description": "Visit sevasindhuservices.karnataka.gov.in and select Gruha Jyothi.",
                "portalUrl": "https://sevasindhuservices.karnataka.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Enter ESCOM Connection ID & Aadhaar",
                "description": "Authenticate via Aadhaar OTP and verify consumer account details.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Receive Subsidized Zero Bill",
                "description": "Eligible monthly consumption within entitlement yields a net zero electricity bill.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ka-yuva-nidhi",
        "slug": "karnataka-yuva-nidhi",
        "name": "Karnataka Yuva Nidhi Scheme (Unemployment Financial Assistance)",
        "shortDescription": "Monthly financial aid of ₹3,000 for unemployed graduates and ₹1,500 for diploma holders in Karnataka for up to 2 years.",
        "fullDescription": "Karnataka Yuva Nidhi provides temporary financial relief to educated youth during job searches. It offers ₹3,000 per month for unemployed degree graduates and ₹1,500 per month for unemployed diploma holders who completed their degrees in Karnataka and remained without job or higher education enrollment for at least 180 days, paid for up to 24 months.",
        "category": "livelihood",
        "jurisdiction": "state",
        "state": "Karnataka",
        "department": "Department of Skill Development, Entrepreneurship and Livelihood, Govt of Karnataka",
        "portalUrl": "https://sevasindhuservices.karnataka.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹3,000/month for degree graduates and ₹1,500/month for diploma holders for up to 24 months via DBT.",
        "eligibilitySummary": "Karnataka domicile candidates who graduated or passed diploma in academic years 2022-23 onwards, who remain unemployed or not enrolled in higher education for >= 180 days.",
        "rules": [
            {
                "id": "rule-ka-yn-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Karnataka",
                "isMandatory": True,
                "conditionName": "Karnataka Domicile",
                "sourceClause": "Yuva Nidhi Scheme Rules Section 2.1"
            },
            {
                "id": "rule-ka-yn-employed",
                "parameter": "isEmployed",
                "operator": "BOOLEAN",
                "expectedValue": False,
                "isMandatory": True,
                "conditionName": "Unemployed Status",
                "sourceClause": "Yuva Nidhi Scheme Rules Section 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-ka-yn-degree",
                "name": "Degree / Diploma Certificate & Marks Cards",
                "description": "Graduation / Diploma passing certificate issued by recognized Karnataka university or board.",
                "requirementType": "mandatory",
                "issuingAuthority": "University / DTE Karnataka",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-ka-yn-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar card with Karnataka address.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-ka-yn-bank",
                "name": "Aadhaar-Seeded Bank Account Passbook",
                "description": "Applicant's bank account details.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Register on Seva Sindhu / Yuva Nidhi Portal",
                "description": "Fill out the online application with registration number, university details, and Aadhaar.",
                "portalUrl": "https://sevasindhuservices.karnataka.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Submit Self-Declaration of Unemployment",
                "description": "Attest that applicant is not employed in public or private sectors and not self-employed.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Monthly DBT Crediting",
                "description": "Stipend credited monthly; candidate submits periodic monthly self-attestation of continuing unemployment.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "ka-anna-bhagya",
        "slug": "karnataka-anna-bhagya",
        "name": "Karnataka Anna Bhagya Scheme (Food Security & Direct Benefit Transfer)",
        "shortDescription": "10 kg food grains per person per month (5 kg grains + ₹170 cash DBT for additional 5 kg) for BPL families in Karnataka.",
        "fullDescription": "Karnataka Anna Bhagya guarantees 10 kg of food grains per person per month to Antyodaya Anna Yojana (AAY) and Priority Household (PHH/BPL) ration card holders. It provides 5 kg food grains through the central NFSA allocation and credits ₹170 in cash DBT (calculated at ₹34 per kg for 5 kg) per member directly into the bank account of the head of the household.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Karnataka",
        "department": "Department of Food, Civil Supplies and Consumer Affairs, Govt of Karnataka",
        "portalUrl": "https://ahara.kar.nic.in",
        "feeStatus": "free_verified",
        "benefitDetails": "5 kg subsidized grains + ₹170 per person per month transferred directly to the household head's bank account via DBT.",
        "eligibilitySummary": "Resident of Karnataka enrolled under BPL (Priority Household) or Antyodaya Anna Yojana (AAY) ration card with active Aadhaar-seeded bank account.",
        "rules": [
            {
                "id": "rule-ka-ab-card",
                "parameter": "rationCardType",
                "operator": "IN",
                "expectedValue": ["bpl_priority_household", "antyodaya_aay"],
                "isMandatory": True,
                "conditionName": "BPL or AAY Card Holder",
                "sourceClause": "Anna Bhagya Guidelines Clause 2.1"
            }
        ],
        "documents": [
            {
                "id": "doc-ka-ab-ration",
                "name": "BPL / Antyodaya Ration Card",
                "description": "Active food card with member details.",
                "requirementType": "mandatory",
                "issuingAuthority": "Food and Civil Supplies Dept, Karnataka",
                "sourceEvidence": "Clause 3.1"
            },
            {
                "id": "doc-ka-ab-aadhaar",
                "name": "Aadhaar Card of Family Head",
                "description": "Aadhaar linked to bank account.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 3.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Fair Price Shop Allocation",
                "description": "Collect 5 kg free NFSA rice per person monthly from Fair Price Shop using biometric ePDS.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Aadhaar Bank Account Seeding",
                "description": "Ensure the head of family's bank account is mapped on NPCI Aadhaar payment bridge.",
                "portalUrl": "https://ahara.kar.nic.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Monthly Cash Transfer",
                "description": "Food Department credits ₹170 per eligible member directly into the family head's bank account.",
                "channel": "online_portal"
            }
        ]
    },

    # ==========================================
    # 4. MAHARASHTRA (3 SCHEMES)
    # ==========================================
    {
        "id": "mh-majhi-ladki-bahin",
        "slug": "maharashtra-majhi-ladki-bahin-yojana",
        "name": "Maharashtra Mukhyamantri Majhi Ladki Bahin Yojana",
        "shortDescription": "Monthly financial aid of ₹1,500 (₹18,000 per year) directly transferred to eligible women aged 21-65 in Maharashtra.",
        "fullDescription": "Mukhyamantri Majhi Ladki Bahin Yojana is Maharashtra's flagship women empowerment welfare initiative. It transfers ₹1,500 per month (₹18,000 per year) directly into the Aadhaar-linked bank accounts of married, widowed, divorced, abandoned, or destitute women aged between 21 and 65 years whose annual family income is within ₹2.5 Lakhs.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Maharashtra",
        "department": "Women and Child Development Department, Government of Maharashtra",
        "portalUrl": "https://ladakibahin.maharashtra.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹1,500 per month direct financial allowance credited via DBT (Aadhaar Payment Bridge).",
        "eligibilitySummary": "Resident woman in Maharashtra aged 21 to 65 years with annual family income up to ₹2.5 Lakhs (or holding Yellow/Orange ration card), not an income tax payer.",
        "rules": [
            {
                "id": "rule-mh-lb-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Maharashtra",
                "isMandatory": True,
                "conditionName": "Maharashtra Domicile",
                "sourceClause": "Govt Resolution No. WCD-2024/CR-102"
            },
            {
                "id": "rule-mh-lb-age",
                "parameter": "age",
                "operator": "BETWEEN",
                "expectedValue": [21, 65],
                "isMandatory": True,
                "conditionName": "Age Between 21 and 65 Years",
                "sourceClause": "Govt Resolution Clause 3.1"
            },
            {
                "id": "rule-mh-lb-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 250000,
                "isMandatory": True,
                "conditionName": "Annual Income Limit",
                "sourceClause": "Govt Resolution Clause 3.2"
            }
        ],
        "documents": [
            {
                "id": "doc-mh-lb-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar with Maharashtra address.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-mh-lb-domicile",
                "name": "Domicile Certificate or 15-Year Ration Card",
                "description": "Maharashtra domicile certificate or yellow/orange ration card.",
                "requirementType": "mandatory",
                "issuingAuthority": "Revenue Dept / Tahsildar",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-mh-lb-bank",
                "name": "Aadhaar-Seeded Bank Account Passbook",
                "description": "Single bank account in applicant's name with NPCI mapping.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Register on Nari Shakti Doot App / Ladki Bahin Portal",
                "description": "Download Nari Shakti Doot App or visit ladakibahin.maharashtra.gov.in.",
                "portalUrl": "https://ladakibahin.maharashtra.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Upload Documents and Complete eKYC",
                "description": "Upload Aadhaar, ration card, bank passbook, and submit self-declaration.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Approval & Monthly Disbursement",
                "description": "Ward/Taluka committee verifies and initiates ₹1,500 monthly payment directly into bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "mh-mjpjay-health",
        "slug": "maharashtra-mjpjay-health-scheme",
        "name": "Mahatma Jyotirao Phule Jan Arogya Yojana (MJPJAY)",
        "shortDescription": "Universal cashless health insurance coverage up to ₹5,00,000 per family per year across 1,356 procedures in Maharashtra.",
        "fullDescription": "MJPJAY provides universal cashless hospitalization coverage up to ₹5,00,000 per family per year to all citizens residing in Maharashtra. Integrated with Ayushman Bharat PM-JAY, it covers 1,356 identified secondary and tertiary medical and surgical treatments, renal transplants, oncology, cardiac interventions, and intensive care across recognized public and private hospitals.",
        "category": "healthcare",
        "jurisdiction": "state",
        "state": "Maharashtra",
        "department": "State Health Assurance Society (SHAS), Public Health Department, Govt of Maharashtra",
        "portalUrl": "https://www.jeevandayee.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Universal cashless healthcare coverage up to ₹5,00,000 per family per year for 1,356 surgeries, therapies, and diagnostics.",
        "eligibilitySummary": "All families domiciled in Maharashtra holding Yellow, Orange, or White Ration Cards or Maharashtra domicile certificate.",
        "rules": [
            {
                "id": "rule-mh-mjp-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Maharashtra",
                "isMandatory": True,
                "conditionName": "Maharashtra Domicile",
                "sourceClause": "SHAS MJPJAY Universal Coverage Resolution"
            }
        ],
        "documents": [
            {
                "id": "doc-mh-mjp-ration",
                "name": "Ration Card (Yellow / Orange / White)",
                "description": "Valid Maharashtra ration card with family member names.",
                "requirementType": "mandatory",
                "issuingAuthority": "Food and Civil Supplies Dept, Maharashtra",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-mh-mjp-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar card of patient.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Visit Network Hospital",
                "description": "Approach any empaneled government or private network hospital in Maharashtra.",
                "portalUrl": "https://www.jeevandayee.gov.in",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Consult Arogya Mitra Desk",
                "description": "Arogya Mitra verifies ration card and Aadhaar, generates e-card, and routes to specialist.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Receive Cashless Treatment",
                "description": "Hospital performs procedure cashless; discharge medications and diagnostics included.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "mh-mahadbt-post-matric",
        "slug": "maharashtra-mahadbt-post-matric-scholarship",
        "name": "Maharashtra MahaDBT Post-Matric Scholarship & Tuition Fee Waiver",
        "shortDescription": "100% or 50% college tuition fee waiver and maintenance allowance for SC, ST, OBC, VJNT, and EBC students in Maharashtra.",
        "fullDescription": "MahaDBT Post-Matric Scholarships offer comprehensive financial support to students in Maharashtra studying in Class 11, 12, undergraduate, postgraduate, engineering, medical, and polytechnic courses. Covers 100% tuition and exam fee waiver for SC/ST and 50% to 100% for OBC, VJNT, SBC, and EBC/SEBC under Rajarshi Chhatrapati Shahu Maharaj Shikshan Shulkh Shishyavrutti Yojna, plus monthly maintenance stipends.",
        "category": "scholarship",
        "jurisdiction": "state",
        "state": "Maharashtra",
        "department": "Social Justice & Special Assistance / Higher & Technical Education Dept, Govt of Maharashtra",
        "portalUrl": "https://mahadbt.maharashtra.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Full or partial reimbursement of tuition and examination fees plus monthly maintenance allowance up to ₹1,200 per month.",
        "eligibilitySummary": "Maharashtra domicile students enrolled in recognized post-matric courses through CAP/convenor quota. Income ceiling: up to ₹2.5 Lakhs (SC/ST) and ₹1.5 to ₹8.0 Lakhs depending on category/EBC scheme.",
        "rules": [
            {
                "id": "rule-mh-dbt-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Maharashtra",
                "isMandatory": True,
                "conditionName": "Maharashtra Domicile",
                "sourceClause": "MahaDBT Post Matric Rules Section 2"
            }
        ],
        "documents": [
            {
                "id": "doc-mh-dbt-caste",
                "name": "Caste & Caste Validity Certificate",
                "description": "Caste Certificate along with Scrutiny Committee Validity (for professional courses).",
                "requirementType": "mandatory",
                "issuingAuthority": "Divisional Caste Scrutiny Committee",
                "sourceEvidence": "Section 3.1"
            },
            {
                "id": "doc-mh-dbt-income",
                "name": "Income Certificate from Tahsildar",
                "description": "Valid income certificate for current financial year.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar",
                "sourceEvidence": "Section 3.2"
            },
            {
                "id": "doc-mh-dbt-allotment",
                "name": "CAP Allotment Letter",
                "description": "Centralized Admission Process (CAP) allotment letter.",
                "requirementType": "mandatory",
                "issuingAuthority": "State CET Cell Maharashtra",
                "sourceEvidence": "Section 3.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Register on MahaDBT Portal",
                "description": "Create applicant profile on mahadbt.maharashtra.gov.in and complete Aadhaar biometric authentication.",
                "portalUrl": "https://mahadbt.maharashtra.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "College Verification",
                "description": "College verification clerk reviews uploaded certificates, bonafide, and attendance.",
                "channel": "college_cell"
            },
            {
                "stepNumber": 3,
                "title": "Direct Scholarship Disbursal",
                "description": "Tuition fee is directly reimbursed to the institute, and maintenance allowance is credited to the student's bank account.",
                "channel": "online_portal"
            }
        ]
    },

    # ==========================================
    # 5. TAMIL NADU (3 SCHEMES)
    # ==========================================
    {
        "id": "tn-kmut-magalir-urimai",
        "slug": "tamil-nadu-kalaignar-magalir-urimai-thittam",
        "name": "Tamil Nadu Kalaignar Magalir Urimai Thittam (KMUT - Basic Income for Women)",
        "shortDescription": "Unconditional basic income support of ₹1,000 per month directly transferred to women heads of families in Tamil Nadu.",
        "fullDescription": "Kalaignar Magalir Urimai Thittam (KMUT) provides ₹1,000 per month (₹12,000 annually) as universal basic income recognition to female heads of eligible households in Tamil Nadu. The payment is transferred directly into beneficiaries' Aadhaar-linked bank accounts via direct benefit transfer on the 15th of every month.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Tamil Nadu",
        "department": "Special Programme Implementation & Revenue Department, Government of Tamil Nadu",
        "portalUrl": "https://kmut.tn.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹1,000 per month deposited directly into the beneficiary woman's bank account via DBT.",
        "eligibilitySummary": "Woman head of family aged 21 years or older domiciled in Tamil Nadu; family annual income below ₹2.5 Lakhs; annual domestic electricity consumption below 3,600 units; family landholding below 5 acres wetland or 10 acres dryland.",
        "rules": [
            {
                "id": "rule-tn-kmut-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Tamil Nadu",
                "isMandatory": True,
                "conditionName": "Tamil Nadu Domicile",
                "sourceClause": "KMUT Implementation Guidelines Section 2"
            },
            {
                "id": "rule-tn-kmut-age",
                "parameter": "age",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 21,
                "isMandatory": True,
                "conditionName": "Minimum Age 21",
                "sourceClause": "KMUT Guidelines Section 3.1"
            },
            {
                "id": "rule-tn-kmut-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 250000,
                "isMandatory": True,
                "conditionName": "Income Ceiling",
                "sourceClause": "KMUT Guidelines Section 3.2"
            }
        ],
        "documents": [
            {
                "id": "doc-tn-kmut-smartcard",
                "name": "Tamil Nadu Smart Family Ration Card",
                "description": "Smart Card showing applicant as head of the family.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies & Consumer Protection Dept, TN",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tn-kmut-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar linked to bank account and smart card.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tn-kmut-ebill",
                "name": "TANGEDCO Electricity Consumer Number",
                "description": "Domestic electricity service number to verify annual consumption under 3,600 units.",
                "requirementType": "mandatory",
                "issuingAuthority": "TANGEDCO",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Application at Special Camp",
                "description": "Submit application with smart card and electricity bill at Fair Price Shop / Ward special camps.",
                "portalUrl": "https://kmut.tn.gov.in",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Field Verification & eKYC",
                "description": "Volunteers and Revenue authorities verify socio-economic criteria through biometric eKYC.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Monthly Direct Credit",
                "description": "₹1,000 credited automatically into the beneficiary's bank account on the 15th of every month.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tn-pudhumai-penn",
        "slug": "tamil-nadu-pudhumai-penn-scheme",
        "name": "Tamil Nadu Pudhumai Penn Scheme (Higher Education Assurance)",
        "shortDescription": "Monthly financial grant of ₹1,000 for female students studying in colleges who completed Class 6-12 in Tamil Nadu Govt schools.",
        "fullDescription": "Moovalur Ramamirtham Ammaiyar Higher Education Assurance Scheme (Pudhumai Penn) encourages female education by granting ₹1,000 per month directly into bank accounts of girl students who studied in government schools from Class 6 to 12. It covers the entire duration of undergraduate degree, diploma, ITI, or professional college courses without disruption.",
        "category": "education_aid",
        "jurisdiction": "state",
        "state": "Tamil Nadu",
        "department": "Social Welfare and Women Empowerment Department, Government of Tamil Nadu",
        "portalUrl": "https://pudhumaipenn.tn.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹1,000 per month credited directly into the student's bank account throughout their college degree/diploma.",
        "eligibilitySummary": "Female students who studied continuously from Class 6 to 12 in Tamil Nadu Government schools, enrolled in an undergraduate degree, diploma, or ITI course in Tamil Nadu.",
        "rules": [
            {
                "id": "rule-tn-pp-gender",
                "parameter": "gender",
                "operator": "EQUALS",
                "expectedValue": "female",
                "isMandatory": True,
                "conditionName": "Female Student",
                "sourceClause": "Pudhumai Penn Guidelines Section 1"
            },
            {
                "id": "rule-tn-pp-school",
                "parameter": "schoolEducationType",
                "operator": "EQUALS",
                "expectedValue": "tn_government_school_class_6_to_12",
                "isMandatory": True,
                "conditionName": "Govt Schooling Class 6-12",
                "sourceClause": "Pudhumai Penn Guidelines Section 2"
            }
        ],
        "documents": [
            {
                "id": "doc-tn-pp-emis",
                "name": "EMIS Student ID & School Bonafide",
                "description": "EMIS number verifying Class 6 to 12 education in Tamil Nadu government schools.",
                "requirementType": "mandatory",
                "issuingAuthority": "School Education Department, TN",
                "sourceEvidence": "Section 3.1"
            },
            {
                "id": "doc-tn-pp-college",
                "name": "College Admission Bonafide",
                "description": "Bonafide certificate confirming admission in recognized higher education institution.",
                "requirementType": "mandatory",
                "issuingAuthority": "College Principal",
                "sourceEvidence": "Section 3.2"
            },
            {
                "id": "doc-tn-pp-bank",
                "name": "Aadhaar-Seeded Bank Passbook",
                "description": "Student's single bank account with NPCI mapping.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Section 3.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "College Level Registration",
                "description": "College nodal officer uploads student EMIS number and certificates on pudhumaipenn.tn.gov.in.",
                "portalUrl": "https://pudhumaipenn.tn.gov.in",
                "channel": "college_cell"
            },
            {
                "stepNumber": 2,
                "title": "Automated EMIS Verification",
                "description": "School Education Department automatically cross-checks government school schooling records.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Monthly DBT Disbursement",
                "description": "State treasury deposits ₹1,000 every month directly into the student's bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "tn-cmchis-health",
        "slug": "tamil-nadu-cmchis-health-insurance",
        "name": "Tamil Nadu Chief Minister's Comprehensive Health Insurance Scheme (CMCHIS)",
        "shortDescription": "Cashless hospitalization health cover up to ₹5,00,000 per family per year in empaneled hospitals in Tamil Nadu.",
        "fullDescription": "CMCHIS provides cashless secondary and tertiary medical treatments up to ₹5,00,000 per family per year for low-income families in Tamil Nadu. Covering 1,513 medical and surgical procedures, 52 specialized diagnostic tests, and 8 high-end surgeries in recognized government and private hospitals.",
        "category": "healthcare",
        "jurisdiction": "state",
        "state": "Tamil Nadu",
        "department": "Tamil Nadu Health Systems Project (TNHSP), Health and Family Welfare Dept, Govt of Tamil Nadu",
        "portalUrl": "https://www.cmchistn.com",
        "feeStatus": "free_verified",
        "benefitDetails": "Cashless in-patient care up to ₹5,00,000 per family per year across 1,513 surgical procedures and therapies.",
        "eligibilitySummary": "Resident families in Tamil Nadu having annual family income below ₹1,20,000 as certified by VAO/Revenue authorities, or enrolled on smart family ration card.",
        "rules": [
            {
                "id": "rule-tn-cmc-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Tamil Nadu",
                "isMandatory": True,
                "conditionName": "Tamil Nadu Domicile",
                "sourceClause": "CMCHIS Scheme Guidelines Section 2"
            },
            {
                "id": "rule-tn-cmc-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 120000,
                "isMandatory": True,
                "conditionName": "Annual Income Limit",
                "sourceClause": "CMCHIS Scheme Guidelines Section 3"
            }
        ],
        "documents": [
            {
                "id": "doc-tn-cmc-smartcard",
                "name": "Tamil Nadu Smart Ration Card",
                "description": "Family card showing all family members.",
                "requirementType": "mandatory",
                "issuingAuthority": "Civil Supplies Dept, Tamil Nadu",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-tn-cmc-income",
                "name": "Income Certificate from VAO / Tahsildar",
                "description": "Income certificate certifying annual family income below ₹1.2 Lakhs.",
                "requirementType": "mandatory",
                "issuingAuthority": "Revenue Dept, Tamil Nadu",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-tn-cmc-aadhaar",
                "name": "Aadhaar Card of Patient",
                "description": "Aadhaar for biometric hospital admission.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Obtain CMCHIS Smart Health Card",
                "description": "Enroll at the District Collectorate CMCHIS kiosk with smart ration card and income certificate.",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Visit Empaneled Network Hospital",
                "description": "Report to CMCHIS liaison desk at any empaneled government or private hospital.",
                "portalUrl": "https://www.cmchistn.com",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Avail Cashless Hospitalization",
                "description": "Pre-authorization approved electronically; treatment, diagnostics, and food delivered cashless.",
                "channel": "online_portal"
            }
        ]
    },

    # ==========================================
    # 6. UTTAR PRADESH (2 SCHEMES)
    # ==========================================
    {
        "id": "up-kanya-sumangala",
        "slug": "uttar-pradesh-mukhyamantri-kanya-sumangala-yojana",
        "name": "Uttar Pradesh Mukhyamantri Kanya Sumangala Yojana",
        "shortDescription": "Phased conditional financial grant totaling ₹25,000 for girl children across 6 key developmental milestones in UP.",
        "fullDescription": "Mukhyamantri Kanya Sumangala Yojana delivers ₹25,000 conditional cash transfers disbursed across 6 developmental milestones: Stage 1 (Birth: ₹3,000), Stage 2 (Complete 1-year immunization: ₹2,000), Stage 3 (Admission to Class 1: ₹3,000), Stage 4 (Admission to Class 6: ₹3,000), Stage 5 (Admission to Class 9: ₹5,000), and Stage 6 (Admission to undergraduate degree or diploma of >= 2 years: ₹7,000).",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Uttar Pradesh",
        "department": "Women and Child Development Department, Government of Uttar Pradesh",
        "portalUrl": "https://mksy.up.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹25,000 cumulative financial assistance released in 6 milestone-based installments directly to the girl's/mother's bank account.",
        "eligibilitySummary": "Resident of Uttar Pradesh with annual family income up to ₹3,00,000; maximum of two daughters per family (or up to three in case of second birth twins).",
        "rules": [
            {
                "id": "rule-up-ks-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Uttar Pradesh",
                "isMandatory": True,
                "conditionName": "UP Domicile",
                "sourceClause": "Kanya Sumangala Rules Clause 2"
            },
            {
                "id": "rule-up-ks-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 300000,
                "isMandatory": True,
                "conditionName": "Income Ceiling ₹3 Lakhs",
                "sourceClause": "Kanya Sumangala Rules Clause 3"
            }
        ],
        "documents": [
            {
                "id": "doc-up-ks-birth",
                "name": "Birth Certificate of Girl Child",
                "description": "Birth certificate issued by Nagar Nigam / Gram Panchayat.",
                "requirementType": "mandatory",
                "issuingAuthority": "Registrar of Births & Deaths",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-up-ks-domicile",
                "name": "UP Domicile Certificate",
                "description": "Resident / domicile certificate of parents.",
                "requirementType": "mandatory",
                "issuingAuthority": "Revenue Dept, UP",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-up-ks-bank",
                "name": "Joint / Single Bank Passbook",
                "description": "Bank account in girl's or mother's name with IFSC and Aadhaar seeding.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Register on MKSY Portal",
                "description": "Citizen registers on mksy.up.gov.in and enters family details and Aadhaar.",
                "portalUrl": "https://mksy.up.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Apply for Specific Category / Stage",
                "description": "Select stage (e.g. Birth, Class 1, Class 6, Class 9, College) and upload admission / immunization proof.",
                "portalUrl": "https://mksy.up.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Verification & DBT Release",
                "description": "Block Development Officer (BDO) or SDM approves application, and installment is credited via PFMS.",
                "channel": "district_office"
            }
        ]
    },
    {
        "id": "up-post-matric-scholarship",
        "slug": "uttar-pradesh-post-matric-scholarship",
        "name": "Uttar Pradesh Post-Matric Scholarship & Fee Reimbursement Scheme",
        "shortDescription": "Full fee reimbursement and monthly maintenance stipend for college students from SC, ST, General, OBC, and Minority communities in UP.",
        "fullDescription": "The Uttar Pradesh Post-Matric Scholarship and Fee Reimbursement Scheme reimburses tuition fees and grants monthly maintenance allowances to students studying in Class 11, 12, undergraduate, postgraduate, engineering, medical, and polytechnic courses in recognized institutions. Covers non-refundable fee components up to ₹50,000+ plus maintenance allowances.",
        "category": "scholarship",
        "jurisdiction": "state",
        "state": "Uttar Pradesh",
        "department": "Social Welfare, Backward Classes Welfare & Minority Welfare Departments, Govt of Uttar Pradesh",
        "portalUrl": "https://scholarship.up.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Direct reimbursement of non-refundable course fees plus monthly maintenance stipend (up to ₹1,200/month for hostellers and ₹600/month for day scholars).",
        "eligibilitySummary": "Permanent resident of Uttar Pradesh enrolled in recognized post-matric course; annual family income <= ₹2.5 Lakhs (SC/ST/General) and <= ₹2.0 Lakhs (OBC/Minority).",
        "rules": [
            {
                "id": "rule-up-pms-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Uttar Pradesh",
                "isMandatory": True,
                "conditionName": "UP Domicile",
                "sourceClause": "UP Scholarship Guidelines Clause 2.1"
            },
            {
                "id": "rule-up-pms-income",
                "parameter": "annualFamilyIncome",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 250000,
                "isMandatory": True,
                "conditionName": "Income Ceiling",
                "sourceClause": "UP Scholarship Guidelines Clause 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-up-pms-caste",
                "name": "Caste Certificate from eDistrict UP",
                "description": "Digitally verified caste certificate.",
                "requirementType": "mandatory",
                "issuingAuthority": "Revenue Dept, UP via edistrict.up.gov.in",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-up-pms-income",
                "name": "Income Certificate from eDistrict UP",
                "description": "Valid income certificate for current financial year.",
                "requirementType": "mandatory",
                "issuingAuthority": "Tahsildar via eDistrict",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-up-pms-fee",
                "name": "Fee Receipt and Allotment Letter",
                "description": "Current year college fee deposit receipt and entrance admission slip.",
                "requirementType": "mandatory",
                "issuingAuthority": "College / University Registrar",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Online Registration on UP Scholarship Portal",
                "description": "Submit application on scholarship.up.gov.in, link DigiLocker, and authenticate Aadhaar.",
                "portalUrl": "https://scholarship.up.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Institute Verification and Forwarding",
                "description": "College verifies fee receipt, attendance, and forwards application to District Welfare Officer.",
                "channel": "college_cell"
            },
            {
                "stepNumber": 3,
                "title": "District Scrutiny & PFMS Disbursement",
                "description": "District scholarship committee approves grant; funds disbursed via PFMS into student's bank account.",
                "channel": "online_portal"
            }
        ]
    },

    # ==========================================
    # 7. WEST BENGAL (3 SCHEMES)
    # ==========================================
    {
        "id": "wb-lakshmir-bhandar",
        "slug": "west-bengal-lakshmir-bhandar",
        "name": "West Bengal Lakshmir Bhandar Scheme (Basic Income Support)",
        "shortDescription": "Monthly basic income support of ₹1,200 for SC/ST and ₹1,000 for General/OBC women aged 25-60 in West Bengal.",
        "fullDescription": "Lakshmir Bhandar provides monthly unconditional financial assistance to adult female members of households in West Bengal. Female heads aged 25 to 60 years receive ₹1,200 per month for SC/ST households and ₹1,000 per month for General and OBC households directly into their bank accounts.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "West Bengal",
        "department": "Department of Women & Child Development and Social Welfare, Govt of West Bengal",
        "portalUrl": "https://socialwelfarewb.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹1,200/month for SC/ST women and ₹1,000/month for General/OBC women transferred directly via DBT.",
        "eligibilitySummary": "Female resident of West Bengal aged 25 to 60 years enrolled under Swasthya Sathi or Khadya Sathi, not employed in government jobs or receiving regular government pensions.",
        "rules": [
            {
                "id": "rule-wb-lb-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "West Bengal",
                "isMandatory": True,
                "conditionName": "West Bengal Domicile",
                "sourceClause": "Lakshmir Bhandar Guidelines Section 2"
            },
            {
                "id": "rule-wb-lb-age",
                "parameter": "age",
                "operator": "BETWEEN",
                "expectedValue": [25, 60],
                "isMandatory": True,
                "conditionName": "Age Between 25 and 60 Years",
                "sourceClause": "Lakshmir Bhandar Guidelines Section 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-wb-lb-swasthya",
                "name": "Swasthya Sathi Card",
                "description": "Health card showing applicant as a beneficiary.",
                "requirementType": "mandatory",
                "issuingAuthority": "Health & Family Welfare Dept, WB",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-wb-lb-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar card with West Bengal address.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-wb-lb-caste",
                "name": "SC/ST Certificate",
                "description": "Sub-divisional officer certificate for higher ₹1,200 rate.",
                "requirementType": "conditional",
                "issuingAuthority": "Backward Classes Welfare Dept, WB",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Application at Duare Sarkar Camp",
                "description": "Collect and submit application form during Duare Sarkar outreach camps or municipal offices.",
                "portalUrl": "https://duaresarkar.wb.gov.in",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "BDO / SDO Verification",
                "description": "Block Development Officer verifies Aadhaar and Swasthya Sathi card mapping.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Monthly Direct Benefit Transfer",
                "description": "State treasury deposits ₹1,000 or ₹1,200 monthly directly into the woman's single bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "wb-kanyashree-prakalpa",
        "slug": "west-bengal-kanyashree-prakalpa",
        "name": "West Bengal Kanyashree Prakalpa Scheme (K1 & K2)",
        "shortDescription": "Annual scholarship of ₹1,000 (K1) and one-time grant of ₹25,000 (K2) for adolescent girls in West Bengal.",
        "fullDescription": "Kanyashree Prakalpa is an internationally recognized conditional cash transfer initiative combating child marriage and incentivizing girl child education. Tier 1 (K1) gives an annual scholarship of ₹1,000 to unmarried girls aged 13-18 enrolled in Class 8 to 12. Tier 2 (K2) awards a one-time grant of ₹25,000 when an unmarried girl reaches 18 years and is enrolled in college or vocational studies.",
        "category": "scholarship",
        "jurisdiction": "state",
        "state": "West Bengal",
        "department": "Department of Women and Child Development and Social Welfare, Govt of West Bengal",
        "portalUrl": "https://www.wbkanyashree.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "K1: ₹1,000 annual scholarship; K2: ₹25,000 one-time grant deposited directly into the girl's bank account.",
        "eligibilitySummary": "Unmarried girl resident in West Bengal enrolled as regular student in recognized school, college, or polytechnic institution.",
        "rules": [
            {
                "id": "rule-wb-kp-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "West Bengal",
                "isMandatory": True,
                "conditionName": "West Bengal Domicile",
                "sourceClause": "Kanyashree Scheme Guidelines Section 2"
            },
            {
                "id": "rule-wb-kp-marital",
                "parameter": "isUnmarried",
                "operator": "BOOLEAN",
                "expectedValue": True,
                "isMandatory": True,
                "conditionName": "Unmarried Status",
                "sourceClause": "Kanyashree Scheme Guidelines Section 3.1"
            }
        ],
        "documents": [
            {
                "id": "doc-wb-kp-school",
                "name": "School / College Bonafide Certificate",
                "description": "Certificate showing regular enrollment and date of birth.",
                "requirementType": "mandatory",
                "issuingAuthority": "Head of Institution / Principal",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-wb-kp-unmarried",
                "name": "Unmarried Self-Declaration",
                "description": "Declaration endorsed by parents/guardians that the girl is unmarried.",
                "requirementType": "mandatory",
                "issuingAuthority": "Applicant / Parent",
                "sourceEvidence": "Clause 4.2"
            },
            {
                "id": "doc-wb-kp-bank",
                "name": "Applicant Single Bank Account Passbook",
                "description": "Savings bank account in the girl's own name.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Clause 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Application Form at School / College",
                "description": "Obtain and submit the K1 or K2 application form through your educational institution.",
                "channel": "college_cell"
            },
            {
                "stepNumber": 2,
                "title": "Institution Portal Upload",
                "description": "Head of school/college enters student details and uploads documents on wbkanyashree.gov.in.",
                "portalUrl": "https://www.wbkanyashree.gov.in",
                "channel": "college_cell"
            },
            {
                "stepNumber": 3,
                "title": "Administrative Sanction & Fund Disbursal",
                "description": "District Magistrate sanction leads to direct bank crediting of ₹1,000 (K1) or ₹25,000 (K2).",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "wb-swasthya-sathi",
        "slug": "west-bengal-swasthya-sathi",
        "name": "West Bengal Swasthya Sathi Universal Health Scheme",
        "shortDescription": "Universal cashless secondary and tertiary hospitalization cover up to ₹5,00,000 per family per year in West Bengal.",
        "fullDescription": "Swasthya Sathi is West Bengal's universal group health assurance scheme providing up to ₹5,00,000 cashless hospitalization coverage per family per year across secondary and tertiary healthcare procedures. Smart biometric cards are issued in the name of the eldest female member (mother/grandmother/wife) of the household, ensuring complete family coverage.",
        "category": "healthcare",
        "jurisdiction": "state",
        "state": "West Bengal",
        "department": "Department of Health & Family Welfare, Government of West Bengal",
        "portalUrl": "https://swasthyasathi.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Cashless in-patient hospitalization up to ₹5,00,000 per family per year across 2,000+ medical and surgical packages in empaneled hospitals.",
        "eligibilitySummary": "Universal coverage for all resident families in West Bengal not covered under another statutory government medical scheme.",
        "rules": [
            {
                "id": "rule-wb-ss-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "West Bengal",
                "isMandatory": True,
                "conditionName": "West Bengal Domicile",
                "sourceClause": "Swasthya Sathi Universal Notification Clause 2"
            }
        ],
        "documents": [
            {
                "id": "doc-wb-ss-card",
                "name": "Swasthya Sathi Smart Card",
                "description": "Biometric smart card issued in the name of female family head.",
                "requirementType": "mandatory",
                "issuingAuthority": "Health & Family Welfare Dept, West Bengal",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-wb-ss-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar of patient.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Enroll at Duare Sarkar Camp",
                "description": "Submit Form-B with family details and photo of female head at Duare Sarkar camp.",
                "portalUrl": "https://swasthyasathi.gov.in",
                "channel": "district_office"
            },
            {
                "stepNumber": 2,
                "title": "Receive Biometric Smart Card",
                "description": "Collect personalized Swasthya Sathi smart card with encoded family biometric data.",
                "channel": "district_office"
            },
            {
                "stepNumber": 3,
                "title": "Avail Cashless Hospitalization",
                "description": "Present smart card at Swasthya Sathi helpdesk in any empaneled hospital for cashless treatment.",
                "channel": "district_office"
            }
        ]
    },

    # ==========================================
    # 8. DELHI (2 SCHEMES)
    # ==========================================
    {
        "id": "dl-mahila-samman-yojana",
        "slug": "delhi-mukhyamantri-mahila-samman-yojana",
        "name": "Delhi Mukhyamantri Mahila Samman Yojana",
        "shortDescription": "Direct financial assistance of ₹1,000 per month (₹12,000 per year) for non-taxpayer adult women in Delhi.",
        "fullDescription": "Mukhyamantri Mahila Samman Yojana provides a monthly financial support of ₹1,000 (₹12,000 per year) directly to adult women residing in the National Capital Territory of Delhi. The scheme aims to enhance financial security and autonomy for women who are not government employees, regular taxpayers, or recipients of other governmental welfare pensions.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Delhi",
        "department": "Department of Women and Child Development, Govt of NCT of Delhi",
        "portalUrl": "https://wcd.delhi.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "₹1,000 per month transferred directly to the beneficiary woman's Aadhaar-linked bank account.",
        "eligibilitySummary": "Women aged 18 years and above who are registered voters in NCT of Delhi with valid Delhi voter ID, not paying income tax, not central/state government employees, and not drawing other government pensions.",
        "rules": [
            {
                "id": "rule-dl-msy-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Delhi",
                "isMandatory": True,
                "conditionName": "Delhi Domicile / Voter",
                "sourceClause": "Mahila Samman Yojana Policy Resolution Section 2"
            },
            {
                "id": "rule-dl-msy-age",
                "parameter": "age",
                "operator": "GREATER_THAN_OR_EQUAL",
                "expectedValue": 18,
                "isMandatory": True,
                "conditionName": "Adult Woman 18+ Years",
                "sourceClause": "Mahila Samman Yojana Policy Resolution Section 3.1"
            },
            {
                "id": "rule-dl-msy-tax",
                "parameter": "isIncomeTaxPayer",
                "operator": "BOOLEAN",
                "expectedValue": False,
                "isMandatory": True,
                "conditionName": "Non-Income Tax Payer",
                "sourceClause": "Mahila Samman Yojana Policy Resolution Section 3.2"
            }
        ],
        "documents": [
            {
                "id": "doc-dl-msy-voter",
                "name": "Delhi Voter Identity Card (EPIC)",
                "description": "Valid Voter ID card showing registration in Delhi assembly constituency.",
                "requirementType": "mandatory",
                "issuingAuthority": "Election Commission of India / CEO Delhi",
                "sourceEvidence": "Section 4.1"
            },
            {
                "id": "doc-dl-msy-aadhaar",
                "name": "Aadhaar Card",
                "description": "Aadhaar with Delhi address.",
                "requirementType": "mandatory",
                "issuingAuthority": "UIDAI",
                "sourceEvidence": "Section 4.2"
            },
            {
                "id": "doc-dl-msy-bank",
                "name": "Aadhaar-Seeded Bank Passbook",
                "description": "Beneficiary's single bank account with NPCI mapping.",
                "requirementType": "mandatory",
                "issuingAuthority": "Bank",
                "sourceEvidence": "Section 4.3"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Online / Kiosk Registration",
                "description": "Submit application on the official Delhi Government portal or at authorized registration centers.",
                "portalUrl": "https://wcd.delhi.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Self-Declaration of Non-Taxpayer Status",
                "description": "Sign self-declaration confirming non-taxpayer status and that applicant is not receiving any other government pension.",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Monthly Direct Benefit Transfer",
                "description": "WCD department transfers ₹1,000 every month directly to the verified Aadhaar-linked bank account.",
                "channel": "online_portal"
            }
        ]
    },
    {
        "id": "dl-free-power-water",
        "slug": "delhi-free-power-water-lifeline-scheme",
        "name": "Delhi Free Power & Water Lifeline Scheme",
        "shortDescription": "100% free electricity up to 200 units/month and up to 20,000 liters of free potable water/month in NCT of Delhi.",
        "fullDescription": "The Delhi Lifeline Scheme provides 100% electricity subsidy for domestic consumption up to 200 units per month (and 50% subsidy up to ₹800 for consumption between 201 and 400 units) for consumers opting in. Concurrently, it provides up to 20,000 litres of clean potable water per household per month completely free of charge (with zero sewer and service charges) for all residential metered connections under Delhi Jal Board.",
        "category": "welfare",
        "jurisdiction": "state",
        "state": "Delhi",
        "department": "Power Department & Delhi Jal Board, Government of NCT of Delhi",
        "portalUrl": "https://delhijalboard.delhi.gov.in",
        "feeStatus": "free_verified",
        "benefitDetails": "Zero electricity bill for up to 200 units/month + zero water bill for consumption up to 20,000 litres/month for domestic consumers.",
        "eligibilitySummary": "Domestic residential electricity consumers in NCT of Delhi (BRPL, BYPL, TPDDL) opting into the power subsidy, and households with functional domestic water meters under Delhi Jal Board.",
        "rules": [
            {
                "id": "rule-dl-pw-state",
                "parameter": "state",
                "operator": "EQUALS",
                "expectedValue": "Delhi",
                "isMandatory": True,
                "conditionName": "Delhi Resident Consumer",
                "sourceClause": "Delhi Power & Water Policy Resolution"
            },
            {
                "id": "rule-dl-pw-power",
                "parameter": "monthlyElectricityUnits",
                "operator": "LESS_THAN_OR_EQUAL",
                "expectedValue": 200,
                "isMandatory": True,
                "conditionName": "Monthly Power Consumption <= 200 Units",
                "sourceClause": "Delhi Power Subsidy Scheme Clause 2"
            }
        ],
        "documents": [
            {
                "id": "doc-dl-pw-powerbill",
                "name": "Electricity Bill CA Number",
                "description": "Consumer Account number on BSES Yamuna, BSES Rajdhani, or Tata Power DDL bill.",
                "requirementType": "mandatory",
                "issuingAuthority": "Delhi DISCOMs",
                "sourceEvidence": "Clause 4.1"
            },
            {
                "id": "doc-dl-pw-waterbill",
                "name": "Delhi Jal Board (DJB) K No",
                "description": "Water connection K Number showing metered domestic connection.",
                "requirementType": "mandatory",
                "issuingAuthority": "Delhi Jal Board",
                "sourceEvidence": "Clause 4.2"
            }
        ],
        "applicationSteps": [
            {
                "stepNumber": 1,
                "title": "Opt-In for Electricity Subsidy",
                "description": "Submit opt-in request by sending WhatsApp message with CA number to 7011311111 or via DISCOM website.",
                "portalUrl": "https://power.delhi.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 2,
                "title": "Ensure Functional Water Meter",
                "description": "Ensure working functional water meter installed and registered with Delhi Jal Board.",
                "portalUrl": "https://delhijalboard.delhi.gov.in",
                "channel": "online_portal"
            },
            {
                "stepNumber": 3,
                "title": "Receive Zero Monthly Utility Bills",
                "description": "DISCOM and DJB automatically issue zero bills for consumption within eligible lifeline caps.",
                "channel": "online_portal"
            }
        ]
    }
]

output_path = "/Users/potlasrisharanchowdary/Documents/CODE BENDERS PROJECT /scripts/data/state-schemes.json"
os.makedirs(os.path.dirname(output_path), exist_ok=True)
with open(output_path, "w", encoding="utf-8") as f:
    json.dump(schemes, f, indent=2, ensure_ascii=False)

print(f"Successfully compiled {len(schemes)} state schemes to {output_path}")
