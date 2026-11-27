/// Port of src/core/profile/citizen-profile.ts: CitizenProfile, golden personas,
/// and the free-text extractor. Pure Dart (no Flutter imports).
library;

import 'sensitive_id_guard.dart';

/// Citizen profile. Field names match the TS CitizenProfile keys so that
/// [fieldValue] can look up rule parameters by name, as the TS does.
/// Enum-valued fields are kept as Strings with the TS wire values.
class CitizenProfile {
  const CitizenProfile({
    this.id,
    this.domicileState,
    this.educationLevel,
    this.courseStream,
    this.socialCategory,
    this.familyIncome,
    this.attendancePercentage,
    this.gender,
    this.hasDisability,
    this.twelfthPercentile,
    this.isAgriculturalLandholder,
  });

  final String? id;
  final String? domicileState;
  /// 'intermediate' | 'undergraduate' | 'postgraduate' | 'diploma' | 'school'
  final String? educationLevel;
  final String? courseStream;
  /// 'SC' | 'ST' | 'BC-A' | 'BC-B' | 'BC-C' | 'BC-D' | 'BC-E' | 'EBC' | 'Minority' | 'General'
  final String? socialCategory;
  final num? familyIncome;
  final num? attendancePercentage;
  /// 'female' | 'male' | 'other'
  final String? gender;
  final bool? hasDisability;
  final num? twelfthPercentile;
  final bool? isAgriculturalLandholder;

  /// Looks up a profile attribute by its TS key. Unknown keys return null.
  Object? fieldValue(String key) {
    switch (key) {
      case 'id':
        return id;
      case 'domicileState':
        return domicileState;
      case 'educationLevel':
        return educationLevel;
      case 'courseStream':
        return courseStream;
      case 'socialCategory':
        return socialCategory;
      case 'familyIncome':
        return familyIncome;
      case 'attendancePercentage':
        return attendancePercentage;
      case 'gender':
        return gender;
      case 'hasDisability':
        return hasDisability;
      case 'twelfthPercentile':
        return twelfthPercentile;
      case 'isAgriculturalLandholder':
        return isAgriculturalLandholder;
      default:
        return null;
    }
  }

  /// Returns a copy with the keys present in [overrides] replaced (TS spread
  /// semantics: a present key wins even when its value is null).
  CitizenProfile withOverrides(Map<String, Object?> overrides) {
    Object? pick(String key, Object? current) =>
        overrides.containsKey(key) ? overrides[key] : current;

    return CitizenProfile(
      id: pick('id', id) as String?,
      domicileState: pick('domicileState', domicileState) as String?,
      educationLevel: pick('educationLevel', educationLevel) as String?,
      courseStream: pick('courseStream', courseStream) as String?,
      socialCategory: pick('socialCategory', socialCategory) as String?,
      familyIncome: pick('familyIncome', familyIncome) as num?,
      attendancePercentage: pick('attendancePercentage', attendancePercentage) as num?,
      gender: pick('gender', gender) as String?,
      hasDisability: pick('hasDisability', hasDisability) as bool?,
      twelfthPercentile: pick('twelfthPercentile', twelfthPercentile) as num?,
      isAgriculturalLandholder:
          pick('isAgriculturalLandholder', isAgriculturalLandholder) as bool?,
    );
  }

  /// JSON map using the same TS keys as [fieldValue]. Mirrors JSON.stringify of
  /// the TS profile in ProfileContext.tsx.
  Map<String, Object?> toJson() => {
        'id': id,
        'domicileState': domicileState,
        'educationLevel': educationLevel,
        'courseStream': courseStream,
        'socialCategory': socialCategory,
        'familyIncome': familyIncome,
        'attendancePercentage': attendancePercentage,
        'gender': gender,
        'hasDisability': hasDisability,
        'twelfthPercentile': twelfthPercentile,
        'isAgriculturalLandholder': isAgriculturalLandholder,
      };

  /// Inverse of [toJson]. Throws on mistyped values; callers decide the fallback.
  factory CitizenProfile.fromJson(Map<String, Object?> json) {
    String? str(String key) => json[key] as String?;
    num? number(String key) => json[key] as num?;
    bool? flag(String key) => json[key] as bool?;

    return CitizenProfile(
      id: str('id'),
      domicileState: str('domicileState'),
      educationLevel: str('educationLevel'),
      courseStream: str('courseStream'),
      socialCategory: str('socialCategory'),
      familyIncome: number('familyIncome'),
      attendancePercentage: number('attendancePercentage'),
      gender: str('gender'),
      hasDisability: flag('hasDisability'),
      twelfthPercentile: number('twelfthPercentile'),
      isAgriculturalLandholder: flag('isAgriculturalLandholder'),
    );
  }
}

