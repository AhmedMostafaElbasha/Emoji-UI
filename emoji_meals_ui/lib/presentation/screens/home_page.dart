import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../presentation/presentation.dart';
import '../../constants/constants.dart';
import '../../data/data.dart';
import '../../utilities/utilities.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(16),
              vertical: ScreenUtil().setHeight(16),
            ),
            child: Container(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appCustomAppBar(AppRoutes.home, context),
                  _homeMainHeadings(),
                  _displaySearchBar(),
                  _homeSubHeadings(AppStrings.homeSubHeading1),
                  _recommendedMealsList(),
                  _displayTabBar(tabController),
                  _displayTabMealsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayTabMealsList() {
    return Container(
      height: ScreenUtil().setHeight(134.0),
      child: ListView.builder(
        itemCount: tabMeals.length,
        itemBuilder: (context, index) {
          return TabMealItem(tabMeals[index]);
        },
      ),
    );
  }

  Widget _displayTabBar(TabController tabController) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(24),
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.blueGreyWithOpacity70,
        labelStyle: AppTextStyles.tabSelectedLabel(),
        unselectedLabelStyle: AppTextStyles.tabUnSelectedLabel(),
        tabs: [
          Tab(
            // child: AppTextDisplay(
            //   translation: AppStrings.featured,
            // ),
            child: Text(
              AppLocalizations.of(context).translate(AppStrings.featured),
            ),
          ),
          Tab(
            // child: AppTextDisplay(
            //   translation: AppStrings.combo,
            // ),
            child: Text(
              AppLocalizations.of(context).translate(AppStrings.combo),
            ),
          ),
          Tab(
            // child: AppTextDisplay(
            //   translation: AppStrings.favorites,
            // ),
            child: Text(
              AppLocalizations.of(context).translate(AppStrings.favorites),
            ),
          ),
          Tab(
            // child: AppTextDisplay(
            //   translation: AppStrings.recommended,
            // ),
            child: Text(
              AppLocalizations.of(context).translate(AppStrings.recommended),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendedMealsList() {
    return Container(
      height: ScreenUtil().setHeight(180),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedMeals.length,
        itemBuilder: (context, index) {
          return RecommendedMealItem(
            recommendedMeals[index],
          );
        },
      ),
    );
  }

  Widget _displaySearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(24),
      ),
      child: AppSearchBar(),
    );
  }

  Widget _homeSubHeadings(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(12),
      ),
      child: AppTextDisplay(
        translation: title,
        textStyle: AppTextStyles.subHeading(),
      ),
    );
  }

  Widget _homeMainHeadings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(12),
          ),
          child: AppTextDisplay(
            translation: AppStrings.homeMainHeading1,
            textStyle: AppTextStyles.mainHeading(),
          ),
        ),
        AppTextDisplay(
          translation: AppStrings.homeMainHeading2,
          textStyle: AppTextStyles.mainHeading(),
        ),
      ],
    );
  }
}
