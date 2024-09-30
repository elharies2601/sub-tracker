import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:startapp_sdk/startapp.dart';

class AdsService extends GetxService {
  late final StartAppSdk _startAppSdk;

  Future<AdsService> init() async {
    _startAppSdk = StartAppSdk();
    await _startAppSdk.setTestAdsEnabled(kDebugMode);
    return this;
  }

  Future<StartAppInterstitialAd> loadInterstitialAd() async {
    return _startAppSdk.loadInterstitialAd();
  }

  Future<StartAppBannerAd> loadBannerAd() async {
    return _startAppSdk.loadBannerAd(StartAppBannerType.BANNER);
  }
}