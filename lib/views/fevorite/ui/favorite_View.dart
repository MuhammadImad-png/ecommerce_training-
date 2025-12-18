// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/componens/productList.dart';
import '../../../core/componens/productcard.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Center(
          child: Text(
            "Your Favorite Products",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 24),
        Text(
          "Resantly product",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ProductList(),
      ],
    );
  }
}
