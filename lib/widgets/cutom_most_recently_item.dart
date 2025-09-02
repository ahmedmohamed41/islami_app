import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/extension_context.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/models/sura_model.dart';

class CustomMostRecentlyItem extends StatelessWidget {
  const CustomMostRecentlyItem({super.key,required this.model});
final  SuraModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth * 0.8,
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                 model.suraNameEn,
                  style: TextStyle(fontFamily: FontsFamilyManager.fontFamilyJannaLT, fontSize: 20),
                ),
                Text(
                 model.suraNameAr,
                  style: TextStyle(  fontFamily: FontsFamilyManager.fontFamilyJannaLT,fontSize: 24),
                ),
                Text(
                  '${model.versesNum} Verses',
                  style: TextStyle(fontFamily: FontsFamilyManager.fontFamilyJannaLT, fontSize: 14),
                ),
              ],
            ),
          ),
          Image.asset(AssetsManager.imageRecently),
        ],
      ),
    );
  }
}
