// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shartflix/product/core/service/api/api.dart';
import 'package:shartflix/product/core/service/end_point/end_point.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';

class HomeProvider extends ChangeNotifier {
  MovieData? movieData;
  bool isLoading = true;
  bool isLoadingMore = false;
  int currentPage = 1;

  final PageController pageController = PageController();

  HomeProvider() {
    fetchMovies(page: currentPage);
    pageController.addListener(_pageListener);
  }

  void _pageListener() {
    if (pageController.page == null || movieData == null) return;

    final page = pageController.page!.round();

    if (page >= (movieData!.movies.length - 1) && !isLoadingMore) {
      loadMoreMovies();
    }
  }

  Future<void> fetchMovies({int page = 1, bool isRefresh = false}) async {
    if (isRefresh) {
      isLoading = true;
    } else if (page == 1) {
      isLoading = true;
    } else {
      isLoadingMore = true;
    }

    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'auth_token');

    try {
      final response = await http.get(
        EndPoint.uriParse(EndPoint.movieListPoint(page)),
        headers: ApiService.tokenHeaders(token ?? ''),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final ApiResponse decodedResponse = ApiResponse.fromJson(data);

        if (isRefresh || page == 1) {
          movieData = decodedResponse.data;
        } else {
          movieData = MovieData(
            movies: [...movieData!.movies, ...decodedResponse.data.movies],
          );
        }
        currentPage = page;
        isLoading = false;
        isLoadingMore = false;
      } else {
        debugPrint('Hata: ${response.statusCode} - ${response.body}');

        isLoading = false;
        isLoadingMore = false;
      }
    } catch (e) {
      debugPrint('Hata: $e');

      isLoading = false;
      isLoadingMore = false;
    }
    notifyListeners();
  }

  void loadMoreMovies() {
    fetchMovies(page: currentPage + 1);
  }

  Future<void> onRefresh() async {
    await fetchMovies(page: 1, isRefresh: true);
  }

  String fixPosterUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    return url;
  }
}
