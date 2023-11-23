import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class VerySmallText extends StatelessWidget {
  VerySmallText(
      {super.key, required this.body, this.color = AppColors.textColor2});
  final String body;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(body,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 16 / 12,
          letterSpacing: 0,
        ));
  }
}
class VerySmallText13 extends StatelessWidget {
  VerySmallText13(
      {super.key, required this.body, this.color = AppColors.textColor});
  final String body;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 16 / 12,
              letterSpacing: 0,
            )),
      ],
    );
  }
}
