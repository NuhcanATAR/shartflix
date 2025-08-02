import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {}

  String fixPosterUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    return url;
  }
}
