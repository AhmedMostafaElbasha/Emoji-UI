import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/constants.dart';
import '../../presentation/presentation.dart';

Widget appCustomAppBar(String routeName, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: routeName == AppRoutes.orderDetails
            ? () => Navigator.of(context).pop()
            : () {},
        icon: Icon(
          routeName == AppRoutes.home ? AppIcons.menu : Icons.arrow_back_ios,
          color: AppColors.black,
        ),
      ),
      routeName == AppRoutes.home ? homeScreenActions() : orderDetailsActions(),
    ],
  );
}

Widget orderDetailsActions() {
  return Stack(
    children: [
      Container(
        height: ScreenUtil().setHeight(40),
        width: ScreenUtil().setWidth(40),
        color: Colors.transparent,
      ),
      Container(
        height: ScreenUtil().setHeight(40),
        width: ScreenUtil().setWidth(40),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightOrangeWithOpacity30,
              blurRadius: 6.0,
              spreadRadius: 4.0,
              offset: Offset(0.0, 4.0),
            ),
          ],
          color: AppColors.lightOrangeAccent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            AppIcons.shoppingCart,
            color: AppColors.white,
          ),
        ),
      ),
      Positioned(
        top: 3.0,
        right: 0.0,
        child: Container(
          height: ScreenUtil().setHeight(16),
          width: ScreenUtil().setWidth(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: AppTextDisplay(
            text: '1',
            textStyle: AppTextStyles.cartItemsCount(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}

Widget homeScreenActions() {
  return Container(
    height: ScreenUtil().setHeight(40),
    width: ScreenUtil().setWidth(40),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.grayWithOpacity30,
          blurRadius: 6.0,
          spreadRadius: 4.0,
          offset: Offset(0.0, 3.0),
        ),
      ],
      color: AppColors.lightSky,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(AppImagePaths.tuxedo),
        fit: BoxFit.contain,
      ),
    ),
  );
}
