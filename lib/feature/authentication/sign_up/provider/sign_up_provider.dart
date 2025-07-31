import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final formSignUpKey = GlobalKey<FormState>();

  late TextEditingController nameSurnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController repeadPasswordController = TextEditingController();

  SignUpProvider() {}

  Future<void> signUp(BuildContext context) async {
    if (formSignUpKey.currentState!.validate()) {}
  }
}
