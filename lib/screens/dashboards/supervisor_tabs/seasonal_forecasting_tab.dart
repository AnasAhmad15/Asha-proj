import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SeasonalForecastingTab extends StatelessWidget {
  final String language;
  const SeasonalForecastingTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHeader(context, 'Disease Outbreak Forecast', 'रोग प्रकोप पूर्वानुमान', 'रोग प्रकोप पूर्वानुमान'),
        const SizedBox(height: 16),
        _buildForecastChart(context),
        const SizedBox(height: 30),
        _buildHeader(context, 'Recommendations', 'सिफारिशें', 'शिफारसी'),
        const SizedBox(height: 16),
        _buildRecommendationsList(context),
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

  Widget _buildForecastChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Next 60 Days: High-Risk Areas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.map_outlined, size: 80, color: AppTheme.accentTeal),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Placeholder for geospatial map showing high-risk zones for upcoming seasonal diseases.',
              style: TextStyle(color: AppTheme.textLight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsList(BuildContext context) {
    return Column(
      children: const [
        _RecommendationItem(
          icon: Icons.warning_amber_rounded,
          title: 'Increase ASHA awareness campaigns in Sector 3',
          subtitle: 'High probability of water-borne diseases.',
          color: Colors.orange,
        ),
        _RecommendationItem(
          icon: Icons.inventory_2_outlined,
          title: 'Stock up on malaria kits for PHC 2',
          subtitle: 'Forecast shows a 40% increase in cases.',
          color: AppTheme.primaryBlue,
        ),
        _RecommendationItem(
          icon: Icons.school_outlined,
          title: 'Conduct refresher training on dehydration',
          subtitle: 'Heatwave expected in the next 15 days.',
          color: AppTheme.secondaryGreen,
        ),
      ],
    );
  }
}

class _RecommendationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _RecommendationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        isThreeLine: true,
      ),
    );
  }
}
