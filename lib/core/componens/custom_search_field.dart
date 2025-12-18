import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: "Search In Market ",
          suffixIcon: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kBordersideColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
              onPressed: () {},
              label: const Icon(
                Icons.search,
              )),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.kBordersideColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 4,
              color: AppColors.kBordersideColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 4,
              color: AppColors.kBordersideColor,
            ),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