/// EMPTY_CITIZEN_PROFILE: every attribute null.
const CitizenProfile emptyCitizenProfile = CitizenProfile();

class GoldenPersona {
  const GoldenPersona({
    required this.name,
    required this.description,
    required this.profile,
  });

  final String name;
  final String description;
  final CitizenProfile profile;
}

/// 6 synthetic golden demo personas. Index 0 is Priya.
const List<GoldenPersona> goldenPersonas = [
  GoldenPersona(
    name: 'Priya (Telangana B.Tech Student)',
    description: '2nd year B.Tech student in Hyderabad, BC-B category, family income ₹1.2 Lakhs, 80% attendance.',
    profile: CitizenProfile(
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'engineering',
      socialCategory: 'BC-B',
      familyIncome: 120000,
      attendancePercentage: 80,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: 72,
      isAgriculturalLandholder: false,
    ),
  ),
  GoldenPersona(
    name: 'Rajesh (SC Degree Student - Merit Achiever)',
    description: '1st year B.Sc student in Warangal, SC category, income ₹1.8 Lakhs, 78% attendance, 85th percentile in 12th.',
    profile: CitizenProfile(
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'degree_arts_science',
      socialCategory: 'SC',
      familyIncome: 180000,
      attendancePercentage: 78,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: 85,
      isAgriculturalLandholder: false,
    ),
  ),
  GoldenPersona(
    name: 'Ananya (AICTE Engineering Girl Student)',
    description: '1st year B.Tech girl student in approved technical college, General category, family income ₹3.5 Lakhs.',
    profile: CitizenProfile(
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'engineering',
      socialCategory: 'General',
      familyIncome: 350000,
      attendancePercentage: 85,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: 75,
      isAgriculturalLandholder: false,
    ),
  ),
  GoldenPersona(
    name: 'Suresh (Incomplete Information - Missing Income)',
    description: 'Degree student in Nizamabad, BC-A, attendance 82%, but family income is unknown ("I don\'t know").',
    profile: CitizenProfile(
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'degree_arts_science',
      socialCategory: 'BC-A',
      familyIncome: null, // Unknown!
      attendancePercentage: 82,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: null,
      isAgriculturalLandholder: false,
    ),
  ),
  GoldenPersona(
    name: 'Vikram (High Income - Ineligible for Needs-based)',
    description: 'College student from affluent family with income ₹12 Lakhs/year, General category.',
    profile: CitizenProfile(
      domicileState: 'Telangana',
      educationLevel: 'undergraduate',
      courseStream: 'engineering',
      socialCategory: 'General',
      familyIncome: 1200000, // Exceeds all welfare ceilings
      attendancePercentage: 88,
      gender: 'male',
      hasDisability: false,
      twelfthPercentile: 70,
      isAgriculturalLandholder: false,
    ),
  ),
  GoldenPersona(
    name: 'Sneha (Out of State Domicile - Karnataka)',
    description: 'Karnataka domicile studying in college, family income ₹2 Lakhs.',
    profile: CitizenProfile(
      domicileState: 'Karnataka',
      educationLevel: 'undergraduate',
      courseStream: 'degree_arts_science',
      socialCategory: 'BC-A',
      familyIncome: 200000,
      attendancePercentage: 80,
      gender: 'female',
      hasDisability: false,
      twelfthPercentile: 82,
      isAgriculturalLandholder: false,
    ),
  ),
];

class ProfileExtraction {
  const ProfileExtraction({required this.profile, required this.extractedAttributes});

  final CitizenProfile profile;
  final List<String> extractedAttributes;
}

