import 'package:equatable/equatable.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final MovieData movies;
  final List<String> favoriteMovieIds;
  final int currentPage;

  const HomeLoaded({
    required this.movies,
    required this.favoriteMovieIds,
    required this.currentPage,
  });

  HomeLoaded copyWith({
    MovieData? movies,
    List<String>? favoriteMovieIds,
    int? currentPage,
  }) {
    return HomeLoaded(
      movies: movies ?? this.movies,
      favoriteMovieIds: favoriteMovieIds ?? this.favoriteMovieIds,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [movies, favoriteMovieIds, currentPage];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
