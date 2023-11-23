import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';
import '../url_launch/url_launch.dart';

class PolicyTerms extends StatelessWidget {
  const PolicyTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commonTextStyle = TextStyle(
      color: AppColors.textColor2,
      fontSize: 13,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    );

    return Container(
      padding: const EdgeInsets.only(left: 45.0,right: 45,top: 30),
      child:  Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'By signing up, you agree',
              style: commonTextStyle,
            ),
            TextSpan(
              text: ' ',
              style: commonTextStyle,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchConditionsWebPageUrl();
                },
              text: 'Terms Of Service',
              style: commonTextStyle.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ' And ',
              style: commonTextStyle,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchPolicyWebPageUrl();
                },
              text: 'Privacy Policy',
              style: commonTextStyle.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
