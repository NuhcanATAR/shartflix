import 'package:flutter/material.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/authentication/sign_up/sign_up_view.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_view.dart';
import 'package:shartflix/feature/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => const SignInView());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case '/navigation_bar':
        return MaterialPageRoute(builder: (_) => const NavigationBarView());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('Sayfa bulunamadı: ${settings.name}')),
              ),
        );
    }
  }
}
