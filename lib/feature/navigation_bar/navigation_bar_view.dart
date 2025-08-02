// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_viewmodel.dart';
import 'package:shartflix/feature/navigation_bar/provider/navigation_bar_provider.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  static String routeName = 'navigation_bar';
  static String routePath = '/navigation_bar';

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends NavigationBarViewModel {
  @override
  Widget build(BuildContext context) {
    final navigationBarProvider = context.watch<NavigationBarProvider>();
    return WillPopScope(
      onWillPop: () => navigationBarProvider.exitWarningDialog(context),
      child: Scaffold(
        body: navigationBarProvider.viewList[navigationBarProvider.selectView],
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(flex: 2),
              GestureDetector(
                onTap: () => navigationBarProvider.menuSelectPrimary(),
                child: Container(
                  margin: BaseUtility.right(BaseUtility.marginNormalValue),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(BaseUtility.radiusCircularNormalValue),
                    ),
                  ),
                  padding: BaseUtility.symmetric(
                    BaseUtility.paddingMediumValue,
                    BaseUtility.paddingNormalHightValue,
                  ),
                  child: Row(
                    children: [
                      AppIcons.homeOutline.toSvgImg(Colors.white, 24, 24),
                      Padding(
                        padding: BaseUtility.left(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: const BodyMediumWhiteText(
                          text: 'Anasayfa',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigationBarProvider.menuSelectSecondary(),
                child: Container(
                  margin: BaseUtility.left(BaseUtility.marginNormalValue),

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(BaseUtility.radiusCircularNormalValue),
                    ),
                  ),
                  padding: BaseUtility.symmetric(
                    BaseUtility.paddingMediumValue,
                    BaseUtility.paddingHightValue,
                  ),
                  child: Row(
                    children: [
                      AppIcons.profile.toSvgImg(Colors.white, 24, 24),
                      Padding(
                        padding: BaseUtility.left(
                          BaseUtility.paddingSmallValue,
                        ),
                        child: const BodyMediumWhiteText(
                          text: 'Profil',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
