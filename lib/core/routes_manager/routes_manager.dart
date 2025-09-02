import 'package:flutter/widgets.dart';
import 'package:islami_app/features/main_layout/main_layout.dart';
import 'package:islami_app/features/main_layout/quran/soura_details_screen.dart';
import 'package:islami_app/features/onboarding_layout/on_boarding_screeen.dart';
import 'package:islami_app/features/splash/splash_screen.dart';

abstract class RoutesManager {
  static const String splash = '/splashScreen';
  static const String onboarding = '/onboardingScreen';
  static const String mainLayout = '/mainLayout';
  static const String souraDetailsScreen = '/souraDetailsScreen';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => OnBoardingScreeen(),
    mainLayout: (context) => MainLayout(),
    souraDetailsScreen: (context) => SouraDetailsScreen(),
  };
}
