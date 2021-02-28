import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle mainHeading() {
    return GoogleFonts.notoSans(
      fontWeight: FontWeight.w800,
      fontSize: ScreenUtil().setSp(27.0),
      color: AppColors.black,
    );
  }

  static TextStyle subHeading() {
    return GoogleFonts.notoSans(
      fontWeight: FontWeight.w700,
      fontSize: ScreenUtil().setSp(20.0),
      color: AppColors.black,
    );
  }

  static TextStyle homeMealItemInfo(Color color) {
    return GoogleFonts.notoSans(
      fontSize: ScreenUtil().setSp(17.0),
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle tabSelectedLabel() {
    return GoogleFonts.notoSans(
      fontSize: ScreenUtil().setSp(16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle tabUnSelectedLabel() {
    return GoogleFonts.notoSans(
      fontSize: ScreenUtil().setSp(13.0),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle foodName() {
    return GoogleFonts.notoSans(
      fontSize: ScreenUtil().setSp(14.0),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle mealOfferPrice() {
    return GoogleFonts.lato(
      fontWeight: FontWeight.w800,
      fontSize: ScreenUtil().setSp(16.0),
      color: AppColors.lightOrangeAccent,
    );
  }

  static TextStyle mealOriginalPrice() {
    return GoogleFonts.lato(
      fontSize: ScreenUtil().setSp(16.0),
      decoration: TextDecoration.lineThrough,
      fontWeight: FontWeight.w600,
      color: AppColors.grayWithOpacity40,
    );
  }

  static TextStyle cartItemsCount() {
    return GoogleFonts.notoSans(
      color: AppColors.red,
      fontSize: ScreenUtil().setSp(14.0),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle totalPrice() {
    return GoogleFonts.notoSans(
      color: AppColors.darkGrey,
      fontSize: ScreenUtil().setSp(40.0),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle addToCart() {
    return GoogleFonts.notoSans(
      color: AppColors.white,
      fontSize: ScreenUtil().setSp(15.0),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle quantity() {
    return GoogleFonts.notoSans(
      color: AppColors.lightOrange,
      fontSize: ScreenUtil().setSp(18.0),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle hint() {
    return GoogleFonts.notoSans(
      fontSize: ScreenUtil().setSp(18.0),
    );
  }
}
