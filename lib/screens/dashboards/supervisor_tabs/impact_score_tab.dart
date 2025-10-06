import 'package:flutter/material.dart';
import 'package:morse_proj/screens/features/impact_score_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class ImpactScoreTab extends StatelessWidget {
  final String language;
  const ImpactScoreTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Key Metrics Grid (2x2)
        _buildMetricsGrid(context),
        const SizedBox(height: 32),
        
        // Regional Impact Scores Section
        _buildRegionalImpactSection(context),
        const SizedBox(height: 24),
        
        // View Detailed Report Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ImpactScoreScreen()),
              );
            },
            icon: const Icon(Icons.analytics_outlined, color: Colors.white, size: 20),
            label: Text(
              _getText('View Detailed Report', 'विस्तृत रिपोर्ट देखें', 'तपशीलवार अहवाल पहा'),
              style: const TextStyle(
                fontSize: 15, 
                fontWeight: FontWeight.w600, 
                color: Colors.white,
                height: 1.2,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

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

  Widget _buildMetricsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.4,
      children: [
        _MetricCard(
          title: _getText('Health Outcomes', 'स्वास्थ्य परिणाम', 'आरोग्य परिणाम'),
          value: '92%',
          icon: Icons.favorite_outline,
          color: AppTheme.primaryBlue,
        ),
        _MetricCard(
          title: _getText('Service Delivery', 'सेवा वितरण', 'सेवा वितरण'),
          value: '88%',
          icon: Icons.check_circle_outline,
          color: AppTheme.secondaryGreen,
        ),
        _MetricCard(
          title: _getText('Community Reach', 'सामुदायिक पहुंच', 'समुदायिक पोहोच'),
          value: '85%',
          icon: Icons.people_outline,
          color: Colors.deepOrange,
        ),
        _MetricCard(
          title: _getText('Quality Index', 'गुणवत्ता सूचकांक', 'गुणवत्ता निर्देशांक'),
          value: '90%',
          icon: Icons.star_outline,
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildRegionalImpactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _getText('Regional Impact Scores', 'क्षेत्रीय प्रभाव स्कोर', 'प्रादेशिक प्रभाव गुण'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 16),
        _RegionalScoreCard(
          zoneName: _getText('North Zone', 'उत्तर क्षेत्र', 'उत्तर विभाग'),
          score: 92,
          change: '+5%',
          isPositive: true,
        ),
        const SizedBox(height: 12),
        _RegionalScoreCard(
          zoneName: _getText('South Zone', 'दक्षिण क्षेत्र', 'दक्षिण विभाग'),
          score: 88,
          change: '+3%',
          isPositive: true,
        ),
        const SizedBox(height: 12),
        _RegionalScoreCard(
          zoneName: _getText('East Zone', 'पूर्व क्षेत्र', 'पूर्व विभाग'),
          score: 85,
          change: '-2%',
          isPositive: false,
        ),
      ],
    );
  }
}

// Metric Card Widget
class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 16),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
                height: 0.9,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Regional Score Card Widget
class _RegionalScoreCard extends StatelessWidget {
  final String zoneName;
  final int score;
  final String change;
  final bool isPositive;

  const _RegionalScoreCard({
    required this.zoneName,
    required this.score,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.secondaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.secondaryGreen.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.secondaryGreen.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: AppTheme.secondaryGreen,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  zoneName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Impact Score: $score',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isPositive 
                ? AppTheme.secondaryGreen.withOpacity(0.1)
                : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              change,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isPositive ? AppTheme.secondaryGreen : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
