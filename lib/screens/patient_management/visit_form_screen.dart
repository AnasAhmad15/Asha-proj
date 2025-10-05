import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class VisitFormScreen extends StatefulWidget {
  final String? language;
  
  const VisitFormScreen({super.key, this.language});

  @override
  State<VisitFormScreen> createState() => _VisitFormScreenState();
}

class _VisitFormScreenState extends State<VisitFormScreen> {
  final TextEditingController _bpController = TextEditingController();
  final TextEditingController _pulseController = TextEditingController();
  final TextEditingController _tempController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  
  final Map<String, bool> _immunizationStatus = {
    'BCG Vaccine': false,
    'DPT Dose 1': false,
    'DPT Dose 2': false,
    'DPT Dose 3': false,
    'OPV (Polio)': false,
    'Measles Vaccine': false,
    'Tetanus Vaccine': false,
    'Hepatitis B': false,
  };

  bool _isRecording = false;

  String _getText(String en, String hi, String mr) {
    switch (widget.language) {
      case 'hi':
        return hi;
      case 'mr':
        return mr;
      default:
        return en;
    }
  }

  @override
  void dispose() {
    _bpController.dispose();
    _pulseController.dispose();
    _tempController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(_getText('Record Patient Visit', 'रोगी विज़िट रिकॉर्ड करें', 'रुग्ण भेट रेकॉर्ड करा')),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildVitalsSection(),
            const SizedBox(height: 20),
            _buildVisitNotesSection(),
            const SizedBox(height: 20),
            _buildImmunizationSection(),
            const SizedBox(height: 30),
            _buildSaveButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildVitalsSection() {
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppTheme.primaryBlue,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                _getText('Vitals', 'महत्वपूर्ण संकेत', 'महत्त्वाचे संकेत'),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildVitalInput(
            controller: _bpController,
            label: _getText('Blood Pressure', 'रक्तचाप', 'रक्तदाब'),
            hint: _getText('e.g., 120/80', 'उदा., 120/80', 'उदा., 120/80'),
            icon: Icons.monitor_heart_outlined,
          ),
          const SizedBox(height: 16),
          _buildVitalInput(
            controller: _pulseController,
            label: _getText('Pulse (bpm)', 'नाड़ी (bpm)', 'नाडी (bpm)'),
            hint: _getText('e.g., 72', 'उदा., 72', 'उदा., 72'),
            icon: Icons.favorite_border,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          _buildVitalInput(
            controller: _tempController,
            label: _getText('Temperature (°F)', 'तापमान (°F)', 'तापमान (°F)'),
            hint: _getText('e.g., 98.6', 'उदा., 98.6', 'उदा., 98.6'),
            icon: Icons.thermostat_outlined,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _buildVitalInput({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppTheme.primaryBlue),
        filled: true,
        fillColor: AppTheme.backgroundWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.textLight.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.textLight.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2),
        ),
      ),
    );
  }

  Widget _buildVisitNotesSection() {
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.description,
                  color: AppTheme.primaryBlue,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getText('Visit Notes', 'यात्रा नोट्स', 'भेट नोट्स'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      _getText('यात्रा नोट्स', 'Visit Notes', 'Visit Notes'),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _notesController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: _getText(
                'Enter observations, recommendations, or any important notes...',
                'अवलोकन, सिफारिशें, या कोई महत्वपूर्ण नोट्स दर्ज करें...',
                'निरीक्षणे, शिफारसी किंवा कोणत्याही महत्त्वाच्या नोट्स प्रविष्ट करा...',
              ),
              filled: true,
              fillColor: AppTheme.backgroundWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppTheme.textLight.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppTheme.textLight.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getText('Voice Input', 'आवाज इनपुट', 'आवाज इनपुट'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                      Text(
                        _getText('आवाज इनपुट', 'Voice Input', 'Voice Input'),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _isRecording = !_isRecording;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_isRecording
                            ? _getText('Recording... (Demo)', 'रिकॉर्डिंग... (डेमो)', 'रेकॉर्डिंग... (डेमो)')
                            : _getText('Recording stopped', 'रिकॉर्डिंग बंद', 'रेकॉर्डिंग थांबवले')),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: Icon(_isRecording ? Icons.stop : Icons.mic),
                  label: Text(_isRecording
                      ? _getText('Stop', 'रोकें', 'थांबवा')
                      : _getText('Record', 'रिकॉर्ड', 'रेकॉर्ड')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRecording ? AppTheme.errorRed : Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.vaccines,
                  color: Colors.purple,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getText('Immunization Checklist', 'टीकाकरण चेकलिस्ट', 'लसीकरण चेकलिस्ट'),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    Text(
                      _getText('टीकाकरण चेकलिस्ट', 'Immunization Checklist', 'Immunization Checklist'),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._immunizationStatus.keys.map((String vaccine) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _immunizationStatus[vaccine] = !_immunizationStatus[vaccine]!;
                  });
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4F1E8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: _immunizationStatus[vaccine]! ? AppTheme.secondaryGreen : Colors.white,
                          border: Border.all(
                            color: _immunizationStatus[vaccine]! ? AppTheme.secondaryGreen : AppTheme.textLight,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: _immunizationStatus[vaccine]!
                            ? const Icon(Icons.check, color: Colors.white, size: 16)
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          vaccine,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getText(
              'Visit recorded successfully! (Demo)',
              'विज़िट सफलतापूर्वक रिकॉर्ड की गई! (डेमो)',
              'भेट यशस्वीरित्या रेकॉर्ड केली! (डेमो)',
            )),
          ),
        );
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryBlue,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Text(_getText('Save Visit', 'विज़िट सहेजें', 'भेट जतन करा')),
    );
  }
}
