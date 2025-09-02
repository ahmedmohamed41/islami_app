import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/extension_context.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/widgets/cutom_most_recently_item.dart';

class CustomListOfMostRecently extends StatelessWidget {
  const CustomListOfMostRecently({super.key ,required this.listOfMostRecently});
  final List<SuraModel> listOfMostRecently;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight * 0.18,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (context, index) => CustomMostRecentlyItem(model: listOfMostRecently[index],),
        itemCount: listOfMostRecently.length,
      ),
    );
  }
}
