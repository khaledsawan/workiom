import '../../constant/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text/small_text.dart';

class GoogleBTN extends StatelessWidget {
  const GoogleBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.backGroundGroupG,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 4),
               child: SvgPicture.asset('assets/google.svg', semanticsLabel: 'google'),
             ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              body: 'Continue with Google',
            )
          ],
        ),
      ),
    );
  }
}
