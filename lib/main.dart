import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
import 'package:shartflix/feature/profile/view/language/provider/language_provide.dart';
import 'package:shartflix/feature/profile/view/photo_update/bloc/cubit.dart';
import 'package:shartflix/feature/profile/view/photo_update/provider/photo_update_provider.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/core/router/go_router.dart';
import 'package:shartflix/product/initialize/initialize.dart';
import 'package:shartflix/product/theme/light_theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  await AppStart.initStartApp();

  final languageProvider = LanguageProvider();
  await languageProvider.loadLanguage();

  runApp(
    ChangeNotifierProvider(
      create: (_) => languageProvider,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => SignInBloc()),
          BlocProvider(create: (BuildContext context) => SignUpBloc()),
          BlocProvider(create: (BuildContext context) => ProfileBloc()),
          BlocProvider(create: (BuildContext context) => HomeBloc()),
          BlocProvider(create: (BuildContext context) => PhotoUpdateBloc()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
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
        locale: Locale(languageProvider.selectedLanguage),
        supportedLocales: const [Locale('en', ''), Locale('tr', '')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        theme: CustomColorTheme().themeData,
        themeMode: ThemeMode.light,
        initialRoute: '/',
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
          routeObserver,
        ],
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
