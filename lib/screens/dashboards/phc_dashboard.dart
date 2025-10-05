import 'package:flutter/material.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/feedback_tab.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/patient_records_tab.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/reports_forecasting_tab.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/staff_monitoring_tab.dart';
import 'package:morse_proj/screens/usp_features/settings_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class PhcDashboard extends StatefulWidget {
  final String language;
  const PhcDashboard({super.key, required this.language});
  @override
  State<PhcDashboard> createState() => _PhcDashboardState();
}

class _PhcDashboardState extends State<PhcDashboard> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;
  late final List<String> _appBarTitles;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      PatientRecordsTab(language: widget.language),
      ReportsForecastingTab(language: widget.language),
      FeedbackTab(language: widget.language),
      StaffMonitoringTab(language: widget.language),
    ];

    _appBarTitles = [
      _getText('Patient Records', 'रोगी रिकॉर्ड', 'रुग्ण रेकॉर्ड'),
      _getText('Reports', 'रिपोर्ट', 'अहवाल'),
      _getText('Feedback', 'प्रतिक्रिया', 'अभिप्राय'),
      _getText('Staff Monitoring', 'स्टाफ निगरानी', 'कर्मचारी निरीक्षण'),
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
            icon: const Icon(Icons.sync_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SmartSyncScreen()),
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.folder_shared_outlined),
            label: _getText('Records', 'रिकॉर्ड', 'रेकॉर्ड'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.analytics_outlined),
            label: _getText('Reports', 'रिपोर्ट', 'अहवाल'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.feedback_outlined),
            label: _getText('Feedback', 'प्रतिक्रिया', 'अभिप्राय'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.groups_outlined),
            label: _getText('Monitoring', 'निगरानी', 'निरीक्षण'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.secondaryGreen,
        unselectedItemColor: AppTheme.textLight,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
