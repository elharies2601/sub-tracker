import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker/global_widget/item_active_subscription.dart';
import 'package:sub_tracker/helper/constants/const_billing_cycle.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions/string_extension.dart';
import 'package:sub_tracker/models/add_subscription_state.dart';
import 'package:sub_tracker/models/category.dart';
import 'package:sub_tracker/models/subscription.dart';
import 'package:sub_tracker/models/ui_state.dart';
import 'package:sub_tracker/service/ads/ads_service.dart';
import 'package:sub_tracker/service/data/category_service.dart';
import 'package:sub_tracker/service/data/subscription_service.dart';

class AddEditSubscriptionController extends GetxController {
  final CategoryService _categoryService = Get.find();
  final SubscriptionService _subscriptionService = Get.find();
  final AdsService _adsService = Get.find();

  final subscriptionTrackKey = GlobalKey<FormState>();

  final serviceNameController = TextEditingController();
  final serviceConstController = TextEditingController();
  final paymentDateController = TextEditingController();
  final billingTypeController = SingleValueDropDownController();
  final categoryController = SingleValueDropDownController();

  var serviceName = ''.obs;
  var serviceCost = ''.obs;
  var billingType = ConstBillingCycle.harian.obs;
  var startPaymentDate = DateTime.now().obs;
  var category = 0.obs;
  var categories = <Category>[].obs;
  var isValidForm = false.obs;
  var newResultSave = AddSubscriptionState().obs;
  var bannerAds = Rx<StartAppBannerAd?>(null);

  var billingTypes = [
    ConstBillingCycle.bulanan,
    ConstBillingCycle.mingguan,
    ConstBillingCycle.tahunan,
  ];

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  @override
  void onClose() {
    Get.log("dispose semua");
    categoryController.dispose();
    billingTypeController.dispose();
    paymentDateController.dispose();
    serviceConstController.dispose();
    serviceNameController.dispose();
    super.onClose();
  }

  String? generalValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Wajib diisi";
    }

    return null;
  }

  String? costValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Wajib diisi";
    }

    if (value?.isNotEmpty == true &&
        (double.tryParse(value!.replaceAll(RegExp(r"\D"), "")) ?? 0.0) <
            1000.0) {
      return "Minimal Rp 1000";
    }

    return null;
  }

  void clearAllValues() {
    categoryController.clearDropDown();
    billingTypeController.clearDropDown();
    serviceNameController.clear();
    serviceConstController.clear();
    paymentDateController.clear();
  }

  void fetchCategories() async {
    final list = await _categoryService.getAllCategories();
    categories.assignAll(list);
  }

  void saveDataSubscription() async {
    var isValid = subscriptionTrackKey.currentState?.validate() == true;
    if (isValid) {
      newResultSave.value = newResultSave.value.copyWith(isLoading: true);
      try {
        var payload = Subscription(
          serviceName: serviceName.value,
          cost: double.parse(serviceCost.value.removeAllWhitespace
              .replaceAll(RegExp(r"\D"), "")),
          billingCycle: billingType.value.toLowerCase(),
          startPaymentDate: startPaymentDate.value.toFormatString(),
          nextPaymentDate: startPaymentDate.value
              .toFormatString()
              .calculateNextPayment(billingCycle: billingType.value),
          createdAt: DateTime.now().toFormatString(),
          categoryId: category.value,
          categoryName: null,
        );
        var result = await _subscriptionService.insertSubscription(payload);
        newResultSave.value = newResultSave.value.copyWith(
          resultSave: result,
          isLoading: false,
        );
      } catch (e) {
        newResultSave.value = newResultSave.value.copyWith(
          msgError: e.toString(),
          isLoading: false,
        );
      }
    }
  }

  void showBannerAds() {
    _adsService.loadBannerAd().then((ad) {
      Get.log("bannerAds: $ad");
      bannerAds.value = ad;
    }).catchError((error) {
      Get.log("bannerAds: $error");
    });
  }

  @override
  void dispose() {
    bannerAds.value?.dispose();
    super.dispose();
  }
}
