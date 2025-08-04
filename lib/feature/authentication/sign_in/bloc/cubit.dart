// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shartflix/feature/authentication/sign_in/bloc/event.dart';
import 'package:shartflix/feature/authentication/sign_in/bloc/state.dart';
import 'package:shartflix/product/core/helper/logger_package.dart';
import 'package:shartflix/product/core/helper/secure_storage.dart';
import 'package:shartflix/product/core/repository/profile_repository/profile_repository.dart';
import 'package:shartflix/product/core/service/api/api.dart';
import 'package:shartflix/product/core/service/end_point/end_point.dart';
import 'package:shartflix/product/model/sign_model/sign_model.dart';
import 'package:shartflix/product/model/user_model/user_model.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  CustomLoggerPrint loggerPrint = CustomLoggerPrint();

  SignInBloc() : super(SignInInitial()) {
    on<SignInEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<SignInPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SignInFuncEvent>(signIn);
  }

  // sign in
  Future<void> signIn(SignInFuncEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      final response = await http.post(
        EndPoint.uriParse(EndPoint.signInEndPoint),
        headers: ApiService.headers(),
        body: jsonEncode({'email': event.email, 'password': event.password}),
      );

      loggerPrint.printInfoLog('Status Code: ${response.statusCode}');
      loggerPrint.printInfoLog('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        loggerPrint.printInfoLog('Sign In Success!');
        final jsonResponse = jsonDecode(response.body);
        final signInResponse = SignResponseModel.fromJson(jsonResponse);
        await SecureStorage().saveTokenSecurely(signInResponse.data.token);

        final ProfileModel userModel = await ProfileRepository().getUser();

        emit(SignInSuccess(userModel));
      } else if (response.statusCode == 400) {
        loggerPrint.printErrorLog('Invalid login information');
        emit(SignInError());
      } else {
        loggerPrint.printErrorLog('Server error: ${response.statusCode}');
        emit(SignInError());
      }
    } catch (e) {
      loggerPrint.printWarningLog('An error has occurred: $e');
      emit(SignInError());
    }
  }
}
