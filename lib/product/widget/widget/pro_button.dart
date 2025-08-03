import 'package:flutter/material.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class ProButtonWidget extends StatelessWidget {
  const ProButtonWidget({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: BaseUtility.horizontal(BaseUtility.paddingSmallValue),
        padding: BaseUtility.all(BaseUtility.paddingMediumValue),
        decoration: BoxDecoration(
          color: CustomColorTheme().themeData.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(BaseUtility.radiusNormalValue),
          ),
        ),
        child: Row(
          children: <Widget>[
            AppIcons.pro.toSvgImg(
              Colors.white,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
            Padding(
              padding: BaseUtility.horizontal(BaseUtility.paddingMediumValue),
              child: BodyMediumWhiteBoldText(
                text: AppLocalizations.of(context)!.pro_button_text,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
