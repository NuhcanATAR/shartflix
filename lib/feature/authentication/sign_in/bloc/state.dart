import 'package:equatable/equatable.dart';
import 'package:shartflix/product/model/user_model/user_model.dart';

class SignInState extends Equatable {
  final String email;
  final String password;

  const SignInState({this.email = '', this.password = ''});

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final ProfileModel userModel;

  const SignInSuccess(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class SignInError extends SignInState {}
