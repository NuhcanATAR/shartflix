import 'package:flutter/material.dart';
import 'package:shartflix/product/extension/dynamic_extension.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
    required this.btnText,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: dynamicViewExtensions.maxWidth(context),
        height: dynamicViewExtensions.dynamicHeight(context, 0.07),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomColorTheme().themeData.primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(BaseUtility.radiusCircularMediumValue),
            ),
          ),
          child: BodyMediumWhiteText(
            text: btnText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
