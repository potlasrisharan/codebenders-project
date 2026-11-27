"""
scripts/catalog/builder.py
Schema and helper factories for generating verified scheme records.
"""

def make_scheme(*args, **kwargs):
    # Handle both positional and keyword arguments smoothly
    id = kwargs.get("id")
    slug = kwargs.get("slug") or id
    name = kwargs.get("name")
    short_description = kwargs.get("short_description") or kwargs.get("shortDescription")
    full_description = kwargs.get("full_description") or kwargs.get("fullDescription") or short_description
    category = kwargs.get("category")
    jurisdiction = kwargs.get("jurisdiction")
    state = kwargs.get("state")
    ministry = kwargs.get("ministry")
    department = kwargs.get("department")
    portal_url = kwargs.get("portal_url") or kwargs.get("portalUrl")
    benefit_details = kwargs.get("benefit_details") or kwargs.get("benefitDetails") or ""
    eligibility_summary = kwargs.get("eligibility_summary") or kwargs.get("eligibilitySummary") or ""
    rules = kwargs.get("rules") or []
    documents = kwargs.get("documents") or []
    steps = kwargs.get("steps") or kwargs.get("applicationSteps") or []
    fee_status = kwargs.get("fee_status") or kwargs.get("feeStatus") or "free_verified"
    fee_details = kwargs.get("fee_details") or kwargs.get("feeDetails") or "Official application is free of cost. Beware of middlemen charging illegal fees."
    renewal_supported = kwargs.get("renewal_supported") or kwargs.get("renewalSupported") or False
    renewal_window = kwargs.get("renewal_window") or kwargs.get("renewalWindow")
    scam_warning = kwargs.get("scam_warning") or kwargs.get("scamWarning") or "Official government applications must be submitted via the designated portal or authorised MeeSeva/CSC centre. No third-party agent is authorized to collect fees or guarantee approval."

    valid_categories = {
        "scholarship", "education_aid", "fellowship", "welfare", 
        "healthcare", "agriculture", "housing", "livelihood", "pension"
    }
    if category not in valid_categories:
        raise ValueError(f"Invalid category '{category}' for scheme {id}")
        
    return {
        "id": id,
        "slug": slug or id,
        "name": name,
        "shortDescription": short_description,
        "fullDescription": full_description,
        "category": category,
        "jurisdiction": jurisdiction,
        "state": state,
        "ministry": ministry,
        "department": department,
        "portalUrl": portal_url,
        "feeStatus": fee_status,
        "feeDetails": fee_details,
        "benefitDetails": benefit_details,
        "eligibilitySummary": eligibility_summary,
        "renewalSupported": renewal_supported,
        "renewalWindow": renewal_window,
        "scamWarning": scam_warning,
        "rules": rules,
        "documents": documents,
        "applicationSteps": steps
    }

def make_rule(param, op, expected, name, clause, mandatory=True):
    return {
        "id": f"rule-{param}-{op.lower()}",
        "parameter": param,
        "operator": op,
        "expectedValue": expected,
        "isMandatory": mandatory,
        "conditionName": name,
        "sourceClause": clause
    }

def make_doc(doc_id, name, desc, authority, clause, req_type="mandatory"):
    return {
        "id": doc_id,
        "name": name,
        "description": desc,
        "requirementType": req_type,
        "issuingAuthority": authority,
        "sourceEvidence": clause
    }

def make_step(step_num, title, desc, channel="online_portal", url=None):
    step = {
        "stepNumber": step_num,
        "title": title,
        "description": desc,
        "channel": channel
    }
    if url:
        step["portalUrl"] = url
    return step
