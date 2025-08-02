// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/home/home_view.dart';
import 'package:shartflix/feature/profile/profile_view.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class NavigationBarProvider extends ChangeNotifier {
  List<Widget> viewList = <Widget>[const HomeView(), const ProfileView()];

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  late int selectView = 0;

  NavigationBarProvider() {}

  void menuSelectPrimary() {
    selectView = 0;
    notifyListeners();
  }

  void menuSelectSecondary() {
    selectView = 1;
    notifyListeners();
  }

  Future<bool> exitWarningDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                backgroundColor: Colors.black,
                title: const BodyMediumWhiteBoldText(
                  text: 'Çıkış Yapma',
                  textAlign: TextAlign.center,
                ),
                content: const BodyMediumWhiteText(
                  text: 'Çıkış yapmak için seçiminizi yapınız!',
                  textAlign: TextAlign.center,
                ),
                actionsPadding: BaseUtility.all(BaseUtility.paddingNormalValue),
                actions: [
                  Row(
                    children: <Widget>[
                      // exit account
                      Flexible(
                        fit: FlexFit.tight,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green,
                            side: const BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            exitAccount(context);
                          },
                          child: const Text(
                            'Hesaptan Çıkış Yap',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // exit app
                      Flexible(
                        fit: FlexFit.tight,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text(
                            'Uygulamayı Kapat',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        ) ??
        false;
  }

  // exit account
  Future<void> exitAccount(BuildContext context) async {
    await storage.delete(key: 'auth_token');
    selectView = 0;
    if (!context.mounted) return;
    CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
      context,
      SignInView.routePath,
    );
  }
}
