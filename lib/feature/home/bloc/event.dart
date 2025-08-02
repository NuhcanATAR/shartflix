import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeFetchMovies extends HomeEvent {
  final int page;

  const HomeFetchMovies({required this.page});

  @override
  List<Object?> get props => [page];
}

class HomeLoadMoreMovies extends HomeEvent {
  const HomeLoadMoreMovies();
}

class HomeToggleFavorite extends HomeEvent {
  final String movieId;

  const HomeToggleFavorite(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class HomeRefreshMovies extends HomeEvent {
  const HomeRefreshMovies();
}

class HomeInitFavorites extends HomeEvent {
  const HomeInitFavorites();
}
