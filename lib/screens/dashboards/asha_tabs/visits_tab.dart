import 'package:flutter/material.dart';
import 'package:morse_proj/screens/patient_management/reminders_screen.dart';
import 'package:morse_proj/screens/patient_management/visit_form_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class VisitsTab extends StatelessWidget {
  final String language;
  const VisitsTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHeader(context, 'Manage Visits', 'विज़िट प्रबंधित करें', 'भेटी व्यवस्थापित करा'),
        const SizedBox(height: 20),
        _ActionButton(
          icon: Icons.add_location_alt_outlined,
          title: 'Add New Visit',
          subtitle: 'Log a new patient visit',
          color: AppTheme.primaryBlue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VisitFormScreen(language: language)),
            );
          },
        ),
        const SizedBox(height: 16),
        _ActionButton(
          icon: Icons.mic_none_outlined,
          title: 'Record Voice Note',
          subtitle: 'Quickly capture audio notes',
          color: AppTheme.secondaryGreen,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Voice recording feature coming soon!')),
            );
          },
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildHeader(context, 'Upcoming Reminders', 'आगामी अनुस्मारक', 'आगामी स्मरणपत्रे')),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RemindersScreen()),
                );
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildReminderList(context),
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

  Widget _buildReminderList(BuildContext context) {
    return Column(
      children: const [
        _ReminderListItem(
          patientName: 'Ramesh Kumar',
          reminder: 'Blood pressure checkup',
          time: 'Today, 3:00 PM',
          icon: Icons.favorite,
          iconColor: AppTheme.errorRed,
        ),
        _ReminderListItem(
          patientName: 'Sunita Devi',
          reminder: 'Vaccination follow-up',
          time: 'Tomorrow, 10:00 AM',
          icon: Icons.vaccines,
          iconColor: AppTheme.secondaryGreen,
        ),
        _ReminderListItem(
          patientName: 'Arjun Singh',
          reminder: 'Diabetes consultation',
          time: 'Dec 20, 2:00 PM',
          icon: Icons.medication,
          iconColor: AppTheme.primaryBlue,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.textLight.withOpacity(0.2)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textDark)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 13, color: AppTheme.textLight)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: AppTheme.textLight),
          ],
        ),
      ),
    );
  }
}

class _ReminderListItem extends StatelessWidget {
  final String patientName;
  final String reminder;
  final String time;
  final IconData icon;
  final Color iconColor;

  const _ReminderListItem({
    required this.patientName,
    required this.reminder,
    required this.time,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(patientName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$reminder\n$time'),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.call_outlined),
          onPressed: () {},
          color: AppTheme.primaryBlue,
        ),
      ),
    );
  }
}
