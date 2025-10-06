import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class StaffMonitoringTab extends StatelessWidget {
  final String language;
  const StaffMonitoringTab({super.key, required this.language});

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Staff Analytics Cards
          Row(
            children: [
              Expanded(
                child: _StaffAnalyticsCard(
                  title: _getText('Total Staff', 'कुल स्टाफ', 'एकूण कर्मचारी'),
                  value: '24',
                  icon: Icons.groups,
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StaffAnalyticsCard(
                  title: _getText('On Duty', 'ड्यूटी पर', 'कर्तव्यावर'),
                  value: '18',
                  icon: Icons.work,
                  color: AppTheme.secondaryGreen,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Staff Directory Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryBlue.withOpacity(0.1), AppTheme.primaryBlue.withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.primaryBlue.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.groups, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getText('Staff Directory', 'स्टाफ डायरेक्टरी', 'कर्मचारी निर्देशिका'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getText('View complete staff information', 'संपूर्ण स्टाफ जानकारी देखें', 'संपूर्ण कर्मचारी माहिती पहा'),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffDirectoryScreen(language: language),
                        ),
                      );
                    },
                    icon: const Icon(Icons.people, color: Colors.white, size: 20),
                    label: Text(
                      _getText('View All Staff', 'सभी स्टाफ देखें', 'सर्व कर्मचारी पहा'),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Active ASHA Workers Section
          Text(
            _getText('ASHA Workers - Active', 'ASHA कार्यकर्ता - सक्रिय', 'ASHA कार्यकर्ते - सक्रिय'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          // Active ASHA List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3, // Show only 3 active workers
            itemBuilder: (context, index) {
              final ashaNames = [_getText('Priya Sharma', 'प्रिया शर्मा', 'प्रिया शर्मा'), _getText('Meera Devi', 'मीरा देवी', 'मीरा देवी'), _getText('Radha Singh', 'राधा सिंह', 'राधा सिंह')];
              final phoneNumbers = ['9876543210', '9876543211', '9876543212'];
              final visits = [8, 6, 5];
              
              return _ActiveStaffCard(
                name: ashaNames[index],
                phoneNumber: phoneNumbers[index],
                visits: visits[index],
                language: language,
              );
            },
          ),
          
          const SizedBox(height: 32),
          
          // Performance Summary Section
          Text(
            _getText('Performance Summary', 'प्रदर्शन सारांश', 'कामगिरी सारांश'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200, width: 1),
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
                _PerformanceMetric(
                  icon: Icons.trending_up,
                  title: _getText('Avg Visits/Day', 'औसत विज़िट/दिन', 'सरासरी भेटी/दिवस'),
                  value: '7.5',
                  color: AppTheme.secondaryGreen,
                ),
                const SizedBox(height: 16),
                _PerformanceMetric(
                  icon: Icons.check_circle,
                  title: _getText('Patient Satisfaction', 'रोगी संतुष्टि', 'रुग्ण समाधान'),
                  value: '94%',
                  color: AppTheme.secondaryGreen,
                ),
                const SizedBox(height: 16),
                _PerformanceMetric(
                  icon: Icons.access_time,
                  title: _getText('Response Time', 'प्रतिक्रिया समय', 'प्रतिसाद वेळ'),
                  value: '15 min',
                  color: AppTheme.accentTeal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Staff Analytics Card Widget
class _StaffAnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StaffAnalyticsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing based on available space
        double iconSize = constraints.maxWidth > 160 ? 18 : 16;
        double valueSize = constraints.maxWidth > 160 ? 24 : 20;
        double titleSize = constraints.maxWidth > 160 ? 13 : 11;
        double padding = constraints.maxWidth > 160 ? 18 : 14;
        
        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
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

// Active Staff Card Widget
class _ActiveStaffCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final int visits;
  final String language;

  const _ActiveStaffCard({
    required this.name,
    required this.phoneNumber,
    required this.visits,
    required this.language,
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.secondaryGreen.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.secondaryGreen, AppTheme.secondaryGreen.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '$visits ${_getText('visits', 'विज़िट', 'भेटी')} • $phoneNumber',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.secondaryGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getText('Active', 'सक्रिय', 'सक्रिय'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Performance Metric Widget
class _PerformanceMetric extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _PerformanceMetric({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// Staff Directory Screen
class StaffDirectoryScreen extends StatelessWidget {
  final String language;
  
  const StaffDirectoryScreen({super.key, required this.language});

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
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          _getText('Staff Directory', 'स्टाफ डायरेक्टरी', 'कर्मचारी निर्देशिका'),
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          final staffNames = [
            _getText('Sunita Devi', 'सुनीता देवी', 'सुनीता देवी'), _getText('Fatima Begum', 'फातिमा बेगम', 'फातिमा बेगम'), _getText('Priya Sharma', 'प्रिया शर्मा', 'प्रिया शर्मा'), _getText('Ayesha Khan', 'आयशा खान', 'आयशा खान'),
            _getText('Anjali Kumari', 'अंजली कुमारी', 'अंजली कुमारी'), _getText('Zainab Ansari', 'जैनब अंसारी', 'जैनब अंसारी'), _getText('Meena Verma', 'मीना वर्मा', 'मीना वर्मा'), _getText('Nazia Siddiqui', 'नाजिया सिद्दीकी', 'नाजिया सिद्दीकी')
          ];
          final roles = [
            _getText('ASHA Worker', 'ASHA कार्यकर्ता', 'ASHA कार्यकर्ते'), _getText('ANM', 'ANM', 'ANM'), _getText('ASHA Worker', 'ASHA कार्यकर्ता', 'ASHA कार्यकर्ते'), _getText('ASHA Worker', 'ASHA कार्यकर्ता', 'ASHA कार्यकर्ते'),
            _getText('ANM', 'ANM', 'ANM'), _getText('ASHA Worker', 'ASHA कार्यकर्ता', 'ASHA कार्यकर्ते'), _getText('ASHA Worker', 'ASHA कार्यकर्ता', 'ASHA कार्यकर्ते'), _getText('ASHA Worker', 'ASHA कार्यकर्ता', 'ASHA कार्यकर्ते')
          ];
          final phoneNumbers = [
            '9876543210', '9876543211', '9876543212', '9876543213',
            '9876543214', '9876543215', '9876543216', '9876543217'
          ];
          
          return _StaffDirectoryCard(
            name: staffNames[index],
            role: roles[index],
            phoneNumber: phoneNumbers[index],
            area: '${_getText('Sector', 'सेक्टर', 'क्षेत्र')} ${index % 4 + 1}',
            tasksCompleted: 15 - index,
            isActive: index % 3 != 0, // Some are inactive
            language: language,
          );
        },
      ),
    );
  }
}

// Staff Directory Card Widget
class _StaffDirectoryCard extends StatelessWidget {
  final String name;
  final String role;
  final String phoneNumber;
  final String area;
  final int tasksCompleted;
  final bool isActive;
  final String language;

  const _StaffDirectoryCard({
    required this.name,
    required this.role,
    required this.phoneNumber,
    required this.area,
    required this.tasksCompleted,
    required this.isActive,
    required this.language,
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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isActive 
                      ? [AppTheme.secondaryGreen, AppTheme.secondaryGreen.withOpacity(0.8)]
                      : [Colors.grey.shade400, Colors.grey.shade500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.secondaryGreen : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isActive ? _getText('Active', 'सक्रिय', 'सक्रिय') : _getText('Inactive', 'निष्क्रिय', 'निष्क्रिय'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Contact and Area Info
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.phone, size: 16, color: Colors.grey.shade600),
                    const SizedBox(width: 8),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Text(
                    area,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Tasks Completed
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getText('Tasks Completed', 'कार्य पूर्ण', 'कार्ये पूर्ण'),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                tasksCompleted.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isActive ? AppTheme.secondaryGreen : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
