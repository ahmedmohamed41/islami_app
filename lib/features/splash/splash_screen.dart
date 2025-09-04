import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void navigator() {
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
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
