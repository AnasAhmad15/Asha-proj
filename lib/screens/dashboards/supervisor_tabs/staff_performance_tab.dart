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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: _getText('Filter by Role', 'भूमिका के अनुसार फ़िल्टर करें', 'भूमिकेनुसार फिल्टर करा')),
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
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_outlined),
                label: Text(_getText('Export', 'निर्यात करें', 'निर्यात करा')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentTeal,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 8, // Placeholder count
            itemBuilder: (context, index) {
              final staffNames = [
                'Sunita Devi', 'Fatima Begum', 'Priya Sharma', 'Ayesha Khan',
                'Anjali Kumari', 'Zainab Ansari', 'Meena Verma', 'Naziaiddiqui'
              ];
              return _StaffPerformanceListItem(
                name: staffNames[index],
                performanceScore: 95 - (index * 5),
                area: '${_getText('Sector', 'सेक्टर', 'क्षेत्र')} ${index % 4 + 1}',
                language: language,
              );
            },
          ),
        ),
      ],
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getScoreColor(performanceScore),
          child: Text(
            '$performanceScore%',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${_getText('Area', 'क्षेत्र', 'क्षेत्र')}: $area'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
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
}
