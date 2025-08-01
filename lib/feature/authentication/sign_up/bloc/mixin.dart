// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/state.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/core/helper/show_dialogs.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

mixin SignUpMixin {
  void signUpBlocListener(BuildContext context, SignUpState state) {
    switch (state.runtimeType) {
      case SignUpSuccess:
        Navigator.pop(context);

        CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
          context,
          SignInView.routePath,
        );
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: 'Hesabınız başarıyla oluşturulmuştur!',
        );
        break;
      case SignUpError:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'Hata oluştu, bilgilerinizi kontrol ediniz!',
        );
        break;
      case SignUpLoading:
        CodeNoahDialogs(context).showAlert(
          const BodyMediumWhiteBoldText(
            text: 'Lütfen Bekleyiniz...',
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
