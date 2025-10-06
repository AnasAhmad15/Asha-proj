import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class FeedbackTab extends StatelessWidget {
  final String language;
  const FeedbackTab({super.key, required this.language});

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
          // Feedback Analytics Cards
          Row(
            children: [
              Expanded(
                child: _FeedbackAnalyticsCard(
                  title: _getText('Total Feedback', 'कुल फीडबैक', 'एकूण अभिप्राय'),
                  value: '156',
                  icon: Icons.feedback,
                  color: AppTheme.primaryBlue,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _FeedbackAnalyticsCard(
                  title: _getText('Pending Review', 'समीक्षा लंबित', 'पुनरावलोकन प्रलंबित'),
                  value: '12',
                  icon: Icons.pending_actions,
                  color: AppTheme.errorRed,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Submit Feedback Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.secondaryGreen.withOpacity(0.1), AppTheme.secondaryGreen.withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.secondaryGreen.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getText('Submit Feedback', 'फीडबैक सबमिट करें', 'अभिप्राय सादर करा'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getText('Share your thoughts and suggestions', 'अपने विचार और सुझाव साझा करें', 'आपले विचार आणि सूचना सामायिक करा'),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FeedbackFormScreen(language: language),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_comment, color: Colors.white, size: 20),
                    label: Text(
                      _getText('New Feedback', 'नया फीडबैक', 'नवीन अभिप्राय'),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Recent Feedback Section
          Text(
            _getText('Recent Feedback', 'हाल का फीडबैक', 'अलीकडील अभिप्राय'),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 16),
          
          // Feedback List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              final ashaNames = [
                'Dr. Verma', 'ASHA Meera', 'Sunita Devi', 
                'Fatima Begum', 'Priya Sharma'
              ];
              final feedbackMessages = [
                _getText('Need more medical supplies', 'और चिकित्सा आपूर्ति चाहिए', 'अधिक वैद्यकीय पुरवठा हवा'),
                _getText('Excellent training session', 'उत्कृष्ट प्रशिक्षण सत्र', 'उत्कृष्ट प्रशिक्षण सत्र'),
                _getText('Transportation issues in remote areas', 'दूरदराज के क्षेत्रों में परिवहन की समस्या', 'दुर्गम भागात वाहतुकीची समस्या'),
                _getText('Request for additional training', 'अतिरिक्त प्रशिक्षण का अनुरोध', 'अतिरिक्त प्रशिक्षणाची विनंती'),
                _getText('Equipment maintenance required', 'उपकरण रखरखाव आवश्यक', 'उपकरणांची देखभाल आवश्यक')
              ];
              final timeStamps = ['2 hours ago', '5 hours ago', '1 day ago', '2 days ago', '3 days ago'];
              
              return _FeedbackListItem(
                ashaName: ashaNames[index],
                feedback: feedbackMessages[index],
                timestamp: timeStamps[index],
                isAddressed: index == 1 || index == 3, // Some are addressed
                language: language,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeedbackListItem extends StatelessWidget {
  final String ashaName;
  final String feedback;
  final String timestamp;
  final bool isAddressed;
  final String language;

  const _FeedbackListItem({
    required this.ashaName,
    required this.feedback,
    required this.timestamp,
    required this.isAddressed,
    required this.language,
  });

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
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ashaName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isAddressed ? AppTheme.secondaryGreen.withOpacity(0.1) : AppTheme.errorRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isAddressed ? _getText('Addressed', 'संबोधित', 'संबोधित') : _getText('Pending', 'लंबित', 'प्रलंबित'),
                    style: TextStyle(color: isAddressed ? AppTheme.secondaryGreen : AppTheme.errorRed, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(feedback, style: const TextStyle(color: AppTheme.textLight)),
            const SizedBox(height: 12),
            Text(timestamp, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            if (!isAddressed) ...[
              const Divider(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: Text(_getText('Mark as Addressed', 'संबोधित के रूप में चिह्नित करें', 'संबोधित म्हणून चिन्हांकित करा'))
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Feedback Analytics Card Widget
class _FeedbackAnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _FeedbackAnalyticsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Feedback Form Screen
class FeedbackFormScreen extends StatefulWidget {
  final String language;
  
  const FeedbackFormScreen({super.key, required this.language});

  @override
  State<FeedbackFormScreen> createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  int _selectedRating = 0;
  String _selectedCategory = '';
  final TextEditingController _feedbackController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          _getText('Submit Feedback', 'फीडबैक सबमिट करें', 'अभिप्राय सादर करा'),
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Experience Rating Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
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
                      const Icon(Icons.chat_bubble_outline, color: AppTheme.primaryBlue, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getText('How was your experience?', 'आपका अनुभव कैसा रहा?', 'तुमचा अनुभव कसा होता?'),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.textDark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _getText('Rate your overall experience', 'अपने समग्र अनुभव को रेट करें', 'तुमच्या एकूण अनुभवाला रेट करा'),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Star Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRating = index + 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            _selectedRating > index ? Icons.star : Icons.star_border,
                            color: _selectedRating > index ? Colors.amber : Colors.grey.shade400,
                            size: 40,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      _getText('Tap a star to rate', 'रेट करने के लिए स्टार पर टैप करें', 'रेट करण्यासाठी स्टारवर टॅप करा'),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Feedback Category Section
            Text(
              _getText('Feedback Category', 'फीडबैक श्रेणी', 'अभिप्राय श्रेणी'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 16),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.8,
              children: [
                _CategoryCard(
                  title: _getText('App Experience', 'ऐप अनुभव', 'अॅप अनुभव'),
                  icon: Icons.smartphone,
                  color: AppTheme.primaryBlue,
                  isSelected: _selectedCategory == 'app',
                  onTap: () => setState(() => _selectedCategory = 'app'),
                ),
                _CategoryCard(
                  title: _getText('Training & Support', 'प्रशिक्षण और सहायता', 'प्रशिक्षण आणि सहाय्य'),
                  icon: Icons.school,
                  color: AppTheme.accentTeal,
                  isSelected: _selectedCategory == 'training',
                  onTap: () => setState(() => _selectedCategory = 'training'),
                ),
                _CategoryCard(
                  title: _getText('Technical Issues', 'तकनीकी समस्याएं', 'तांत्रिक समस्या'),
                  icon: Icons.build,
                  color: AppTheme.errorRed,
                  isSelected: _selectedCategory == 'technical',
                  onTap: () => setState(() => _selectedCategory = 'technical'),
                ),
                _CategoryCard(
                  title: _getText('Suggestions', 'सुझाव', 'सूचना'),
                  icon: Icons.lightbulb,
                  color: Colors.orange,
                  isSelected: _selectedCategory == 'suggestions',
                  onTap: () => setState(() => _selectedCategory = 'suggestions'),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Feedback Text Section
            Text(
              _getText('Tell us more', 'हमें और बताएं', 'आम्हाला अधिक सांगा'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 16),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _feedbackController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: _getText(
                    'Share your thoughts, suggestions, or report any issues...',
                    'अपने विचार, सुझाव साझा करें या किसी समस्या की रिपोर्ट करें...',
                    'आपले विचार, सूचना सामायिक करा किंवा कोणत्याही समस्येची तक्रार करा...'
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${_feedbackController.text.length} characters',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle feedback submission
                  _submitFeedback();
                },
                icon: const Icon(Icons.send, color: Colors.white),
                label: Text(
                  _getText('Submit Feedback', 'फीडबैक सबमिट करें', 'अभिप्राय सादर करा'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Help Message
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.secondaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.secondaryGreen.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: AppTheme.secondaryGreen, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _getText(
                        'Your feedback helps us improve the ASHA EHR Companion app for everyone',
                        'आपका फीडबैक हमें सभी के लिए ASHA EHR कंपेनियन ऐप को बेहतर बनाने में मदद करता है',
                        'तुमचा अभिप्राय आम्हाला सर्वांसाठी ASHA EHR कंपेनियन अॅप सुधारण्यास मदत करतो'
                      ),
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.secondaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback() {
    // Show success message and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_getText(
          'Feedback submitted successfully!',
          'फीडबैक सफलतापूर्वक सबमिट किया गया!',
          'अभिप्राय यशस्वीरित्या सादर केला!'
        )),
        backgroundColor: AppTheme.secondaryGreen,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}

// Category Card Widget
class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? color : Colors.grey.shade600,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? color : Colors.grey.shade700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
