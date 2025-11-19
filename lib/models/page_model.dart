import 'package:islami_app/core/resources/assets_manager.dart';

class PageModel {
  String pathImage;
  String title;
  String subTitle;
  PageModel({
    required this.pathImage,
    required this.title,
    required this.subTitle,
  });
  static List<PageModel> litsOfPage = [
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
}
