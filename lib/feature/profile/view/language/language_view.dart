import 'package:flutter/material.dart';
import 'package:shartflix/feature/profile/view/language/language_viewmodel.dart';

class LanguageSelectView extends StatefulWidget {
  const LanguageSelectView({super.key});

  static String routeName = 'language';
  static String routePath = '/language';

  @override
  State<LanguageSelectView> createState() => _LanguageSelectViewState();
}

class _LanguageSelectViewState extends LanguageSelectViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Language Select View")));
  }
}
