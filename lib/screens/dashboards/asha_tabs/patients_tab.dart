import 'package:flutter/material.dart';
import 'package:morse_proj/screens/patient_management/patient_history_screen.dart';
import 'package:morse_proj/screens/patient_management/patient_registration_screen.dart';
import 'package:morse_proj/screens/patient_management/qr_scan_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class PatientsTab extends StatelessWidget {
  final String language;
  const PatientsTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHeader(context, 'Patient Management', 'रोगी प्रबंधन', 'रुग्ण व्यवस्थापन'),
        const SizedBox(height: 20),
        _buildActionGrid(context),
        const SizedBox(height: 20),
        _buildHeader(context, 'Recent Patients', 'हाल के रोगी', 'अलीकडील रुग्ण'),
        const SizedBox(height: 16),
        _PatientListItem(name: 'Ramesh Kumar', age: 45, patientId: 'P001', language: language),
        _PatientListItem(name: 'Sunita Devi', age: 32, patientId: 'P002', language: language),
        _PatientListItem(name: 'Arjun Singh', age: 28, patientId: 'P003', language: language),
        _PatientListItem(name: 'Lakshmi Bai', age: 56, patientId: 'P004', language: language),
        _PatientListItem(name: 'Vijay Sharma', age: 38, patientId: 'P005', language: language),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, String en, String hi, String mr) {
    String title;
    switch (language) {
      case 'hi':
        title = hi;
        break;
      case 'mr':
        title = mr;
        break;
      default:
        title = en;
    }
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildActionGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _ActionButton(
          icon: Icons.person_add_alt_1_outlined,
          title: 'Register Patient',
          color: AppTheme.primaryBlue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PatientRegistrationScreen()),
            );
          },
        ),
        _ActionButton(
          icon: Icons.qr_code_scanner_outlined,
          title: 'Scan QR Code',
          color: AppTheme.secondaryGreen,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrScanScreen(language: language)),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecentPatientList(BuildContext context) {
    final patients = [
      {'name': 'Ravi Kumar', 'age': 45, 'id': 'PAT001'},
      {'name': 'Sunita Devi', 'age': 32, 'id': 'PAT002'},
      {'name': 'Ramesh Singh', 'age': 58, 'id': 'PAT003'},
      {'name': 'Anita Sharma', 'age': 28, 'id': 'PAT004'},
    ];

    return Column(
      children: patients.map((patient) {
        return _PatientListItem(
          name: patient['name'] as String,
          age: patient['age'] as int,
          patientId: patient['id'] as String,
          language: language,
        );
      }).toList(),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PatientListItem extends StatelessWidget {
  final String name;
  final int age;
  final String patientId;
  final String language;

  const _PatientListItem({
    required this.name,
    required this.age,
    required this.patientId,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD4F1E8), // Light mint/teal color
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
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
                const SizedBox(height: 6),
                Text(
                  'Age: $age • ID: $patientId',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textDark,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientHistoryScreen(language: language)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.textDark,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'View',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
