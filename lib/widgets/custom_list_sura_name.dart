import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/widgets/custom_list_of_most_recently.dart';
import 'package:islami_app/widgets/custom_sura_name_item.dart';

class CustomListSuraName extends StatelessWidget {
  const CustomListSuraName({super.key,required this.filterdSuras,required this.mostRecentKey});
final  List<SuraModel> filterdSuras;
  final GlobalKey<CustomListOfMostRecentlyState> mostRecentKey;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(indent: 40, endIndent: 40),
      itemBuilder: (context, index) =>
          CustomSuraNameItem(sura:filterdSuras[index],mostRecentKey: mostRecentKey,),
      itemCount: filterdSuras.length,
    );
  }
}
