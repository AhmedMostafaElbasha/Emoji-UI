import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          _buildFoodListItem(
            foodName: 'Delicious hot dog',
            rating: 4.0,
            price: '6',
            imagePath: 'assets/hotdog.png',
          ),
          _buildFoodListItem(
            foodName: 'Cheese pizza',
            rating: 5.0,
            price: '12',
            imagePath: 'assets/pizza.png',
          ),
        ],
      ),
    );
  }

  Widget _buildFoodListItem({
    @required String foodName,
    @required num rating,
    @required String price,
    @required String imagePath,
  }) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 210.0,
            child: Row(
              children: [
                _buildFoodImage(imagePath),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFoodNameText(foodName),
                    _buildFoodMealRatingBar(rating),
                    Row(
                      children: [
                        _buildOfferPriceText(price),
                        SizedBox(width: 3.0),
                        _buildOriginalPriceText(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildAddMealToOrderbutton(foodName),
        ],
      ),
    );
  }

  Widget _buildFoodImage(String imagePath) {
    return Container(
      height: 75.0,
      width: 75.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: Color(0xFFFFE3DF),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 50.0,
          width: 50.0,
        ),
      ),
    );
  }

  Widget _buildFoodNameText(String foodName) {
    return Text(
      foodName,
      style: GoogleFonts.notoSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildFoodMealRatingBar(num rating) {
    return SmoothStarRating(
      allowHalfRating: true,
      onRated: (value) {},
      starCount: rating.toInt(),
      rating: rating,
      color: Color(0xFFFFD143),
      borderColor: Color(0xFFFFD143),
      size: 15.0,
      spacing: 0.0,
    );
  }

  Widget _buildOfferPriceText(String price) {
    return Text(
      '\$$price',
      style: GoogleFonts.lato(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(
          color: Color(0xFFF68D7F),
        ),
      ),
    );
  }

  Widget _buildOriginalPriceText() {
    return Text(
      '\$18',
      style: GoogleFonts.lato(
        fontSize: 12.0,
        decoration: TextDecoration.lineThrough,
        fontWeight: FontWeight.w600,
        textStyle: TextStyle(
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _buildAddMealToOrderbutton(String foodName) {
    return FloatingActionButton(
      heroTag: foodName,
      mini: true,
      onPressed: () {},
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color(0xFFFE7D6A),
    );
  }
}
