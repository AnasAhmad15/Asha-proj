import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class PatientRegistrationScreen extends StatelessWidget {
  const PatientRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register New Patient'),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Enter Patient Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.textDark),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(label: 'Full Name', icon: Icons.person_outline),
                  const SizedBox(height: 20),
                  _buildTextField(label: 'Date of Birth', icon: Icons.calendar_today_outlined, isDatePicker: true, context: context),
                  const SizedBox(height: 20),
                  _buildDropdownField(label: 'Gender', icon: Icons.wc_outlined, items: ['Male', 'Female', 'Other']),
                  const SizedBox(height: 20),
                  _buildTextField(label: 'Phone Number', icon: Icons.phone_outlined, keyboardType: TextInputType.phone),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.qr_code_2_outlined, size: 28),
                    label: const Text('Generate QR & Save'),
                    onPressed: () {
                      // Placeholder for QR generation and saving
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Patient Registered Successfully! (Placeholder)')),
                      );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required IconData icon, TextInputType keyboardType = TextInputType.text, bool isDatePicker = false, BuildContext? context}) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      readOnly: isDatePicker,
      onTap: isDatePicker ? () async {
        // Placeholder to show date picker
        await showDatePicker(
          context: context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
      } : null,
    );
  }

  Widget _buildDropdownField({required String label, required IconData icon, required List<String> items}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
