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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Analytics Overview
          Text(
            _getText('Health Analytics Overview', 'स्वास्थ्य विश्लेषण अवलोकन', 'आरोग्य विश्लेषण अवलोकन'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          // Metrics Grid
          _buildMetricsGrid(context),
          const SizedBox(height: 24),
          
          // Seasonal Disease Forecasting Section
          Text(
            _getText('Seasonal Disease Forecasting', 'मौसमी रोग पूर्वानुमान', 'हंगामी रोग अंदाज'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          // Dengue & Malaria Chart
          _buildForecastChart(
            context,
            title: _getText('Dengue Cases - Next 30 Days', 'डेंगू के मामले - अगले 30 दिन', 'डेंग्यूची प्रकरणे - पुढील 30 दिवस'),
            icon: Icons.coronavirus,
            color: AppTheme.errorRed,
            description: _getText('Predicted dengue outbreak based on weather patterns and historical data', 'मौसम पैटर्न और ऐतिहासिक डेटा के आधार पर डेंगू प्रकोप की भविष्यवाणी', 'हवामान पॅटर्न आणि ऐतिहासिक डेटाच्या आधारे डेंग्यू प्रकोपाचा अंदाज'),
          ),
          const SizedBox(height: 16),
          
          // Malaria Chart
          _buildForecastChart(
            context,
            title: _getText('Malaria Cases - Next 30 Days', 'मलेरिया के मामले - अगले 30 दिन', 'मलेरियाची प्रकरणे - पुढील 30 दिवस'),
            icon: Icons.bug_report,
            color: AppTheme.accentTeal,
            description: _getText('Malaria risk assessment based on monsoon patterns and vector activity', 'मानसून पैटर्न और वेक्टर गतिविधि के आधार पर मलेरिया जोखिम मूल्यांकन', 'पावसाळी पॅटर्न आणि वेक्टर क्रियाकलापांच्या आधारे मलेरिया जोखीम मूल्यांकन'),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive aspect ratio based on screen width
        double aspectRatio = constraints.maxWidth > 400 ? 1.3 : 1.1;
        double spacing = constraints.maxWidth > 400 ? 12 : 8;
        
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: aspectRatio,
          children: [
            _MetricCard(
              title: _getText('Immunization Rate', 'टीकाकरण दर', 'लसीकरण दर'), 
              value: '92%', 
              color: AppTheme.secondaryGreen,
              icon: Icons.vaccines,
            ),
            _MetricCard(
              title: _getText('Maternal Visits', 'मातृ विज़िट', 'मातृ भेटी'), 
              value: '128', 
              color: AppTheme.primaryBlue,
              icon: Icons.pregnant_woman,
            ),
            _MetricCard(
              title: _getText('Child Checkups', 'बाल जांच', 'बाल तपासणी'), 
              value: '312', 
              color: AppTheme.accentTeal,
              icon: Icons.child_care,
            ),
            _MetricCard(
              title: _getText('Malnutrition Cases', 'कुपोषण के मामले', 'कुपोषणाची प्रकरणे'), 
              value: '14', 
              color: AppTheme.errorRed,
              icon: Icons.warning,
            ),
          ],
        );
      },
    );
  }

  Widget _buildForecastChart(BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Chart Container with Disease-specific Visual
            LayoutBuilder(
              builder: (context, constraints) {
                double chartHeight = constraints.maxWidth > 400 ? 160 : 140;
                return Container(
                  height: chartHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.withOpacity(0.2)),
                  ),
                  child: Stack(
                    children: [
                      // Background pattern
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _ChartPatternPainter(color: color),
                        ),
                      ),
                      // Center icon and text
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon, size: constraints.maxWidth > 400 ? 40 : 32, color: color.withOpacity(0.7)),
                            const SizedBox(height: 6),
                            Text(
                              _getText('Forecasting Model', 'पूर्वानुमान मॉडल', 'अंदाज मॉडेल'),
                              style: TextStyle(
                                fontSize: constraints.maxWidth > 400 ? 13 : 11,
                                fontWeight: FontWeight.w600,
                                color: color,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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
  final IconData icon;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing based on available space
        double iconSize = constraints.maxWidth > 150 ? 24 : 20;
        double valueSize = constraints.maxWidth > 150 ? 24 : 20;
        double titleSize = constraints.maxWidth > 150 ? 11 : 10;
        double padding = constraints.maxWidth > 150 ? 16 : 12;
        
        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(constraints.maxWidth > 150 ? 10 : 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: iconSize),
              ),
              SizedBox(height: constraints.maxHeight > 120 ? 10 : 6),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: valueSize, 
                    fontWeight: FontWeight.bold, 
                    color: color
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: constraints.maxHeight > 120 ? 6 : 4),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleSize, 
                    fontWeight: FontWeight.w600, 
                    color: Colors.grey.shade700,
                    height: 1.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Custom painter for chart background pattern
class _ChartPatternPainter extends CustomPainter {
  final Color color;

  _ChartPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw grid lines
    for (int i = 0; i < 6; i++) {
      double y = (size.height / 5) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    for (int i = 0; i < 8; i++) {
      double x = (size.width / 7) * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw sample trend line
    final trendPaint = Paint()
      ..color = color.withOpacity(0.4)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.3, size.height * 0.6,
      size.width * 0.5, size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.7, size.height * 0.3,
      size.width * 0.9, size.height * 0.2,
    );

    canvas.drawPath(path, trendPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
