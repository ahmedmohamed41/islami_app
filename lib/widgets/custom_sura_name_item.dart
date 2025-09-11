import 'package:flutter/material.dart';
import 'package:islami_app/core/prefs_manager.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';
import 'package:islami_app/models/sura_model.dart';

import 'custom_list_of_most_recently.dart';

class CustomSuraNameItem extends StatelessWidget {
   CustomSuraNameItem({super.key, required this.sura,required this.mostRecentKey});
   SuraModel sura;
   GlobalKey<CustomListOfMostRecentlyState>mostRecentKey ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsManager.addSuraIndex(sura.suraNumber);
        Navigator.pushNamed(
          context,
          RoutesManager.souraDetailsScreen,
          arguments: ArgumentsSuraName(sura: sura, mostRecentKey: mostRecentKey),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.imgSurNumberFrame),
              Text(
                sura.suraNumber,
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
                  sura.suraNameEn,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '${sura.versesNum} Verses ',
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
            sura.suraNameAr,
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

class ArgumentsSuraName{
  SuraModel sura;
  GlobalKey<CustomListOfMostRecentlyState> mostRecentKey;

  ArgumentsSuraName({required this.sura,required this.mostRecentKey});

}