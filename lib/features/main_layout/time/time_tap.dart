import 'package:flutter/widgets.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class TimeTap extends StatelessWidget {
  const TimeTap({super.key});

   @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('TimeTap', style: TextStyle(color: ColorsManager.white)),
        ],
      ),
    );
  }
}