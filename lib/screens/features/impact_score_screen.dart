import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class ImpactScoreScreen extends StatelessWidget {
  const ImpactScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Impact Score Dashboard',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade50,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Regional Performance Section
          _buildRegionalPerformanceSection(),
          const SizedBox(height: 24),
          
          // Health Outcome Scores Section
          _buildHealthOutcomeSection(),
          const SizedBox(height: 24),
          
          // Key Achievements Section
          _buildKeyAchievementsSection(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildRegionalPerformanceSection() {
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
          const Text(
            'Regional Performance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 20),
          _buildRegionalItem('North District', 87.5, 4.2, true),
          const SizedBox(height: 16),
          _buildRegionalItem('South District', 84.2, 2.8, true),
          const SizedBox(height: 16),
          _buildRegionalItem('East District', 79.8, -1.5, false),
          const SizedBox(height: 16),
          _buildRegionalItem('West District', 91.3, 5.6, true),
        ],
      ),
    );
  }

  Widget _buildHealthOutcomeSection() {
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
          const Text(
            'Health Outcome Scores',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 20),
          _buildHealthOutcomeItem('Community Health', 82, 5, Colors.pink, Icons.favorite),
          const SizedBox(height: 16),
          _buildHealthOutcomeItem('Vaccination Coverage', 90, 8, AppTheme.secondaryGreen, Icons.check_circle),
          const SizedBox(height: 16),
          _buildHealthOutcomeItem('Maternal Care', 88, 3, Colors.purple, Icons.people),
          const SizedBox(height: 16),
          _buildHealthOutcomeItem('Child Nutrition', 75, 12, Colors.orange, Icons.trending_up),
          const SizedBox(height: 16),
          _buildHealthOutcomeItem('Disease Prevention', 85, 6, Colors.blue, Icons.security),
        ],
      ),
    );
  }

  Widget _buildKeyAchievementsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF8A00), Color(0xFFFFB347)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
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
              Icon(Icons.emoji_events, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                'Key Achievements This Month',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAchievementItem('100% Vaccination Coverage in West District'),
          const SizedBox(height: 12),
          _buildAchievementItem('Zero Maternal Mortality Cases'),
          const SizedBox(height: 12),
          _buildAchievementItem('500+ New Patient Registrations'),
        ],
      ),
    );
  }

  Widget _buildRegionalItem(String district, double score, double change, bool isPositive) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              district,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
              ),
            ),
            Row(
              children: [
                Text(
                  score.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isPositive ? AppTheme.secondaryGreen : Colors.red,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: isPositive 
                      ? AppTheme.secondaryGreen.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${isPositive ? '↑' : '↓'} ${change.abs()}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isPositive ? AppTheme.secondaryGreen : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: score / 100,
          backgroundColor: Colors.grey.shade200,
          valueColor: AlwaysStoppedAnimation<Color>(
            isPositive ? AppTheme.secondaryGreen : Colors.red,
          ),
          minHeight: 6,
        ),
      ],
    );
  }

  Widget _buildHealthOutcomeItem(String title, int score, int change, Color color, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: score / 100,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 6,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              score.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              '+$change%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.secondaryGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementItem(String achievement) {
    return Row(
      children: [
        const Icon(Icons.check, color: Colors.white, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            achievement,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
