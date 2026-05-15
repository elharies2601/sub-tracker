import 'package:flutter/material.dart';
import 'package:startapp_sdk/startapp.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  StartAppBannerAd? _bannerAd;
  final _startAppSdk = StartAppSdk();

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  Future<void> _loadAd() async {
    try {
      final ad = await _startAppSdk.loadBannerAd(StartAppBannerType.BANNER);
      if (mounted) {
        setState(() {
          _bannerAd = ad;
        });
      }
    } catch (e) {
      debugPrint("Error loading Banner ad: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd == null) {
      // Return a 50px high invisible box while loading
      return const SizedBox(height: 50, width: double.infinity);
    }
    return StartAppBanner(_bannerAd!);
  }
}
