// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/custom_search_field.dart';
import 'package:flutter_app_std/core/componens/productList.dart';
import 'package:flutter_app_std/core/componens/productcard.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/widgets/categories_list.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Center(
          child: Text(
            "Welcome To Our Market",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: CustomSearchField(),
        ),

        SizedBox(height: 24),

        Text(
          "Resantly product",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

  
       ],
    );

  }
  
}
