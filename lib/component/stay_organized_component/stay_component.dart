import 'package:clean_architecture_flutter/component/text/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/color/colors.dart';
import '../url_launch/url_launch.dart';

class StayOrganizedComponent extends StatelessWidget {
  const StayOrganizedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(body: 'Stay organized with',color: AppColors.textColor2,),
          SizedBox(width: 10,),
          InkWell(
            onTap: () =>launchWebPageUrl(),
            child:
                Row(
                  children: [
                    SvgPicture.asset('assets/Logo color.svg', semanticsLabel: 'check out website',),
                    SvgPicture.asset('assets/logotext.svg', semanticsLabel: 'check out website',),
                  ],
                ),
          )
        ],
      ),
    );
  }
}
