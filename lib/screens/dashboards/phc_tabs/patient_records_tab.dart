import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class PatientRecordsTab extends StatelessWidget {
  final String language;
  const PatientRecordsTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Analytics Cards
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: _AnalyticsCard(
                  title: _getText('Total Patients', 'कुल रोगी', 'एकूण रुग्ण'),
                  value: '2,456',
                  icon: Icons.people,
                  color: AppTheme.secondaryGreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _AnalyticsCard(
                  title: _getText('Today\'s Visits', 'आज की विज़िट', 'आजच्या भेटी'),
                  value: '45',
                  icon: Icons.event_available,
                  color: AppTheme.primaryBlue,
                ),
              ),
            ],
          ),
        ),
        
        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: _getText('Search Patients...', 'रोगी खोजें...', 'रुग्ण शोधा...'),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Patient List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 10, // Placeholder count
            itemBuilder: (context, index) {
              final names = [
                _getText('Ramesh Kumar', 'रमेश कुमार', 'रमेश कुमार'), _getText('Fatima Begum', 'फातिमा बेगम', 'फातिमा बेगम'), _getText('Arjun Singh', 'अर्जुन सिंह', 'अर्जुन सिंह'), _getText('Ayesha Khan', 'आयशा खान', 'आयशा खान'),
                _getText('Vijay Sharma', 'विजय शर्मा', 'विजय शर्मा'), _getText('Zainab Ansari', 'जैनब अंसारी', 'जैनब अंसारी'), _getText('Mohammed Aslam', 'मोहम्मद अस्लम', 'मोहम्मद अस्लम'), _getText('Sunita Devi', 'सुनीता देवी', 'सुनीता देवी'),
                _getText('Farhan Sheikh', 'फरहान शेख', 'फरहान शेख'), _getText('Priya Sharma', 'प्रिया शर्मा', 'प्रिया शर्मा')
              ];
              return _PatientListItem(
                name: names[index],
                id: 'PID-2024-${1001 + index}',
                lastConsult: '2024-09-${15 + index}',
                language: language,
              );
            },
          ),
        ),
      ],
    );
  }

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
}

class _PatientListItem extends StatelessWidget {
  final String name;
  final String id;
  final String lastConsult;
  final String language;

  const _PatientListItem({
    required this.name,
    required this.id,
    required this.lastConsult,
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
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          // Navigate to patient details
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Patient Avatar
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.secondaryGreen, AppTheme.secondaryGreen.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
              
              // Patient Info
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
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.badge_outlined, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Text(
                          id,
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Text(
                          '${_getText('Last Visit', 'अंतिम विज़िट', 'शेवटची भेट')}: $lastConsult',
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Arrow Icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppTheme.primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Analytics Card Widget
class _AnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _AnalyticsCard({
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
                  Flexible(
                    flex: 2,
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
              SizedBox(height: constraints.maxHeight > 100 ? 12 : 8),
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
            ],
          ),
        );
      },
    );
  }
}
