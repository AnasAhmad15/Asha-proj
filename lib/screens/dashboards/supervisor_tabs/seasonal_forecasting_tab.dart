import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';
import 'package:morse_proj/screens/features/detailed_forecasting_screen.dart';

class SeasonalForecastingTab extends StatelessWidget {
  final String language;
  const SeasonalForecastingTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Disease Trends Overview
        _buildDiseaseOverviewSection(),
        const SizedBox(height: 20),
        
        // Quick Stats Grid
        _buildQuickStatsGrid(),
        const SizedBox(height: 20),
        
        // High Risk Alerts
        _buildHighRiskAlertsSection(),
        const SizedBox(height: 20),
        
        // View Detailed Forecasting Button
        _buildDetailedForecastButton(context),
        const SizedBox(height: 16),
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

  Widget _buildDiseaseOverviewSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.trending_up, color: Colors.purple, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                _getText('Seasonal Disease Trends', 'मौसमी रोग रुझान', 'हंगामी रोग ट्रेंड'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _getText('Monthly forecast analysis', 'मासिक पूर्वानुमान विश्लेषण', 'मासिक अंदाज विश्लेषण'),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.show_chart, size: 40, color: Colors.purple),
                  SizedBox(height: 8),
                  Text(
                    'Disease Trend Chart',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.purple.shade600, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _getText(
                      'Disease cases expected to peak in June with 85 reported cases',
                      'जून में 85 मामलों के साथ रोग के मामले चरम पर पहुंचने की उम्मीद',
                      'जून मध्ये 85 प्रकरणांसह रोगाची प्रकरणे शिखरावर पोहोचण्याची अपेक्षा'
                    ),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.purple.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildStatCard(
          _getText('Active Cases', 'सक्रिय मामले', 'सक्रिय प्रकरणे'),
          '234',
          Icons.local_hospital,
          Colors.red,
          '+12%',
        ),
        _buildStatCard(
          _getText('Recovered', 'ठीक हुए', 'बरे झाले'),
          '1,456',
          Icons.health_and_safety,
          AppTheme.secondaryGreen,
          '+8%',
        ),
        _buildStatCard(
          _getText('High Risk Areas', 'उच्च जोखिम क्षेत्र', 'उच्च जोखीम क्षेत्र'),
          '7',
          Icons.warning,
          Colors.orange,
          '+2',
        ),
        _buildStatCard(
          _getText('Prevention Rate', 'रोकथाम दर', 'प्रतिबंध दर'),
          '89%',
          Icons.shield,
          AppTheme.primaryBlue,
          '+5%',
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, String change) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 16),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  change,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.secondaryGreen,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildHighRiskAlertsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.warning, color: Colors.orange, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                _getText('High Risk Alerts', 'उच्च जोखिम अलर्ट', 'उच्च जोखीम अलर्ट'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAlertItem(
            'Dengue',
            _getText(
              'Action: Increase mosquito control activities',
              'कार्रवाई: मच्छर नियंत्रण गतिविधियां बढ़ाएं',
              'कृती: डास नियंत्रण उपक्रम वाढवा'
            ),
            Colors.red,
            'High Risk',
          ),
          const SizedBox(height: 12),
          _buildAlertItem(
            'Typhoid',
            _getText(
              'Action: Water quality testing required',
              'कार्रवाई: पानी की गुणवत्ता परीक्षण आवश्यक',
              'कृती: पाण्याची गुणवत्ता तपासणी आवश्यक'
            ),
            Colors.orange,
            'Medium Risk',
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem(String disease, String action, Color riskColor, String riskLevel) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: riskColor.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: riskColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  disease,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  action,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: riskColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              riskLevel,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: riskColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedForecastButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedForecastingScreen(language: language),
            ),
          );
        },
        icon: const Icon(Icons.analytics_outlined, color: Colors.white, size: 20),
        label: Text(
          _getText('View Detailed Forecasting', 'विस्तृत पूर्वानुमान देखें', 'तपशीलवार अंदाज पहा'),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}

