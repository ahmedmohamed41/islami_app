import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/models/hadith_model.dart';

import '../../../core/routes_manager/routes_manager.dart';
import '../../../widgets/custom_sura_name_item.dart';

class HadithItem extends StatefulWidget {
  const HadithItem({super.key, required this.index});
  final int index;
  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithContent(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.pushNamed(
          context,
          RoutesManager.hadithDetailsScreen,
          arguments: hadith
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Column(
              children: [
                Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AssetsManager.imgLeftCorner,
                          color: ColorsManager.black,
                        ),
                        Image.asset(
                          AssetsManager.imgRightCorner,
                          color: ColorsManager.black,
                        ),
                      ],
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      hadith?.title ?? "",
                      style: TextStyle(
                        fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(AssetsManager.hadithCardBackGround),
                ),
                Image.asset(
                  AssetsManager.imgBottomDecoration,
                  color: ColorsManager.black,
                ),
              ],
            ),
            hadith == null
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 70,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      hadith!.content,
                      style: TextStyle(
                        fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                        fontSize: 16,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void loadHadithContent(int index) async {
    String filePath = 'assets/files/hadith/h$index.txt';
    String hadithContent = await rootBundle.loadString(filePath);

    List<String> hadithLines = hadithContent.trim().split('\n');
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    String content = hadithLines.join();
    hadith = HadithModel(title: title, content: content);

    if (mounted) {
      setState(() {});
    }
  }
}
