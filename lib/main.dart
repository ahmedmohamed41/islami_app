import 'package:flutter/material.dart';
import 'package:islami_app/core/cache/shared_pref_service.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.splash,
    );
  }
}
