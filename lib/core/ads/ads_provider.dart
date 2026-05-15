import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/presentations/settings_provider.dart';

part 'ads_provider.g.dart';

@riverpod
bool shouldShowAds(Ref ref) {
  final settings = ref.watch(appSettingsNotifierProvider).valueOrNull;
  if (settings == null) return true; // Show ads by default if settings not loaded

  final adsHiddenUntil = settings.adsHiddenUntil;
  if (adsHiddenUntil == null) return true;

  // Show ads if the current time is past the hidden until time
  return DateTime.now().isAfter(adsHiddenUntil);
}
