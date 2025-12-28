import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/cach_image.dart';
import 'package:flutter_app_std/core/function/bulid_appbar.dart';
import 'package:flutter_app_std/core/function/navigate_without_back.dart';
import 'package:flutter_app_std/core/model/product_model.dart';
import 'package:flutter_app_std/views/auth/logic/ui/Widget/custom_text_from_field.dart';
import 'package:flutter_app_std/views/product_details/logic/cubit/product_detals_cubit.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/custom_rating_widget.dart';
import 'package:flutter_app_std/views/product_details/logic/ui/widgets/comments_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
          if (state is AddOrUpdateRateSuccess) {
            navigateWithoutBack(context, this);
          }
        },
        builder: (context, state) {
          ProductDetailsCubit cubit = context.read<ProductDetailsCubit>();

          return Scaffold(
            appBar: bulidCustomAppBar(
              context as String,
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
                      // Center(
                      //   child: CustomRatingWidget(
                      //     onRated: (double rating) {
                      //       context.read<ProductDetailsCubit>().getRates(
                      //             productId: product.id,
                      //           );
                      //     },
                      //   ),
                      // ),

                      const SizedBox(
                        height: 20,
                      ),
                      RatingBar.builder(
                        initialRating: cubit.userRate.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          cubit.addOrUpdateUserRate(
                            productId: widget.product.productId!,
                            data: {
                              "rate": rating.toInt(),
                              "for_user": cubit.userId,
                              "for_product": widget.product.productId,
                            },
                          );
                        },
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

                      const CommentsList(
                        productModel: widget.product,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
