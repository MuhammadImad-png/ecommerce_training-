import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CuctomRowBtn extends StatelessWidget {
  const CuctomRowBtn({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
  });
  final void Function()? onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColors.kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: AppColors.kWhiteColor,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      color: AppColors.kWhiteColor, fontSize: 20),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: AppColors.kWhiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
