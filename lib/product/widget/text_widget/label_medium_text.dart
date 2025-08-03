import 'package:flutter/material.dart';

import '../../theme/light_theme.dart';

class LabelMediumWhiteText extends StatelessWidget {
  const LabelMediumWhiteText({
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
      style: CustomColorTheme().themeDataSecond.textTheme.labelMedium!.copyWith(
        fontSize: 12,
        color: Colors.white,
      ),
    );
  }
}
