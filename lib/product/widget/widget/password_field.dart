import 'package:flutter/material.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/core/base/base_state.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/validator/validator.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class CustomPasswordFieldWidget extends StatefulWidget {
  const CustomPasswordFieldWidget({
    super.key,
    required this.passwordController,
    required this.hintText,
    required this.onChanged,
    required this.isValidator,
    this.isHideEye = false,
  });

  final TextEditingController passwordController;
  final String hintText;
  final Function(String)? onChanged;
  final bool isValidator;
  final bool? isHideEye;

  @override
  State<CustomPasswordFieldWidget> createState() =>
      _CustomPasswordFieldWidgetState();
}

class _CustomPasswordFieldWidgetState
    extends BaseState<CustomPasswordFieldWidget> {
  String? errorText;
  bool isPassObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // password field
        buildPasswordFieldWidget,
        // validator error
        if (errorText != null) buildValidatorErrorWidget,
      ],
    );
  }

  // password field
  Widget get buildPasswordFieldWidget => Container(
    padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
    margin: BaseUtility.bottom(BaseUtility.paddingSmallValue),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(
        BaseUtility.radiusCircularMediumValue,
      ),
      border: Border.all(color: Colors.grey, width: 0.5),
    ),
    child: TextFormField(
      obscureText: isPassObscured,
      style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      controller: widget.passwordController,
      validator: (String? value) {
        final result =
            widget.isValidator == true
                ? CustomValidator(
                  value: value,
                  context: context,
                ).emptyNormalCheck
                : CustomValidator(
                  value: value,
                  context: context,
                ).emptyNormalCheck;
        setState(() {
          errorText = result;
        });
        return result;
      },
      onChanged: (value) {
        setState(() {
          errorText = null;
        });
        widget.onChanged?.call(value);
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 0.2),
        hintText: widget.hintText,
        hintStyle: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
            .copyWith(color: Colors.grey),
        suffixIcon:
            widget.isHideEye == true
                ? const SizedBox()
                : IconButton(
                  onPressed: () {
                    setState(() {
                      isPassObscured = !isPassObscured;
                    });
                  },
                  icon:
                      isPassObscured == true
                          ? AppIcons.hideOutline.toSvgImg(
                            Colors.white,
                            BaseUtility.iconNormalSize,
                            BaseUtility.iconNormalSize,
                          )
                          : AppIcons.hideOutline.toSvgImg(
                            Colors.white,
                            BaseUtility.iconNormalSize,
                            BaseUtility.iconNormalSize,
                          ),
                ),
        icon: AppIcons.unlockOutline.toSvgImg(
          Colors.white,
          BaseUtility.iconNormalSize,
          BaseUtility.iconNormalSize,
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: BaseUtility.paddingNormalValue,
          vertical: BaseUtility.paddingSmallValue,
        ),
        // TextFormField varsayılan hata mesajını engellemek için errorText kullanma
        errorText: null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseUtility.radiusCircularMediumValue,
          ),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseUtility.radiusCircularMediumValue,
          ),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseUtility.radiusCircularMediumValue,
          ),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            BaseUtility.radiusCircularMediumValue,
          ),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    ),
  );

  // validator error
  Widget get buildValidatorErrorWidget => Padding(
    padding: BaseUtility.all(BaseUtility.paddingMediumValue),
    child: Row(
      children: [
        const Icon(
          Icons.error,
          color: Colors.white,
          size: BaseUtility.iconNormalSize,
        ),
        Expanded(
          child: Padding(
            padding: BaseUtility.left(BaseUtility.paddingNormalValue),
            child: BodyMediumWhiteText(
              text: errorText!,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    ),
  );
}
