import 'package:flutter/material.dart';

class RecommendedMeal {
  final Map<String, Color> colors;
  final String imagePath;
  final double price;
  final String name;

  RecommendedMeal({
    @required this.colors,
    @required this.imagePath,
    @required this.price,
    @required this.name,
  });
}
