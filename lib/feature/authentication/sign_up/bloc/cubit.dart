// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shartflix/feature/authentication/sign_up/bloc/event.dart';
import 'package:shartflix/feature/authentication/sign_up/bloc/state.dart';
import 'package:shartflix/product/core/helper/logger_package.dart';
import 'package:shartflix/product/core/service/api/api.dart';
import 'package:shartflix/product/core/service/end_point/end_point.dart';
import 'package:shartflix/product/model/sign_model/sign_model.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  CustomLoggerPrint loggerPrint = CustomLoggerPrint();

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpNameSurnameEvent>((event, emit) {
      emit(state.copyWith(nameSurname: event.nameSurname));
    });

    on<SignUpEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<SignUpPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SignUpFuncEvent>(signUp);
  }

  // sign up
  Future<void> signUp(SignUpFuncEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
      final response = await http.post(
        EndPoint.uriParse(EndPoint.signUpEndPoint),
        headers: ApiService.headers(),
        body: jsonEncode({
          'name': event.nameSurname,
          'email': event.email,
          'password': event.password,
        }),
      );

      loggerPrint.printInfoLog('Status Code: ${response.statusCode}');
      loggerPrint.printInfoLog('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        emit(SignUpSuccess());
      } else if (response.statusCode == 400) {
        final jsonResponse = jsonDecode(response.body);
        final model = SignResponseModel.fromJson(jsonResponse);
        final errorMessage = model.response;

        loggerPrint.printErrorLog('Error: $errorMessage');
        emit(SignUpError());
      } else {
        loggerPrint.printErrorLog('Server error: ${response.statusCode}');
        emit(SignUpError());
      }
    } catch (e) {
      loggerPrint.printWarningLog('Error: $e');
      emit(SignUpError());
    }
  }
}
