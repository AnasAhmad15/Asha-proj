import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SmartSyncScreen extends StatefulWidget {
  const SmartSyncScreen({super.key});

  @override
  State<SmartSyncScreen> createState() => _SmartSyncScreenState();
}

class _SmartSyncScreenState extends State<SmartSyncScreen> with TickerProviderStateMixin {
  double _progress = 0.0;
  bool _isManualSync = false;
  late AnimationController _rotationController;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _startSync();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _startSync() {
    if (_progress < 1.0) {
      _rotationController.repeat();
      _pulseController.repeat(reverse: true);
    }
    
    Future.delayed(const Duration(milliseconds: 800), () {
      if (!mounted) return;
      setState(() { _progress = 0.25; });
    });
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      setState(() { _progress = 0.55; });
    });
    Future.delayed(const Duration(milliseconds: 2400), () {
      if (!mounted) return;
      setState(() { _progress = 0.85; });
    });
    Future.delayed(const Duration(milliseconds: 3200), () {
      if (!mounted) return;
      setState(() { _progress = 1.0; });
      _rotationController.stop();
      _pulseController.stop();
    });
  }

  void _manualSync() {
    setState(() {
      _progress = 0.0;
      _isManualSync = true;
    });
    _startSync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Smart Sync',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Sync Status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Animated Sync Icon
                  AnimatedBuilder(
                    animation: _progress < 1.0 ? _rotationController : _pulseController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _progress < 1.0 ? _rotationController.value * 2 * 3.14159 : 0,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _progress < 1.0 
                                ? [AppTheme.primaryBlue, AppTheme.accentTeal]
                                : [AppTheme.secondaryGreen, AppTheme.secondaryGreen.withOpacity(0.7)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: (_progress < 1.0 ? AppTheme.primaryBlue : AppTheme.secondaryGreen).withOpacity(0.3),
                                spreadRadius: _progress < 1.0 ? 4 : 8,
                                blurRadius: _progress < 1.0 ? 12 : 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            _progress < 1.0 ? Icons.sync : Icons.cloud_done,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  
                  // Status Text
                  Text(
                    _progress < 1.0 
                      ? (_isManualSync ? 'Manual Sync in Progress...' : 'Auto Sync in Progress...')
                      : 'Sync Complete!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _progress < 1.0 ? AppTheme.textDark : AppTheme.secondaryGreen,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Progress Bar
                  Container(
                    width: double.infinity,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: _progress,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppTheme.primaryBlue, AppTheme.accentTeal],
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Progress Percentage
                  Text(
                    '${(_progress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Information Cards
            _InfoCard(
              icon: Icons.wifi,
              title: 'Automatic Sync',
              description: 'Data syncs automatically when internet connection is restored or device connects to Wi-Fi.',
              color: AppTheme.secondaryGreen,
            ),
            const SizedBox(height: 16),
            _InfoCard(
              icon: Icons.data_saver_on,
              title: 'Smart Data Usage',
              description: 'Only critical patient data is synced on mobile data to save bandwidth.',
              color: AppTheme.accentTeal,
            ),
            const SizedBox(height: 16),
            _InfoCard(
              icon: Icons.security,
              title: 'Secure Transfer',
              description: 'All data is encrypted during transmission to ensure patient privacy.',
              color: AppTheme.primaryBlue,
            ),
            
            const SizedBox(height: 32),
            
            // Manual Sync Button
            if (_progress >= 1.0)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _manualSync,
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text(
                    'Manual Sync',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
