import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/mixin.dart';
import 'package:shartflix/feature/authentication/sign_up/provider/sign_up_provider.dart';
import 'package:shartflix/feature/authentication/sign_up/sign_up_view.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class SignUpViewModel extends BaseState<SignUpView> with SignUpMixin {
  late SignUpProvider _signUpProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _signUpProvider = context.read<SignUpProvider>();
  }

  @override
  void dispose() {
    _signUpProvider.nameSurnameController.clear();
    _signUpProvider.emailController.clear();
    _signUpProvider.passwordController.clear();
    _signUpProvider.repeadPasswordController.clear();
    super.dispose();
  }
}
