import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class RewardsIncentivesScreen extends StatelessWidget {
  const RewardsIncentivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards & Incentives'),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildPerformanceScoreCard(),
          const SizedBox(height: 30),
          const Text(
            'My Badges',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildBadgesGrid(),
        ],
      ),
    );
  }

  Widget _buildPerformanceScoreCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Your Performance Score',
              style: TextStyle(fontSize: 18, color: AppTheme.textLight),
            ),
            const SizedBox(height: 12),
            const Text(
              '88/100',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppTheme.primaryBlue),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 0.88,
              minHeight: 12,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesGrid() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        _Badge(icon: Icons.star, label: 'Star Performer', color: Colors.amber),
        _Badge(icon: Icons.health_and_safety, label: 'Health Champion', color: AppTheme.secondaryGreen),
        _Badge(icon: Icons.verified, label: '100 Visits', color: AppTheme.primaryBlue),
        _Badge(icon: Icons.groups, label: 'Community Hero', color: Colors.orange),
        _Badge(icon: Icons.school, label: 'Training Pro', color: Colors.purple),
        _Badge(icon: Icons.card_giftcard, label: 'Monthly Target', color: AppTheme.errorRed, locked: true),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool locked;

  const _Badge({
    required this.icon,
    required this.label,
    required this.color,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: locked ? Colors.grey.shade300 : color.withOpacity(0.1),
            ),
            child: Icon(
              locked ? Icons.lock_outline : icon,
              size: 32,
              color: locked ? Colors.grey.shade600 : color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: locked ? Colors.grey.shade600 : AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
