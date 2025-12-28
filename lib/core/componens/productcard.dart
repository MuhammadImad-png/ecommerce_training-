import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/function/navigate_without_back.dart';
import 'package:flutter_app_std/core/model/product_model.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/product_details_view.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateWithoutBack(context, ProductDetailsView(product: product,)),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // أهم حاجة تمنع الـ overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- الصورة ----------------
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl ?? "",
                height: 120, // قللنا الارتفاع
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, _, __) => Container(
                  height: 120,
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

            const SizedBox(height: 8),

            // ---------------- اسم المنتج ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 6),

            // ---------------- السعر ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    "${product.price} EGP",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (product.oldPrice.isNotEmpty &&
                      int.tryParse(product.oldPrice) != null)
                    Text(
                      "${product.oldPrice} EP",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // ---------------- الخصم ----------------
            if (product.sale.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(
                  "${product.sale}% OFF",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
