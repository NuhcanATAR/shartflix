import 'package:flutter/material.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/util/util.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({
    super.key,
    required this.onTap,
    required this.color,
  });

  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: BaseUtility.symmetric(
          BaseUtility.paddingNormalHightValue,
          BaseUtility.paddingNormalValue,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(BaseUtility.radiusCircularNormalValue),
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.4),
            width: 1,
          ),
        ),
        child: AppIcons.favorite.toSvgImg(
          color,
          BaseUtility.iconMediumNormalSize,
          BaseUtility.iconMediumNormalSize,
        ),
      ),
    );
  }
}
