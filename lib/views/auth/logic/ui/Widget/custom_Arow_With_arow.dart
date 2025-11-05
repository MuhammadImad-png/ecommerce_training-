// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_arrow_btn.dart';

// ignore: camel_case_types
class customRowWithArrowBtn extends StatelessWidget {
  const customRowWithArrowBtn({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        customArrowBtn(
          onTap: onTap,
        ),
      ],
    );
  }
}
