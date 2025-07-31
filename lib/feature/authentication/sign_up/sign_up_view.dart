import 'package:flutter/material.dart';
import 'package:shartflix/feature/authentication/sign_up/sign_up_viewmodel.dart';

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
    return Scaffold(appBar: AppBar(title: const Text("Sign Up")));
  }
}
