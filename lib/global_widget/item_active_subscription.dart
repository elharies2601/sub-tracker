import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/extensions/string_extensions.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:sub_tracker/helper/constants/const_billing_cycle.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions//string_extension.dart';
import 'package:sub_tracker/theme/text_styles.dart';

class ItemActiveSubscription extends StatelessWidget {
  final String namePlatform;
  final String category;
  final String startDate;
  final String nextDate;
  final double amountBill;
  final String billingCycle;
  final void Function()? onTap;

  const ItemActiveSubscription({
    super.key,
    this.namePlatform = "LinkedIn",
    this.category = "Jobs",
    this.startDate = "21 Agustus 2024",
    this.nextDate = "21 Agustus 2024",
    this.amountBill = 0.0,
    this.billingCycle = ConstBillingCycle.bulanan,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String formatStartDate;
    if (billingCycle.toLowerCase() == ConstBillingCycle.tahunan.toLowerCase()) {
      formatStartDate = 'dd MMMM yyyy';
    } else {
      formatStartDate = 'dd MMMM';
    }
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      namePlatform.capitalizeWord(),
                      style: textBold16.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                    Text(
                      category,
                      style: textMedium14.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSecondaryContainer),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        const Icon(Icons.date_range_outlined, size: 18,),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${startDate.toDateTime(f: 'yyyy-MM-dd').toFormatString(format: formatStartDate)} (${billingCycle.capitalizeWord()})",
                          style: textRegular14.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.next_week_outlined, size: 18,),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          nextDate.toDateTime(f: 'yyyy-MM-dd').toFormatString(format: formatStartDate),
                          style: textRegular14.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    "Rp ${amountBill.truncate().toCurrencyString(mantissaLength: 0, thousandSeparator: ThousandSeparator.Period)}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    textAlign: TextAlign.end,
                    style: textBold16.copyWith(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
