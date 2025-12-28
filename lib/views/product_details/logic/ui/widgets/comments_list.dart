import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/model/product_model.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
     required this.productModel,
  });
 final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => UserComment(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10);
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text("User Name", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Text(
              "Comment :",
            ),
          ],
        ),
        Row(
          children: [
            Text(" Replay-:", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Text(
              "Raplay....",
            ),
          ],
        )
      ],
    );
  }
}
