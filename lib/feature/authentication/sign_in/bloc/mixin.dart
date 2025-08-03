// ignore_for_file: type_literal_in_constant_pattern

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/state.dart';
import 'package:shartflix/feature/authentication/sign_in/provider/sign_in_provider.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_view.dart';
import 'package:shartflix/feature/profile/view/photo_update/photo_update_view.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/core/helper/show_dialogs.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

mixin SignInMixin {
  void signInBlocListener(BuildContext context, SignInState state) {
    switch (state.runtimeType) {
      case SignInSuccess:
        Navigator.pop(context);

        if ((state as SignInSuccess).userModel.photoUrl.isEmpty) {
          CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
            context,

            PhotoUpdateView.routePath,
          );
          context.read<SignInProvider>().photoUpdateControl();
        } else {
          CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
            context,

            NavigationBarView.routePath,
          );
        }

        context.read<SignInProvider>().emailController.clear();
        context.read<SignInProvider>().passwordController.clear();

        break;
      case SignInError:
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: AppLocalizations.of(context)!.sign_in_error,
        );
        break;
      case SignInLoading:
        CodeNoahDialogs(context).showAlert(
          BodyMediumWhiteBoldText(
            text: AppLocalizations.of(context)!.sign_in_loading,
            textAlign: TextAlign.center,
          ),
        );
    }
  }
}
