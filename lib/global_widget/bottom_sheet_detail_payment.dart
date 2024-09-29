import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sub_tracker/global_widget/empty_screen.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions/string_extension.dart';
import 'package:sub_tracker/models/payment.dart';
import 'package:sub_tracker/theme/text_styles.dart';

class BottomSheetDetailPayment extends StatelessWidget {
  final List<Payment> dataPayments;

  const BottomSheetDetailPayment({super.key, required this.dataPayments});

  @override
  Widget build(BuildContext context) {
    Get.log("size data widget: ${dataPayments.length}");
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
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
                height: 16,
              ),
              dataPayments.isEmpty
                  ? _buildEmptyScreen()
                  : filledScreen(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyScreen(
        title: "Belum Ada Pembayaran",
        desc: "Kalo sudah bayar, jangan lupa dicatat ya!",
      ),
    );
  }

  Expanded filledScreen(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Catatan Pembayaran",
            style: textBold24.copyWith(
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: dataPayments.length,
                itemBuilder: (context, index) {
                  final item = dataPayments[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          item.paymentDate
                              .toDateTime()
                              .toFormatString(format: 'dd MMMM yyyy'),
                          style: textBold16,
                        ),
                        subtitle: item.note != null ? Text("Note: ${item.note}") : null,
                      ),
                      if (index < dataPayments.length - 1)
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
