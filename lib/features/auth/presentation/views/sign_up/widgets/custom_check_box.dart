import 'package:flutter/material.dart';

import 'package:fruits_market/core/utils/app_theme.dart';
import 'package:fruits_market/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appThemeColors = Theme.of(context).extension<AppThemeColors>()!;

    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? colorScheme.primary : Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked
                  ? Colors.transparent
                  : appThemeColors.checkBoxBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(Assets.imagesCheck),
              )
            : const SizedBox(),
      ),
    );
  }
}
