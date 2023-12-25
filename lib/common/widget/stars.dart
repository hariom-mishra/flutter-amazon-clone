import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatings extends StatelessWidget {
  final double rating;
  const StarRatings({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(itemBuilder: (context, _)=> const Icon(Icons.star, color: GloabalVariables.secondaryColor,), itemCount: 5, direction: Axis.horizontal, rating: rating, itemSize: 15,);
  }
}