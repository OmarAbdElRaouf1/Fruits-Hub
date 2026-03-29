import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/utils/app_theme.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Row(
      children: [
        Expanded(
          child: Divider(color: appThemeColors.dividerColor, thickness: 1),
        ),
        SizedBox(width: 12.w),
        Text(
          '  أو  ',
          style: TextStyles.semiBold14.copyWith(
            color: appThemeColors.secondaryTextColor,
          ),
        ),
        SizedBox(width: 12.w),

        Expanded(
          child: Divider(color: appThemeColors.dividerColor, thickness: 1),
        ),
      ],
    );
  }
}
