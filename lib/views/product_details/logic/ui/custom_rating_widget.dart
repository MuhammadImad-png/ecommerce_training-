import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingWidget extends StatefulWidget {
  final void Function(double rating) onRated;

  const CustomRatingWidget({super.key, required this.onRated});

  @override
  State<CustomRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomRatingWidget> {
  bool showRatingBar = true;
  double userRating = 0;

  @override
  Widget build(BuildContext context) {
    return showRatingBar
        ? RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            itemSize: 30,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                userRating = rating;
                showRatingBar = false;
              });
              widget.onRated(rating);
            },
          )
        : Text(
            'أعطيت $userRating نجوم ⭐',
            style: const TextStyle(fontSize: 18),
          );
  }
}
