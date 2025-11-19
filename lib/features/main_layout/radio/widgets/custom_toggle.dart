import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class CustomToggle extends StatelessWidget {
  const CustomToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.size(
      textDirection: TextDirection.ltr,
      current: context.watch<RadioProvider>().currentIndex,
      values: const [0, 1],
      iconOpacity: 1,
      onTap: (props) {
        if (props.tapped!.index == 0) {
          context.read<RadioProvider>().getRadio();
        } else {
          context.read<RadioProvider>().getReciter();
        }
      },
      indicatorSize: const Size.fromWidth(300),
      iconList: [
        Text('Radio', style: context.read<RadioProvider>().changeTextStyle(0)),
        Text(
          'Reciters',
          style: context.read<RadioProvider>().changeTextStyle(1),
        ),
      ],
      iconAnimationType: AnimationType.onSelected,
      style: ToggleStyle(
        borderColor: Colors.transparent,
        backgroundColor: ColorsManager.black.withValues(alpha: 0.7),
        indicatorColor: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16.0),
      ),
      onChanged: (index) => context.read<RadioProvider>().changeIndex(index),
    );
  }
}
