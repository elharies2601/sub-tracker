import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

import 'app_auth_provider.dart';

class LockScreenOverlay extends ConsumerStatefulWidget {
  const LockScreenOverlay({super.key});

  @override
  ConsumerState<LockScreenOverlay> createState() => _LockScreenOverlayState();
}

class _LockScreenOverlayState extends ConsumerState<LockScreenOverlay> {
  final _auth = LocalAuthentication();
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    // Attempt to authenticate automatically when the lock screen appears
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticate();
    });
  }

  Future<void> _authenticate() async {
    if (_isAuthenticating) return;

    setState(() {
      _isAuthenticating = true;
    });

    try {
      final success = await _auth.authenticate(
        localizedReason: 'Please authenticate to access SubTracker',
        persistAcrossBackgrounding: true,
        biometricOnly: false,
      );

      if (success && mounted) {
        ref.read(appAuthProvider.notifier).unlock();
      }
    } catch (e) {
      // User canceled or auth failed
    } finally {
      if (mounted) {
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_rounded,
                  size: 50,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'App Locked',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Authentication required to continue',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 48),
              FilledButton.icon(
                onPressed: _isAuthenticating ? null : _authenticate,
                icon: const Icon(Icons.fingerprint_rounded),
                label: const Text('Tap to Unlock'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(200, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
