import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker/generated/assets.dart';
import 'package:sub_tracker/global_widget/bottom_sheet_detail_payment.dart';
import 'package:sub_tracker/global_widget/empty_screen.dart';
import 'package:sub_tracker/global_widget/info_date_card.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions/string_extension.dart';
import 'package:sub_tracker/models/subscription.dart';
import 'package:sub_tracker/screen/detail/detail_subscription_controller.dart';
import 'package:sub_tracker/theme/text_styles.dart';

import '../../helper/constants/const_back.dart';

class DetailSubscriptionScreen extends GetView<DetailSubscriptionController> {
  const DetailSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Subscription subscription = Get.arguments;
    controller.subscription.value = subscription;

    var diffDay = 0;
    // var diffDay = subscription.nextPaymentDate!.calculateDifferenceDay() * -1;
    controller.fetchPayments(subscriptionId: subscription.id ?? 0);

    controller.subscription.listen((onData) {
      diffDay = onData.nextPaymentDate!.calculateDifferenceDay() * -1;
    });

    controller.resultSave.listen((newData) {
      if (newData.isDone) {
        _showDoneSubscription(context);
      }
    });

    _interstitialAdsWidget();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subscription.serviceName?.capitalizeWord() ?? "",
          style: textMedium28,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Obx(
            () {
              return controller.listPayment.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _showConfirmationDone(context);
                      },
                      icon: const Icon(Icons.stop_rounded),
                    )
                  : const SizedBox();
            },
          ),
          IconButton(
            onPressed: () {
              _showConfirmationDelete(context, subscription.id ?? 0);
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showDialogAdd(context, subscription);
        },
        label: const Text(
          "Tambah Pembayaran",
          style: textMedium14,
        ),
        icon: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      body: Obx(() {
        return SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 38,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        color: Theme.of(context).colorScheme.primary,
                        strokeWidth: 20,
                        value: (controller.subscription.value.nextPaymentDate
                                    ?.calculateDifferenceDay()
                                    .toDouble()
                                    .abs() ??
                                0.0) /
                            100.0,
                      ),
                    ),
                    diffDay < 0
                        ? _uiLateDiffDay(context, diffDay)
                        : _uiDiffDay(subscription), // show UI diff day
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Rp ${controller.subscription.value.cost.truncate().toCurrencyString(mantissaLength: 0, thousandSeparator: ThousandSeparator.Period)}",
                  style: textMedium22,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 48,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InfoDateCard(
                          title: "Awal tagihan",
                          value: controller.subscription.value.startPaymentDate,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InfoDateCard(
                          title: "Tagihan selanjutnya",
                          value: controller
                                  .subscription.value.nextPaymentDate ??
                              controller.subscription.value.startPaymentDate,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Obx(() {
                    return BottomSheetDetailPayment(
                        dataPayments: controller.listPayment.value);
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Column _uiDiffDay(Subscription subscription) {
    return Column(
      children: <Widget>[
        Text(
          "${subscription.nextPaymentDate!.calculateDifferenceDay() * -1}",
          style: textMedium24,
        ),
        const Text(
          "hari lagi",
          style: textMedium16,
        ),
      ],
    );
  }

  Column _uiLateDiffDay(BuildContext context, int diff) {
    return Column(
      children: <Widget>[
        const Text("Terlewat", style: textMedium24),
        Text("$diff",
            style: textMedium24.copyWith(
                color: Theme.of(context).colorScheme.error)),
        const Text(
          "hari",
          style: textMedium16,
        ),
      ],
    );
  }

  void _showDialogAdd(BuildContext context, Subscription dataSubs) {
    controller.showBannerAds();
    Get.dialog(
      AlertDialog(
        title: const Text('Tambah Pembayaran Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: DateFormat('dd/MM/yyyy')
                        .format(controller.selectedDate.value),
                  ),
                  decoration: const InputDecoration(labelText: 'Tanggal'),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate.value,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      controller.selectedDate.value = pickedDate;
                    }
                  },
                )),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Catatan'),
              onChanged: (value) => controller.noteText.value = value,
            ),
            _bannerAdsWidget()
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Get.back(),
          ),
          ElevatedButton(
            child: const Text('Simpan'),
            onPressed: () => controller.savePayment(dataSubs),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDelete(BuildContext context, int subscriptionId) {
    Get.dialog(
      AlertDialog(
        content: const Text(
          "Apakah Kamu yakin ingin menghapus ini?",
          style: textMedium22,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Tidak Jadi!',
              style: textBold14.copyWith(
                  color: Theme.of(context).colorScheme.error),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.deleteSubscription(subscriptionId);
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDone(BuildContext context) {
    Get.dialog(
      AlertDialog(
        content: const Text(
          "Apakah Kamu yakin ingin berhenti berlangganan ini?",
          style: textMedium22,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Tidak Jadi!',
              style: textBold14.copyWith(
                  color: Theme.of(context).colorScheme.error),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.finishSubscription();
            },
            child: const Text("Sudahi!"),
          ),
        ],
      ),
    );
  }

  void _showDoneSubscription(BuildContext context) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Lottie.asset(Assets.animationsDoneAnimation),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Sampai Jumpa Lagi! 👋',
              style: textMedium24.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Kami menghargai waktu yang telah kamu habiskan bersama kami. Jika kamu berubah pikiran, kami ada di sini untukmu. Selamat tinggal untuk sekarang!',
              textAlign: TextAlign.center,
              style: textRegular16.copyWith(
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  controller.showInterstitialAds();
                  // Get.close(2);
                  // Get.back(result: ConstBack.successDeleteOrDone);
                },
                child: const Text('Balik Ke Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bannerAdsWidget() {
    return Obx(() {
      if (controller.bannerAds.value != null) {
        return Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: StartAppBanner(controller.bannerAds.value!),
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }

  void _interstitialAdsWidget() {
    controller.isAdsInterstitialLoad.listen((newData) {
      if (newData && controller.interstitialAds.value != null) {
        controller.interstitialAds.value!.show().then((_) {
          controller.isAdsInterstitialLoad.value = false;
          if (controller.isForDelete.value) {
            Get.close(1);
          } else {
            Get.close(2);
          }
          Get.back(result: ConstBack.successDeleteOrDone);
        }).catchError((error) {
          Get.log("_interstitialAdsWidget: $error");
        });
      }
    });
  }
}
