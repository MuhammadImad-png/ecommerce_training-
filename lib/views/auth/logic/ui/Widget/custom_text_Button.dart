// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

// ignore: camel_case_types
class customTextButton extends StatelessWidget {
  const customTextButton({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.kPrimaryColor,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
