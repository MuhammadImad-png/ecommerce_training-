import 'package:flutter/material.dart';
import 'package:flutter_app_std/core/app_colors.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // تحديد ارتفاع محدد للقائمة
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoreis.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8), // تعديل المسافات بين العناصر
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30, // تحديد حجم الدائرة
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  child: Icon(categoreis[index].icon, size: 30),
                ),
                Text(
                  categoreis[index].text,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Category> categoreis = [
  Category(icon: Icons.sports, text: "Sports"),
  Category(icon: Icons.tv, text: "Electronics"),
  Category(icon: Icons.collections, text: "Collections"),
  Category(icon: Icons.book, text: "Books"),
  Category(icon: Icons.games, text: "Games"),
  Category(icon: Icons.games, text: "Games2"),
  Category(icon: Icons.games, text: "Games3"),
];

class Category {
  final IconData icon;
  final String text;

  Category({required this.icon, required this.text});
}
