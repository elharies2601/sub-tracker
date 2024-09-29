import 'package:flutter/material.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions/string_extension.dart';
import 'package:sub_tracker/models/subscription.dart';
import 'package:sub_tracker/theme/text_styles.dart';

class InfoDateCard extends StatelessWidget {
  final String title;
  final String value;
  const InfoDateCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: textRegular14.copyWith(
              color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value
              .toDateTime()
              .toFormatString(format: 'dd MMMM yyyy'),
          style: textBold16.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          overflow: TextOverflow.clip,
          maxLines: 1,
        )
      ],
    );
  }
}
