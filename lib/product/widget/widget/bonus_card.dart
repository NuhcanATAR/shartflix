import 'package:flutter/material.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/text_widget/label_medium_text.dart';

class BonusCardWidget extends StatelessWidget {
  const BonusCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: BaseUtility.all(BaseUtility.paddingNormalValue),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(BaseUtility.radiusLowValue),
          ),
        ),
        child: Column(
          children: <Widget>[
            // title
            buildTitleWidget,
            // list
            buildListWidget,
          ],
        ),
      ),
    );
  }

  // title
  Widget get buildTitleWidget => Padding(
    padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
    child: const BodyMediumWhiteBoldText(
      text: 'Alacağınız Bonuslar',
      textAlign: TextAlign.center,
    ),
  );

  // list
  Widget get buildListWidget => Row(
    children: <Widget>[
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Padding(
          padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
          child: Column(
            children: <Widget>[
              // icon
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(BaseUtility.radiusCircularHighValue),
                  ),
                  shape: BoxShape.rectangle,
                  gradient: BaseUtility.bonusFeatureColor,
                ),
                child: AppIcons.pro1Icon.toPngImg(
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                ),
              ),
              // label
              Padding(
                padding: BaseUtility.top(BaseUtility.paddingMediumValue),
                child: const LabelMediumWhiteText(
                  text: 'Permium\nHesap\n',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Padding(
          padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
          child: Column(
            children: <Widget>[
              // icon
              Container(
                width: 50,
                height: 50,
                padding: BaseUtility.all(BaseUtility.paddingSmallValue),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(BaseUtility.radiusCircularHighValue),
                  ),
                  shape: BoxShape.rectangle,
                  gradient: BaseUtility.bonusFeatureColor,
                ),
                child: AppIcons.pro2Icon.toPngImg(
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                ),
              ),
              // label
              Padding(
                padding: BaseUtility.top(BaseUtility.paddingMediumValue),
                child: const LabelMediumWhiteText(
                  text: 'Daha\nFazla Eşleşme',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Padding(
          padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
          child: Column(
            children: <Widget>[
              // icon
              Container(
                width: 50,
                height: 50,
                padding: BaseUtility.all(BaseUtility.paddingSmallValue),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(BaseUtility.radiusCircularHighValue),
                  ),
                  shape: BoxShape.rectangle,
                  gradient: BaseUtility.bonusFeatureColor,
                ),
                child: AppIcons.pro3Icon.toPngImg(
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                ),
              ),
              // label
              Padding(
                padding: BaseUtility.top(BaseUtility.paddingMediumValue),
                child: const LabelMediumWhiteText(
                  text: 'Öne\nÇıkarma\n',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Padding(
          padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
          child: Column(
            children: <Widget>[
              // icon
              Container(
                width: 50,
                height: 50,
                padding: BaseUtility.all(BaseUtility.paddingSmallValue),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(BaseUtility.radiusCircularHighValue),
                  ),
                  shape: BoxShape.rectangle,
                  gradient: BaseUtility.bonusFeatureColor,
                ),
                child: AppIcons.pro4Icon.toPngImg(
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                ),
              ),
              // label
              Padding(
                padding: BaseUtility.top(BaseUtility.paddingMediumValue),
                child: const LabelMediumWhiteText(
                  text: 'Daha\nFazla Beğeni',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
