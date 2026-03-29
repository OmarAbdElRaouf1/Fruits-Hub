import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_market/core/helper_functions/on_generate_route.dart';
import 'package:fruits_market/core/services/shared_preferences.dart';
import 'package:fruits_market/core/services/theme_controller.dart';
import 'package:fruits_market/core/utils/app_theme.dart';
import 'package:fruits_market/features/splash/presentation/views/splash.dart';
import 'package:fruits_market/firebase_options.dart';
import 'package:fruits_market/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  ThemeController.instance.loadTheme();
  runApp(const FruitsMarketApp());
}

class FruitsMarketApp extends StatelessWidget {
  const FruitsMarketApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: AnimatedBuilder(
        animation: ThemeController.instance,
        builder: (context, _) {
          return MaterialApp(
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: ThemeController.instance.themeMode,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            title: 'Fruits Market',
            onGenerateRoute: onGenerateRoute,
            initialRoute: Splash.routeName,
          );
        },
      ),
    );
  }
}
