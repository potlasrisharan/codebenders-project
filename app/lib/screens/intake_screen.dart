import 'package:flutter/material.dart';

import '../core/eligibility.dart' show formatInr;
import '../core/profile.dart';
import '../core/sensitive_id_guard.dart';
import '../storage/app_storage.dart';
import '../theme/app_theme.dart';

/// Intake (port of src/routes/IntakePage.tsx and ADAPTIVE_QUESTIONS in
/// src/core/profile/citizen-profile.ts). Sets the citizen profile from a golden
/// persona, from free text, or from the adaptive questions. Every change is saved
/// through [AppStorage].
class IntakeScreen extends StatefulWidget {
  const IntakeScreen({
    super.key,
    required this.profile,
    required this.onProfileChanged,
    required this.onContinue,
  });

  final CitizenProfile profile;
  final ValueChanged<CitizenProfile> onProfileChanged;
  final VoidCallback onContinue;

  @override
  State<IntakeScreen> createState() => _IntakeScreenState();
}

class _IntakeScreenState extends State<IntakeScreen> {
  final AppStorage _storage = AppStorage();
  final TextEditingController _textCtl = TextEditingController();
  int? _personaIndex;
  String? _extractionMessage;

  @override
  void dispose() {
    _textCtl.dispose();
    super.dispose();
  }

  /// Saves [next] to storage and reports it to the parent.
  void _commit(CitizenProfile next) {
    widget.onProfileChanged(next);
    _storage.saveProfile(next);
  }

  void _selectPersona(int index) {
    setState(() {
      _personaIndex = index;
      _extractionMessage = null;
    });
    _commit(goldenPersonas[index].profile);
  }

  void _extract() {
    final shield = inspectSensitiveIds(_textCtl.text);
    if (!shield.isClean) {
      setState(() => _extractionMessage = null);
      return;
    }
    final extraction = extractProfileFromText(_textCtl.text);
    // Only overwrite the attributes the text actually mentioned.
    final overrides = <String, Object?>{
      for (final key in extraction.extractedAttributes)
        key: extraction.profile.fieldValue(key),
    };
    _commit(widget.profile.withOverrides(overrides));
    setState(() {
      _personaIndex = null;
      _extractionMessage = extraction.extractedAttributes.isEmpty
          ? 'No eligibility details found in the text.'
          : 'Extracted ${extraction.extractedAttributes.length} attribute(s): '
              '${extraction.extractedAttributes.join(', ')}.';
    });
  }

