import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/lang/app_localizations.dart';
import 'package:shartflix/product/theme/light_theme.dart';

class ExpandedLabelText extends StatefulWidget {
  final String text;
  final int wordLimit;

  const ExpandedLabelText({super.key, required this.text, this.wordLimit = 9});

  @override
  State<ExpandedLabelText> createState() => _ExpandedLabelTextState();
}

class _ExpandedLabelTextState extends State<ExpandedLabelText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.text.split(' ');
    final bool needTrim = words.length > widget.wordLimit;

    String displayText;
    if (!isExpanded && needTrim) {
      displayText = '${words.take(widget.wordLimit).join(' ')}... ';
    } else {
      displayText = '${widget.text} ';
    }

    return RichText(
      text: TextSpan(
        text: displayText,
        style: TextStyle(color: Colors.grey.withValues(alpha: 0.9)),
        children:
            needTrim
                ? [
                  TextSpan(
                    text:
                        isExpanded
                            ? AppLocalizations.of(context)!.expanded_label_less
                            : AppLocalizations.of(context)!.expanded_label_more,
                    style: CustomColorTheme().themeData.textTheme.labelMedium!
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Euclid Circular A Bold',
                          color: Colors.white,
                        ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                  ),
                ]
                : [],
      ),
    );
  }
}
