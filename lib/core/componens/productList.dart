import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/productcard.dart';
import 'package:flutter_app_std/core/cubit/home_cubit.dart';
import 'package:flutter_app_std/core/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    this.shrinkwrap,
    this.physics,
  });

  final bool? shrinkwrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final int crossAxisCount = width >= 1100
        ? 4
        : width >= 800
            ? 3
            : width >= 500
                ? 2
                : 2;

    return BlocProvider(
      create: (context) => HomeCubit()..getproducts(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final products = cubit.products;

          if (state is GetDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetDataError) {
            return const Center(child: Text("Error loading products"));
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            shrinkWrap: shrinkwrap ?? true,
            physics: physics ?? const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(
                // name: product.productName,
                // price: int.parse(product.price),
                // oldPrice: int.parse(product.oldPrice),
                // imageUrl: product.imageUrl ?? "",
                product: product,
              );
            },
          );
        },
      ),
    );
  }
}
