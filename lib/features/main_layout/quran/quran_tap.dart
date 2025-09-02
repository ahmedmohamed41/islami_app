import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/widgets/custom_list_of_most_recently.dart';
import 'package:islami_app/widgets/custom_list_sura_name.dart';
import 'package:islami_app/widgets/custom_text_from_field.dart';
List<SuraModel> listOfMostRecently=[];
class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<SuraModel> filterdSuras = SuraModel.getAllSurahs;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AssetsManager.quranTapbg),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  child: Image.asset(AssetsManager.imgHeaderQuranTap),
                ),
                CustomTextFormField(
                  onChanged: (value) {
                    filterSurasList(value);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Most Recently',
                    style: TextStyle(
                      color: ColorsManager.white,
                     fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                      fontSize: 16,
                    ),
                  ),
                ),
                CustomListOfMostRecently( listOfMostRecently: listOfMostRecently,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Suras List',
                    style: TextStyle(
                      color: ColorsManager.white,
                     fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                      fontSize: 16,
                    ),
                  ),
                ),
                CustomListSuraName(filterdSuras: filterdSuras),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void filterSurasList(String searchKey) {
    filterdSuras = SuraModel.getAllSurahs
        .where(
          (element) =>
              element.suraNameEn.toLowerCase().contains(
                searchKey.toLowerCase(),
              ) ||
              element.suraNameAr.contains(searchKey),
        )
        .toList();
    setState(() {});
  }
}
