import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker/global_widget/header_home.dart';
import 'package:sub_tracker/global_widget/item_active_subscription.dart';
import 'package:sub_tracker/routes/app_pages.dart';
import 'package:sub_tracker/screen/add_subscription/add_edit_subscription_screen.dart';
import 'package:sub_tracker/screen/home/home_controller.dart';
import 'package:sub_tracker/theme/text_styles.dart';

import '../../global_widget/empty_screen.dart';
import '../../helper/constants/const_back.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.toggleTheme();
            },
            icon: Icon(
              controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          //TODO: go to add tracker subscription
          Get.bottomSheet(AddEditSubscriptionScreen(
            onSuccess: () {
              controller.callFirstData();
            },
          ), isScrollControlled: true);
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() => SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(() {
                  return HeaderHome(
                    totalPayment: controller.sumTotal.value,
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Tagihan Aktif",
                    style: textBold22.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: controller.listSubscriptions.isEmpty
                        ? _bannerAdAndEmptyScreenWidget()
                        : ListView.builder(
                            itemCount: controller.listSubscriptions.length,
                            itemBuilder: (context, index) {
                              final data = controller.listSubscriptions[index];
                              return ItemActiveSubscription(
                                namePlatform: data.serviceName ?? "",
                                category: data.categoryName ?? "",
                                startDate: data.startPaymentDate,
                                nextDate: data.nextPaymentDate ??
                                    data.startPaymentDate,
                                amountBill: data.cost,
                                billingCycle: data.billingCycle,
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_SUBSCRIPTION,
                                          arguments: data)
                                      ?.then((intentVal) => {
                                            if (intentVal is String)
                                              {
                                                if (intentVal ==
                                                    ConstBack
                                                        .successDeleteOrDone)
                                                  {controller.callFirstData()}
                                              }
                                          });
                                },
                              );
                            }),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _bannerAdAndEmptyScreenWidget() {
    return Obx(() {
      if (controller.bannerAds.value != null) {
        return Column(
          children: [
            const EmptyScreen(),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: StartAppBanner(controller.bannerAds.value!),
            )
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
