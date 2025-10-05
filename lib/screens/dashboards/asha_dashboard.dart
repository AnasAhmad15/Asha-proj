import 'package:flutter/material.dart';
import 'package:morse_proj/screens/dashboards/asha_tabs/patients_tab.dart';
import 'package:morse_proj/screens/dashboards/asha_tabs/recognition_wall_tab.dart';
import 'package:morse_proj/screens/dashboards/asha_tabs/rewards_tab.dart';
import 'package:morse_proj/screens/dashboards/asha_tabs/visits_tab.dart';
import 'package:morse_proj/screens/usp_features/settings_screen.dart';
import 'package:morse_proj/screens/usp_features/sos_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class AshaDashboard extends StatefulWidget {
  final String language;
  const AshaDashboard({super.key, required this.language});

  @override
  State<AshaDashboard> createState() => _AshaDashboardState();
}

class _AshaDashboardState extends State<AshaDashboard> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;
  late final List<String> _appBarTitles;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      PatientsTab(language: widget.language),
      VisitsTab(language: widget.language),
      RewardsTab(language: widget.language),
      RecognitionWallTab(language: widget.language),
    ];

    _appBarTitles = [
      _getText('Patients', 'रोगी', 'रुग्ण'),
      _getText('Visits', 'विज़िट', 'भेटी'),
      _getText('Rewards', 'पुरस्कार', 'पुरस्कार'),
      _getText('Recognition', 'मान्यता', 'मान्यता'),
    ];
  }

  String _getText(String en, String hi, String mr) {
    switch (widget.language) {
      case 'hi':
        return hi;
      case 'mr':
        return mr;
      default:
        return en;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSosDialog() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SosScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles.elementAt(_selectedIndex)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showSosDialog,
        label: Text(_getText('SOS', 'SOS', 'SOS')),
        icon: const Icon(Icons.emergency_outlined),
        backgroundColor: AppTheme.errorRed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.people_alt_outlined),
            label: _getText('Patients', 'रोगी', 'रुग्ण'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.medical_services_outlined),
            label: _getText('Visits', 'विज़िट', 'भेटी'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_border_outlined),
            label: _getText('Rewards', 'पुरस्कार', 'पुरस्कार'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.emoji_events_outlined),
            label: _getText('Recognition', 'मान्यता', 'मान्यता'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: AppTheme.textLight,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
