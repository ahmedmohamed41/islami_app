import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/extension_context.dart';
import 'package:islami_app/core/prefs_manager.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/widgets/cutom_most_recently_item.dart';

import '../core/resources/assets_manager.dart';
import '../core/resources/colors_manager.dart';

class CustomListOfMostRecently extends StatefulWidget {
  const CustomListOfMostRecently({super.key});

  @override
  State<CustomListOfMostRecently> createState() =>
      CustomListOfMostRecentlyState();
}

class CustomListOfMostRecentlyState extends State<CustomListOfMostRecently> {
  List<SuraModel> listOfMostRecently = [];
  void fetchMostRecentySuras() async {
    listOfMostRecently = await PrefsManager.getMostRecentSuras();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMostRecentySuras();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: listOfMostRecently.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(
            height: context.getHeight * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => CustomMostRecentlyItem(
                model: listOfMostRecently[index],
                mostRecentKey: widget.key as GlobalKey<CustomListOfMostRecentlyState>,
              ),
              itemCount: listOfMostRecently.length,
            ),
          ),
        ],
      ),
    );
  }
}
