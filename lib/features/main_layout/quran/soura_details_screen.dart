import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/models/sura_model.dart';

class SouraDetailsScreen extends StatefulWidget {
  const SouraDetailsScreen({super.key});

  @override
  State<SouraDetailsScreen> createState() => _SouraDetailsScreenState();
}

class _SouraDetailsScreenState extends State<SouraDetailsScreen> {
  late SuraModel sura;
  String suraContent = '';
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
  }

  @override
  Widget build(BuildContext context) {
    if (suraContent.isEmpty) loadSuraContent(sura.suraNumber);

    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
       
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.gold,
        title: Text(
          sura.suraNameEn,
          style: TextStyle(fontFamily:FontsFamilyManager.fontFamilyJannaLT, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(AssetsManager.imgLeftCorner),
                Text(
                  sura.suraNameAr,
                  style: TextStyle(
                    fontFamily:FontsFamilyManager.fontFamilyJannaLT,
                    fontSize: 24,
                    color: ColorsManager.gold,
                  ),
                ),
                Image.asset(AssetsManager.imgRightCorner),
              ],
            ),
          ),
          Expanded(
            child: suraContent.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorsManager.gold),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        suraContent,
                        style: TextStyle(
                          color: ColorsManager.gold,
                          fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
          ),
          Image.asset(AssetsManager.imgBottomDecoration),
        ],
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    String filePath = 'assets/files/suras/$suraIndex.txt';
    String fileContent = await rootBundle.loadString(filePath);
    List<String> suraLines = fileContent.trim().split("\n");
    for (var i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    suraContent = suraLines.join();
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
