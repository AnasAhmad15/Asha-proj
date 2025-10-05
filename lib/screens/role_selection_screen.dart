import 'package:flutter/material.dart';
import 'package:morse_proj/screens/dashboards/asha_dashboard.dart';
import 'package:morse_proj/screens/dashboards/phc_dashboard.dart';
import 'package:morse_proj/screens/dashboards/supervisor_dashboard.dart';
import 'package:morse_proj/theme/app_theme.dart';

class RoleSelectionScreen extends StatefulWidget {
  final String language;
  
  const RoleSelectionScreen({super.key, required this.language});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedRole;

  final List<Map<String, dynamic>> roles = [
    {
      'id': 'asha',
      'name': 'ASHA Worker',
      'nameHindi': 'आशा कार्यकर्ता',
      'nameMarathi': 'आशा कार्यकर्ता',
      'description': 'Community health worker',
      'icon': Icons.person_outline,
      'color': AppTheme.primaryBlue,
    },
    {
      'id': 'phc',
      'name': 'PHC Staff',
      'nameHindi': 'पीएचसी स्टाफ',
      'nameMarathi': 'पीएचसी कर्मचारी',
      'description': 'Primary Health Center staff',
      'icon': Icons.local_hospital_outlined,
      'color': AppTheme.secondaryGreen,
    },
    {
      'id': 'supervisor',
      'name': 'Supervisor',
      'nameHindi': 'पर्यवेक्षक',
      'nameMarathi': 'पर्यवेक्षक',
      'description': 'Program supervisor',
      'icon': Icons.admin_panel_settings_outlined,
      'color': AppTheme.accentTeal,
    },
  ];

  void _selectRole(String roleId) {
    setState(() {
      selectedRole = roleId;
    });
    
    // Navigate to appropriate dashboard
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Widget dashboard;
        switch (roleId) {
          case 'asha':
            dashboard = AshaDashboard(language: widget.language);
            break;
          case 'phc':
            dashboard = PhcDashboard(language: widget.language);
            break;
          case 'supervisor':
            dashboard = SupervisorDashboard(language: widget.language);
            break;
          default:
            dashboard = AshaDashboard(language: widget.language);
        }
        
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => dashboard),
        );
      }
    });
  }

  String _getRoleName(Map<String, dynamic> role) {
    switch (widget.language) {
      case 'hi':
        return role['nameHindi'];
      case 'mr':
        return role['nameMarathi'];
      default:
        return role['name'];
    }
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
                      Icons.badge_outlined,
                      size: 80,
                      color: AppTheme.primaryBlue,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.language == 'hi' 
                          ? 'अपनी भूमिका चुनें'
                          : widget.language == 'mr'
                              ? 'तुमची भूमिका निवडा'
                              : 'Select Your Role',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.language == 'hi'
                          ? 'जारी रखने के लिए अपनी भूमिका चुनें'
                          : widget.language == 'mr'
                              ? 'सुरू ठेवण्यासाठी तुमची भूमिका निवडा'
                              : 'Choose your role to continue',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppTheme.textLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Role cards
              Expanded(
                child: ListView.separated(
                  itemCount: roles.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final role = roles[index];
                    final isSelected = selectedRole == role['id'];
                    
                    return _RoleCard(
                      roleName: _getRoleName(role),
                      description: role['description'],
                      icon: role['icon'],
                      color: role['color'],
                      isSelected: isSelected,
                      onTap: () => _selectRole(role['id']),
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

class _RoleCard extends StatelessWidget {
  final String roleName;
  final String description;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.roleName,
    required this.description,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [color, color.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : AppTheme.textLight.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? color.withOpacity(0.4)
                  : Colors.black.withOpacity(0.05),
              blurRadius: isSelected ? 15 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? Colors.white.withOpacity(0.2)
                        : color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    size: 40,
                    color: isSelected ? Colors.white : color,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roleName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppTheme.textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
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
                  size: isSelected ? 32 : 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
