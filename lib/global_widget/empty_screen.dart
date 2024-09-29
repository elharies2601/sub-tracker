import 'package:flutter/material.dart';
import 'package:sub_tracker/theme/text_styles.dart';

import '../generated/assets.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String desc;
  const EmptyScreen({super.key, this.title = 'Belum Ada Tagihan', this.desc = 'Kalo udah ada tagihan, yuk catat!'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            const Image(
              image: AssetImage(
                Assets.imageIcEmptyWallet,
              ),
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: textBold24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              desc,
              style: textRegular16,
            )
          ],
        ),
      ),
    );
  }
}
