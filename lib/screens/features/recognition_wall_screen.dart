import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class RecognitionWallScreen extends StatelessWidget {
  const RecognitionWallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recognition Wall'),
        backgroundColor: AppTheme.primaryBlue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: 8, // Dummy count
        itemBuilder: (context, index) {
          return _buildProfileCard(index);
        },
      ),
    );
  }

  Widget _buildProfileCard(int index) {
    final names = ['Meena', 'Anjali', 'Sarita', 'Pooja', 'Kavita', 'Sunita', 'Rekha', 'Geeta'];
    final ratings = [5.0, 4.5, 4.5, 4.0, 4.0, 3.5, 3.5, 3.0];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
            child: Icon(Icons.person, size: 40, color: AppTheme.primaryBlue),
          ),
          const SizedBox(height: 12),
          Text(
            names[index],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          _buildStarRating(ratings[index]),
          const SizedBox(height: 8),
          const Text(
            'Top Performer',
            style: TextStyle(color: AppTheme.textLight, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? (index < rating - 0.5 ? Icons.star : Icons.star_half) : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }
}
