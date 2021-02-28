import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/presentation.dart';
import '../../constants/constants.dart';
import '../../data/data.dart';

class FeaturedMealItem extends StatelessWidget {
  final FeaturedMeal featuredMeal;

  FeaturedMealItem(this.featuredMeal);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(12), right: ScreenUtil().setWidth(12)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(16),
              ),
              child: Container(
                height: ScreenUtil().setHeight(75),
                width: ScreenUtil().setWidth(75),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: featuredMeal.color,
                ),
                child: Center(
                  child: AppImageView(
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(50),
                    assetImagePath: featuredMeal.imagePath,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextDisplay(
                  translation: featuredMeal.name,
                  textStyle: AppTextStyles.foodName(),
                ),
                AppTextDisplay(
                  text: '\$${featuredMeal.price}',
                  textStyle: AppTextStyles.mealOfferPrice(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
