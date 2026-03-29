import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/utils/app_theme.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.obscureText = false,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appThemeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: TextStyles.bold13.copyWith(
            color: appThemeColors.mutedTextColor,
          ),
          fillColor: appThemeColors.inputFillColor,
          border: buildBorder(),
          enabledBorder: buildBorder(borderColor: colorScheme.outline),
          focusedBorder: buildBorder(borderColor: colorScheme.primary),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: borderColor ?? const Color(0xFFE6E9E9), width: 1),
    );
  }
}
