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
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 5, // Placeholder count
      itemBuilder: (context, index) {
        final ashaNames = [
          'Sunita Devi', 'Fatima Begum', 'Priya Sharma', 
          'Ayesha Khan', 'Anjali Kumari'
        ];
        final feedbackMessages = [
          _getText('Need more medical supplies for vaccination drive', 'टीकाकरण अभियान के लिए और चिकित्सा आपूर्ति चाहिए', 'लसीकरण मोहिमेसाठी अधिक वैद्यकीय पुरवठा हवा'),
          _getText('Request for additional training on new protocols', 'नए प्रोटोकॉल पर अतिरिक्त प्रशिक्षण का अनुरोध', 'नवीन प्रोटोकॉलवर अतिरिक्त प्रशिक्षणाची विनंती'),
          _getText('Transportation issues in remote areas', 'दूरदराज के क्षेत्रों में परिवहन की समस्या', 'दुर्गम भागात वाहतुकीची समस्या'),
          _getText('Positive feedback on community response', 'समुदायिक प्रतिक्रिया पर सकारात्मक फीडबैक', 'समुदायिक प्रतिसादावर सकारात्मक अभिप्राय'),
          _getText('Equipment maintenance required urgently', 'उपकरण रखरखाव तुरंत आवश्यक', 'उपकरणांची देखभाल तातडीने आवश्यक')
        ];
        return _FeedbackListItem(
          ashaName: ashaNames[index],
          feedback: feedbackMessages[index],
          timestamp: '2024-09-${20 + index} 10:30 AM',
          isAddressed: index % 2 == 0,
          language: language,
        );
      },
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
