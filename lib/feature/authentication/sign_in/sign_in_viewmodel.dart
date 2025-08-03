import 'package:shartflix/feature/authentication/sign_in/bloc/mixin.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class SignInViewModel extends BaseState<SignInView> with SignInMixin {}
