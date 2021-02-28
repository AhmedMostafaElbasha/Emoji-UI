import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';
import '../../data/models/models.dart';
import '../../presentation/presentation.dart';

class RecommendedMealItem extends StatelessWidget {
  final RecommendedMeal recommendedMeal;

  RecommendedMealItem(this.recommendedMeal);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderDetails(
                recommendedMeal: recommendedMeal,
              ),
            ),
          );
        },
        child: Container(
          height: ScreenUtil().setHeight(175.0),
          width: ScreenUtil().setWidth(150.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: recommendedMeal.colors['backgroundColor'],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _displayMealImage(),
              _displayMealInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayMealImage() {
    return Container(
      height: ScreenUtil().setHeight(75),
      width: ScreenUtil().setWidth(75),
      decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      child: Center(
        child: AppImageView(
          height: ScreenUtil().setHeight(50),
          width: ScreenUtil().setWidth(50),
          assetImagePath: recommendedMeal.imagePath,
        ),
      ),
    );
  }

  Widget _displayMealInfo() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextDisplay(
            translation: recommendedMeal.name,
            textStyle: AppTextStyles.homeMealItemInfo(
              recommendedMeal.colors['textColor'],
            ),
          ),
          AppTextDisplay(
            text: '\$${recommendedMeal.price}',
            textStyle: AppTextStyles.homeMealItemInfo(
              recommendedMeal.colors['textColor'],
            ),
          ),
        ],
      ),
    );
  }
}
