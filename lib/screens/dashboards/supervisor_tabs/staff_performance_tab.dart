import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class StaffPerformanceTab extends StatelessWidget {
  final String language;
  const StaffPerformanceTab({super.key, required this.language});

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
          // Performance Analytics Cards
          Row(
            children: [
              Expanded(
                child: _PerformanceAnalyticsCard(
                  title: _getText('Total Staff', 'कुल स्टाफ', 'एकूण कर्मचारी'),
                  value: '24',
                  icon: Icons.groups,
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _PerformanceAnalyticsCard(
                  title: _getText('Avg Performance', 'औसत प्रदर्शन', 'सरासरी कामगिरी'),
                  value: '87%',
                  icon: Icons.trending_up,
                  color: AppTheme.secondaryGreen,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Performance Summary Section
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getText('Performance Summary', 'प्रदर्शन सारांश', 'कामगिरी सारांश'),
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
                      child: _PerformanceMetric(
                        icon: Icons.star,
                        title: _getText('Excellent', 'उत्कृष्ट', 'उत्कृष्ट'),
                        value: '12',
                        color: AppTheme.secondaryGreen,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _PerformanceMetric(
                        icon: Icons.trending_up,
                        title: _getText('Good', 'अच्छा', 'चांगला'),
                        value: '8',
                        color: AppTheme.accentTeal,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _PerformanceMetric(
                        icon: Icons.warning,
                        title: _getText('Needs Improvement', 'सुधार चाहिए', 'सुधारणा आवश्यक'),
                        value: '4',
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Filter and Export Section
          Container(
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
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: _getText('Filter by Role', 'भूमिका के अनुसार फ़िल्टर करें', 'भूमिकेनुसार फिल्टर करा'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      value: 'ASHA',
                      items: ['ASHA', _getText('PHC Staff', 'PHC स्टाफ', 'PHC कर्मचारी')].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle filter change
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download_outlined, color: Colors.white),
                  label: Text(
                    _getText('Export', 'निर्यात करें', 'निर्यात करा'),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accentTeal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    elevation: 2,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Staff Performance List Header
          Text(
            _getText('Staff Performance Details', 'स्टाफ प्रदर्शन विवरण', 'कर्मचारी कामगिरी तपशील'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          // Staff Performance List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8, // Placeholder count
            itemBuilder: (context, index) {
              final staffNames = [
                _getText('Sunita Devi', 'सुनीता देवी', 'सुनीता देवी'), _getText('Fatima Begum', 'फातिमा बेगम', 'फातिमा बेगम'), _getText('Priya Sharma', 'प्रिया शर्मा', 'प्रिया शर्मा'), _getText('Ayesha Khan', 'आयशा खान', 'आयशा खान'),
                _getText('Anjali Kumari', 'अंजली कुमारी', 'अंजली कुमारी'), _getText('Zainab Ansari', 'जैनब अंसारी', 'जैनब अंसारी'), _getText('Meena Verma', 'मीना वर्मा', 'मीना वर्मा'), _getText('Nazia Siddiqui', 'नाजिया सिद्दीकी', 'नाजिया सिद्दीकी')
              ];
              return _StaffPerformanceListItem(
                name: staffNames[index],
                performanceScore: 95 - (index * 5),
                area: '${_getText('Sector', 'सेक्टर', 'क्षेत्र')} ${index % 4 + 1}',
                language: language,
              );
            },
          ),
        ],
      ),
    );
  }

}

class _StaffPerformanceListItem extends StatelessWidget {
  final String name;
  final int performanceScore;
  final String area;
  final String language;

  const _StaffPerformanceListItem({
    required this.name,
    required this.performanceScore,
    required this.area,
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
      child: InkWell(
        onTap: () {
          // Navigate to staff details
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Performance Score Avatar
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_getScoreColor(performanceScore), _getScoreColor(performanceScore).withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    '$performanceScore%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              
              // Staff Info
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
                        Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade600),
                        const SizedBox(width: 4),
                        Text(
                          '${_getText('Area', 'क्षेत्र', 'क्षेत्र')}: $area',
                          style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.trending_up, size: 14, color: _getScoreColor(performanceScore)),
                        const SizedBox(width: 4),
                        Text(
                          _getPerformanceLabel(performanceScore),
                          style: TextStyle(
                            fontSize: 13,
                            color: _getScoreColor(performanceScore),
                            fontWeight: FontWeight.w600,
                          ),
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

  Color _getScoreColor(int score) {
    if (score >= 90) {
      return AppTheme.secondaryGreen;
    } else if (score >= 70) {
      return Colors.orange;
    } else {
      return AppTheme.errorRed;
    }
  }

  String _getPerformanceLabel(int score) {
    if (score >= 90) {
      return _getText('Excellent', 'उत्कृष्ट', 'उत्कृष्ट');
    } else if (score >= 70) {
      return _getText('Good', 'अच्छा', 'चांगला');
    } else {
      return _getText('Needs Improvement', 'सुधार चाहिए', 'सुधारणा आवश्यक');
    }
  }
}

// Performance Analytics Card Widget
class _PerformanceAnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _PerformanceAnalyticsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
