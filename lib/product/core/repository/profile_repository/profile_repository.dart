// ignore_for_file: depend_on_referenced_packages, avoid_dynamic_calls

import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shartflix/product/core/helper/logger_package.dart';
import 'package:shartflix/product/core/service/api/api.dart';
import 'package:shartflix/product/core/service/end_point/end_point.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';

import '../../../model/user_model/user_model.dart';

class ProfileRepository {
  final CustomLoggerPrint loggerPrint = CustomLoggerPrint();

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // fetch movies
  Future<MovieData> fetchMovies({
    required int page,
    required int currentPage,
  }) async {
    final token = await storage.read(key: 'auth_token');
    final response = await http.get(
      EndPoint.uriParse(EndPoint.movieListPoint(page)),
      headers: ApiService.tokenHeaders(token ?? ''),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final decodedResponse = ApiResponse.fromJson(data);
      currentPage = page;
      return decodedResponse.data;
    } else {
      loggerPrint.printErrorLog('Movie fetch error: ${response.body}');
      return MovieData(movies: []);
    }
  }

  // favorite movies ıds
  Future<List<String>> getFavoriteMovieIds() async {
    final token = await storage.read(key: 'auth_token');
    final response = await http.get(
      EndPoint.uriParse(EndPoint.favoriteMovieEndPoint),
      headers: ApiService.tokenHeaders(token ?? ''),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final movies = data['data'] as List<dynamic>;
      return movies.map((movie) => movie['id'].toString()).toList();
    } else {
      loggerPrint.printErrorLog('Favorite fetch error: ${response.body}');
      return [];
    }
  }

  // user information
  Future<ProfileModel> getUser() async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'auth_token');

      final response = await http.get(
        EndPoint.uriParse(EndPoint.userProfileEndPoint),
        headers: ApiService.tokenHeaders(token ?? ''),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final data = json['data'];

        if (data != null) {
          return ProfileModel.fromJson(data);
        }
      }

      return ProfileModel(id: '', name: '', email: '', photoUrl: '');
    } catch (e, stackTrace) {
      loggerPrint.printErrorLog(e.toString());
      await FirebaseCrashlytics.instance.recordError(e, stackTrace);
      return ProfileModel(id: '', name: '', email: '', photoUrl: '');
    }
  }

  // favorite movies
  Future<List<Movie>> getFavoriteMovie() async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'auth_token');

      final response = await http.get(
        EndPoint.uriParse(EndPoint.favoriteMovieEndPoint),
        headers: ApiService.tokenHeaders(token ?? ''),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final List<dynamic>? data = json['data'] as List<dynamic>?;

        if (data != null) {
          return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
        } else {
          return [];
        }
      }
    } catch (e) {
      loggerPrint.printErrorLog(e.toString());
      return [];
    }

    return [];
  }
}
