import 'package:clean_architecture_flutter/constant/color/colors.dart';
import 'package:flutter/material.dart';

ErrorSnackBar(BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Authentication failed. Please try again."),
      backgroundColor: AppColors.red,
    ),
  );
}