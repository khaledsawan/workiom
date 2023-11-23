import 'package:clean_architecture_flutter/component/text/small_text.dart';
import 'package:clean_architecture_flutter/component/text/very_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../features/common_forms/common_form.dart';

class PasswordValidationErrors extends StatefulWidget {
  final List<ValidationError> validationErrors;

  PasswordValidationErrors({required this.validationErrors});

  @override
  _PasswordValidationErrorsState createState() =>
      _PasswordValidationErrorsState();
}

class _PasswordValidationErrorsState extends State<PasswordValidationErrors> {
  bool good = true;
  isGood(){
    setState(() {
      good = widget.validationErrors.any((error) => error.value!);
      if (widget.validationErrors.isEmpty) {
        good = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isGood();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              good ? 'assets/wornging.svg' : 'assets/checkmark.svg',
            ),
            SizedBox(
              width: 5,
            ),
            SmallText(body: 'Not enought strong')
          ],
        ),
        SizedBox(height: 5),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: widget.validationErrors.map((error) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SvgPicture.asset(
                    error.value! ? 'assets/xicon.svg' : 'assets/checkmark.svg',
                  ),
                  SizedBox(width: 5,),
                  VerySmallText(body: error.error!)
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
