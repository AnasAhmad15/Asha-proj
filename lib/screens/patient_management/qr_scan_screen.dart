import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class QrScanScreen extends StatelessWidget {
  final String? language;
  
  const QrScanScreen({super.key, this.language});

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
      appBar: AppBar(
        title: Text(_getText('Scan Patient QR Code', 'रोगी QR कोड स्कैन करें', 'रुग्ण QR कोड स्कॅन करा')),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              
              // Instructions Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.primaryBlue.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getText('Instructions / निर्देश', 'निर्देश / Instructions', 'सूचना / Instructions'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInstructionItem(
                      '1.',
                      _getText(
                        'Hold your device steady and ensure good lighting',
                        'अपने डिवाइस को स्थिर रखें और अच्छी रोशनी सुनिश्चित करें',
                        'आपले डिव्हाइस स्थिर धरा आणि चांगला प्रकाश सुनिश्चित करा',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInstructionItem(
                      '2.',
                      _getText(
                        'Position the QR code within the camera frame',
                        'QR कोड को कैमरा फ्रेम के भीतर रखें',
                        'QR कोड कॅमेरा फ्रेममध्ये ठेवा',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInstructionItem(
                      '3.',
                      _getText(
                        'Wait for automatic detection and scanning',
                        'स्वचालित पहचान और स्कैनिंग की प्रतीक्षा करें',
                        'स्वयंचलित शोध आणि स्कॅनिंगची प्रतीक्षा करा',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInstructionItem(
                      '4.',
                      _getText(
                        'Patient history will load automatically after successful scan',
                        'सफल स्कैन के बाद रोगी का इतिहास स्वचालित रूप से लोड हो जाएगा',
                        'यशस्वी स्कॅननंतर रुग्णाचा इतिहास आपोआप लोड होईल',
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // QR Code Scanner Frame
              Center(
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    border: Border.all(color: AppTheme.primaryBlue, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      // Corner decorations
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppTheme.primaryBlue, width: 4),
                              left: BorderSide(color: AppTheme.primaryBlue, width: 4),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: AppTheme.primaryBlue, width: 4),
                              right: BorderSide(color: AppTheme.primaryBlue, width: 4),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppTheme.primaryBlue, width: 4),
                              left: BorderSide(color: AppTheme.primaryBlue, width: 4),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppTheme.primaryBlue, width: 4),
                              right: BorderSide(color: AppTheme.primaryBlue, width: 4),
                            ),
                          ),
                        ),
                      ),
                      // QR Icon
                      const Center(
                        child: Icon(
                          Icons.qr_code_scanner,
                          size: 120,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Start Scanning Button
              ElevatedButton.icon(
                onPressed: () {
                  // Simulate scanning
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_getText(
                        'Scanning... (Demo Mode)',
                        'स्कैन हो रहा है... (डेमो मोड)',
                        'स्कॅन करत आहे... (डेमो मोड)',
                      )),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt, size: 24),
                label: Text(
                  _getText('Start Scanning', 'स्कैनिंग शुरू करें', 'स्कॅनिंग सुरू करा'),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Manual Entry Button
              OutlinedButton(
                onPressed: () {
                  _showManualEntryDialog(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textDark,
                  side: BorderSide(color: AppTheme.textLight.withOpacity(0.3), width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  _getText('Enter Patient ID Manually', 'रोगी ID मैन्युअल रूप से दर्ज करें', 'रुग्ण ID व्यक्तिचलितपणे प्रविष्ट करा'),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryBlue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.textDark,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  void _showManualEntryDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(_getText('Enter Patient ID', 'रोगी ID दर्ज करें', 'रुग्ण ID प्रविष्ट करा')),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: _getText('Patient ID', 'रोगी ID', 'रुग्ण ID'),
            hintText: _getText('e.g., P12345', 'उदा., P12345', 'उदा., P12345'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.badge_outlined),
          ),
          keyboardType: TextInputType.text,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(_getText('Cancel', 'रद्द करें', 'रद्द करा')),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_getText(
                    'Patient loaded successfully! (Demo)',
                    'रोगी सफलतापूर्वक लोड हुआ! (डेमो)',
                    'रुग्ण यशस्वीरित्या लोड झाला! (डेमो)',
                  )),
                ),
              );
            },
            child: Text(_getText('Submit', 'जमा करें', 'सबमिट करा')),
          ),
        ],
      ),
    );
  }
}
