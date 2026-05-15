import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/presentations/settings_provider.dart';

part 'app_auth_provider.g.dart';

@riverpod
class AppAuthNotifier extends _$AppAuthNotifier {
  @override
  bool build() {
    // Read the initial settings to see if biometric lock is enabled
    // We use read instead of watch because we only want the initial state on startup.
    // However, actually `watch` is fine here, but if the setting changes, it would trigger a rebuild.
    // Let's use `watch` to initially load the value, but we only lock on start if it's true.
    final settingsAsync = ref.watch(appSettingsProvider);
    return settingsAsync.asData?.value.biometricLock ?? false;
  }

  void unlock() {
    state = false;
  }

  void lock() {
    // Only lock if the setting is currently enabled
    final settingsAsync = ref.read(appSettingsProvider);
    if (settingsAsync.asData?.value.biometricLock == true) {
      state = true;
    }
  }
}
