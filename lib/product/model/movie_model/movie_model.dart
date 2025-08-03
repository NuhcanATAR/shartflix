import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class ApiResponse {
  final ResponseInfo response;
  final MovieData data;

  ApiResponse({required this.response, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

@JsonSerializable()
class ResponseInfo {
  final int code;
  final String message;

  ResponseInfo({required this.code, required this.message});

  factory ResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$ResponseInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseInfoToJson(this);
}

@JsonSerializable()
class MovieData {
  final List<Movie> movies;

  MovieData({required this.movies});

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}

@JsonSerializable()
class Movie {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Plot')
  final String? plot;
  @JsonKey(name: 'Poster')
  final String? poster;
  @JsonKey(name: 'Year')
  final String? year;
  @JsonKey(name: 'Rated')
  final String? rated;
  @JsonKey(name: 'Released')
  final String? released;
  @JsonKey(name: 'Runtime')
  final String? runtime;
  @JsonKey(name: 'Genre')
  final String? genre;
  @JsonKey(name: 'Director')
  final String? director;
  @JsonKey(name: 'Writer')
  final String? writer;
  @JsonKey(name: 'Actors')
  final String? actors;
  @JsonKey(name: 'Language')
  final String? language;
  @JsonKey(name: 'Country')
  final String? country;
  @JsonKey(name: 'Awards')
  final String? awards;
  @JsonKey(name: 'Metascore')
  final String? metascore;
  @JsonKey(name: 'imdbRating')
  final String? imdbRating;
  @JsonKey(name: 'imdbVotes')
  final String? imdbVotes;
  @JsonKey(name: 'imdbID')
  final String? imdbID;
  @JsonKey(name: 'Type')
  final String? type;
  @JsonKey(name: 'Response')
  final String? response;
  @JsonKey(name: 'Images')
  final List<String> images;

  Movie({
    required this.id,
    required this.title,
    required this.plot,
    required this.poster,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.language,
    required this.country,
    required this.awards,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.type,
    required this.response,
    required this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
