import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 7),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive ? ColorsManager.goldActive : ColorsManager.black1,
        borderRadius: BorderRadius.circular(27),
      ),
    );
  }
}
