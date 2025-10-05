import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class ImpactScoreScreen extends StatelessWidget {
  const ImpactScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impact Score Dashboard'),
        backgroundColor: AppTheme.accentTeal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildOverallScoreCard(),
          const SizedBox(height: 20),
          const Text(
            'Key Metrics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildMetricsGrid(),
        ],
      ),
    );
  }

  Widget _buildOverallScoreCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.accentTeal, AppTheme.primaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentTeal.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Overall Impact Score',
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
          const SizedBox(height: 10),
          const Text(
            '8.5/10',
            style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.trending_up, color: Colors.white),
              SizedBox(width: 8),
              Text(
                '+7% from last month',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildMetricCard('Community Health', '82%', Icons.health_and_safety, AppTheme.primaryBlue),
        _buildMetricCard('Vaccination Coverage', '90%', Icons.vaccines, AppTheme.secondaryGreen),
        _buildMetricCard('Maternal Care', '88%', Icons.pregnant_woman, Colors.pink),
        _buildMetricCard('Child Nutrition', '76%', Icons.child_care, Colors.orange),
      ],
    );
  }

  Widget _buildMetricCard(String title, String score, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(
              score,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
