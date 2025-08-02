import 'package:flutter/material.dart';
import 'package:shartflix/feature/profile/view/photo_update/photo_update_viewmodel.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/widget/button_widget.dart';

class PhotoUpdateView extends StatefulWidget {
  const PhotoUpdateView({super.key});

  static String routeName = 'photo_update';
  static String routePath = '/photo_update';

  @override
  State<PhotoUpdateView> createState() => _PhotoUpdateViewState();
}

class _PhotoUpdateViewState extends PhotoUpdateViewModel {
  @override
  Widget build(BuildContext context) {
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
        title: const BodyMediumWhiteBoldText(
          text: 'Profil Detayı',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: BaseUtility.symmetric(
          BaseUtility.paddingNormalValue,
          BaseUtility.paddingSmallValue,
        ),
        child: Column(
          children: <Widget>[
            // body
            buildBodyWidget,
            // footer
            buildFooterWidget,
          ],
        ),
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Expanded(
    child: ListView(
      children: <Widget>[
        // title and sub title
        Padding(
          padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
          child: Column(
            children: <Widget>[
              // title
              const BodyMediumWhiteBoldText(
                text: 'Fotoğraflarınzı Yükleyin',
                textAlign: TextAlign.center,
              ),
              // sub title
              Padding(
                padding: BaseUtility.top(BaseUtility.paddingSmallValue),
                child: const BodyMediumWhiteText(
                  text: 'Resources out incentivize\nrelaxation floor loss cc.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        // photo select
        Container(
          alignment: Alignment.center,
          margin: BaseUtility.top(BaseUtility.paddingNormalHightValue),
          child: SizedBox(
            width: dynamicViewExtensions.dynamicWidth(context, 0.4),
            height: dynamicViewExtensions.dynamicHeight(context, 0.18),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(BaseUtility.radiusHighValue),
                ),
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: AppIcons.plus.toSvgImg(
                Colors.white,
                BaseUtility.iconMediumSecondNormalSize,
                BaseUtility.iconMediumSecondNormalSize,
              ),
            ),
          ),
        ),
      ],
    ),
  );
  // footer
  Widget get buildFooterWidget => CustomButtonWidget(
    dynamicViewExtensions: dynamicViewExtensions,
    onTap: () {},
    btnText: 'Devam Et',
  );
}
