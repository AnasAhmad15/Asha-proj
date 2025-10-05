import 'package:flutter/material.dart';
import 'package:morse_proj/theme/app_theme.dart';

class SmartSyncScreen extends StatefulWidget {
  const SmartSyncScreen({super.key});

  @override
  State<SmartSyncScreen> createState() => _SmartSyncScreenState();
}

class _SmartSyncScreenState extends State<SmartSyncScreen> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startSync();
  }

  void _startSync() {
    // TODO: Replace with actual data sync logic.
    // This is a mock sync process.
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      setState(() { _progress = 0.3; });
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      setState(() { _progress = 0.7; });
    });
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      setState(() { _progress = 1.0; });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Sync Optimization'),
        backgroundColor: AppTheme.secondaryGreen,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _progress < 1.0 ? Icons.sync : Icons.cloud_done_outlined,
                size: 100,
                color: AppTheme.secondaryGreen,
              ),
              const SizedBox(height: 30),
              Text(
                _progress < 1.0 ? 'Syncing Critical Data...' : 'Sync Complete!',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: _progress,
                minHeight: 15,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.secondaryGreen),
              ),
              const SizedBox(height: 20),
              Text(
                '${(_progress * 100).toInt()}%',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              const Text(
                'Only essential data is synced to save bandwidth. Full sync will occur on Wi-Fi.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppTheme.textLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
