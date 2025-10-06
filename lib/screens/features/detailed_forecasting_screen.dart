import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class DetailedForecastingScreen extends StatelessWidget {
  final String language;
  const DetailedForecastingScreen({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getText('Detailed Forecasting', 'विस्तृत पूर्वानुमान', 'तपशीलवार अंदाज'),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade50,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Seasonal Disease Trends Section
          _buildSeasonalTrendsSection(),
          const SizedBox(height: 24),
          
          // Current vs Forecast Section
          _buildCurrentVsForecastSection(),
          const SizedBox(height: 24),
          
          // High Risk Alerts Section
          _buildHighRiskAlertsSection(),
          const SizedBox(height: 24),
          
          // Prevention Calendar Section
          _buildPreventionCalendarSection(),
          const SizedBox(height: 16),
        ],
      ),
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

  Widget _buildSeasonalTrendsSection() {
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
          
          // Monthly Data Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMonthData('Jan', '40'),
              _buildMonthData('Feb', '35'),
              _buildMonthData('Mar', '45'),
              _buildMonthData('Apr', '60'),
              _buildMonthData('May', '75'),
              _buildMonthData('Jun', '85'),
            ],
          ),
          const SizedBox(height: 16),
          
          // Demo Chart
          Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: _buildDemoChart(),
          ),
          const SizedBox(height: 16),
          
          // Prediction Info
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

  Widget _buildMonthData(String month, String cases) {
    return Column(
      children: [
        Text(
          month,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          cases,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildDemoChart() {
    final List<double> dataPoints = [40, 35, 45, 60, 75, 85];
    final double maxValue = dataPoints.reduce((a, b) => a > b ? a : b);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: dataPoints.asMap().entries.map((entry) {
        int index = entry.key;
        double value = entry.value;
        double height = (value / maxValue) * 60; // Max height of 60px
        
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Data point circle
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
            ),
            // Line to next point (except for last point)
            if (index < dataPoints.length - 1)
              Container(
                width: 2,
                height: 4,
                color: Colors.purple.withOpacity(0.3),
              ),
            // Vertical bar
            Container(
              width: 8,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.purple.withOpacity(0.8),
                    Colors.purple.withOpacity(0.4),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCurrentVsForecastSection() {
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
                  color: AppTheme.secondaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.trending_up, color: AppTheme.secondaryGreen, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                _getText('Current vs Forecast', 'वर्तमान बनाम पूर्वानुमान', 'सध्याचे विरुद्ध अंदाज'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          _buildDiseaseComparison('Dengue', 45, 78, 33, Colors.red),
          const SizedBox(height: 16),
          _buildDiseaseComparison('Malaria', 32, 28, -4, Colors.orange),
          const SizedBox(height: 16),
          _buildDiseaseComparison('Typhoid', 18, 35, 17, Colors.amber),
          const SizedBox(height: 16),
          _buildDiseaseComparison('Diarrhea', 56, 62, 6, Colors.blue),
          const SizedBox(height: 16),
          _buildDiseaseComparison('Respiratory', 89, 72, -17, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildDiseaseComparison(String disease, int current, int forecast, int change, Color color) {
    bool isIncrease = change > 0;
    double progress = current / 100;
    double forecastProgress = forecast / 100;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              disease,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isIncrease 
                  ? Colors.red.withOpacity(0.1)
                  : AppTheme.secondaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${isIncrease ? '↑' : '↓'} ${change.abs()}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isIncrease ? Colors.red : AppTheme.secondaryGreen,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        // Progress bars
        Stack(
          children: [
            // Forecast bar (background)
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // Current bar (foreground)
            FractionallySizedBox(
              widthFactor: progress > forecastProgress ? forecastProgress : progress,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _getText('Current: $current cases', 'वर्तमान: $current मामले', 'सध्या: $current प्रकरणे'),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              _getText('Forecast: $forecast cases', 'पूर्वानुमान: $forecast मामले', 'अंदाज: $forecast प्रकरणे'),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
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
          
          _buildDetailedAlertItem(
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
          _buildDetailedAlertItem(
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

  Widget _buildDetailedAlertItem(String disease, String action, Color riskColor, String riskLevel) {
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
            height: 50,
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: riskColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              riskLevel,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreventionCalendarSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00C851), Color(0xFF00E676)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.white, size: 24),
              SizedBox(width: 12),
              Text(
                'Prevention Calendar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          _buildPreventionItem(
            _getText('Week 1-2: Mosquito Control Drive', 'सप्ताह 1-2: मच्छर नियंत्रण अभियान', 'आठवडा 1-2: डास नियंत्रण मोहीम'),
            _getText('Focus areas: Schools, water bodies', 'फोकस क्षेत्र: स्कूल, जल निकाय', 'लक्ष क्षेत्र: शाळा, जलाशय'),
          ),
          const SizedBox(height: 12),
          _buildPreventionItem(
            _getText('Week 3-4: Water Quality Testing', 'सप्ताह 3-4: पानी की गुणवत्ता परीक्षण', 'आठवडा 3-4: पाण्याची गुणवत्ता तपासणी'),
            _getText('Target: All PHC areas', 'लक्ष्य: सभी PHC क्षेत्र', 'लक्ष्य: सर्व PHC क्षेत्र'),
          ),
        ],
      ),
    );
  }

  Widget _buildPreventionItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
