import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SeasonalForecastingScreen extends StatelessWidget {
  const SeasonalForecastingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seasonal Disease Trends'),
        backgroundColor: AppTheme.accentTeal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildForecastCard(),
          const SizedBox(height: 20),
          _buildDiseaseList(),
        ],
      ),
    );
  }

  Widget _buildForecastCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.trending_up, color: AppTheme.accentTeal, size: 28),
                SizedBox(width: 10),
                Text(
                  'Next 30 Days Forecast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildMockBarChart(),
            const SizedBox(height: 20),
            const Text(
              'Predicted increase in water-borne diseases due to monsoon season.',
              style: TextStyle(color: AppTheme.textLight, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMockBarChart() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildBar('Week 1', 60, Colors.blue),
          _buildBar('Week 2', 80, Colors.orange),
          _buildBar('Week 3', 120, Colors.red),
          _buildBar('Week 4', 100, Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildBar(String label, double height, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('${height.toInt()}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(
          width: 50,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildDiseaseList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'High-Risk Diseases',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildDiseaseCard('Dengue', 'High Risk', Icons.bug_report, Colors.red),
        _buildDiseaseCard('Malaria', 'Medium Risk', Icons.coronavirus_outlined, Colors.orange),
        _buildDiseaseCard('Typhoid', 'Low Risk', Icons.water_drop_outlined, Colors.blue),
      ],
    );
  }

  Widget _buildDiseaseCard(String name, String risk, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            risk,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
