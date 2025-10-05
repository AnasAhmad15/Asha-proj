import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class PatientHistoryScreen extends StatelessWidget {
  final String? language;
  
  const PatientHistoryScreen({super.key, this.language});

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
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(_getText('Patient History', 'रोगी इतिहास', 'रुग्ण इतिहास')),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPatientInfoCard(),
            const SizedBox(height: 16),
            _buildLastVisitCard(),
            const SizedBox(height: 16),
            _buildVisitHistorySection(),
            const SizedBox(height: 16),
            _buildImmunizationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light blue background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.person,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          // Patient Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunita Devi',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Text(
                      'ID: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      'PAT12345',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textDark,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Age: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      '32 years',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Text(
                      'Gender: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textDark,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Blood: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      'B+',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.phone, size: 16, color: AppTheme.textDark),
                    SizedBox(width: 4),
                    Text(
                      '9876543210',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 16, color: AppTheme.textDark),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Village Rampur, Block 12',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastVisitCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: AppTheme.secondaryGreen,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                _getText('Last Visit', 'अंतिम विज़िट', 'शेवटची भेट'),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Jan 25, 2025 - ANC Checkup',
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisitHistorySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.description,
                color: AppTheme.primaryBlue,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                _getText('Visit History / यात्रा इतिहास', 'यात्रा इतिहास / Visit History', 'भेट इतिहास / Visit History'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildVisitCard(
            title: 'ANC Checkup',
            date: 'Jan 25, 2025',
            notes: 'Blood pressure normal, weight gain on track',
            bp: '120/80',
            temp: '98.6°F',
            weight: '62kg',
          ),
          const SizedBox(height: 12),
          _buildVisitCard(
            title: 'Follow-up',
            date: 'Jan 18, 2025',
            notes: 'Iron tablets prescribed, diet counseling provided',
            bp: '118/78',
            temp: '98.4°F',
            weight: '61kg',
          ),
          const SizedBox(height: 12),
          _buildVisitCard(
            title: 'Vaccination',
            date: 'Jan 10, 2025',
            notes: 'Tetanus vaccine administered',
            bp: '120/82',
            temp: '98.6°F',
            weight: '60kg',
          ),
        ],
      ),
    );
  }

  Widget _buildVisitCard({
    required String title,
    required String date,
    required String notes,
    required String bp,
    required String temp,
    required String weight,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD4F1E8), // Light mint/teal
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
              Icon(
                Icons.monitor_heart_outlined,
                color: AppTheme.secondaryGreen,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            notes,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textDark,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildVitalItem('BP', bp),
                _buildVitalItem('Temp', temp),
                _buildVitalItem('Weight', weight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVitalItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
      ],
    );
  }

  Widget _buildImmunizationSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.vaccines,
                color: Colors.purple,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                _getText('Immunization Records / टीकाकरण रिकॉर्ड', 'टीकाकरण रिकॉर्ड / Immunization Records', 'लसीकरण रेकॉर्ड / Immunization Records'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildImmunizationCard('BCG', '2023', true),
          const SizedBox(height: 12),
          _buildImmunizationCard('DPT 1', '2023', true),
          const SizedBox(height: 12),
          _buildImmunizationCard('DPT 2', '2024', true),
          const SizedBox(height: 12),
          _buildImmunizationCard('Tetanus', 'Jan 2025', true),
        ],
      ),
    );
  }

  Widget _buildImmunizationCard(String vaccine, String date, bool completed) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD4F1E8), // Light mint/teal
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vaccine,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.secondaryGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _getText('Completed', 'पूर्ण', 'पूर्ण'),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
