import 'package:flutter/material.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_viewmodel.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  static String routeName = 'navigation_bar';
  static String routePath = '/navigation_bar';

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends NavigationBarViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Navigation Bar View")));
  }
}
