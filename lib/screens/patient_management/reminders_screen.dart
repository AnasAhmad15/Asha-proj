import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final Map<String, bool> _reminders = {
    'Sunita Sharma - ANC Checkup 3': false,
    'Priya Singh - DPT-2 Vaccination': true,
    'Geeta Devi - Postnatal Visit 1': false,
    'Ramesh Kumar - Child Growth Monitoring': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Reminders'),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildSectionHeader('Pending Tasks'),
          ..._reminders.entries
              .where((entry) => !entry.value)
              .map((entry) => _buildReminderTile(entry.key, entry.value)),
          const SizedBox(height: 30),
          _buildSectionHeader('Completed Tasks'),
          ..._reminders.entries
              .where((entry) => entry.value)
              .map((entry) => _buildReminderTile(entry.key, entry.value)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.textDark)),
    );
  }

  Widget _buildReminderTile(String title, bool isCompleted) {
    IconData iconData;
    Color iconColor;

    if (title.contains('ANC')) {
      iconData = Icons.pregnant_woman_outlined;
      iconColor = Colors.pink;
    } else if (title.contains('Vaccination')) {
      iconData = Icons.vaccines_outlined;
      iconColor = AppTheme.accentTeal;
    } else {
      iconData = Icons.child_care_outlined;
      iconColor = Colors.orange;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: SwitchListTile(
        secondary: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(iconData, color: iconColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            color: isCompleted ? AppTheme.textLight : AppTheme.textDark,
          ),
        ),
        value: isCompleted,
        onChanged: (bool value) {
          setState(() {
            _reminders[title] = value;
          });
        },
        activeColor: AppTheme.secondaryGreen,
      ),
    );
  }
}
