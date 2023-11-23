import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class SmallText extends StatelessWidget {
  SmallText({super.key, required this.body, this.color = AppColors.textColor});
  final String body;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(body,
        style: TextStyle(
          color: color,
          fontFamily: 'Rubik',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          height: 21 / 15,
          letterSpacing: -0.3,

        ));
  }
}
