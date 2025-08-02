import 'package:equatable/equatable.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';
import 'package:shartflix/product/model/user_model/user_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<Movie> movie;
  final UserModel userModel;

  ProfileLoaded(this.movie, this.userModel);

  @override
  List<Object> get props => [movie, userModel];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object> get props => [message];
}
