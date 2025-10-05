import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class ReportsForecastingTab extends StatelessWidget {
  final String language;
  const ReportsForecastingTab({super.key, required this.language});

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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildMetricsGrid(context),
        const SizedBox(height: 20),
        _buildForecastChart(context),
      ],
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _MetricCard(title: _getText('Immunization Rate', 'टीकाकरण दर', 'लसीकरण दर'), value: '92%', color: AppTheme.secondaryGreen),
        _MetricCard(title: _getText('Maternal Visits', 'मातृ विज़िट', 'मातृ भेटी'), value: '128', color: AppTheme.primaryBlue),
        _MetricCard(title: _getText('Child Checkups', 'बाल जांच', 'बाल तपासणी'), value: '312', color: AppTheme.accentTeal),
        _MetricCard(title: _getText('Malnutrition Cases', 'कुपोषण के मामले', 'कुपोषणाची प्रकरणे'), value: '14', color: AppTheme.errorRed),
      ],
    );
  }

  Widget _buildForecastChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getText('Dengue & Malaria Cases - Next 30 Days', 'डेंगू और मलेरिया के मामले - अगले 30 दिन', 'डेंग्यू आणि मलेरियाची प्रकरणे - पुढील 30 दिवस'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.show_chart, size: 64, color: AppTheme.secondaryGreen),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _getText('Placeholder for forecasting chart. This will show predicted trends for seasonal diseases based on historical data.', 'पूर्वानुमान चार्ट के लिए प्लेसहोल्डर। यह ऐतिहासिक डेटा के आधार पर मौसमी बीमारियों के अनुमानित रुझान दिखाएगा।', 'अंदाज चार्टसाठी प्लेसहोल्डर. हे ऐतिहासिक डेटाच्या आधारे हंगामी आजारांचे अंदाजित ट्रेंड दाखवेल.'),
              style: const TextStyle(color: AppTheme.textLight),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color),
          ),
        ],
      ),
    );
  }
}
