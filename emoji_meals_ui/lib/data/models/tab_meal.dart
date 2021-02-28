import 'package:flutter/material.dart';

class TabMeal {
  final String name;
  double rating;
  final double offerPrice;
  final String imagePath;
  final double originalPrice;

  TabMeal({
    @required this.name,
    @required this.rating,
    @required this.offerPrice,
    @required this.imagePath,
    @required this.originalPrice,
  });
}
