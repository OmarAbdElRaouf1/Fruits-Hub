import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/utils/app_theme.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.text,
  });

  final String icon;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appThemeColors = Theme.of(context).extension<AppThemeColors>()!;

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appThemeColors.socialButtonBorderColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          backgroundColor: Theme.of(context).cardColor,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: 24.w, height: 24.h),
            SizedBox(width: 12.w), // مسافة بين الأيقونة والنص
            Expanded(
              child: Text(
                text,
                style: TextStyles.semiBold16.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
