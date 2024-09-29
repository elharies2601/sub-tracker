import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/extensions/string_extensions.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:sub_tracker/theme/text_styles.dart';

class HeaderHome extends StatelessWidget {
  final double totalPayment;

  const HeaderHome({super.key, this.totalPayment = 0.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total Tagihan',
                style: textRegular16.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              ),
              Text(
                "Rp ${totalPayment.truncate().toCurrencyString(
                      mantissaLength: 0,
                      thousandSeparator: ThousandSeparator.Period,
                    )}",
                style: textBold28.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
                maxLines: 3,
              ),
              Text(
                'Di bulan ini',
                style: textRegular14.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Get.showSnackbar(GetSnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    message: "Masih on-progres, tunggu saja ya",
                    icon: Icon(
                      Icons.running_with_errors,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    duration: const Duration(seconds: 5),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Riwayat Pembayaran",
                      style: textRegular14.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onTertiaryContainer),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
