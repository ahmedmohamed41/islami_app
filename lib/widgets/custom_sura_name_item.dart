import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';
import 'package:islami_app/features/main_layout/quran/quran_tap.dart';
import 'package:islami_app/models/sura_model.dart';

class CustomSuraNameItem extends StatelessWidget {
  const CustomSuraNameItem({super.key, required this.suraModel});
  final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.souraDetailsScreen,
          arguments: suraModel,
        );
        listOfMostRecently.add(suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.imgSurNumberFrame),
              Text(
                suraModel.suraNumber,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraModel.suraNameEn,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '${suraModel.versesNum} Verses ',
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            suraModel.suraNameAr,
            style: TextStyle(
              color: ColorsManager.white,
              fontFamily: FontsFamilyManager.fontFamilyJannaLT,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
