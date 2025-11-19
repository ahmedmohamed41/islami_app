import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/radio/provider/radio_provider.dart';
import 'package:islami_app/features/main_layout/radio/widgets/custom_toggle.dart';
import 'package:islami_app/features/main_layout/radio/widgets/radio_card.dart';
import 'package:islami_app/features/main_layout/radio/widgets/reciter_card.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(AssetsManager.backgroundRadio),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AssetsManager.sebhalogo),
                CustomToggle(),

                Consumer<RadioProvider>(
                  builder: (context, radioProvider, child) {
                    if (radioProvider.currentIndex == 0) {
                      if (radioProvider.radiosLoading) {
                        return Expanded(
                          child: Center(child: CupertinoActivityIndicator()),
                        );
                      }
                      if (radioProvider.radiosErrorMessage.isNotEmpty) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              radioProvider.radiosErrorMessage,
                              style: TextStyle(color: ColorsManager.white),
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) =>
                              RadioCard(radio: radioProvider.radios[index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: radioProvider.radios.length,
                        ),
                      );
                    } else {
                      if (radioProvider.recitersLoading) {
                        return Expanded(
                          child: Center(child: CupertinoActivityIndicator()),
                        );
                      }
                      if (radioProvider.recitersErrorMessage.isNotEmpty) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              radioProvider.radiosErrorMessage,
                              style: TextStyle(color: ColorsManager.white),
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) => ReciterCard(
                            reciter: radioProvider.reciters[index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: radioProvider.radios.length,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
