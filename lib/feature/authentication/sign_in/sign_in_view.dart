import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/bloc.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/event.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/state.dart';
import 'package:shartflix/feature/authentication/sign_in/provider/sign_in_provider.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_viewmodel.dart';
import 'package:shartflix/feature/authentication/sign_up/sign_up_view.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/text_widget/title_medium_text.dart';
import 'package:shartflix/product/widget/widget/button_widget.dart';
import 'package:shartflix/product/widget/widget/email_field.dart';
import 'package:shartflix/product/widget/widget/password_field.dart';
import 'package:shartflix/product/widget/widget/social_media_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static String routeName = 'sign_in';
  static String routePath = '/sign_in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends SignInViewModel {
  @override
  Widget build(BuildContext context) {
    final signInProvider = context.read<SignInProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            CustomColorTheme().themeDataSecond.scaffoldBackgroundColor,
      ),
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return BlocConsumer<SignInBloc, SignInState>(
            listener: signInBlocListener,
            builder: (context, blocConsumerState) {
              return Padding(
                padding: BaseUtility.all(BaseUtility.paddingNormalValue),
                child: Form(
                  key: signInProvider.formSignInKey,
                  child: Column(
                    children: <Widget>[
                      const Spacer(flex: 2),
                      Expanded(
                        flex: 10,
                        child: ListView(
                          children: <Widget>[
                            // title and sub title
                            buildTitleAndSubTitleWidget,
                            // email and password
                            buildEmailPasswordFieldWidget(
                              signInProvider,
                              state,
                            ),
                            // forgot password
                            buildForgotPasswordWidget,
                            // sign in button
                            buildSignInButtonWidget(signInProvider, state),
                            // other sign in
                            buildOtherSignInWidget,
                            // sign up
                            buildSignUpWidget,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // title and sub title
  Padding get buildTitleAndSubTitleWidget => Padding(
    padding: BaseUtility.bottom(BaseUtility.paddingHightValue),
    child: Column(
      children: <Widget>[
        // title
        Padding(
          padding: BaseUtility.top(BaseUtility.paddingMediumValue),
          child: TitleMediumWhiteBoldText(
            text: AppLocalizations.of(context)!.sign_in_title,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: BaseUtility.top(BaseUtility.paddingMediumValue),
          child: BodyMediumWhiteText(
            text: AppLocalizations.of(context)!.sign_in_sub_title,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  // email and password
  Column buildEmailPasswordFieldWidget(
    SignInProvider signInProvider,
    SignInState state,
  ) => Column(
    children: <Widget>[
      // email
      Padding(
        padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        child: CustomEmailFieldWidget(
          emailController: signInProvider.emailController,
          placeHolderText: AppLocalizations.of(context)!.sign_in_email_field,
          onChanged: (String val) {
            context.read<SignInBloc>().add(SignInEmailEvent(val));
          },
        ),
      ),
      // password
      Padding(
        padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        child: CustomPasswordFieldWidget(
          passwordController: signInProvider.passwordController,
          hintText: AppLocalizations.of(context)!.sign_in_password_field,
          onChanged: (String val) {
            context.read<SignInBloc>().add(SignInPasswordEvent(val));
          },
          isValidator: true,
        ),
      ),
    ],
  );

  // forgot password
  Padding get buildForgotPasswordWidget => Padding(
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: Text(
      AppLocalizations.of(context)!.sign_in_forgot_password,
      textAlign: TextAlign.left,
      style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
        decoration: TextDecoration.underline,
      ),
    ),
  );

  // sign in button
  Padding buildSignInButtonWidget(
    SignInProvider signInProvider,
    SignInState state,
  ) => Padding(
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: CustomButtonWidget(
      dynamicViewExtensions: dynamicViewExtensions,
      onTap: () => signInProvider.signIn(context, state),
      btnText: AppLocalizations.of(context)!.sign_in_button,
    ),
  );

  // other sign in
  Padding get buildOtherSignInWidget => Padding(
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: Row(
      children: <Widget>[
        const Spacer(flex: 2),
        // google
        SocialMediaButton(
          dynamicViewExtensions: dynamicViewExtensions,
          onTap: () {},
          socialIcon: AppIcons.google,
        ),
        // apple
        SocialMediaButton(
          dynamicViewExtensions: dynamicViewExtensions,
          onTap: () {},
          socialIcon: AppIcons.apple,
        ),
        // facebook
        SocialMediaButton(
          dynamicViewExtensions: dynamicViewExtensions,
          onTap: () {},
          socialIcon: AppIcons.facebook,
        ),
        const Spacer(flex: 2),
      ],
    ),
  );

  // sign up
  Container get buildSignUpWidget => Container(
    alignment: Alignment.center,
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${AppLocalizations.of(context)!.sign_in_register_title}  ',
            style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.sign_in_register,
            style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            recognizer:
                TapGestureRecognizer()
                  ..onTap =
                      () => CodeNoahNavigatorRouter.pushNamed(
                        context,
                        SignUpView.routePath,
                      ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    ),
  );
}
