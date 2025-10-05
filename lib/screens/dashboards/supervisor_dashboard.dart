import 'package:flutter/material.dart';
import 'package:morse_proj/screens/dashboards/supervisor_tabs/feedback_tab.dart';
import 'package:morse_proj/screens/dashboards/supervisor_tabs/impact_score_tab.dart';
import 'package:morse_proj/screens/dashboards/supervisor_tabs/seasonal_forecasting_tab.dart';
import 'package:morse_proj/screens/dashboards/supervisor_tabs/staff_performance_tab.dart';
import 'package:morse_proj/screens/usp_features/blockchain_info_screen.dart';
import 'package:morse_proj/screens/usp_features/settings_screen.dart';
import 'package:morse_proj/screens/usp_features/sos_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SupervisorDashboard extends StatefulWidget {
  final String language;
  const SupervisorDashboard({super.key, required this.language});

  @override
  State<SupervisorDashboard> createState() => _SupervisorDashboardState();
}

class _SupervisorDashboardState extends State<SupervisorDashboard> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;
  late final List<String> _appBarTitles;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      ImpactScoreTab(language: widget.language),
      SeasonalForecastingTab(language: widget.language),
      StaffPerformanceTab(language: widget.language),
      FeedbackTab(language: widget.language),
    ];

    _appBarTitles = [
      _getText('Impact Score', 'प्रभाव स्कोर', 'प्रभाव गुण'),
      _getText('Forecasting', 'पूर्वानुमान', 'अंदाज'),
      _getText('Staff Performance', 'स्टाफ प्रदर्शन', 'कर्मचारी कामगिरी'),
      _getText('Feedback', 'प्रतिक्रिया', 'अभिप्राय'),
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
  centerTitle: false,  // Add this line
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
            icon: const Icon(Icons.security_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BlockchainInfoScreen()),
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
            icon: const Icon(Icons.dashboard_customize_outlined),
            label: _getText('Impact', 'प्रभाव', 'प्रभाव'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.online_prediction_outlined),
            label: _getText('Forecasting', 'पूर्वानुमान', 'अंदाज'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.insights_outlined),
            label: _getText('Performance', 'प्रदर्शन', 'कामगिरी'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.reviews_outlined),
            label: _getText('Feedback', 'प्रतिक्रिया', 'अभिप्राय'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.accentTeal,
        unselectedItemColor: AppTheme.textLight,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
