import 'package:flutter/material.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/feedback_tab.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/patient_records_tab.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/reports_forecasting_tab.dart';
import 'package:morse_proj/screens/dashboards/phc_tabs/staff_monitoring_tab.dart';
import 'package:morse_proj/screens/usp_features/settings_screen.dart';
import 'package:morse_proj/screens/usp_features/smart_sync_screen.dart';
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
      _DashboardOverview(
        language: widget.language,
        onNavigate: (index) => _onItemTapped(index),
      ),
      PatientRecordsTab(language: widget.language),
      ReportsForecastingTab(language: widget.language),
      FeedbackTab(language: widget.language),
      StaffMonitoringTab(language: widget.language),
    ];

    _appBarTitles = [
      _getText('PHC Dashboard', 'PHC डैशबोर्ड', 'PHC डॅशबोर्ड'),
      _getText('Patient Records', 'रोगी रिकॉर्ड', 'रुग्ण रेकॉर्ड'),
      _getText('Reports & Analytics', 'रिपोर्ट और विश्लेषण', 'अहवाल आणि विश्लेषण'),
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
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          _appBarTitles.elementAt(_selectedIndex),
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.w600,
            color: _selectedIndex == 0 ? AppTheme.textDark : Colors.white,
          ),
        ),
        centerTitle: false,
        titleSpacing: 16,
        toolbarHeight: 68,
        backgroundColor: _selectedIndex == 0 ? Colors.white : AppTheme.primaryBlue,
        foregroundColor: _selectedIndex == 0 ? AppTheme.textDark : Colors.white,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(0.1),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 
                    ? AppTheme.primaryBlue.withOpacity(0.1)
                    : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.sync_outlined, 
                  color: _selectedIndex == 0 ? AppTheme.primaryBlue : Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SmartSyncScreen()),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 
                    ? AppTheme.accentTeal.withOpacity(0.1)
                    : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.notifications_outlined, 
                  color: _selectedIndex == 0 ? AppTheme.accentTeal : Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 
                    ? AppTheme.secondaryGreen.withOpacity(0.1)
                    : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.settings_outlined, 
                  color: _selectedIndex == 0 ? AppTheme.secondaryGreen : Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard_outlined),
              activeIcon: const Icon(Icons.dashboard),
              label: _getText('Dashboard', 'डैशबोर्ड', 'डॅशबोर्ड'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.folder_shared_outlined),
              activeIcon: const Icon(Icons.folder_shared),
              label: _getText('Records', 'रिकॉर्ड', 'रेकॉर्ड'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.analytics_outlined),
              activeIcon: const Icon(Icons.analytics),
              label: _getText('Reports', 'रिपोर्ट', 'अहवाल'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.feedback_outlined),
              activeIcon: const Icon(Icons.feedback),
              label: _getText('Feedback', 'प्रतिक्रिया', 'अभिप्राय'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.groups_outlined),
              activeIcon: const Icon(Icons.groups),
              label: _getText('Staff', 'स्टाफ', 'कर्मचारी'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppTheme.primaryBlue,
          unselectedItemColor: AppTheme.textLight,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

// Dashboard Overview Widget
class _DashboardOverview extends StatelessWidget {
  final String language;
  final Function(int) onNavigate;
  
  const _DashboardOverview({
    required this.language,
    required this.onNavigate,
  });

  String _getText(String en, String hi, String mr) {
    switch (language) {
      case 'hi':
        return hi;
      case 'mr':
        return mr;
      default:
        return en;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryBlue, AppTheme.primaryBlue.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.local_hospital, color: Colors.white, size: 32),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getText('Welcome to PHC Dashboard', 'PHC डैशबोर्ड में आपका स्वागत है', 'PHC डॅशबोर्डमध्ये आपले स्वागत आहे'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getText('Manage healthcare operations efficiently', 'स्वास्थ्य सेवा संचालन को कुशलता से प्रबंधित करें', 'आरोग्य सेवा संचालन कार्यक्षमतेने व्यवस्थापित करा'),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Quick Stats
          Text(
            _getText('Today\'s Overview', 'आज का अवलोकन', 'आजचे अवलोकन'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: _getText('Total Patients', 'कुल रोगी', 'एकूण रुग्ण'),
                  value: '2,456',
                  icon: Icons.people,
                  color: AppTheme.secondaryGreen,
                  trend: '+12%',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: _getText('Today\'s Visits', 'आज की विज़िट', 'आजच्या भेटी'),
                  value: '45',
                  icon: Icons.event_available,
                  color: AppTheme.primaryBlue,
                  trend: '+8%',
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: _getText('Active ASHA', 'सक्रिय ASHA', 'सक्रिय ASHA'),
                  value: '24',
                  icon: Icons.person_pin,
                  color: AppTheme.accentTeal,
                  trend: '100%',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: _getText('Pending Tasks', 'लंबित कार्य', 'प्रलंबित कार्ये'),
                  value: '8',
                  icon: Icons.pending_actions,
                  color: AppTheme.errorRed,
                  trend: '-15%',
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Quick Actions
          Text(
            _getText('Quick Actions', 'त्वरित कार्य', 'त्वरित कृती'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              _QuickActionCard(
                title: _getText('Records', 'रिकॉर्ड', 'रेकॉर्ड'),
                icon: Icons.folder_shared,
                color: AppTheme.primaryBlue,
                onTap: () => onNavigate(1),
              ),
              _QuickActionCard(
                title: _getText('Reports', 'रिपोर्ट', 'अहवाल'),
                icon: Icons.analytics,
                color: AppTheme.secondaryGreen,
                onTap: () => onNavigate(2),
              ),
              _QuickActionCard(
                title: _getText('Staff', 'स्टाफ', 'कर्मचारी'),
                icon: Icons.groups,
                color: AppTheme.accentTeal,
                onTap: () => onNavigate(4),
              ),
              _QuickActionCard(
                title: _getText('Sync', 'सिंक', 'सिंक'),
                icon: Icons.sync,
                color: AppTheme.primaryBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SmartSyncScreen()),
                  );
                },
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Recent Activities
          Text(
            _getText('Recent Activities', 'हाल की गतिविधियां', 'अलीकडील क्रियाकलाप'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _ActivityItem(
                  title: _getText('New patient registered', 'नया रोगी पंजीकृत', 'नवीन रुग्ण नोंदणी'),
                  subtitle: 'Ramesh Kumar - PID-2024-1011',
                  time: _getText('2 mins ago', '2 मिनट पहले', '2 मिनिटांपूर्वी'),
                  icon: Icons.person_add,
                  color: AppTheme.secondaryGreen,
                ),
                _ActivityItem(
                  title: _getText('ASHA report submitted', 'ASHA रिपोर्ट जमा की गई', 'ASHA अहवाल सादर केला'),
                  subtitle: _getText('Sunita Devi - Sector 3', 'सुनीता देवी - सेक्टर 3', 'सुनीता देवी - सेक्टर 3'),
                  time: _getText('15 mins ago', '15 मिनट पहले', '15 मिनिटांपूर्वी'),
                  icon: Icons.assignment_turned_in,
                  color: AppTheme.primaryBlue,
                ),
                _ActivityItem(
                  title: _getText('Vaccination completed', 'टीकाकरण पूर्ण', 'लसीकरण पूर्ण'),
                  subtitle: _getText('Child immunization drive', 'बाल टीकाकरण अभियान', 'बाल लसीकरण मोहीम'),
                  time: _getText('1 hour ago', '1 घंटे पहले', '1 तासापूर्वी'),
                  icon: Icons.vaccines,
                  color: AppTheme.accentTeal,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Stat Card Widget
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing based on available space
        double iconSize = constraints.maxWidth > 160 ? 18 : 16;
        double valueSize = constraints.maxWidth > 160 ? 24 : 20;
        double titleSize = constraints.maxWidth > 160 ? 13 : 11;
        double trendSize = constraints.maxWidth > 160 ? 11 : 10;
        double padding = constraints.maxWidth > 160 ? 18 : 14;
        
        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(constraints.maxWidth > 160 ? 8 : 6),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: color, size: iconSize),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 160 ? 8 : 6, 
                        vertical: constraints.maxWidth > 160 ? 4 : 3
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        trend,
                        style: TextStyle(
                          fontSize: trendSize,
                          color: AppTheme.secondaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: constraints.maxHeight > 100 ? 14 : 10),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: valueSize,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: constraints.maxHeight > 100 ? 4 : 2),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Quick Action Card Widget
class _QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing based on available space
        double iconSize = constraints.maxWidth > 140 ? 28 : 24;
        double fontSize = constraints.maxWidth > 140 ? 11 : 10;
        double iconPadding = constraints.maxWidth > 140 ? 14 : 12;
        double cardPadding = constraints.maxWidth > 140 ? 16 : 12;
        double spacing = constraints.maxHeight > 120 ? 10 : 8;
        
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(cardPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.2)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(iconPadding),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: iconSize),
                ),
                SizedBox(height: spacing),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                      height: 1.1,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Activity Item Widget
class _ActivityItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color color;
  final bool isLast;

  const _ActivityItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.color,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: isLast ? null : Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
