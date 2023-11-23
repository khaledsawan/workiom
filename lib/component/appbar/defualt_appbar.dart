import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../constant/color/colors.dart';

AppBar appBar(String? title, BuildContext context, {required bool isBack}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    automaticallyImplyLeading: true,
    titleSpacing: -15,
    title: Text(
      title!.isEmpty ? '' : title,
      style: TextStyle(
        color: AppColors.backGroundGroup5,
        fontFamily: 'Rubik',
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    ),
    centerTitle: false,
    leading: IconButton(
        onPressed: () => isBack ? context.pop() : null,
        icon: SvgPicture.asset('assets/chevron.left.svg',
            semanticsLabel: 'Back')),
  );
}
