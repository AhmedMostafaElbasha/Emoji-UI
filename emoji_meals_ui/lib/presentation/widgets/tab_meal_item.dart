import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../presentation/presentation.dart';
import '../../constants/constants.dart';
import '../../data/data.dart';

class TabMealItem extends StatelessWidget {
  final TabMeal tabMeal;

  TabMealItem(this.tabMeal);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(16),
      ),
      child: Container(
        width: ScreenUtil().setWidth(210.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _displayMealImage(),
            _displayMealInfo(),
            _displayAddMealToOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget _displayMealImage() {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(8),
      ),
      child: Container(
        height: ScreenUtil().setHeight(75.0),
        width: ScreenUtil().setWidth(75.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: AppColors.lightSimon,
        ),
        child: Center(
          child: AppImageView(
            height: ScreenUtil().setHeight(50),
            width: ScreenUtil().setWidth(50),
            assetImagePath: tabMeal.imagePath,
          ),
        ),
      ),
    );
  }

  Widget _displayMealInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _displayMealName(),
        _displayMealRating(),
        Row(
          children: [
            _displayOfferPrice(),
            //Consider putting a width padding
            _displayOriginalPrice(),
          ],
        ),
      ],
    );
  }

  Widget _displayMealName() {
    return AppTextDisplay(
      translation: tabMeal.name,
      textStyle: AppTextStyles.foodName(),
    );
  }

  Widget _displayMealRating() {
    return SmoothStarRating(
      allowHalfRating: true,
      onRated: (value) => tabMeal.rating = value,
      rating: tabMeal.rating,
      color: AppColors.canary,
      borderColor: AppColors.canary,
      size: 20.0,
      spacing: 1.0,
    );
  }

  Widget _displayOfferPrice() {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(8),
      ),
      child: AppTextDisplay(
        text: '\$${tabMeal.offerPrice.toString()}',
        textStyle: AppTextStyles.mealOfferPrice(),
      ),
    );
  }

  Widget _displayOriginalPrice() {
    return AppTextDisplay(
      text: '\$${tabMeal.originalPrice.toString()}',
      textStyle: AppTextStyles.mealOriginalPrice(),
    );
  }

  Widget _displayAddMealToOrderButton() {
    return FloatingActionButton(
      heroTag: tabMeal.name,
      mini: true,
      onPressed: () {},
      child: Center(
        child: Icon(
          AppIcons.add,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.lightOrange,
    );
  }
}
