import 'package:flutter/material.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/extension/dynamic_extension.dart';
import 'package:shartflix/product/util/util.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
    required this.socialIcon,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;
  final AppIcons socialIcon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 3,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: dynamicViewExtensions.dynamicHeight(context, 0.075),
          margin: BaseUtility.horizontal(BaseUtility.paddingSmallValue),
          padding: BaseUtility.all(BaseUtility.paddingNormalValue),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(BaseUtility.radiusCircularMediumValue),
            ),
          ),
          child: socialIcon.toSvgImg(
            Colors.white,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
      ),
    );
  }
}
