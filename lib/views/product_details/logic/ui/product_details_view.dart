import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/cach_image.dart';
import 'package:flutter_app_std/core/function/bulid_appbar.dart';
import 'package:flutter_app_std/core/model/product_model.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';
import 'package:flutter_app_std/views/product_details/logic/cubit/product_detals_cubit.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/custom_rating_widget.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/widgets/comments_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit()..getRates(productId: product.id),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
        
        },
        builder: (context, state) {
          return Scaffold(
            appBar: bulidCustomAppBar(
              context as String ,
              product.productName,
            ),
            body: state is GetRateLoading
                ? CircularProgressIndicator()
                : ListView(
                    padding: const EdgeInsets.all(12),
                    children: [
                      // ---------- الصورة ----------
                      CachImage(
                        url: product.imageUrl ??
                            "https://via.placeholder.com/300",
                      ),

                      const SizedBox(height: 16),

                      // ---------- الاسم + السعر ----------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.productName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${product.price} LE",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ---------- الوصف ----------
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 14),
                      ),

                      const SizedBox(height: 20),

                      // ---------- الريت ----------
                      Center(
                        child: CustomRatingWidget(
                          onRated: (double rating) {
                            context.read<ProductDetailsCubit>().getRates(
                                  productId: product.id,
                                );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ---------- إضافة تعليق ----------
                      customTextFormField(
                        labelText: "Type Your Feedback",
                        suffIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Comments:",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const CommentList(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
