// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppIcons {
  mailOutline('mail_outline'),
  unlockOutline('unlock_outline'),
  hideOutline('hide_outline'),
  google('google'),
  apple('apple'),
  facebook('facebook'),
  arrowLeft('arrow_left'),
  plus('plus'),
  accountIcon('account_icon'),
  favorite('favorite'),
  homeOutline('home_outline'),
  profile('profile'),
  pro('pro'),
  iconlyPro1('iconly_pro1'),
  iconlyPro2('iconly_pro2'),
  iconlyPro3('iconly_pro3'),
  iconlyPro4('iconly_pro4'),
  addUserOutline('add_user_outline');

  final String value;
  const AppIcons(this.value);

  String get toSvg => "assets/icons/$value.svg";
  SvgPicture toSvgImg(Color? color, double width, double height) =>
      SvgPicture.asset(toSvg, color: color, width: width, height: height);

  String get toPng => "assets/icons/$value.png";
  Image toPngImg(double width, double height) =>
      Image.asset(toPng, width: width, height: height);
}
