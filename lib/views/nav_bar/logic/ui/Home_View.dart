// ignore_for_file: file_names, non_constant_identifier_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/cach_image.dart';
import 'package:flutter_app_std/core/componens/custom_search_field.dart';
import 'package:flutter_app_std/core/componens/productList.dart';
import 'package:flutter_app_std/core/componens/productcard.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_Button.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/widgets/categories_list.dart';

import '../../../../core/app_colors.dart' show AppColors;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/undraw_shopping-bags_nfsf.png",
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Popular Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 16),
        const CategoriesList(),
        const SizedBox(height: 24),

        const Text(
          "Resantly product",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        /// Card for product
        const ProductList(
          shrinkwrap: null,
          physics: null,
        )
      ],
    );
  }
}
