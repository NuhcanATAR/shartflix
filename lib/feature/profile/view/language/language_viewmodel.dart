import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/feature/profile/view/language/language_view.dart';
import 'package:shartflix/feature/profile/view/language/provider/language_provide.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class LanguageSelectViewModel extends BaseState<LanguageSelectView> {
  Future<void> saveLanguage(String languageCode) async {
    await Provider.of<LanguageProvider>(
      context,
      listen: false,
    ).setLanguage(languageCode);

    if (!mounted) return;
    Navigator.of(context).pop();
  }
}
