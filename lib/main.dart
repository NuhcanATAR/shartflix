import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/bloc.dart';
import 'package:shartflix/feature/authentication/sign_in/provider/sign_in_provider.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/cubit.dart';
import 'package:shartflix/feature/authentication/sign_up/provider/sign_up_provider.dart';
import 'package:shartflix/feature/home/bloc/bloc.dart';
import 'package:shartflix/feature/home/provider/home_provider.dart';
import 'package:shartflix/feature/navigation_bar/provider/navigation_bar_provider.dart';
import 'package:shartflix/feature/profile/bloc/cubit.dart';
import 'package:shartflix/feature/profile/provider/profile_provider.dart';
import 'package:shartflix/feature/profile/view/photo_update/bloc/cubit.dart';
import 'package:shartflix/feature/profile/view/photo_update/provider/photo_update_provider.dart';
import 'package:shartflix/product/core/router/go_router.dart';
import 'package:shartflix/product/initialize/initialize.dart';
import 'package:shartflix/product/theme/light_theme.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SignInBloc()),
        BlocProvider(create: (BuildContext context) => SignUpBloc()),
        BlocProvider(create: (BuildContext context) => ProfileBloc()),
        BlocProvider(create: (BuildContext context) => HomeBloc()),
        BlocProvider(create: (BuildContext context) => PhotoUpdateBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PhotoUpdateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomColorTheme().themeData,
        themeMode: ThemeMode.light,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
