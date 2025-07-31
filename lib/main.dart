import 'package:flutter/material.dart';
import 'package:shartflix/product/core/router/go_router.dart';
import 'package:shartflix/product/initialize/initialize.dart';
import 'package:shartflix/product/theme/light_theme.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomColorTheme().themeData,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