/// Natural-language parser (English & Telugu keywords). Extracts candidate
/// attributes from [rawText] after the Sensitive-ID Shield has redacted it.
ProfileExtraction extractProfileFromText(String rawText) {
  // First pass: Privacy Shield
  final safeText = inspectSensitiveIds(rawText).safeText.toLowerCase();

  String? domicileState;
  String? educationLevel;
  String? courseStream;
  String? socialCategory;
  num? familyIncome;
  num? attendancePercentage;
  String? gender;
  bool? hasDisability;
  final extracted = <String>[];

  // 1. Domicile State
  if (safeText.contains('telangana') ||
      safeText.contains('hyderabad') ||
      safeText.contains('warangal') ||
      safeText.contains('తెలంగాణ') ||
      safeText.contains('హైదరాబాద్') ||
      safeText.contains('వరంగల్')) {
    domicileState = 'Telangana';
    extracted.add('domicileState');
  } else if (safeText.contains('andhra') || safeText.contains('ఆంధ్ర')) {
    domicileState = 'Andhra Pradesh';
    extracted.add('domicileState');
  } else if (safeText.contains('karnataka') ||
      safeText.contains('bengaluru') ||
      safeText.contains('కర్ణాటక')) {
    domicileState = 'Karnataka';
    extracted.add('domicileState');
  }

  // 2. Education Level & Course Stream
  if (safeText.contains('btech') ||
      safeText.contains('b.tech') ||
      safeText.contains('engineering') ||
      safeText.contains('ఇంజనీరింగ్')) {
    educationLevel = 'undergraduate';
    courseStream = 'engineering';
    extracted.addAll(['educationLevel', 'courseStream']);
  } else if (safeText.contains('degree') ||
      safeText.contains('bsc') ||
      safeText.contains('b.sc') ||
      safeText.contains('bcom') ||
      safeText.contains('డిగ్రీ')) {
    educationLevel = 'undergraduate';
    courseStream = 'degree_arts_science';
    extracted.addAll(['educationLevel', 'courseStream']);
  } else if (safeText.contains('intermediate') ||
      safeText.contains('inter') ||
      safeText.contains('12th') ||
      safeText.contains('ఇంటర్')) {
    educationLevel = 'intermediate';
    extracted.add('educationLevel');
  } else if (safeText.contains('diploma') ||
      safeText.contains('polytechnic') ||
      safeText.contains('డిప్లొమా')) {
    educationLevel = 'diploma';
    courseStream = 'technical_diploma';
    extracted.addAll(['educationLevel', 'courseStream']);
  }

  // 3. Social Category
  if (RegExp(r'\bsc\b|scheduled caste|ఎస్సీ').hasMatch(safeText)) {
    socialCategory = 'SC';
    extracted.add('socialCategory');
  } else if (RegExp(r'\bst\b|scheduled tribe|ఎస్టీ').hasMatch(safeText)) {
    socialCategory = 'ST';
    extracted.add('socialCategory');
  } else if (RegExp(r'\bbc[- ]?b\b').hasMatch(safeText)) {
    socialCategory = 'BC-B';
    extracted.add('socialCategory');
  } else if (RegExp(r'\bbc[- ]?a\b').hasMatch(safeText)) {
    socialCategory = 'BC-A';
    extracted.add('socialCategory');
  } else if (RegExp(r'\bbc\b|backward class|బీసీ').hasMatch(safeText)) {
    socialCategory = 'BC-B';
    extracted.add('socialCategory');
  } else if (RegExp(r'\bminority\b|muslim|christian|మైనారిటీ').hasMatch(safeText)) {
    socialCategory = 'Minority';
    extracted.add('socialCategory');
  } else if (RegExp(r'\bebc\b').hasMatch(safeText)) {
    socialCategory = 'EBC';
    extracted.add('socialCategory');
  }

  // 4. Income patterns (e.g. "1.5 lakh", "150000", "2 lakhs", "లక్ష")
  final lakhMatch =
      RegExp(r'(\d+(?:\.\d+)?)\s*(?:lakh|lakhs|lac|లక్ష)').firstMatch(safeText);
  if (lakhMatch != null) {
    final lakhVal = double.parse(lakhMatch.group(1)!);
    familyIncome = (lakhVal * 100000).round();
    extracted.add('familyIncome');
  } else {
    final rawNumberMatch = RegExp(r'\b([1-9]\d{4,6})\b').firstMatch(safeText);
    if (rawNumberMatch != null) {
      familyIncome = int.parse(rawNumberMatch.group(1)!);
      extracted.add('familyIncome');
    }
  }

  // 5. Attendance (e.g. "80% attendance", "75 percent")
  final attMatch = RegExp(r'(\d{2})\s*(?:%|percent|శాతం)').firstMatch(safeText);
  if (attMatch != null) {
    attendancePercentage = int.parse(attMatch.group(1)!);
    extracted.add('attendancePercentage');
  }

  // 6. Gender
  if (RegExp(r'\bgirl\b|\bfemale\b|\bwoman\b|అమ్మాయి|మహిళ').hasMatch(safeText)) {
    gender = 'female';
    extracted.add('gender');
  } else if (RegExp(r'\bboy\b|\bmale\b|\bman\b|అబ్బాయి').hasMatch(safeText)) {
    gender = 'male';
    extracted.add('gender');
  }

  // 7. Disability
  if (RegExp(r'\bdisabled\b|\bdisability\b|\bhandicapped\b|\budid\b|దివ్యాంగుల')
      .hasMatch(safeText)) {
    hasDisability = true;
    extracted.add('hasDisability');
  }

  return ProfileExtraction(
    profile: CitizenProfile(
      domicileState: domicileState,
      educationLevel: educationLevel,
      courseStream: courseStream,
      socialCategory: socialCategory,
      familyIncome: familyIncome,
      attendancePercentage: attendancePercentage,
      gender: gender,
      hasDisability: hasDisability,
    ),
    extractedAttributes: extracted.toSet().toList(),
  );
}
