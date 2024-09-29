import 'package:get/get.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker/helper/constants/const_back.dart';
import 'package:sub_tracker/helper/constants/const_billing_cycle.dart';
import 'package:sub_tracker/helper/constants/const_status_subscription.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions/string_extension.dart';
import 'package:sub_tracker/models/add_payment_state.dart';
import 'package:sub_tracker/models/payment.dart';
import 'package:sub_tracker/models/subscription.dart';
import 'package:sub_tracker/service/data/payment_service.dart';
import 'package:sub_tracker/service/data/subscription_service.dart';

import '../../service/ads/ads_service.dart';

class DetailSubscriptionController extends GetxController {
  final SubscriptionService _subscriptionService = Get.find();
  final PaymentService _paymentService = Get.find();
  final AdsService _adsService = Get.find();

  final RxList<Payment> listPayment = <Payment>[].obs;
  var selectedDate = DateTime.now().obs;
  var noteText = ''.obs;
  var subscription = Subscription(
          cost: 0,
          billingCycle: ConstBillingCycle.bulanan,
          startPaymentDate: DateTime.now().toFormatString(),
          createdAt: DateTime.now().toFormatString())
      .obs;

  var resultSave = AddPaymentState().obs;
  var bannerAds = Rx<StartAppBannerAd?>(null);
  var interstitialAds = Rx<StartAppInterstitialAd?>(null);
  var isAdsInterstitialLoad = false.obs;
  var isForDelete = false.obs;

  void fetchPayments({required int subscriptionId}) async {
    Get.log("Logs memanggil $subscriptionId");
    final dataPayments =
        await _paymentService.getAllPaymentById(subscriptionId);
    Get.log("data payment first: ${dataPayments.length}");
    listPayment.assignAll(dataPayments);
  }

  void savePayment(Subscription dataSubs) async {
    try {
      final payload = Payment(
        idSubscription: dataSubs.id ?? 0,
        note: noteText.value.isEmpty ? null : noteText.value,
        paymentDate: selectedDate.value.toFormatString(),
        createdAt: DateTime.now().toFormatString(),
      );
      final isDataExist = await _paymentService.checkPaymentExist(
          dataSubs.id ?? 0,
          selectedDate.value.toFormatString(),
          dataSubs.billingCycle);
      Get.log("philo: ${payload.toString()} --> isDataExist: $isDataExist");
      if (isDataExist) {
        Get.snackbar('Gagal Menyimpan',
            "Sudah melakukan pembayaran ditanggal/ditahun tersebut");
      } else {
        _paymentService.insertPayment(payload);
        _updateNextPaymentDate(dataSubs, selectedDate.value.toFormatString());
        fetchPayments(subscriptionId: dataSubs.id ?? 0);
        Get.snackbar(
            'Sukses Menyimpan', "Catatan Pembayaran Baru Telah Disimpan",
            snackPosition: SnackPosition.BOTTOM);
        Get.close(1);
      }
    } catch (exception) {
      Get.log("error save: $exception");
      Get.snackbar('Gagal', "Terjadi kesalahan, silahkan coba lagi");
    }
  }

  void _updateNextPaymentDate(
      Subscription payload, String latestPaymentDate) async {
    final newPayload = payload.copyWith(
        cost: payload.cost,
        billingCycle: payload.billingCycle,
        startPaymentDate: payload.startPaymentDate,
        createdAt: payload.createdAt,
        nextPaymentDate: payload.nextPaymentDate
            ?.calculateNextPayment(billingCycle: payload.billingCycle),
        latestPaymentDate: latestPaymentDate,
        updatedAt: DateTime.now().toFormatString());
    Get.log("philo: ${newPayload.toJson()}");
    subscription.value = newPayload;
    _subscriptionService.updateSubscription(newPayload);
  }

  void finishSubscription() {
    try {
      final newPayload = subscription.value.copyWith(
          cost: subscription.value.cost,
          billingCycle: subscription.value.billingCycle,
          startPaymentDate: subscription.value.startPaymentDate,
          createdAt: subscription.value.createdAt,
          nextPaymentDate: null,
          status: ConstStatusSubscription.done,
          updatedAt: DateTime.now().toFormatString()
      );

      _subscriptionService.updateSubscription(newPayload);
      isForDelete.value = false;
      resultSave.value = resultSave.value.copy(isDone: true);
    } catch (e) {
      resultSave.value = resultSave.value.copy(msgError: e.toString());
    }
  }

  void deleteSubscription(int subscriptionId) {
    try {
      _subscriptionService.deleteSubscription(subscriptionId);
      isForDelete.value = true;
      showInterstitialAds();
    } catch (e) {
      Get.close(1);
      Get.snackbar('Gagal',
          "Terjadi kesalahan, silahkan coba lagi nanti, ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void showBannerAds() {
    _adsService.loadBannerAd().then((ad) {
      Get.log("bannerAdsDetail: $ad");
      bannerAds.value = ad;
    }).catchError((error) {
      Get.log("bannerAdsDetail: $error");
    });
  }

  void showInterstitialAds() {
    _adsService.loadInterstitialAd().then((ad) {
      Get.log("interstitialAdsDetail: $ad");
      interstitialAds.value = ad;
      isAdsInterstitialLoad.value = true;
    }).catchError((error) {
      Get.log("interstitialAdsDetail: $error");
      isAdsInterstitialLoad.value = false;
    });
  }
}
