import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/productList.dart';
import 'package:flutter_app_std/core/function/bulid_appbar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulidCustomAppBar("MyOrders",context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Productlist(
          shrinkwrap: false,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}

Productlist(
    {required bool shrinkwrap, required BouncingScrollPhysics physics}) {}
