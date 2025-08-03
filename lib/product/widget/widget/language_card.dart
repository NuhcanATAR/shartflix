import 'package:flutter/material.dart';
import 'package:shartflix/product/constants/image_constant.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class LanguageCardWidget extends StatelessWidget {
  const LanguageCardWidget({
    super.key,
    required this.menuText,
    required this.groupValue,
    required this.onChanged,
    required this.flagIcon,
    required this.onTap,
    required this.value,
  });

  final String menuText;
  final String? groupValue;
  final Function(String?)? onChanged;
  final AppImages flagIcon;
  final Function() onTap;
  final String value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: BaseUtility.all(BaseUtility.paddingNormalValue),
      title: BodyMediumWhiteText(text: menuText, textAlign: TextAlign.left),
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
      trailing: flagIcon.toPngImg(
        BaseUtility.iconMediumSecondSize,
        BaseUtility.iconMediumSecondSize,
      ),
      onTap: () => onTap,
    );
  }
}
