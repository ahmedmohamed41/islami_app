import 'package:flutter/material.dart';
import 'package:islami_app/core/cache/shared_pref_service.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';
import 'package:islami_app/features/onboarding_layout/on_boarding_item.dart';
import 'package:islami_app/features/onboarding_layout/widgets/custom_dots_indicator.dart';
import 'package:islami_app/features/onboarding_layout/widgets/custom_text_button.dart';
import 'package:islami_app/models/page_model.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  PageController controller = PageController(initialPage: 0);
  int pos = 0;

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
                  pos = value;
                });
              },
              itemBuilder: (context, index) =>
                  OnboardingItem(model: PageModel.litsOfPage[index]),
              itemCount: PageModel.litsOfPage.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pos == 0
                        ? SizedBox()
                        : TextButton(
                            onPressed: () {
                              previousPage();
                            },
                            child: CustomText(text: 'Back'),
                          ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        nextPage(context);
                      },
                      child: CustomText(
                        text: pos == PageModel.litsOfPage.length - 1
                            ? 'Finish'
                            : 'Next',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      PageModel.litsOfPage.length,
                      (index) => CustomDotsIndicator(isActive: pos == index),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void previousPage() {
    controller.previousPage(
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
    );
  }

  void nextPage(BuildContext context) {
    controller.nextPage(
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
    );

    if (PageModel.litsOfPage.length - 1 == pos) {
      SharedPrefService.setBoolean('isScreenShown', false);
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    }
  }
}
//  DotsIndicator(
//                   dotsCount: 5,
//                   position: pos,
//                   decorator: DotsDecorator(
//                     activeShape: BeveledRectangleBorder(
//                       borderRadius: BorderRadiusGeometry.circular(1),
//                       side: BorderSide(width: 7, color: ColorsManager.gold),
//                     ),
//                     color: ColorsManager.black1,
//                   ),
//                 ),