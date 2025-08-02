import 'package:flutter/material.dart';

class BaseUtility {
  BaseUtility._();

  // icon sizes
  static const double iconHugeSize = 200.0;
  static const double iconLargeSecondSize = 55.0;
  static const double iconLargeSize = 40.0;
  static const double iconMediumSecondSize = 33.0;
  static const double iconMediumSecondNormalSize = 26.0;
  static const double iconMediumNormalSize = 24.0;
  static const double iconMediumSize = 18.0;
  static const double iconNormalSize = 16.0;
  static const double iconSmallSize = 10.0;
  static const double iconXSmallSize = 5.0;

  // width and height sizes
  static const double sizedIconNormalHeight = 0.10;
  static const double sizedIconStandartHeight = 0.06;
  static const double sizedIconMediumHeight = 0.08;
  static const double sizedIconLargeHeight = 0.15;

  // color
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff1C1B1B);

  // padding sizes
  static const double paddingHugeValue = 125.0;
  static const double paddingHightValue = 33.0;
  static const double paddingNormalHightValue = 26.0;
  static const double paddingNormalMinValue = 18.0;
  static const double paddingNormalValue = 16.0;
  static const double paddingMediumValue = 10.0;
  static const double paddingSmallValue = 8.0;

  // margin sizes
  static const double marginHugeValue = 125.0;
  static const double marginHightValue = 33.0;
  static const double marginNormalMinValue = 18.0;
  static const double marginNormalValue = 16.0;
  static const double marginMediumValue = 10.0;
  static const double marginSmallValue = 8.0;

  static EdgeInsets horizontal(double padding) =>
      EdgeInsets.symmetric(horizontal: padding);
  static EdgeInsets vertical(double padding) =>
      EdgeInsets.symmetric(vertical: padding);

  static EdgeInsets symmetric(double vertical, double horizontal) =>
      EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
  static EdgeInsets left(double padding) => EdgeInsets.only(left: padding);
  static EdgeInsets right(double padding) => EdgeInsets.only(right: padding);
  static EdgeInsets top(double padding) => EdgeInsets.only(top: padding);
  static EdgeInsets bottom(double padding) => EdgeInsets.only(bottom: padding);
  static EdgeInsets all(double padding) => EdgeInsets.all(padding);

  // radius sizes
  static const double radiusHighValue = 31.0;
  static const double radiusMediumValue = 20.0;
  static const double radiusNormalValue = 12.0;
  static const double radiusLowValue = 4.0;

  static const double radiusCircularHighValue = 124;
  static const double radiusCircularNormalValue = 24;
  static const double radiusCircularMediumValue = 18;
  static const double radiusCircularLowValue = 4;
}
