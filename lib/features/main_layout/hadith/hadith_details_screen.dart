import 'package:flutter/material.dart';
import 'package:islami_app/models/hadith_model.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.gold,
        title: Text(
          'Hadith 1',
          style: TextStyle(
            fontFamily: FontsFamilyManager.fontFamilyJannaLT,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(AssetsManager.imgLeftCorner),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      argument.title,
                      style: TextStyle(
                        fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                        fontSize: 20,
                        color: ColorsManager.gold,
                      ),
                    ),
                  ),
                  Image.asset(AssetsManager.imgRightCorner),
                ],
              ),
            ),
            Expanded(
              child: argument.content.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.gold,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 7,
                          right: 7,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          argument.content,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                            color: ColorsManager.gold,
                          ),
                        ),
                      ),
                    ),
            ),
            Image.asset(AssetsManager.imgBottomDecoration),
          ],
        ),
      ),
    );
  }
}
