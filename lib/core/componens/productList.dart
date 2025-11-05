import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/productcard.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.shrinkwrap,
    required this.physics,

  });

  final bool? shrinkwrap;
  final ScrollPhysics? physics;

  final List<Map<String, dynamic>> products = const [
    {
      "name": "TV",
      "price": 234,
      "oldPrice": 420,
      "image":
          "https://cdn.pixabay.com/photo/2017/08/01/13/13/tv-2565306_640.jpg"
    },

    {
      "name": "Headphones",
      "price": 199,
      "oldPrice": 299,
      "image":
          " https://pixabay.com/photos/sony-mdr-cd580-headphones-2202301_640.jpg"
    },
    {
      "name": "Camera",
      "price": 800,
      "oldPrice": 1050,
      "image":
          "https://pixabay.com/photos/camera-olympus-digital-camera-541213_640.jpg"
    },
    // كمل بقية المنتجات هنا
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkwrap ?? true,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          name: product['name'],
          price: product['price'],
          oldPrice: product['oldPrice'],
          imageUrl: product['image'],
        );
      },
    );
  }
}
