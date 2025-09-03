import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class CustomVersesOfDetails extends StatelessWidget {
  const CustomVersesOfDetails({super.key, required this.verse,required this.number});
  final String verse;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: ColorsManager.gold,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right, '$verse[$number]'),
      ),
    );
  }
}
