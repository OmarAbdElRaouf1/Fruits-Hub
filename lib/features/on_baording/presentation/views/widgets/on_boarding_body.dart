import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_market/constants.dart';
import 'package:fruits_market/core/services/shared_preferences.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/features/auth/presentation/views/login/login.dart';
import 'package:fruits_market/features/on_baording/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            controller: pageController,
            currentPage: currentPage,
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 2,
          effect: WormEffect(
            dotColor: colorScheme.outline,
            activeDotColor: colorScheme.primary,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 8,
          ),
        ),
        const SizedBox(height: 29),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: currentPage == 1 ? true : false,
            child: CustomButton(
              onPressed: () {
                Prefs.setBool(kIsOnBoardingViewSeen, true);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Login()),
                  (route) => false,
                );
              },
              text: "ابدأ الان",
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
