// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:shartflix/feature/home/home_view.dart';
import 'package:shartflix/feature/profile/profile_view.dart';

class NavigationBarProvider extends ChangeNotifier {
  List<Widget> viewList = <Widget>[const HomeView(), const ProfileView()];

  late int selectView = 0;

  NavigationBarProvider() {}

  void menuSelectPrimary() {
    selectView = 0;
    notifyListeners();
  }

  void menuSelectSecondary() {
    selectView = 1;
    notifyListeners();
  }
}
