import 'package:flutter/material.dart';
import '../../utilities/utilities.dart';
import '../../constants/constants.dart';

class AppTextDisplay extends StatelessWidget {
  final String translation;
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final int maxLines;

  AppTextDisplay(
      {this.translation = '',
      this.text = '',
      this.textStyle,
      this.textAlign = TextAlign.start,
      this.maxLines = 1})
      : assert(translation != '' || text != '');

  @override
  Widget build(BuildContext context) {
    return Text(
      translation != ''
          ? AppLocalizations.of(context).translate(translation)
          : text,
      textAlign: textAlign,
      style: textStyle ?? AppTextStyles.tabUnSelectedLabel(),
      maxLines: maxLines,
      softWrap: true,
    );
  }
}
