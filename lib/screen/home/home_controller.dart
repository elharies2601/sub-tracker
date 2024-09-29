import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker/models/subscription.dart';
import 'package:sub_tracker/service/ads/ads_service.dart';
import 'package:sub_tracker/service/data/subscription_service.dart';
import 'package:sub_tracker/theme/ThemeController.dart';

class HomeController extends GetxController {
  final SubscriptionService _subService = Get.find();
  final AdsService _adsService = Get.find();
  final _storage = GetStorage();

  final RxList<Subscription> listSubscriptions = <Subscription>[].obs;
  var sumTotal = 0.0.obs;
  var isDarkMode = false.obs;
  var bannerAds = Rx<StartAppBannerAd?>(null);

  @override
  void onInit() {
    super.onInit();
    // Get.log("isDarkMode: ${_storage.read('isDarkMode')}");
    isDarkMode.value = _storage.read('isDarkMode') ?? false;
    // Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void onReady() {
    super.onReady();
    callFirstData();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _storage.write("isDarkMode", isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void callFirstData() {
    fetchSubscriptions();
    fetchSumTotalCostThisMonth();
    showBannerAds();
  }

  void fetchSubscriptions() async {
    final subs = await _subService.getAllSubscriptionsWithCategoryName();
    listSubscriptions.assignAll(subs);
  }

  void fetchSumTotalCostThisMonth() async {
    final total = await _subService.getSumAllTransactionThisMonth();
    sumTotal.value = total;
  }

  Future<void> addSubscription(Subscription subscription) async {
    await _subService.insertSubscription(subscription);
    fetchSubscriptions();
  }

  void showBannerAds() {
    _adsService.loadBannerAd().then((ad) {
      Get.log("bannerAdsHome: $ad");
      bannerAds.value = ad;
    }).catchError((error) {
      Get.log("bannerAdsHome: $error");
    });
  }
}
