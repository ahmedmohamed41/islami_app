import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double angle = 0;
  int tik = 1;
  List<String> texts = [
    'سبحان الله',
    'الحمدالله',
    'الله اكبر',
    'لا إله إلا الله وحده لا شريك له',
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsManager.sebhaBackground),
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                AssetsManager.sebhaBackground1,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsManager.sebhalogo),
                    Text(
                      'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                      style: TextStyle(
                        fontFamily: FontsFamilyManager.fontFamilyJannaLT,
                        fontSize: 30,
                        color: ColorsManager.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 60),
                              child: Image.asset(AssetsManager.sebhaMask),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      angle += math.pi / 12.0;
                                      if (index == 3) {
                                        index = 0;
                                        print(index);
                                      } else {
                                        if (tik == 6) {
                                          texts[index++];
                                          tik = 1;
                                        } else {
                                          tik++;
                                        }
                                      }
                                    });
                                  },
                                  child: Transform.rotate(
                                    angle: angle,
                                    child: Image.asset(AssetsManager.sebhaBody),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      index == 3
                                          ? texts[texts.length - 1]
                                          : texts[index],
                                      style: TextStyle(
                                        fontFamily:
                                            FontsFamilyManager.fontFamilyJannaLT,
                                        fontSize: 20,
                                        color: ColorsManager.white,
                                      ),
                                    ),
                                    Text(
                                      '$tik',
                                      style: TextStyle(
                                        fontFamily:
                                            FontsFamilyManager.fontFamilyJannaLT,
                                        fontSize: 20,
                                        color: ColorsManager.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
