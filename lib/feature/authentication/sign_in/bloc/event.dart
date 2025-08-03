import 'package:equatable/equatable.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailEvent extends SignInEvent {
  final String email;

  const SignInEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}

class SignInPasswordEvent extends SignInEvent {
  final String password;

  const SignInPasswordEvent(this.password);

  @override
  List<Object> get props => [password];
}

class SignInFuncEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInFuncEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
