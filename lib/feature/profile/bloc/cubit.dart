// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/profile/bloc/event.dart';
import 'package:shartflix/feature/profile/bloc/state.dart';
import 'package:shartflix/product/core/helper/logger_package.dart';
import 'package:shartflix/product/core/repository/profile_repository/profile_repository.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';

import '../../../product/model/user_model/user_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final loggerPrint = CustomLoggerPrint();

  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
  }

  // user information and favorite movies get
  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final List<Movie> movieList =
          await ProfileRepository().getFavoriteMovie();
      final ProfileModel userModel = await ProfileRepository().getUser();
      emit(ProfileLoaded(movieList, userModel));
    } catch (e, stackTrace) {
      loggerPrint.printErrorLog(e.toString());
      await FirebaseCrashlytics.instance.recordError(e, stackTrace);
      emit(ProfileError('Hata Oluştu'));
    }
  }
}
