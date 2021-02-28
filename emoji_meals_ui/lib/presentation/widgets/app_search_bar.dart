import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../utilities/utilities.dart';

class AppSearchBar extends StatefulWidget {
  @override
  _AppSearchBarState createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grayWithOpacity10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText:
              AppLocalizations.of(context).translate(AppStrings.searchHint),
          hintStyle: AppTextStyles.hint(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: AppColors.grayWithOpacity10,
              width: 1.0,
            ),
          ),
          filled: true,
          fillColor: AppColors.grayWithOpacity10,
          prefixIcon: Icon(
            AppIcons.search,
            color: AppColors.gray,
            size: 28,
          ),
        ),
      ),
    );
  }
}
