import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard_page';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildCustomAppBar(),
          _buildMainHeading('SEARCH FOR'),
          _buildMainHeading('RECIPES'),
          SizedBox(height: 25.0),
          _buildSearchBar(),
          SizedBox(height: 20.0),
          _buildSubHeading('Recommended'),
          SizedBox(height: 15.0),
          _buildRecommendedMealsList(),
          SizedBox(height: 10.0),
          _buildTabBar(),
          _buildFoodTabBarView(),
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
          Icon(Icons.menu, color: Colors.black),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6.0,
                  spreadRadius: 4.0,
                  offset: Offset(0.0, 3.0),
                ),
              ],
              color: Color(0xFFC6E7FE),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/tuxedo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeading(String value) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        value,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w800,
          fontSize: 27.0,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: GoogleFonts.notoSans(fontSize: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.1),
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubHeading(String value) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        value,
        style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildRecommendedMealsList() {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildListItem(
            foodName: 'Hamburg',
            imagePath: 'assets/burger.png',
            price: '21',
            backgroundColor: Color(0xFFFFE9C6),
            textColor: Color(0xFFDA9551),
          ),
          _buildListItem(
            foodName: 'Chips',
            imagePath: 'assets/fries.png',
            price: '15',
            backgroundColor: Color(0xFFC2E3FE),
            textColor: Color(0xFF6A8CAA),
          ),
          _buildListItem(
            foodName: 'Donuts',
            imagePath: 'assets/doughnut.png',
            price: '15',
            backgroundColor: Color(0xFFD7FADA),
            textColor: Color(0xFF56CC7E),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem({
    @required String foodName,
    @required String imagePath,
    @required String price,
    @required Color backgroundColor,
    @required Color textColor,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BurgerPage(
              foodName: foodName,
              heroTag: foodName,
              imagePath: imagePath,
              pricePerItem: price,
            ),
          ));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMealImage(imagePath: imagePath, foodName: foodName),
              SizedBox(height: 25.0),
              _buildMealInfoText(value: foodName, textColor: textColor),
              _buildMealInfoText(value: "\$$price", textColor: textColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealInfoText(
      {@required String value, @required Color textColor}) {
    return Text(
      value,
      style: GoogleFonts.notoSans(
        fontSize: 17.0,
        color: textColor,
      ),
    );
  }

  Widget _buildMealImage({
    @required String imagePath,
    @required String foodName,
  }) {
    return Hero(
      tag: foodName,
      child: Container(
        height: 75.0,
        width: 75.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 50.0,
            width: 50.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.blueGrey.withOpacity(0.7),
        labelStyle: GoogleFonts.notoSans(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.notoSans(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
        tabs: [
          Tab(child: Text('FEATURED')),
          Tab(child: Text('COMBO')),
          Tab(child: Text('FAVORITES')),
          Tab(child: Text('RECOMMENDED')),
        ],
      ),
    );
  }

  Widget _buildFoodTabBarView() {
    return Container(
      height: MediaQuery.of(context).size.height - 450.0,
      child: TabBarView(
        controller: tabController,
        children: [
          FoodTab(),
          FoodTab(),
          FoodTab(),
          FoodTab(),
        ],
      ),
    );
  }
}
