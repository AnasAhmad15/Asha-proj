import 'package:flutter/material.dart';
import 'package:morse_proj/screens/role_selection_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  final List<Map<String, dynamic>> languages = [
    {
      'code': 'en',
      'name': 'English',
      'nativeName': 'English',
      'icon': Icons.language,
    },
    {
      'code': 'hi',
      'name': 'Hindi',
      'nativeName': 'हिन्दी',
      'icon': Icons.language,
    },
    {
      'code': 'mr',
      'name': 'Marathi',
      'nativeName': 'मराठी',
      'icon': Icons.language,
    },
  ];

  void _selectLanguage(String languageCode) {
    setState(() {
      selectedLanguage = languageCode;
    });
    
    // Navigate to role selection after brief delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => RoleSelectionScreen(language: languageCode),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              
              // Header
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.translate,
                      size: 80,
                      color: AppTheme.primaryBlue,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Select Language',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'भाषा चुनें | Choose Your Language',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Language buttons
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    final isSelected = selectedLanguage == language['code'];
                    
                    return _LanguageButton(
                      languageName: language['name'],
                      nativeName: language['nativeName'],
                      icon: language['icon'],
                      isSelected: isSelected,
                      onTap: () => _selectLanguage(language['code']),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String languageName;
  final String nativeName;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.languageName,
    required this.nativeName,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.primaryBlue : AppTheme.textLight.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? AppTheme.primaryBlue.withOpacity(0.3)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected 
                    ? Colors.white.withOpacity(0.2)
                    : AppTheme.primaryBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: isSelected ? Colors.white : AppTheme.primaryBlue,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nativeName,
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected 
                          ? Colors.white.withOpacity(0.9)
                          : AppTheme.textLight,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.arrow_forward_ios,
              color: isSelected ? Colors.white : AppTheme.textLight,
              size: isSelected ? 28 : 20,
            ),
          ],
        ),
      ),
    );
  }
}
