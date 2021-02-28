import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/presentation.dart';
import '../../constants/constants.dart';
import '../../data/data.dart';

// ignore: must_be_immutable
class OrderDetails extends StatefulWidget {
  final RecommendedMeal recommendedMeal;

  OrderDetails({this.recommendedMeal});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(16),
              top: ScreenUtil().setHeight(16),
              // bottom: ScreenUtil().setHeight(16),
            ),
            child: Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(16),
                    ),
                    child: appCustomAppBar(
                      AppRoutes.orderDetails,
                      context,
                    ),
                  ),
                  _mainHeadings(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(34),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _displayMealImage(),
                        Column(
                          children: [
                            _displayCustomIconButton(AppIcons.favoriteBorder),
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(24),
                              ),
                              child: _displayCustomIconButton(AppIcons.restore),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _displayTotalPrice(),
                        _displayQuantityController(),
                      ],
                    ),
                  ),
                  _displaySubHeading(),
                  _displayFeaturedMealsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainHeadings() {
    var mealName = _displayedMealName();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(12),
          ),
          child: AppTextDisplay(
            translation: AppStrings.orderDetailsMainHeading,
            textStyle: AppTextStyles.mainHeading(),
          ),
        ),
        AppTextDisplay(
          translation: mealName,
          textStyle: AppTextStyles.mainHeading(),
        ),
      ],
    );
  }

  String _displayedMealName() {
    print(widget.recommendedMeal.name);
    switch (widget.recommendedMeal.name) {
      case 'hamburg':
        return AppStrings.burgerHeading;
      case 'chips':
        return AppStrings.chipsHeading;
      case 'donuts':
        return AppStrings.donutsHeading;
    }
  }

  Widget _displayMealImage() {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(8),
      ),
      child: Hero(
        tag: widget.recommendedMeal.name,
        child: Container(
          height: ScreenUtil().setHeight(215),
          width: ScreenUtil().setWidth(215),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.recommendedMeal.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayCustomIconButton(IconData icon) {
    return Stack(
      children: [
        Container(
          height: ScreenUtil().setHeight(50),
          width: ScreenUtil().setWidth(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.lightOrangeWithOpacity10,
                blurRadius: 6.0,
                spreadRadius: 6.0,
                offset: Offset(5.0, 11.0),
              ),
            ],
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(50),
          width: ScreenUtil().setWidth(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.lightOrange,
              size: 25.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayTotalPrice() {
    return Container(
      height: ScreenUtil().setHeight(70),
      width: ScreenUtil().setWidth(85),
      color: AppColors.white,
      child: Center(
        child: AppTextDisplay(
          text: '\$${widget.recommendedMeal.price.toInt() * quantity}',
          textStyle: AppTextStyles.totalPrice(),
        ),
      ),
    );
  }

  Widget _displayQuantityController() {
    return Container(
      height: ScreenUtil().setHeight(60),
      width: ScreenUtil().setWidth(230),
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: ScreenUtil().setHeight(40),
            width: ScreenUtil().setWidth(112),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Row(
              children: [
                // TODO Decrement Button
                _displayQuantityControlButton(Icons.remove, 'minus'),
                // TODO Quantity Display
                _displayQuantity(),
                // TODO Increment Button
                _displayQuantityControlButton(AppIcons.add, 'add'),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: AppTextDisplay(
              translation: AppStrings.addToCart,
              textStyle: AppTextStyles.addToCart(),
            ),
          ),
        ],
      ),
    );
  }

  void adjustQuantity(String value) {
    switch (value) {
      case 'add':
        setState(() {
          quantity += 1;
        });
        return;
      case 'minus':
        setState(() {
          quantity -= 1;
        });
        return;
    }
  }

  Widget _displayQuantityControlButton(IconData icon, String operation) {
    return IconButton(
      iconSize: 24.0,
      icon: Icon(
        icon,
        color: AppColors.lightOrange,
      ),
      onPressed: () => adjustQuantity(operation),
    );
  }

  Widget _displayQuantity() {
    return AppTextDisplay(
      text: quantity.toString(),
      textStyle: AppTextStyles.quantity(),
    );
  }

  Widget _displaySubHeading() {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(34),
      ),
      child: AppTextDisplay(
        translation: AppStrings.orderDetailsFeatured,
        textStyle: AppTextStyles.subHeading(),
      ),
    );
  }

  Widget _displayFeaturedMealsList() {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setWidth(16),
      ),
      child: Container(
        height: ScreenUtil().setHeight(177.0),
        width: ScreenUtil().screenWidth,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  // right: ScreenUtil().setWidth(12),
                  // vertical: ScreenUtil().setHeight(12),
                  ),
              child: Column(
                children: [
                  FeaturedMealItem(featuredMeals[0]),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(8),
                      ),
                      FeaturedMealItem(featuredMeals[1]),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(8),
                // right: ScreenUtil().setWidth(12),
                // vertical: ScreenUtil().setHeight(12),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(20),
                    ),
                    child: FeaturedMealItem(featuredMeals[2]),
                  ),
                  FeaturedMealItem(featuredMeals[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
