import '../../constant/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text/small_text.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(this.text,
      {super.key, required this.isValid, required this.fun});
  final bool? isValid;
  final Function? fun;
  final String? text;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.backGroundGroupDisable;
              }
              return AppColors.backGroundGroup5;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        onPressed: isValid! ? () => fun!() : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Center(
                      child: SmallText(
                    body: text!,
                    color: AppColors.white,
                  ))),
            ),
            Container(
              alignment:Alignment.centerRight,
              width: 24,
              height: 18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white.withOpacity(0.4)),
              child: Center(
                child: SvgPicture.asset('assets/rectangle1.svg',
                    semanticsLabel: 'continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
