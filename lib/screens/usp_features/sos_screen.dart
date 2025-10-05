import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.errorRed,
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 100),
              const SizedBox(height: 24),
              const Text(
                'Confirm Emergency',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your location and an emergency alert will be sent to your supervisor and the nearest PHC.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.4),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Emergency Alert Sent! (Demo Mode)')),
                  );
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.errorRed,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Send Emergency Alert'),
              ),
              const SizedBox(height: 32),
              
              // Emergency Hotlines Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Emergency Hotlines',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildHotlineItem('Ambulance', '108'),
                    const SizedBox(height: 12),
                    _buildHotlineItem('Police', '100'),
                    const SizedBox(height: 12),
                    _buildHotlineItem('Women Helpline', '1091'),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotlineItem(String label, String number) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
          ),
          Text(
            number,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}
