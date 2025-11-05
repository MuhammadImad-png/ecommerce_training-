import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

class CustomerCircleProglndicator extends StatelessWidget {
  const CustomerCircleProglndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
