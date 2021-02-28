import 'package:emoji_meals_ui/data/models/models.dart';
import '../../constants/constants.dart';

var recommendedMeals = [
  RecommendedMeal(
    colors: {
      'backgroundColor': AppColors.lightBrownAccent,
      'textColor': AppColors.lightBrown,
    },
    imagePath: AppImagePaths.burger,
    price: 21,
    name: AppStrings.hamburg,
  ),
  RecommendedMeal(
    colors: {
      'backgroundColor': AppColors.blueGreyAccent,
      'textColor': AppColors.blueGray,
    },
    imagePath: AppImagePaths.fries,
    price: 15,
    name: AppStrings.chips,
  ),
  RecommendedMeal(
    colors: {
      'backgroundColor': AppColors.lightGreenAccent,
      'textColor': AppColors.lightGreen,
    },
    imagePath: AppImagePaths.doughnut,
    price: 15,
    name: AppStrings.donuts,
  ),
];
