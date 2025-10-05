import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class PatientRecordsTab extends StatelessWidget {
  final String language;
  const PatientRecordsTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: _getText('Search Patients...', 'रोगी खोजें...', 'रुग्ण शोधा...'),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10, // Placeholder count
            itemBuilder: (context, index) {
              final names = [
                'Ramesh Kumar', 'Fatima Begum', 'Arjun Singh', 'Ayesha Khan',
                'Vijay Sharma', 'Zainab Ansari', 'Mohammed Aslam', 'Sunita Devi',
                'Farhan Sheikh', 'Priya Sharma'
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: AppTheme.secondaryGreen,
          child: Icon(Icons.person_outline, color: Colors.white),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${_getText('Patient ID', 'रोगी आईडी', 'रुग्ण आयडी')}: $id\n${_getText('Last Consultation', 'अंतिम परामर्श', 'शेवटचा सल्लामसलत')}: $lastConsult'),
        isThreeLine: true,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to patient details
        },
      ),
    );
  }
}
