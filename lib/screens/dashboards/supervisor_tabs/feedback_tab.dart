import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class FeedbackTab extends StatefulWidget {
  final String language;
  const FeedbackTab({super.key, required this.language});

  @override
  State<FeedbackTab> createState() => _FeedbackTabState();
}

class _FeedbackTabState extends State<FeedbackTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _getText(String en, String hi, String mr) {
    switch (widget.language) {
      case 'hi':
        return hi;
      case 'mr':
        return mr;
      default:
        return en;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Overview Stats Row
        _buildOverviewStatsRow(),
        const SizedBox(height: 20),
        
        // Feedback Summary Section
        _buildFeedbackSummarySection(),
        const SizedBox(height: 20),
        
        // Recent Feedback from Field Section
        _buildRecentFeedbackSection(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildOverviewStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildOverviewCard(
            _getText('Total Feedback', 'कुल फीडबैक', 'एकूण अभिप्राय'),
            '342',
            AppTheme.primaryBlue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildOverviewCard(
            _getText('Pending Review', 'लंबित समीक्षा', 'प्रलंबित पुनरावलोकन'),
            '23',
            Colors.deepOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildOverviewCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackSummarySection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getText('Feedback Summary', 'फीडबैक सारांश', 'अभिप्राय सारांश'),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
            children: [
              _buildSummaryCard(
                _getText('Resources', 'संसाधन', 'संसाधने'),
                '45',
                Icons.inventory_2_outlined,
                AppTheme.primaryBlue,
              ),
              _buildSummaryCard(
                _getText('Training', 'प्रशिक्षण', 'प्रशिक्षण'),
                '32',
                Icons.school_outlined,
                Colors.purple,
              ),
              _buildSummaryCard(
                _getText('Maintenance', 'रखरखाव', 'देखभाल'),
                '28',
                Icons.build_outlined,
                Colors.orange,
              ),
              _buildSummaryCard(
                _getText('Achievements', 'उपलब्धियां', 'यश'),
                '67',
                Icons.emoji_events_outlined,
                AppTheme.secondaryGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const Spacer(),
          Text(
            count,
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
              fontSize: 10,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentFeedbackSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getText('Recent Feedback from Field', 'फील्ड से हाल की फीडबैक', 'मैदानातून अलीकडील अभिप्राय'),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 14),
          _buildFeedbackItem(
            'North Zone Team',
            '1 hour ago',
            'Need additional medical kits for monsoon season preparedness',
            'Resources',
            AppTheme.primaryBlue,
            Icons.warning_outlined,
          ),
          const SizedBox(height: 10),
          _buildFeedbackItem(
            'ASHA Priya Sharma',
            '3 hours ago',
            'Excellent training on maternal health care received',
            'Training',
            Colors.purple,
            Icons.check_circle_outlined,
          ),
          const SizedBox(height: 10),
          _buildFeedbackItem(
            'PHC South',
            '5 hours ago',
            'Equipment maintenance required urgently',
            'Maintenance',
            Colors.orange,
            Icons.warning_outlined,
          ),
          const SizedBox(height: 10),
          _buildFeedbackItem(
            'East Zone Supervisor',
            '1 day ago',
            'Great improvement in vaccination coverage this month',
            'Achievement',
            AppTheme.secondaryGreen,
            Icons.check_circle_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackItem(
    String source,
    String timeAgo,
    String message,
    String category,
    Color categoryColor,
    IconData statusIcon,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: categoryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: categoryColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  source,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: categoryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(statusIcon, color: categoryColor, size: 16),
                ],
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            timeAgo,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            message,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 28,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: categoryColor,
                elevation: 0,
                side: BorderSide(color: categoryColor.withOpacity(0.3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              child: Text(
                _getText('Review', 'समीक्षा', 'पुनरावलोकन'),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

