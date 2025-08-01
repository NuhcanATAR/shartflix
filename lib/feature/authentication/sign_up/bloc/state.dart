import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String nameSurname;
  final String email;
  final String password;

  const SignUpState({
    this.nameSurname = '',
    this.email = '',
    this.password = '',
  });

  SignUpState copyWith({String? nameSurname, String? email, String? password}) {
    return SignUpState(
      nameSurname: nameSurname ?? this.nameSurname,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [nameSurname, email, password];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {}
