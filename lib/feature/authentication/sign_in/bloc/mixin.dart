// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/widgets.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/state.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_view.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/core/helper/show_dialogs.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

mixin SignInMixin {
  void signInBlocListener(BuildContext context, SignInState state) {
    switch (state.runtimeType) {
      case SignInSuccess:
        Navigator.pop(context);

        CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
          context,
          NavigationBarView.routePath,
        );
        break;
      case SignInError:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'Hata oluştu, bilgilerinizi kontrol ediniz!',
        );
        break;
      case SignInLoading:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteBoldText(
            text: 'Lütfen Bekleyiniz...',
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
