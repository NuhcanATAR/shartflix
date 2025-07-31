// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppImages {
  sinFlixSplash('sin_flix_splash');

  final String value;
  const AppImages(this.value);

  String get toSvg => "assets/image/$value.svg";
  SvgPicture toSvgImg(Color? color, double width, double height) =>
      SvgPicture.asset(toSvg, color: color, width: width, height: height);

  String get toPng => "assets/image/$value.png";
  Image toPngImg(double width, double height) =>
      Image.asset(toPng, width: width, height: height);
}
