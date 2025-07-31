import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/authentication/sign_up/provider/sign_up_provider.dart';
import 'package:shartflix/feature/authentication/sign_up/sign_up_viewmodel.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/text_widget/title_medium_text.dart';
import 'package:shartflix/product/widget/widget/button_widget.dart';
import 'package:shartflix/product/widget/widget/email_field.dart';
import 'package:shartflix/product/widget/widget/normal_text_field.dart';
import 'package:shartflix/product/widget/widget/password_field.dart';
import 'package:shartflix/product/widget/widget/social_media_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static String routeName = 'sign_up';
  static String routePath = '/sign_up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends SignUpViewModel {
  @override
  Widget build(BuildContext context) {
    final signUpProvider = context.read<SignUpProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            CustomColorTheme().themeDataSecond.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: BaseUtility.all(BaseUtility.paddingNormalValue),
        child: Form(
          key: signUpProvider.formSignUpKey,
          child: Center(
            child: ListView(
              children: <Widget>[
                // title and sub title
                buildTitleAndSubTitleWidget,
                // email and password
                buildEmailPasswordFieldWidget(signUpProvider),
                // forgot password
                buildForgotPasswordWidget,
                // sign up button
                buildSignUpButtonWidget(signUpProvider),
                // other sign up
                buildOtherSignUpWidget,
                // sign up
                buildSignUpWidget,
              ],
            ),
          ),
        ),
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
          child: const TitleMediumWhiteBoldText(
            text: 'Hoşgeldiniz',
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: BaseUtility.top(BaseUtility.paddingMediumValue),
          child: const BodyMediumWhiteText(
            text:
                'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  // email and password
  Column buildEmailPasswordFieldWidget(SignUpProvider signUpProvider) => Column(
    children: <Widget>[
      // name surname
      Padding(
        padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        child: NormalTextFieldWidget(
          controller: signUpProvider.nameSurnameController,
          placeHolderText: 'E-posta',
          onChanged: (String val) {},
          isValidator: true,
          enabled: false,
          dynamicViewExtensions: dynamicViewExtensions,
          fieldIcon: AppIcons.addUserOutline,
        ),
      ),
      // email
      Padding(
        padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        child: CustomEmailFieldWidget(
          emailController: signUpProvider.emailController,
          placeHolderText: 'E-posta',
          onChanged: (String val) {},
        ),
      ),
      // password
      Padding(
        padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        child: CustomPasswordFieldWidget(
          passwordController: signUpProvider.passwordController,
          hintText: 'Şifre',
          onChanged: (String val) {},
          isValidator: true,
        ),
      ),
      // repead password
      Padding(
        padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
        child: CustomPasswordFieldWidget(
          passwordController: signUpProvider.repeadPasswordController,
          hintText: 'Şifre Tekrar',
          onChanged: (String val) {},
          isValidator: true,
          isHideEye: true,
        ),
      ),
    ],
  );

  // forgot password
  Padding get buildForgotPasswordWidget => Padding(
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Kullanıcı sözleşmesini ',
            style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          TextSpan(
            text: 'okudum ve kabul ediyorum',
            style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
                .copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
          ),
          TextSpan(
            text: '. Bu sözleşmeyi okuyarak devam ediniz lütfen.',
            style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    ),
  );

  // sign up button
  Padding buildSignUpButtonWidget(SignUpProvider signUpProvider) => Padding(
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: CustomButtonWidget(
      dynamicViewExtensions: dynamicViewExtensions,
      onTap: () => signUpProvider.signUp(context),
      btnText: 'Şimdi Kaydol',
    ),
  );

  // other sign up
  Padding get buildOtherSignUpWidget => Padding(
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
  Padding get buildSignUpWidget => Padding(
    padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
    child: Row(
      children: <Widget>[
        const Spacer(),
        const Flexible(
          fit: FlexFit.tight,
          flex: 4,
          child: BodyMediumBlackText(
            text: 'Zaten bir hesabın var mı?',
            textAlign: TextAlign.right,
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: GestureDetector(
            onTap:
                () => CodeNoahNavigatorRouter.pushNamed(
                  context,
                  SignInView.routePath,
                ),
            child: Padding(
              padding: BaseUtility.left(BaseUtility.paddingSmallValue),
              child: const BodyMediumWhiteBoldText(
                text: 'Giriş Yap!',
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
