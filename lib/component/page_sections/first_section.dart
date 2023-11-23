import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text/big_text.dart';
import '../text/mid_text_.dart';

class FirstSection extends StatelessWidget {
  FirstSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BigText(body: title),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            MidText(body: 'Let\'s start an amazing journey! '),
            SvgPicture.asset('assets/hi.svg', semanticsLabel: 'Back')
          ],
        ),
      ],
    );
  }
}
