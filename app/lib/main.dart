import 'package:flutter/material.dart';

import 'core/profile.dart';
import 'core/tracker.dart';
import 'screens/admin_review_screen.dart';
import 'screens/checklist_screen.dart';
import 'screens/intake_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/scheme_bridge.dart';
import 'screens/tracker_screen.dart';
import 'storage/app_storage.dart';
import 'theme/app_theme.dart';

/// Scheme seeded into an empty tracker on first run (as on the website).
const String _seedSchemeId = 'ts-epass-rtf-2026';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _seedTrackerIfEmpty();
  runApp(const LabhSaathiApp());
}

/// Adds the seed scheme when the tracker has no saved claims yet.
Future<void> _seedTrackerIfEmpty() async {
  final storage = AppStorage();
  final claims = await storage.loadTrackedClaims();
  if (claims.isNotEmpty) return;
  final seed = findSchemeByKey(_seedSchemeId);
  if (seed == null || seed.id != _seedSchemeId) return;
  addClaim(claims, seed);
  await storage.saveTrackedClaims(claims);
}

class LabhSaathiApp extends StatelessWidget {
  const LabhSaathiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LabhSaathi',
      theme: buildAppTheme(),
      home: LandingScreen(
        shellBuilder: (_) => const AppShell(),
      ),
      // Unknown routes go to the Intake tab.
      onUnknownRoute: (_) => MaterialPageRoute<void>(
        builder: (_) => const AppShell(initialIndex: 0),
      ),
    );
  }
}

/// Main shell: five tabs (Intake, Matches, Checklist, Tracker, Admin review).
/// Owns the citizen profile and tracked claims, loaded from [AppStorage].
class AppShell extends StatefulWidget {
  const AppShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final AppStorage _storage = AppStorage();

  late int _index = widget.initialIndex;
  CitizenProfile _profile = goldenPersonas[0].profile;
  List<TrackedClaim> _claims = [];
  bool _loaded = false;

  /// Bumped when claims change so the tabs that load claims on init reload them.
  int _claimsVersion = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final profile = await _storage.loadProfile();
    final claims = await _storage.loadTrackedClaims();
    if (!mounted) return;
    setState(() {
      _profile = profile ?? goldenPersonas[0].profile;
      _claims = claims;
      _loaded = true;
    });
  }

  void _setProfile(CitizenProfile profile) => setState(() => _profile = profile);

  void _setClaims(List<TrackedClaim> claims) {
    setState(() {
      _claims = claims;
      _claimsVersion++;
    });
    _storage.saveTrackedClaims(claims);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          IntakeScreen(
            profile: _profile,
            onProfileChanged: _setProfile,
            onContinue: () => setState(() => _index = 1),
          ),
          MatchesScreen(
            profile: _profile,
            claims: _claims,
            onClaimsChanged: _setClaims,
          ),
          ChecklistScreen(key: ValueKey('checklist-$_claimsVersion')),
          TrackerScreen(key: ValueKey('tracker-$_claimsVersion')),
          const AdminReviewScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Intake',
          ),
          NavigationDestination(
            icon: Icon(Icons.fact_check_outlined),
            selectedIcon: Icon(Icons.fact_check),
            label: 'Matches',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist),
            label: 'Checklist',
          ),
          NavigationDestination(
            icon: Icon(Icons.timeline_outlined),
            selectedIcon: Icon(Icons.timeline),
            label: 'Tracker',
          ),
          NavigationDestination(
            icon: Icon(Icons.admin_panel_settings_outlined),
            selectedIcon: Icon(Icons.admin_panel_settings),
            label: 'Admin review',
          ),
        ],
      ),
    );
  }
}
