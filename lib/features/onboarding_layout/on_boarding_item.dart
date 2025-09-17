import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/models/page_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});
  final PageModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(flex: 2, child: Image.asset(AssetsManager.sebhalogo)),
          SizedBox(height: 16),
          Expanded(flex: 4, child: Image.asset(model.pathImage)),
          SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: Text(
              model.title,
              style: TextStyle(
                color: ColorsManager.gold,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: FontsFamilyManager.fontFamilyJannaLT,
              ),
            ),
          ),
          model.subTitle == ''
              ? SizedBox()
              : Expanded(
                  flex: 1,
                  child: Text(
                    textAlign: TextAlign.center,
                    model.subTitle,
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