  void _answer(String key, Object? value) {
    _commit(widget.profile.withOverrides({key: value}));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    final shield = inspectSensitiveIds(_textCtl.text);

    return Scaffold(
      appBar: AppBar(title: const Text('Intake')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space2),
        children: [
          Text('Tell us about your situation', style: textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.space1),
          const Text(
            'Pick a demo persona, describe your situation in plain words, or answer the '
            'questions below. Never type Aadhaar, PAN or voter ID numbers.',
            style: TextStyle(color: AppColors.colorTextSecondary),
          ),
          const SizedBox(height: AppSpacing.space3),

          // Golden personas.
          Text('Demo personas', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space1),
          Wrap(
            spacing: AppSpacing.space1,
            runSpacing: AppSpacing.space1,
            children: [
              for (var i = 0; i < goldenPersonas.length; i++)
                ChoiceChip(
                  label: Text(goldenPersonas[i].name),
                  selected: _personaIndex == i,
                  onSelected: (_) => _selectPersona(i),
                ),
            ],
          ),
          if (_personaIndex != null) ...[
            const SizedBox(height: AppSpacing.space1),
            Text(goldenPersonas[_personaIndex!].description,
                style: const TextStyle(fontSize: 12, color: AppColors.colorTextSecondary)),
          ],
          const SizedBox(height: AppSpacing.space3),

          // Free text.
          Text('Describe your situation', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space1),
          TextField(
            controller: _textCtl,
            minLines: 3,
            maxLines: 6,
            decoration: const InputDecoration(
              hintText: 'e.g. 2nd year B.Tech student in Hyderabad, BC-B, income 1.2 lakh, 80% attendance',
            ),
            onChanged: (_) => setState(() => _extractionMessage = null),
          ),
          if (!shield.isClean) ...[
            const SizedBox(height: AppSpacing.space1),
            Text(
              shield.userExplanation ?? sensitiveIdUserExplanation,
              style: TextStyle(color: scheme.error, fontSize: 13),
            ),
          ],
          const SizedBox(height: AppSpacing.space1),
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton(
              onPressed: shield.isClean ? _extract : null,
              child: const Text('Extract Attributes'),
            ),
          ),
          if (_extractionMessage != null) ...[
            const SizedBox(height: AppSpacing.space1),
            Text(_extractionMessage!, style: const TextStyle(fontSize: 13)),
          ],
          const SizedBox(height: AppSpacing.space3),

          // Adaptive questions.
          Text('Quick questions', style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space1),
          for (final q in _questions) ...[
            _questionField(q),
            const SizedBox(height: AppSpacing.space2),
          ],
          const SizedBox(height: AppSpacing.space1),

          FilledButton.icon(
            onPressed: widget.onContinue,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Widget _questionField(_Question q) {
    final current = widget.profile.fieldValue(q.key);
    final matches = q.options.any((o) => o.value == current);

    return DropdownButtonFormField<Object?>(
      key: ValueKey('${q.key}-$current'),
      initialValue: matches ? current : null,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: q.text,
        helperText: q.why,
        helperMaxLines: 3,
      ),
      items: [
        const DropdownMenuItem<Object?>(
          value: null,
          child: Text("I don't know"),
        ),
        // Keep a value that is set but not offered as an option visible.
        if (current != null && !matches)
          DropdownMenuItem<Object?>(
            value: current,
            child: Text('Saved: ${_describe(q.key, current)}'),
          ),
        for (final o in q.options)
          DropdownMenuItem<Object?>(value: o.value, child: Text(o.label)),
      ],
      onChanged: (v) => _answer(q.key, v),
    );
  }

  static String _describe(String key, Object current) {
    if (current is num && (key == 'familyIncome')) return '₹${formatInr(current)}';
    return current.toString();
  }
}

class _Option {
  const _Option(this.label, this.value);

  final String label;
  final Object value;
}

class _Question {
  const _Question({
    required this.key,
    required this.text,
    required this.why,
    required this.options,
  });

  /// TS CitizenProfile key (also used by [CitizenProfile.fieldValue]).
  final String key;
  final String text;
  final String why;
  final List<_Option> options;
}

/// The nine adaptive questions from ADAPTIVE_QUESTIONS (citizen-profile.ts).
const List<_Question> _questions = [
  _Question(
    key: 'domicileState',
    text: 'Which state are you a permanent resident/native of?',
    why: 'State government scholarships (like Telangana ePASS) require state domicile, while Central schemes apply across India.',
    options: [
      _Option('Telangana', 'Telangana'),
      _Option('Andhra Pradesh', 'Andhra Pradesh'),
      _Option('Karnataka', 'Karnataka'),
      _Option('Maharashtra', 'Maharashtra'),
      _Option('Tamil Nadu', 'Tamil Nadu'),
      _Option('Other State', 'Other'),
    ],
  ),
  _Question(
    key: 'educationLevel',
    text: 'What is your current level of education?',
    why: 'Most scholarships are specific to post-matric, degree (B.Tech/B.Sc), diploma, or intermediate education.',
    options: [
      _Option('Undergraduate / College (B.Tech, B.Sc, B.Com, MBBS, etc.)', 'undergraduate'),
      _Option('Intermediate / Class 11-12 (+2)', 'intermediate'),
      _Option('Diploma / Polytechnic', 'diploma'),
      _Option('Postgraduate (M.Tech, M.Sc, MBA, etc.)', 'postgraduate'),
    ],
  ),
  _Question(
    key: 'courseStream',
    text: 'What stream is your course?',
    why: 'Schemes like AICTE Pragati and Saksham specifically fund technical engineering and pharmacy courses.',
    options: [
      _Option('Engineering / Technology (B.Tech / B.E)', 'engineering'),
      _Option('Degree (B.Sc, B.Com, B.A)', 'degree_arts_science'),
      _Option('Pharmacy (B.Pharm)', 'pharmacy'),
      _Option('Polytechnic Diploma', 'technical_diploma'),
      _Option('General / Other', 'general'),
    ],
  ),
  _Question(
    key: 'socialCategory',
    text: 'What is your social / reservation category?',
    why: 'Government welfare departments (SC, ST, BC, Minority) have dedicated fee reimbursement funds with different income thresholds.',
    options: [
      _Option('SC (Scheduled Caste)', 'SC'),
      _Option('ST (Scheduled Tribe)', 'ST'),
      _Option('BC-A', 'BC-A'),
      _Option('BC-B', 'BC-B'),
      _Option('BC-C', 'BC-C'),
      _Option('BC-D', 'BC-D'),
      _Option('BC-E', 'BC-E'),
      _Option('EBC (Economically Backward Class)', 'EBC'),
      _Option('Minority (Muslim, Christian, Sikh, Jain, Buddhist)', 'Minority'),
      _Option('General / OC', 'General'),
    ],
  ),
  _Question(
    key: 'familyIncome',
    text: 'What is your total annual family income (from all sources)?',
    why: 'Scholarships have official income caps certified by MeeSeva Tahsildar (e.g. ₹2 Lakhs for ePASS, ₹4.5 Lakhs for CSSS, ₹8 Lakhs for AICTE).',
    options: [
      _Option('Below ₹1,50,000 / year (Rural BC/EBC limit)', 140000),
      _Option('Below ₹2,00,000 / year (SC/ST & Urban ePASS limit)', 190000),
      _Option('Below ₹4,50,000 / year (Central Sector CSSS limit)', 350000),
      _Option('Below ₹8,00,000 / year (AICTE Pragati limit)', 600000),
      _Option('Above ₹8,00,000 / year', 1000000),
    ],
  ),
  _Question(
    key: 'attendancePercentage',
    text: 'What is your certified college attendance percentage?',
    why: 'Telangana ePASS mandates at least 75% quarterly attendance certified by your Principal to release tuition and mess fee.',
    options: [
      _Option('75% or higher (Meets requirement)', 80),
      _Option('Below 75%', 65),
    ],
  ),
  _Question(
    key: 'gender',
    text: 'What is your gender?',
    why: 'Special affirmative schemes (like AICTE Pragati) provide dedicated funding exclusively for female students.',
    options: [
      _Option('Female', 'female'),
      _Option('Male', 'male'),
      _Option('Other', 'other'),
    ],
  ),
  _Question(
    key: 'hasDisability',
    text: 'Do you have a certified physical disability (UDID 40%+)?',
    why: 'AICTE Saksham and Disabled Welfare schemes offer dedicated grants for students with benchmark disability.',
    options: [
      _Option('Yes, 40% or more (UDID certified)', true),
      _Option('No', false),
    ],
  ),
  _Question(
    key: 'twelfthPercentile',
    text: 'Did you score in the top 20th percentile (80th percentile+) in Class 12 / Intermediate?',
    why: 'The Central Sector Scheme (CSSS) requires scoring above the 80th percentile cutoff of the State Board (TSBIE).',
    options: [
      _Option('Yes, top percentile (> 80 percentile / 90%+ marks)', 85),
      _Option('No / Average score', 65),
    ],
  ),
];
