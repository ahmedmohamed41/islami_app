import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/radio/models/radio_model.dart';
import 'package:islami_app/features/main_layout/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class RadioCard extends StatelessWidget {
  const RadioCard({super.key, required this.radio});
  final Radios radio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133,
      width: 390,
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(AssetsManager.backMosque),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                radio.name ?? '',
                style: TextStyle(
                  color: ColorsManager.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer<RadioProvider>(
                builder: (context, provider, child) {
                  return Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          provider.playRadio(radio);
                        },
                        icon: Icon(
                          provider.selectedRadio == radio
                              ? CupertinoIcons.pause_fill
                              : CupertinoIcons.play_arrow_solid,
                          color: ColorsManager.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.changeVolumeRadio(radio);
                        },
                        icon: Icon(
                          provider.selectedVolumeRadio == radio
                              ? CupertinoIcons.volume_off
                              : CupertinoIcons.volume_up,
                          color: ColorsManager.black,
                        ),
                      ),
                      Spacer(),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
