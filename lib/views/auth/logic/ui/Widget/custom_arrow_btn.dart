// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

// ignore: camel_case_types
class customArrowBtn extends StatelessWidget {
  const customArrowBtn({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          child: Icon(Icons.arrow_forward),
        ));
  }
}
