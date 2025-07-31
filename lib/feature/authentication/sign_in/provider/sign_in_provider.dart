import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/bloc.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/event.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/state.dart';

class SignInProvider extends ChangeNotifier {
  final formSignInKey = GlobalKey<FormState>();

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  SignInProvider() {}

  Future<void> signIn(BuildContext context, SignInState state) async {
    if (formSignInKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
        SignInFuncEvent(state.email, state.password),
      );
    }
  }
}
