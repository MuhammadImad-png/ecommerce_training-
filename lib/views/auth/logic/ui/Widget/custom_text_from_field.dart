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

// ignore: camel_case_types
class customTextFormField extends StatelessWidget {
  const customTextFormField({
    super.key,
    required this.labelText,
    required this.suffIcon,
    this.isSecured = false,
    this.controller,
    this.keybordType,
  });
  final String labelText;
  final Widget? suffIcon;
  final bool isSecured;
  final TextInputType? keybordType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecured,
      validator: (value) {
        if (value!.isEmpty) {
          return "الحقل فارغ";
        }
        return null;
      },
      keyboardType: keybordType,
      decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffIcon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kBlackColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.3,
              color: AppColors.kBordersideColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.8,
              color: AppColors.kBordersideColor,
            ),
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
