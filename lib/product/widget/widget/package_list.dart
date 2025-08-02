import 'package:flutter/material.dart';
import 'package:shartflix/product/extension/dynamic_extension.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/text_widget/title_medium_text.dart';

class PackageListWidget extends StatelessWidget {
  const PackageListWidget({super.key, required this.dynamicViewExtensions});

  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
      child: Column(
        children: <Widget>[
          // title
          buildTitleWidget,
          // list
          buildListWidget(context),
        ],
      ),
    );
  }

  // title
  Widget get buildTitleWidget => Padding(
    padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
    child: const BodyMediumWhiteBoldText(
      text: 'Kilidi açmak için bir jeton paketi seçin',
      textAlign: TextAlign.center,
    ),
  );

  // list
  Widget buildListWidget(BuildContext context) => SizedBox(
    width: dynamicViewExtensions.maxWidth(context),
    height: dynamicViewExtensions.dynamicHeight(context, 0.25),
    child: Row(
      children: <Widget>[
        // card one
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // card
              Positioned(
                left: 0,
                right: 0,
                top: 12,
                child: Container(
                  height: dynamicViewExtensions.dynamicHeight(context, 0.24),
                  decoration: BoxDecoration(
                    gradient: BaseUtility.packageCardStandartColor,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(BaseUtility.radiusNormalValue),
                    ),
                  ),

                  child: Column(
                    children: <Widget>[
                      // body
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '200',
                                textAlign: TextAlign.center,
                                style: CustomColorTheme()
                                    .themeDataSecond
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.white,
                                      decorationThickness: 1.5,
                                    ),
                              ),

                              const TitleMediumWhiteBoldText(
                                text: '330',
                                textAlign: TextAlign.center,
                              ),
                              const BodyMediumWhiteText(
                                text: 'Jeton',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // footer
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            BodyMediumWhiteBoldText(
                              text: '₺99,99',
                              textAlign: TextAlign.center,
                            ),
                            BodyMediumWhiteText(
                              text: 'Başına haftalık',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: BaseUtility.symmetric(
                        BaseUtility.paddingLowValue,
                        BaseUtility.paddingNormalValue,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            BaseUtility.radiusCircularNormalValue,
                          ),
                        ),
                        shape: BoxShape.rectangle,
                        gradient: BaseUtility.packageCardStandartHeadColor,
                      ),
                      child: const BodyMediumWhiteText(
                        text: '+10%',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: BaseUtility.paddingNormalValue),
        // card second
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // card
              Positioned(
                left: 0,
                right: 0,
                top: 12,
                child: Container(
                  height: dynamicViewExtensions.dynamicHeight(context, 0.24),
                  decoration: BoxDecoration(
                    gradient: BaseUtility.packageCardPremiumColor,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(BaseUtility.radiusNormalValue),
                    ),
                  ),

                  child: Column(
                    children: <Widget>[
                      // body
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '2.000',
                                textAlign: TextAlign.center,
                                style: CustomColorTheme()
                                    .themeDataSecond
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.white,
                                      decorationThickness: 1.5,
                                    ),
                              ),

                              const TitleMediumWhiteBoldText(
                                text: '3.375',
                                textAlign: TextAlign.center,
                              ),
                              const BodyMediumWhiteText(
                                text: 'Jeton',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // footer
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            BodyMediumWhiteBoldText(
                              text: '₺799,99',
                              textAlign: TextAlign.center,
                            ),
                            BodyMediumWhiteText(
                              text: 'Başına haftalık',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: BaseUtility.symmetric(
                        BaseUtility.paddingLowValue,
                        BaseUtility.paddingNormalValue,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            BaseUtility.radiusCircularNormalValue,
                          ),
                        ),
                        shape: BoxShape.rectangle,
                        gradient: BaseUtility.packageCardPremiumHeadColor,
                      ),
                      child: const BodyMediumWhiteText(
                        text: '+70%',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: BaseUtility.paddingNormalValue),
        // card three
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // card
              Positioned(
                left: 0,
                right: 0,
                top: 12,
                child: Container(
                  height: dynamicViewExtensions.dynamicHeight(context, 0.24),
                  decoration: BoxDecoration(
                    gradient: BaseUtility.packageCardStandartColor,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(BaseUtility.radiusNormalValue),
                    ),
                  ),

                  child: Column(
                    children: <Widget>[
                      // body
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '1.000',
                                textAlign: TextAlign.center,
                                style: CustomColorTheme()
                                    .themeDataSecond
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.white,
                                      decorationThickness: 1.5,
                                    ),
                              ),

                              const TitleMediumWhiteBoldText(
                                text: '1.350',
                                textAlign: TextAlign.center,
                              ),
                              const BodyMediumWhiteText(
                                text: 'Jeton',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // footer
                      Padding(
                        padding: BaseUtility.bottom(
                          BaseUtility.paddingNormalValue,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            BodyMediumWhiteBoldText(
                              text: '₺399,99',
                              textAlign: TextAlign.center,
                            ),
                            BodyMediumWhiteText(
                              text: 'Başına haftalık',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // header
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: BaseUtility.symmetric(
                        BaseUtility.paddingLowValue,
                        BaseUtility.paddingNormalValue,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            BaseUtility.radiusCircularNormalValue,
                          ),
                        ),
                        shape: BoxShape.rectangle,
                        gradient: BaseUtility.packageCardStandartHeadColor,
                      ),
                      child: const BodyMediumWhiteText(
                        text: '+35%',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
