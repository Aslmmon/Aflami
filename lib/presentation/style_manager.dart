import 'package:afalmi/presentation/font_manager.dart';
import 'package:flutter/cupertino.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}
/// Styles for Different TextSyles.
TextStyle getBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.fontWeightBold, color);

TextStyle getThinStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.fontWeightThin, color);

TextStyle getSemiBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.fontWeightSemiBold, color);

TextStyle getLightStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.fontWeightLight, color);
