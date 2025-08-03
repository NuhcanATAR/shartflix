// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/material.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/state.dart';
import 'package:shartflix/lang/app_localizations.dart';
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
          message: AppLocalizations.of(context)!.sign_up_success,
        );
        break;
      case SignUpError:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: AppLocalizations.of(context)!.sign_up_error,
        );
        break;
      case SignUpLoading:
        CodeNoahDialogs(context).showAlert(
          BodyMediumWhiteBoldText(
            text: AppLocalizations.of(context)!.sign_up_loading,
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
