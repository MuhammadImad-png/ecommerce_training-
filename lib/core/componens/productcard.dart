import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    required int price,
    required String name,
    required int oldPrice,
    required String imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------------- الصورة ----------------------
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl ?? "",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, _, __) => Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ---------------------- اسم المنتج ----------------------
            Text(
              product.productName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            // ---------------------- السعر ----------------------
            Row(
              children: [
                Text(
                  "${product.price} EGP",
                  // style: const TextStyle(
                  //   fontSize: 16,
                  //   color: Colors.green,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),

                const SizedBox(width: 8),

                // Text(
                //   product.oldPrice,
                //   style: const TextStyle(
                //     fontSize: 14,
                //     color: Colors.red,
                //     decoration: TextDecoration.lineThrough,
                //   ),
                // ),
              ],
            ),

            const SizedBox(height: 6),

            // ---------------------- الخصم ----------------------
            if (product.sale.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  // color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "${product.sale}% OFF",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
