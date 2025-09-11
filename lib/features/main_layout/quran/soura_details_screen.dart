import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/widgets/custom_sura_name_item.dart';
import 'package:islami_app/widgets/custom_verses_details.dart';

class SouraDetailsScreen extends StatefulWidget {
  const SouraDetailsScreen({super.key});

  @override
  State<SouraDetailsScreen> createState() => _SouraDetailsScreenState();
}

class _SouraDetailsScreenState extends State<SouraDetailsScreen> {

  List<String> suraLines = [];
  late ArgumentsSuraName argument ;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    argument = ModalRoute.of(context)!.settings.arguments as ArgumentsSuraName;
    loadSuraContent(argument.sura.suraNumber);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    argument.mostRecentKey.currentState?.fetchMostRecentySuras();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (suraLines.isEmpty) loadSuraContent(sura.suraNumber);
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.gold,
        title: Text(
          argument.sura.suraNameEn,
          style: TextStyle(
            fontFamily: FontsFamilyManager.fontFamilyJannaLT,
            fontSize: 20,
          ),
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
                  argument.sura.suraNameAr,
                  style: TextStyle(
                    fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                    fontSize: 24,
                    color: ColorsManager.gold,
                  ),
                ),
                Image.asset(AssetsManager.imgRightCorner),
              ],
            ),
          ),
          Expanded(
            child: suraLines.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorsManager.gold),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => CustomVersesOfDetails(verse: suraLines[index],number: ++index,),
                    itemCount: suraLines.length,
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
    suraLines = fileContent.trim().split("\n");
    // for (var i = 0; i < suraLines.length; i++) {
    //   suraLines[i] += '[${i + 1}]';
    // }
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
