import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_market/constants.dart';
import 'package:fruits_market/core/services/shared_preferences.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/utils/app_theme.dart';
import 'package:fruits_market/features/auth/presentation/views/login/login.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisiable,
  });
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisiable;

  @override
  Widget build(BuildContext context) {
    final appThemeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisiable,
                child: GestureDetector(
                  onTap: () {
                    // Prefs.setBool(kIsOnBoardingViewSeen, true);
                    //   Navigator.of(context)
                    //       .pushReplacementNamed(SigninView.routeName);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(kIsOnBoardingViewSeen, true);

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Login()),
                        (route) => false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'تخط',
                        style: TextStyles.bold16.copyWith(
                          color: appThemeColors.mutedTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        title,
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyles.bold16.copyWith(
              color: appThemeColors.secondaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
