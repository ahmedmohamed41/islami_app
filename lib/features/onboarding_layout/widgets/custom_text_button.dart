import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,  required this.text});
 
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: ColorsManager.gold,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: FontsFamilyManager.fontFamilyJannaLT,
      ),
    );
  }
}
