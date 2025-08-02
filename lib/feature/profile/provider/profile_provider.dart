// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:shartflix/product/widget/widget/limited_offer.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() {}

  String fixPosterUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    return url.replaceFirst(RegExp(r'^http:'), 'https:');
  }

  void profileLimitedOffer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.white.withValues(alpha: 0.6),
      isScrollControlled: true,
      backgroundColor: Colors.red,
      builder: (context) {
        return const LimitedOfferWidget();
      },
    );
  }
}
