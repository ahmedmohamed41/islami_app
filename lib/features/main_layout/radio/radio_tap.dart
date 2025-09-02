import 'package:flutter/widgets.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('RadioTap', style: TextStyle(color: ColorsManager.white)),
        ],
      ),
    );
  }
}
