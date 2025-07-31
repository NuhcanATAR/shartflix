import 'package:flutter/material.dart';

import '../../theme/light_theme.dart';

class TitleMediumWhiteBoldText extends StatelessWidget {
  const TitleMediumWhiteBoldText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: CustomColorTheme().themeData.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: 'Euclid Circular A SemiBold',
        color: Colors.white,
      ),
    );
  }
}

class TitleMediumWhiteText extends StatelessWidget {
  const TitleMediumWhiteText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: CustomColorTheme().themeData.textTheme.titleMedium!.copyWith(
        fontFamily: 'Euclid Circular A Regular',
        color: Colors.white,
      ),
    );
  }
}
