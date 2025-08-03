import 'package:flutter/material.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/authentication/sign_up/sign_up_view.dart';
import 'package:shartflix/feature/home/home_view.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_view.dart';
import 'package:shartflix/feature/profile/profile_view.dart';
import 'package:shartflix/feature/profile/view/language/language_view.dart';
import 'package:shartflix/feature/profile/view/photo_update/photo_update_view.dart';
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
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case '/photo_update':
        return MaterialPageRoute(builder: (_) => const PhotoUpdateView());
      case '/language':
        return MaterialPageRoute(builder: (_) => const LanguageSelectView());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('Page Not Found: ${settings.name}')),
              ),
        );
    }
  }
}
