import 'package:flutter/material.dart';
import 'package:shartflix/feature/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashView());
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
