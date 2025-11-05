import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/cach_image.dart';
import 'package:flutter_app_std/core/function/bulid_appbar.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/custom_rating_widget.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/widgets/comments_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulidCustomAppBar("product Name"),
      body: ListView(children: [
        const CachImage(
          url:
              "https://cdn.pixabay.com/photo/2017/08/01/13/13/tv-2565306_640.jpg",
        ),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Three",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text("234 LE",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Product Dsciption",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRatingWidget(
              onRated: (double rating) {
                debugPrint("تم التقييم: $rating");
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        customTextFormField(
            labelText: " Type Your Feedbake",
            suffIcon: IconButton(onPressed: () {}, icon: Icon(Icons.send))),
        const SizedBox(
          height: 20,
        ),
        Text("Comment :",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        CommentList(),
      ]),
    );
  }
}
 