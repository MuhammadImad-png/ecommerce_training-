import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/componens/custom_circle_pro_ind.dart';
import 'package:flutter_app_std/views/nav_bar/logic/ui/Home_View.dart';

class CachImage extends StatelessWidget {
  const CachImage({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: 250,
      width: double.infinity,
      imageUrl: url,
      placeholder: (context, url) =>
          const SizedBox(height: 200, child: CustomerCircleProglndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
