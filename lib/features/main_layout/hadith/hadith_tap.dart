import 'package:flutter/widgets.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class HadithTap extends StatelessWidget {
  const HadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('HadithTap', style: TextStyle(color: ColorsManager.white)),
        ],
      ),
    );
  }
}