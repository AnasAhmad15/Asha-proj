import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class RecognitionWallTab extends StatelessWidget {
  final String language;
  const RecognitionWallTab({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHeader(context, 'Recognition Wall', 'मान्यता की दीवार', 'मान्यता भिंत'),
        const SizedBox(height: 10),
        Text(
          _getSubHeader(context, 'Top Performers of the Month', 'महीने के शीर्ष प्रदर्शक', 'महिन्यातील शीर्ष कामगिरी करणारे'),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.textLight),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        _buildPodium(context),
        const SizedBox(height: 30),
        _buildHeader(context, 'Leaderboard', 'लीडरबोर्ड', 'लीडरबोर्ड'),
        const SizedBox(height: 16),
        _buildLeaderboardList(context),
        const SizedBox(height: 24),
        _buildCurrentScoreCard(context),
        const SizedBox(height: 20),
        _buildRecognitionMessage(context),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCurrentScoreCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF059669)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                '💪',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(width: 8),
              Text(
                'Keep Going!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.4,
              ),
              children: [
                TextSpan(text: "You're just "),
                TextSpan(
                  text: '140 points',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' away from breaking into the top 10!'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Next milestone reward:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '₹1000 Bonus + Special Badge',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecognitionMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD1FAE5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF10B981).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recognition Message',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '"Great work this month! Your dedication to community health is truly inspiring. Keep up the excellent service!"',
            style: TextStyle(
              fontSize: 15,
              color: AppTheme.textDark,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '- District Health Officer',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textLight,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  String _getSubHeader(BuildContext context, String en, String hi, String mr) {
    switch (language) {
      case 'hi':
        return hi;
      case 'mr':
        return mr;
      default:
        return en;
    }
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
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPodium(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PodiumMember(name: 'Priya Sharma', rank: 2, points: 1150, color: Colors.grey.shade400, height: 100),
        const SizedBox(width: 10),
        _PodiumMember(name: 'Anjali Devi', rank: 1, points: 1250, color: Colors.amber, height: 130),
        const SizedBox(width: 10),
        _PodiumMember(name: 'Meena Kumari', rank: 3, points: 1050, color: const Color(0xFFCD7F32), height: 80),
      ],
    );
  }

  Widget _buildLeaderboardList(BuildContext context) {
    return Column(
      children: const [
        _LeaderboardListItem(rank: 4, name: 'Sunita Verma', points: 980),
        _LeaderboardListItem(rank: 5, name: 'Kavita Singh', points: 950),
        _LeaderboardListItem(rank: 6, name: 'Rekha Patel', points: 920),
        _LeaderboardListItem(rank: 7, name: 'Pooja Yadav', points: 890),
      ],
    );
  }
}

class _PodiumMember extends StatelessWidget {
  final String name;
  final int rank;
  final int points;
  final Color color;
  final double height;

  const _PodiumMember({
    required this.name,
    required this.rank,
    required this.points,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Text(rank.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        const SizedBox(height: 4),
        Container(
          height: height,
          width: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              '$points\npts',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _LeaderboardListItem extends StatelessWidget {
  final int rank;
  final String name;
  final int points;

  const _LeaderboardListItem({
    required this.rank,
    required this.name,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '#$rank',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.secondaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$points pts',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
