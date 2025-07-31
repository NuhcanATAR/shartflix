import 'package:flutter/material.dart';

import '../../theme/light_theme.dart';

class BodyMediumWhiteBoldText extends StatelessWidget {
  const BodyMediumWhiteBoldText({
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
      style: CustomColorTheme().themeData.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: 'Euclid Circular A Bold',
        color: Colors.white,
      ),
    );
  }
}

class BodyMediumBlackText extends StatelessWidget {
  const BodyMediumBlackText({
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
      style: CustomColorTheme().themeData.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BodyMediumWhiteText extends StatelessWidget {
  const BodyMediumWhiteText({
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
      style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
