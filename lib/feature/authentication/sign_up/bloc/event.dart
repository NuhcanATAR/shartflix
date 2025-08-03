import 'package:equatable/equatable.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpNameSurnameEvent extends SignUpEvent {
  final String nameSurname;

  const SignUpNameSurnameEvent(this.nameSurname);

  @override
  List<Object> get props => [nameSurname];
}

class SignUpEmailEvent extends SignUpEvent {
  final String email;

  const SignUpEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}

class SignUpPasswordEvent extends SignUpEvent {
  final String password;

  const SignUpPasswordEvent(this.password);

  @override
  List<Object> get props => [password];
}

class SignUpFuncEvent extends SignUpEvent {
  final String nameSurname;
  final String email;
  final String password;

  const SignUpFuncEvent(this.nameSurname, this.email, this.password);

  @override
  List<Object> get props => [nameSurname, email, password];
}
