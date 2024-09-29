import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/models/category.dart';
import 'package:sub_tracker/screen/add_subscription/add_edit_subscription_controller.dart';
import 'package:sub_tracker/theme/text_styles.dart';

class AddEditSubscriptionScreen extends StatelessWidget {
  final AddEditSubscriptionController controller =
      Get.put(AddEditSubscriptionController());

  final void Function()? onSuccess;

  AddEditSubscriptionScreen({super.key, this.onSuccess});

  @override
  Widget build(BuildContext context) {
    controller.newResultSave.listen((newData) {
      Future.delayed(const Duration(seconds: 1), () {
        if (newData.resultSave > -1) {
          onSuccess!();
          controller.clearAllValues();
          Get.back();
        } else if (newData.msgError.isNotEmpty) {
          Get.snackbar(
              "Terjadi Error", controller.newResultSave.value.msgError);
        }
      });
    });
    controller.showBannerAds();
    return GestureDetector(
      onTap: () {
        controller.clearAllValues();
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Form(
          key: controller.subscriptionTrackKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tambah Catatan Subscription",
                      style: textBold22,
                    )),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.serviceNameController,
                  decoration: const InputDecoration(labelText: "Nama Layanan"),
                  onChanged: (value) {
                    controller.serviceNameController.text = value;
                    controller.serviceName.value = value;
                  },
                  validator: controller.generalValidator,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.serviceConstController,
                  decoration: const InputDecoration(
                      labelText: "Biaya Layanan (dalam Rupiah)"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyInputFormatter(
                        thousandSeparator: ThousandSeparator.Period,
                        mantissaLength: 0)
                  ],
                  onChanged: (value) {
                    controller.serviceConstController.text = value;
                    controller.serviceCost.value = value;
                  },
                  validator: controller.costValidator,
                ),
                const SizedBox(
                  height: 16,
                ),
                DropDownTextField(
                  dropDownList: controller.billingTypes.map((String value) {
                    return DropDownValueModel(name: value, value: value);
                  }).toList(),
                  dropDownItemCount: controller.billingTypes.length,
                  controller: controller.billingTypeController,
                  listTextStyle: textMedium14.copyWith(color: Colors.black45),
                  textFieldDecoration:
                      const InputDecoration(hintText: "Tipe Durasi Tagihan"),
                  onChanged: (val) {
                    // controller.billingTypeController.dropDownValue =
                    //     val as DropDownValueModel;
                    if (val is DropDownValueModel) {
                      controller.billingType.value = (val).value;
                    }
                  },
                  validator: controller.generalValidator,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onTap: () {
                    showDueDatePicker(
                        context: context,
                        currentTime: controller.startPaymentDate.value,
                        onConfirm: (datePicked) {
                          controller.startPaymentDate.value = datePicked;
                          controller.paymentDateController.text =
                              datePicked.toFormatString(format: "dd MMMM yyyy");
                        });
                  },
                  controller: controller.paymentDateController,
                  showCursor: false,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Mulai Penagihan",
                    suffixIcon: Icon(Icons.calendar_month),
                  ),
                  validator: controller.generalValidator,
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => DropDownTextField(
                    clearOption: false,
                    dropDownList: controller.categories.map((Category item) {
                      return DropDownValueModel(
                          name: item.name, value: item.id);
                    }).toList(),
                    dropDownItemCount: 6,
                    controller: controller.categoryController,
                    listTextStyle: textMedium14.copyWith(color: Colors.black45),
                    textFieldDecoration:
                        const InputDecoration(hintText: "Kategori"),
                    onChanged: (val) {
                      // controller.categoryController.dropDownValue = val;
                      if (val is DropDownValueModel) {
                        controller.category.value = (val).value;
                      }
                    },
                    validator: controller.generalValidator,
                  ),
                ),
                const SizedBox(
                  height: 56,
                ),
                _bannerAdWidget(),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.subscriptionTrackKey.currentState
                                ?.validate() ==
                            true) {
                          controller.saveDataSubscription();
                        } else {
                          null;
                        }
                      },
                      child: controller.newResultSave.value.isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sedang Memproses.."),
                                SizedBox(
                                  width: 16,
                                ),
                                CircularProgressIndicator(),
                              ],
                            )
                          : const Text("Simpan"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: const Text(
                    "Batal",
                    style: textMedium14,
                  ),
                  onTap: () {
                    controller.clearAllValues();
                    Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDueDatePicker(
      {required BuildContext context,
      required DateTime currentTime,
      Function(DateTime)? onConfirm}) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(DateTime.now().year - 5, 1, 1),
        maxTime: DateTime(DateTime.now().year, 12, 31), onConfirm: (date) {
      // controller.nextPaymentDate.value = date;
      onConfirm!(date);
    }, currentTime: currentTime, locale: LocaleType.id);
  }

  Widget _bannerAdWidget() {
    return Obx(() {
      if (controller.bannerAds.value != null) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: StartAppBanner(controller.bannerAds.value!),
            ),
            const SizedBox(height: 32,)
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
