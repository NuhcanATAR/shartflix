import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/core/base/base_state.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/text_widget/title_medium_text.dart';
import 'package:shartflix/product/widget/widget/bonus_card.dart';
import 'package:shartflix/product/widget/widget/button_widget.dart';
import 'package:shartflix/product/widget/widget/package_list.dart';

class LimitedOfferWidget extends StatefulWidget {
  const LimitedOfferWidget({super.key});

  @override
  State<LimitedOfferWidget> createState() => _LimitedOfferWidgetState();
}

class _LimitedOfferWidgetState extends BaseState<LimitedOfferWidget> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: dynamicViewExtensions.maxWidth(context),
        height: MediaQuery.of(context).size.height * 0.8,

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(BaseUtility.radiusNormalValue),
          ),
          gradient: BaseUtility.limitedOfferCardColor,
        ),
        child: buildBodyWidget,
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Stack(
    children: [
      // decoration
      Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(BaseUtility.radiusNormalValue),
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black54,
                Colors.transparent,
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.0, 0.2, 0.8, 1.0],
            ),
          ),
        ),
      ),
      // body
      Padding(
        padding: BaseUtility.all(BaseUtility.paddingNormalValue),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // title and sub title
              buildTitleAndSubTitleWidget,
              // bonus cards
              buildBonusCardsWidget,
              // package list
              buildPackageListWidget,
              // all tokens button
              buildAllTokensButtonWidget,
            ],
          ),
        ),
      ),
    ],
  );

  // title and sub title
  Widget get buildTitleAndSubTitleWidget => FadeInDown(
    child: Padding(
      padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
      child: Column(
        children: <Widget>[
          // title
          Padding(
            padding: BaseUtility.bottom(BaseUtility.paddingSmallValue),
            child: TitleMediumWhiteBoldText(
              text: AppLocalizations.of(context)!.limited_offer_card_title,
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          BodyMediumWhiteText(
            text: AppLocalizations.of(context)!.limited_offer_card_sub_title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  // bonuc cards
  Widget get buildBonusCardsWidget =>
      FadeInDown(child: const BonusCardWidget());

  // package list
  Widget get buildPackageListWidget =>
      PackageListWidget(dynamicViewExtensions: dynamicViewExtensions);

  // all tokens button
  Widget get buildAllTokensButtonWidget => FadeInUp(
    duration: const Duration(seconds: 1),
    child: Container(
      margin: BaseUtility.top(BaseUtility.paddingSmallValue),
      child: CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        onTap: () {},
        btnText:
            AppLocalizations.of(context)!.limited_offer_card_all_tokens_btn,
      ),
    ),
  );
}
