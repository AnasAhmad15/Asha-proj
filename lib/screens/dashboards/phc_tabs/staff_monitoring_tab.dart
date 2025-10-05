import 'package:flutter/material.dart';
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
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 8, // Placeholder count
      itemBuilder: (context, index) {
        final ashaNames = [
          'Sunita Devi', 'Fatima Begum', 'Priya Sharma', 'Ayesha Khan',
          'Anjali Kumari', 'Zainab Ansari', 'Meena Verma', 'Naziaiddiqui'
        ];
        return _StaffListItem(
          name: ashaNames[index],
          area: '${_getText('Sector', 'सेक्टर', 'क्षेत्र')} ${index % 4 + 1}',
          lastSync: '${index * 10 + 5} ${_getText('mins ago', 'मिनट पहले', 'मिनिटांपूर्वी')}',
          tasksCompleted: 15 - index,
          language: language,
        );
      },
    );
  }
}
class _StaffListItem extends StatelessWidget {
  final String name;
  final String area;
  final String lastSync;
  final int tasksCompleted;
  final String language;

  const _StaffListItem({
    required this.name,
    required this.area,
    required this.lastSync,
    required this.tasksCompleted,
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
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: AppTheme.primaryBlue,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${_getText('Area', 'क्षेत्र', 'क्षेत्र')}: $area | ${_getText('Last Sync', 'अंतिम सिंक', 'शेवटचे सिंक')}: $lastSync', style: const TextStyle(color: AppTheme.textLight)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  tasksCompleted.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.secondaryGreen),
                ),
                Text(_getText('Tasks Done', 'कार्य पूर्ण', 'कार्ये पूर्ण'), style: const TextStyle(color: AppTheme.textLight)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
