// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
  response: ResponseInfo.fromJson(json['response'] as Map<String, dynamic>),
  data: MovieData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{'response': instance.response, 'data': instance.data};

ResponseInfo _$ResponseInfoFromJson(Map<String, dynamic> json) => ResponseInfo(
  code: (json['code'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$ResponseInfoToJson(ResponseInfo instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
  movies:
      (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
  'movies': instance.movies,
};

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: json['_id'] as String,
  title: json['Title'] as String,
  plot: json['Plot'] as String,
  poster: json['Poster'] as String,
  year: json['Year'] as String,
  rated: json['Rated'] as String,
  released: json['Released'] as String,
  runtime: json['Runtime'] as String,
  genre: json['Genre'] as String,
  director: json['Director'] as String,
  writer: json['Writer'] as String,
  actors: json['Actors'] as String,
  language: json['Language'] as String,
  country: json['Country'] as String,
  awards: json['Awards'] as String,
  metascore: json['Metascore'] as String,
  imdbRating: json['imdbRating'] as String,
  imdbVotes: json['imdbVotes'] as String,
  imdbID: json['imdbID'] as String,
  type: json['Type'] as String,
  response: json['Response'] as String,
  images: (json['Images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  '_id': instance.id,
  'Title': instance.title,
  'Plot': instance.plot,
  'Poster': instance.poster,
  'Year': instance.year,
  'Rated': instance.rated,
  'Released': instance.released,
  'Runtime': instance.runtime,
  'Genre': instance.genre,
  'Director': instance.director,
  'Writer': instance.writer,
  'Actors': instance.actors,
  'Language': instance.language,
  'Country': instance.country,
  'Awards': instance.awards,
  'Metascore': instance.metascore,
  'imdbRating': instance.imdbRating,
  'imdbVotes': instance.imdbVotes,
  'imdbID': instance.imdbID,
  'Type': instance.type,
  'Response': instance.response,
  'Images': instance.images,
};
