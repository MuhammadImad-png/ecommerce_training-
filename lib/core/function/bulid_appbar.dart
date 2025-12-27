import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

AppBar bulidCustomAppBar(String title, param1) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.kPrimaryColor,
    title: Text(
      title,
      style: const TextStyle(color: AppColors.kWhiteColor),
    ),
  );
}
