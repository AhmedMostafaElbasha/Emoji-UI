import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPage extends StatefulWidget {
  final String imagePath;
  final String foodName;
  final String pricePerItem;
  final String heroTag;

  BurgerPage({
    @required this.imagePath,
    @required this.foodName,
    @required this.pricePerItem,
    @required this.heroTag,
  });

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildCustomAppBar(),
          SizedBox(height: 15.0),
          _buildMainHeading('SUPER'),
          _buildMainHeading(widget.foodName.toUpperCase()),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFoodImageDisplay(
                imagePath: widget.imagePath,
                heroTag: widget.heroTag,
              ),
              SizedBox(width: 15.0),
              Column(
                children: [
                  _buildCustomIconButton(Icons.favorite_border),
                  _buildCustomIconButton(Icons.restore),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOrderTotalPriceDisplay(widget.pricePerItem),
              _buildQuantityControlBar(),
            ],
          ),
          _buildSubHeadingText('FEATURED'),
          _buildFeaturedMealsList()
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          Stack(
            children: [
              Container(
                height: 45.0,
                width: 45.0,
                color: Colors.transparent,
              ),
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFE7D6A).withOpacity(0.3),
                      blurRadius: 6.0,
                      spreadRadius: 4.0,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                  color: Color(0xFFFE7D6A),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  height: 21.0,
                  width: 21.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: GoogleFonts.notoSans(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        textStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeading(String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        value,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w800,
          fontSize: 27.0,
        ),
      ),
    );
  }

  Widget _buildFoodImageDisplay({
    @required String imagePath,
    @required String heroTag,
  }) {
    return Hero(
      tag: heroTag,
      child: Container(
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomIconButton(IconData icon) {
    return Stack(
      children: [
        Container(
          height: 45.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFE7D6A).withOpacity(0.1),
                blurRadius: 6.0,
                spreadRadius: 6.0,
                offset: Offset(5.0, 11.0),
              ),
            ],
          ),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Center(
            child: Icon(
              icon,
              color: Color(0xFFFE7D6A),
              size: 25.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderTotalPriceDisplay(String pricePerItem) {
    return Container(
      height: 70.0,
      width: 85.0,
      color: Colors.white,
      child: Center(
        child: Text(
          '\$${(int.parse(pricePerItem) * quantity).toString()}',
          style: GoogleFonts.notoSans(
            fontSize: 40.0,
            color: Color(0xFF5E6166),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityControlBar() {
    return Container(
      height: 60.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: Color(0xFFFE7D6A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 40.0,
            width: 105.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Row(
              children: [
                _buildQuantityControlButton(Icons.remove, 'MINUS'),
                _buildQuantityText(),
                _buildQuantityControlButton(Icons.add, 'PLUS'),
                Text(
                  'Add to cart',
                  style: GoogleFonts.notoSans(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void adjustQuantity(String value) {
    switch (value) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }

  Widget _buildQuantityControlButton(IconData icon, String expression) {
    return IconButton(
      iconSize: 17.0,
      icon: Icon(
        icon,
        color: Color(0xFFFE7D6A),
      ),
      onPressed: () {
        adjustQuantity(expression);
      },
    );
  }

  Widget _buildQuantityText() {
    return Text(
      quantity.toString(),
      style: GoogleFonts.notoSans(
        fontSize: 14.0,
        color: Color(0xFFFE7D6A),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildSubHeadingText(String value) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        value,
        style: GoogleFonts.notoSans(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildFeaturedMealsList() {
    return Container(
      height: 225.0,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                _buildListItem(
                  'assets/cheese.png',
                  'Sweet cheese',
                  '11',
                  Color(0xFFFBD6F5),
                ),
                SizedBox(height: 15.0),
                _buildListItem(
                  'assets/popcorn.png',
                  'Sweet popcorn',
                  '11',
                  Color(0xFFFBD6F5),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                _buildListItem(
                  'assets/taco.png',
                  'Tacos',
                  '6',
                  Color(0xFFC2E3FE),
                ),
                SizedBox(height: 15.0),
                _buildListItem(
                  'assets/sandwich.png',
                  'Sandwich',
                  '6',
                  Color(0xFFD7FADA),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(
      String imagePath, String foodName, String price, Color backgroundColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: null,
          child: Row(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: backgroundColor,
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: GoogleFonts.notoSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: GoogleFonts.lato(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      textStyle: TextStyle(
                        color: Color(0xFFF68D7F),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
