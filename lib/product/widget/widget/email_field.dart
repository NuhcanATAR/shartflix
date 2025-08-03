import 'package:flutter/material.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/core/base/base_state.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/validator/validator.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class CustomEmailFieldWidget extends StatefulWidget {
  const CustomEmailFieldWidget({
    super.key,
    required this.emailController,
    required this.placeHolderText,
    required this.onChanged,
  });

  final TextEditingController emailController;
  final String placeHolderText;
  final Function(String)? onChanged;

  @override
  State<CustomEmailFieldWidget> createState() => _CustomEmailFieldWidgetState();
}

class _CustomEmailFieldWidgetState extends BaseState<CustomEmailFieldWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // email field
        Container(
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
            style: CustomColorTheme().themeDataSecond.textTheme.bodyMedium!
                .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),

            controller: widget.emailController,
            validator: (String? value) {
              final result =
                  CustomValidator(value: value, context: context).emailCheck;
              setState(() {
                errorText = result;
              });
              return result;
            },
            onChanged: widget.onChanged,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 0.2),
              hintText:
                  widget.placeHolderText.isEmpty ? '' : widget.placeHolderText,
              hintStyle: CustomColorTheme()
                  .themeDataSecond
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
              icon: AppIcons.mailOutline.toSvgImg(
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  BaseUtility.radiusCircularMediumValue,
                ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
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
        ),
        // validator error
        if (errorText != null)
          Padding(
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
          ),
      ],
    );
  }
}
