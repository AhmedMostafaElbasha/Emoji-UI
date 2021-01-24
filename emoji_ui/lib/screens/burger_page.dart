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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildCustomAppBar(),
        ],
      ),
    );
  }

  Widget buildCustomAppBar() {
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
}
