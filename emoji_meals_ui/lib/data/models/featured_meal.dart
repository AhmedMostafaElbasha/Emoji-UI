import 'package:flutter/material.dart';

class FeaturedMeal {
  final String imagePath;
  final String name;
  final double price;
  final Color color;

  FeaturedMeal({
    @required this.imagePath,
    @required this.name,
    @required this.price,
    @required this.color,
  });
}
