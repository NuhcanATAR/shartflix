import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/feature/profile/view/language/language_viewmodel.dart';
import 'package:shartflix/feature/profile/view/language/provider/language_provide.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/constants/image_constant.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/widget/language_card.dart';

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
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: dynamicViewExtensions.dynamicHeight(context, 0.1),
        backgroundColor:
            CustomColorTheme().themeDataSecond.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            width: 40,
            height: 40,
            padding: BaseUtility.all(BaseUtility.paddingSmallValue),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(BaseUtility.radiusCircularHighValue),
              ),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: AppIcons.arrowLeft.toSvgImg(
              Colors.white,
              BaseUtility.iconMediumNormalSize,
              BaseUtility.iconMediumNormalSize,
            ),
          ),
        ),
        centerTitle: true,
        title: BodyMediumWhiteBoldText(
          text: AppLocalizations.of(context)!.language_select_appbar,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: BaseUtility.symmetric(
          BaseUtility.paddingNormalValue,
          BaseUtility.paddingSmallValue,
        ),
        child: ListView(
          children: <Widget>[
            // english
            LanguageCardWidget(
              menuText: AppLocalizations.of(context)!.language_select_english,
              value: 'en',
              groupValue: languageProvider.selectedLanguage,
              onChanged: (value) {
                setState(() {
                  languageProvider.setLanguage(value!);
                });
              },
              flagIcon: AppImages.flagEnglish,
              onTap: () => saveLanguage('en'),
            ),
            // turkish
            LanguageCardWidget(
              menuText: AppLocalizations.of(context)!.language_select_turkey,
              value: 'tr',
              groupValue: languageProvider.selectedLanguage,
              onChanged: (value) {
                setState(() {
                  languageProvider.setLanguage(value!);
                });
              },
              flagIcon: AppImages.flagTurkey,
              onTap: () => saveLanguage('tr'),
            ),
          ],
        ),
      ),
    );
  }
}
