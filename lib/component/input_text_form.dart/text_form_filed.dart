import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFiled extends StatelessWidget {
  TextFormFiled(
      {required this.focusNode,
      super.key,
      required this.initialValue,
      required this.suffixText,
      required this.hintText,
      required this.iconData,
      this.suffixIcon,
      this.textInputType=TextInputType.text,
      required this.onChanged});
  final FocusNode focusNode;
  final IconData? suffixIcon;
  final String initialValue;
  final String suffixText;
  final String hintText;
  final String iconData;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(bottom: 10.0, top: 15),
        icon: SvgPicture.asset(iconData),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon,size: 24,)
            : null,
        suffixText: suffixText,
        hintText: hintText,
      ),
      keyboardType: textInputType,
      onChanged: (value) {
        onChanged(value);
      },
      textInputAction: TextInputAction.next,
    );
  }
}
