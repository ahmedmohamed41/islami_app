import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';
import 'package:islami_app/features/onboarding_layout/on_boarding_item.dart';
import 'package:islami_app/features/onboarding_layout/widgets/custom_text_button.dart';
import 'package:islami_app/models/page_model.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  PageController controller = PageController(initialPage: 0);
  double pos = 0;
  List<PageModel> litsOfPage = [
    PageModel(
      pathImage: AssetsManager.onboarding1,
      title: 'Welcome To Islmi App',
      subTitle: '',
    ),
    PageModel(
      pathImage: AssetsManager.onboarding2,
      title: 'Welcome To Islami',
      subTitle: 'We Are Very Excited To Have You In Our Community',
    ),
    PageModel(
      pathImage: AssetsManager.onboarding3,
      title: 'Reading the Quran',
      subTitle: 'Read, and your Lord is the Most Generous',
    ),
    PageModel(
      pathImage: AssetsManager.onboarding4,
      title: 'Bearish',
      subTitle: 'Praise the name of your Lord, the Most High',
    ),
    PageModel(
      pathImage: AssetsManager.onboarding5,
      title: 'Holy Quran Radio',
      subTitle:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  pos = value.toDouble();
                });
              },
              itemBuilder: (context, index) =>
                  OnboardingItem(model: litsOfPage[index]),
              itemCount: litsOfPage.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    previousPage();
                  },
                  child: CustomText(text: 'Back'),
                ),
                DotsIndicator(
                  dotsCount: 5,
                  position: pos,
                  decorator: DotsDecorator(
                    activeShape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(1),
                      side: BorderSide(width: 7, color: ColorsManager.gold),
                    ),
                    color: ColorsManager.black1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    nextPage(context);
                  },
                  child: CustomText(text: 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void previousPage() {
    if (pos > 0) {
      controller.previousPage(
        curve: Curves.linear,
        duration: Duration(milliseconds: 500),
      );
      setState(() {
        pos--;
      });
    }
  }

  void nextPage(BuildContext context) {
    if (pos < 4) {
      controller.nextPage(
        curve: Curves.linear,
        duration: Duration(milliseconds: 500),
      );
      setState(() {
        pos++;
      });
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    }
  }
}
