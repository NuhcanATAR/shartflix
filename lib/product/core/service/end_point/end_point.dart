import 'package:shartflix/product/core/service/api/api.dart';

class EndPoint {
  const EndPoint._();

  // sign in end point
  static const String signInEndPoint =
      "${ApiService.https}://${ApiService.server}/user/login";

  // sign up end point
  static const String signUpEndPoint =
      "${ApiService.https}://${ApiService.server}/user/register";

  // movie list end point
  static String movieListPoint(int value) =>
      "${ApiService.https}://${ApiService.server}/movie/list?page=$value";

  // favorite movie toggle end point
  static String favoriteMovieToggleEndPoint(String movieId) =>
      "${ApiService.https}://${ApiService.server}/movie/favorite/$movieId";

  // favorite movie
  static const String favoriteMovieEndPoint =
      "${ApiService.https}://${ApiService.server}/movie/favorites";

  // user profile
  static const String userProfileEndPoint =
      "${ApiService.https}://${ApiService.server}/user/profile";

  // photo upload
  static const String userUploadPhotoEndPoint =
      "${ApiService.https}://${ApiService.server}/user/upload_photo";

  // endpoint uri parse function
  static Uri uriParse(String endPoint) {
    return Uri.parse(endPoint);
  }
}
