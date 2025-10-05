import 'package:flutter/material.dart';
import 'package:morse_proj/screens/features/impact_score_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class ImpactScoreTab extends StatelessWidget {
  final String language;
  const ImpactScoreTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildImpactScoreCard(context),
        const SizedBox(height: 30),
        _buildHeader(context, 'Key Performance Indicators', 'प्रमुख प्रदर्शन संकेतक', 'मुख्य कार्यप्रदर्शन निर्देशक'),
        const SizedBox(height: 16),
        _buildKpiGrid(context),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ImpactScoreScreen()),
            );
          },
          child: const Text('View Detailed Report'),
        ),
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

  Widget _buildImpactScoreCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.accentTeal, AppTheme.primaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Overall Impact Score',
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
          const SizedBox(height: 10),
          const Text(
            '8.2/10',
            style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.trending_up, color: Colors.white),
              const SizedBox(width: 8),
              const Text(
                '+5% from last month',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKpiGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        _KpiCard(title: 'Coverage Area', value: '85%', icon: Icons.map_outlined, color: AppTheme.primaryBlue),
        _KpiCard(title: 'Patient Satisfaction', value: '94%', icon: Icons.sentiment_satisfied_alt_outlined, color: AppTheme.secondaryGreen),
        _KpiCard(title: 'ASHA Engagement', value: '98%', icon: Icons.groups_2_outlined, color: AppTheme.accentTeal),
        _KpiCard(title: 'Data Accuracy', value: '96%', icon: Icons.check_circle_outline, color: Colors.orange),
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _KpiCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: color),
            const Spacer(),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
