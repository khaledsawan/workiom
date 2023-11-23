import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class MidText extends StatelessWidget {
  MidText({super.key, required this.body, this.color = AppColors.textColor});
  final String body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(body,
            style: TextStyle(
              color: AppColors.textColor2,
              fontFamily: 'Rubik',
              fontSize: 17,
              fontWeight: FontWeight.w400,
              height: 22 / 17,
              letterSpacing: -0.40799999237060547,
            )),
      ],
    );
  }
}
