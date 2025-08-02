// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shartflix/feature/home/bloc/event.dart';
import 'package:shartflix/feature/home/bloc/state.dart';
import 'package:shartflix/product/core/helper/logger_package.dart';
import 'package:shartflix/product/core/repository/profile_repository/profile_repository.dart';
import 'package:shartflix/product/core/service/api/api.dart';
import 'package:shartflix/product/core/service/end_point/end_point.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CustomLoggerPrint loggerPrint = CustomLoggerPrint();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  int currentPage = 1;

  HomeBloc() : super(HomeInitial()) {
    on<HomeFetchMovies>(_onFetchMovies);
    on<HomeLoadMoreMovies>(_onLoadMoreMovies);
    on<HomeToggleFavorite>(_onToggleFavorite);
    on<HomeRefreshMovies>(_onRefreshMovies);
    on<HomeInitFavorites>(_onInitFavorites);
  }

  Future<void> _onFetchMovies(
    HomeFetchMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final movies = await ProfileRepository().fetchMovies(
      page: event.page,
      currentPage: currentPage,
    );
    final favoriteIds = await ProfileRepository().getFavoriteMovieIds();

    emit(
      HomeLoaded(
        movies: movies,
        favoriteMovieIds: favoriteIds,
        currentPage: event.page,
      ),
    );
  }

  Future<void> _onLoadMoreMovies(
    HomeLoadMoreMovies event,
    Emitter<HomeState> emit,
  ) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final newPage = currentState.currentPage + 1;
      final newMovies = await ProfileRepository().fetchMovies(
        page: newPage,
        currentPage: currentPage,
      );

      emit(
        HomeLoaded(
          movies: MovieData(
            movies: [...currentState.movies.movies, ...newMovies.movies],
          ),
          favoriteMovieIds: currentState.favoriteMovieIds,
          currentPage: newPage,
        ),
      );
    }
  }

  Future<void> _onToggleFavorite(
    HomeToggleFavorite event,
    Emitter<HomeState> emit,
  ) async {
    if (await _toggleFavorite(event.movieId)) {
      final favoriteIds = await ProfileRepository().getFavoriteMovieIds();
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        emit(currentState.copyWith(favoriteMovieIds: favoriteIds));
      }
    } else {
      loggerPrint.printErrorLog("Favorite Error");
    }
  }

  Future<void> _onRefreshMovies(
    HomeRefreshMovies event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final movies = await ProfileRepository().fetchMovies(
      page: 1,
      currentPage: currentPage,
    );
    final favoriteIds = await ProfileRepository().getFavoriteMovieIds();
    emit(
      HomeLoaded(movies: movies, favoriteMovieIds: favoriteIds, currentPage: 1),
    );
  }

  Future<void> _onInitFavorites(
    HomeInitFavorites event,
    Emitter<HomeState> emit,
  ) async {
    final favoriteIds = await ProfileRepository().getFavoriteMovieIds();
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(currentState.copyWith(favoriteMovieIds: favoriteIds));
    }
  }

  Future<bool> _toggleFavorite(String movieId) async {
    final token = await storage.read(key: 'auth_token');
    final response = await http.post(
      EndPoint.uriParse(EndPoint.favoriteMovieToggleEndPoint(movieId)),
      headers: ApiService.tokenHeaders(token ?? ''),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      loggerPrint.printErrorLog('Error code: ${response.statusCode}');
      loggerPrint.printErrorLog('Error message: ${response.body}');
      return false;
    }
  }
}
