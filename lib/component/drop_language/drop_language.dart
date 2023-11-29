import '../text/very_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DropLanguage extends StatelessWidget {
  const DropLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/erath.svg', semanticsLabel: 'Back'),
        SizedBox(
          width: 4,
        ),
        VerySmallText(body: 'English'),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset('assets/droparrow.svg', semanticsLabel: 'Back'),
      ],
    );
  }
}
