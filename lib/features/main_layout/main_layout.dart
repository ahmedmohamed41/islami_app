import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/hadith/hadith_tap.dart';
import 'package:islami_app/features/main_layout/quran/quran_tap.dart';
import 'package:islami_app/features/main_layout/radio/radio_tap.dart';
import 'package:islami_app/features/main_layout/sebha/sebha_tap.dart';
import 'package:islami_app/features/main_layout/time/time_tap.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> listOfNavigation = [
    QuranTap(),
    HadithTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: listOfNavigation[current],
      bottomNavigationBar: _listBottomNavigationBar(),
    );
  }

  BottomNavigationBar _listBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: current,
      onTap: (value) {
        setState(() {
          current = value;
        });
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.gold,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.black,
      items: [
        _bottomNavigationBarItem(
          text: 'Quran',
          path: AssetsManager.quran,
          selectIndex: current == 0,
        ),
        _bottomNavigationBarItem(
          text: 'Hadeth',
          path: AssetsManager.hadeth,
          selectIndex: current == 1,
        ),
        _bottomNavigationBarItem(
          text: 'Sebha',
          path: AssetsManager.sebha,
          selectIndex: current == 2,
        ),
        _bottomNavigationBarItem(
          text: 'Radio',
          path: AssetsManager.radio,
          selectIndex: current == 3,
        ),
        _bottomNavigationBarItem(
          text: 'Time',
          path: AssetsManager.time,
          selectIndex: current == 4,
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required bool selectIndex,
    required String text,
    required String path,
  }) {
    return BottomNavigationBarItem(
      icon: selectIndex
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: ColorsManager.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(path, color: ColorsManager.white),
            )
          : Image.asset(path),
      label: text,
    );
  }
}
