import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMsg(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: AppColors.kPrimaryColor,
  ));
}
