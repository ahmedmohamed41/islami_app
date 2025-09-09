import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/features/main_layout/hadith/hadith_item.dart';

class HadithTap extends StatelessWidget {
  const HadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsManager.hadithTapBg),
          ),
        ),
        child: Column(
          children: [
            Image.asset(AssetsManager.imgHeaderQuranTap),

            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  viewportFraction: 0.8,
                ),
                items: List.generate(50, (index) => index + 1).map((index) {
                  return Builder(
                    builder: (BuildContext context) {
                      return HadithItem(index: index);
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
