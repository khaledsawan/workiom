import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class BigText extends StatelessWidget {
  BigText({super.key, required this.body});
  final body;
  @override
  Widget build(BuildContext context) {
    return Text(body,
        style: TextStyle(
          color: AppColors.textColor,
          fontFamily: 'Rubik',
          fontSize: 22,
          fontWeight: FontWeight.w500,
          height: 28 / 22,
          letterSpacing: 0.3499999940395355,
        ));
  }
}
