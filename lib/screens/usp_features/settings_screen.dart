import 'package:flutter/material.dart';
import 'package:morse_proj/screens/usp_features/blockchain_info_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSettingsCard(
            context,
            title: 'Profile',
            children: [
              _buildSettingsTile(icon: Icons.person_outline, title: 'Edit Profile', onTap: () {}),
              _buildSettingsTile(icon: Icons.lock_outline, title: 'Change Password', onTap: () {}),
            ],
          ),
          const SizedBox(height: 20),
          _buildSettingsCard(
            context,
            title: 'Preferences',
            children: [
              _buildLanguageToggle(context),
              _buildSettingsTile(icon: Icons.notifications_outlined, title: 'Notification Settings', onTap: () {}),
            ],
          ),
          const SizedBox(height: 20),
          _buildSettingsCard(
            context,
            title: 'Security & Info',
            children: [
              _buildSettingsTile(icon: Icons.shield_outlined, title: 'Blockchain Security Info', onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BlockchainInfoScreen()),
                );
              }),
              _buildSettingsTile(icon: Icons.info_outline, title: 'About App', onTap: () {}),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement logout logic
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorRed,
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(BuildContext context, {required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryBlue)),
            const Divider(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.textDark),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildLanguageToggle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.language_outlined, color: AppTheme.textDark),
              SizedBox(width: 16),
              Text('Language', style: TextStyle(fontSize: 16)),
            ],
          ),
          DropdownButton<String>(
            value: 'English',
            items: ['English', 'हिन्दी', 'मराठी'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {
              // TODO: Implement language change logic
            },
          ),
        ],
      ),
    );
  }
}
