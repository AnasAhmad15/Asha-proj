import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class BlockchainInfoScreen extends StatelessWidget {
  const BlockchainInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Blockchain Security'),
        backgroundColor: AppTheme.accentTeal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOriginalTopSection(),
            const SizedBox(height: 30),
            _buildKeyFeaturesSection(),
            const SizedBox(height: 20),
            _buildHowItWorksSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOriginalTopSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, size: 80, color: AppTheme.accentTeal),
            const SizedBox(height: 20),
            const Text(
              'Tamper-Proof Health Records',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This application uses blockchain technology to ensure that all patient records are secure, transparent, and cannot be altered without authorization. Every transaction is cryptographically signed and linked, creating an immutable chain of trust.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppTheme.textLight, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            const Text(
              '(Demo Prototype)',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyFeaturesSection() {
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
          const Text(
            'Key Security Features',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 20),
          _buildFeatureItem(
            icon: Icons.lock,
            color: AppTheme.secondaryGreen,
            title: 'Immutable Records',
            description: 'Once written, health records cannot be altered or deleted',
            hindiText: 'अपरिवर्तनीय रिकॉर्ड',
            bgColor: const Color(0xFFD1FAE5),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            icon: Icons.fingerprint,
            color: AppTheme.primaryBlue,
            title: 'Cryptographic Verification',
            description: 'Every record is digitally signed and verified using advanced cryptography',
            hindiText: 'क्रिप्टोग्राफिक सत्यापन',
            bgColor: const Color(0xFFDBEAFE),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            icon: Icons.visibility,
            color: Colors.purple,
            title: 'Full Audit Trail',
            description: 'Complete transparency with every access and modification logged',
            hindiText: 'पूर्ण ऑडिट ट्रेल',
            bgColor: const Color(0xFFF3E8FF),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            icon: Icons.link,
            color: Colors.orange,
            title: 'Distributed Ledger',
            description: 'Data is replicated across multiple nodes for maximum reliability',
            hindiText: 'वितरित लेजर',
            bgColor: const Color(0xFFFFEDD5),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required String hindiText,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textDark,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hindiText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textLight,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksSection() {
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
          const Text(
            'How It Works',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 20),
          _buildStepItem(
            number: '1',
            title: 'Record Created',
            description: 'ASHA worker creates a health record',
          ),
          const SizedBox(height: 16),
          _buildStepItem(
            number: '2',
            title: 'Cryptographic Hash',
            description: 'System generates unique digital fingerprint',
          ),
          const SizedBox(height: 16),
          _buildStepItem(
            number: '3',
            title: 'Blockchain Storage',
            description: 'Record is added to the blockchain ledger',
          ),
          const SizedBox(height: 16),
          _buildStepItem(
            number: '4',
            title: 'Verification',
            description: 'All future access is verified against blockchain',
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem({
    required String number,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.purple,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
