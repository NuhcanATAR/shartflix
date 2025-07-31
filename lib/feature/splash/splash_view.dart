import 'package:flutter/material.dart';
import 'package:shartflix/feature/splash/splash_viewmodel.dart';
import 'package:shartflix/product/constants/image_constant.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static String routeName = 'splash';
  static String routePath = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.sinFlixSplash.toPng),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
