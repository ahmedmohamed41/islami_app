import 'package:flutter/material.dart';
import 'package:islami_app/core/cache/shared_pref_service.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isFirstTime;
  @override
  void initState() {
    super.initState();
     _navigator(screen: RoutesManager.onboarding);
    isFirstTime = SharedPrefService.getBoolean('isScreenShown') ?? true;
    if (isFirstTime) {
      _navigator(screen: RoutesManager.onboarding);
    } else {
      _navigator(screen: RoutesManager.mainLayout);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _navigator({required String screen}) {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, screen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          Spacer(flex: 40),
          Image.asset(AssetsManager.spashLogo),
          Spacer(flex: 40),
          Image.asset(AssetsManager.routeGold),
          Spacer(flex: 5),
        ],
      ),
    );
  }
}
