import 'package:shartflix/product/core/service/api/api.dart';

class EndPoint {
  const EndPoint._();

  // sign in end point
  static const String signInEndPoint =
      "${ApiService.https}://${ApiService.server}/user/login";

  // sign up endpoint
  static const String signUpEndPoint =
      "${ApiService.https}://${ApiService.server}/user/register";

  // endpoint uri parse function
  static Uri uriParse(String endPoint) {
    return Uri.parse(endPoint);
  }
}
