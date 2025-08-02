// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {}

  String fixPosterUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    return url.replaceFirst(RegExp(r'^http:'), 'https:');
  }
}
