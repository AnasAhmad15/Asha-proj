import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class RewardsTab extends StatelessWidget {
  final String language;
  const RewardsTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHeader(context, 'My Rewards', 'मेरे पुरस्कार', 'माझे पुरस्कार'),
        const SizedBox(height: 10),
        _buildPointsCard(context),
        const SizedBox(height: 30),
        _buildHeader(context, 'Badges Earned', 'अर्जित बैज', 'कमावलेले बॅज'),
        const SizedBox(height: 16),
        _buildBadgesGrid(context),
        const SizedBox(height: 30),
        _buildHeader(context, 'Available Incentives', 'उपलब्ध प्रोत्साहन', 'उपलब्ध प्रोत्साहन'),
        const SizedBox(height: 16),
        _buildIncentivesList(context),
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

  Widget _buildPointsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryBlue, AppTheme.accentTeal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppTheme.primaryBlue.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: const Column(
        children: [
          Text(
            'Total Points',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 8),
          Text(
            '1,250',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.85,
      children: const [
        _Badge(icon: Icons.star, label: 'Star Performer', color: Colors.amber),
        _Badge(icon: Icons.military_tech, label: '100 Visits', color: AppTheme.primaryBlue),
        _Badge(icon: Icons.emoji_events, label: 'Top ASHA', color: Colors.purple),
        _Badge(icon: Icons.card_giftcard, label: 'Community Hero', color: AppTheme.secondaryGreen),
        _Badge(icon: Icons.bolt, label: 'Quick Responder', color: Colors.orange),
        _Badge(icon: Icons.favorite, label: 'Health Champion', color: AppTheme.errorRed),
      ],
    );
  }

  Widget _buildIncentivesList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.textLight.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _IncentiveListItem(
            title: 'Mobile Data Pack',
            points: '500 Points',
            icon: Icons.wifi,
            color: AppTheme.primaryBlue,
          ),
          const SizedBox(height: 12),
          _IncentiveListItem(
            title: 'Medical Kit Refill',
            points: '1000 Points',
            icon: Icons.medical_services_outlined,
            color: AppTheme.secondaryGreen,
          ),
          const SizedBox(height: 12),
          _IncentiveListItem(
            title: 'Training Certificate',
            points: '750 Points',
            icon: Icons.school_outlined,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _Badge({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.textLight.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Icon(
              icon,
              size: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IncentiveListItem extends StatelessWidget {
  final String title;
  final String points;
  final IconData icon;
  final Color color;

  const _IncentiveListItem({
    required this.title,
    required this.points,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.textLight.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  points,
                  style: TextStyle(
                    fontSize: 13,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              minimumSize: const Size(100, 44),
            ),
            child: const Text(
              'Redeem',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
