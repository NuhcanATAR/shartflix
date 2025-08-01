// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/cubit.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/event.dart';
import 'package:shartflix/product/core/helper/show_dialogs.dart';

class SignUpProvider extends ChangeNotifier {
  final formSignUpKey = GlobalKey<FormState>();

  late TextEditingController nameSurnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController repeadPasswordController = TextEditingController();

  SignUpProvider() {}

  Future<void> signUp(BuildContext context) async {
    if (formSignUpKey.currentState!.validate()) {
      if (passwordController.text == repeadPasswordController.text) {
        context.read<SignUpBloc>().add(
          SignUpFuncEvent(
            nameSurnameController.text,
            emailController.text,
            passwordController.text,
          ),
        );
      } else {
        await CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'Şifreler Uyuşmuyor lütfen şifrelerinizi kontrol ediniz.',
        );
      }
    }
  }
}
