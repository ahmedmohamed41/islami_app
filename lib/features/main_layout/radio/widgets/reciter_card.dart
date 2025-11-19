import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/radio/models/reciter_model.dart';
import 'package:islami_app/features/main_layout/radio/provider/radio_provider.dart';
import 'package:provider/provider.dart';

class ReciterCard extends StatelessWidget {
  const ReciterCard({super.key, required this.reciter});
  final Reciters reciter;

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
                reciter.name ?? '',
                style: TextStyle(
                  color: ColorsManager.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer<RadioProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.previousSura(reciter);
                        },
                        icon: Icon(
                          Icons.skip_previous_rounded,
                          color: ColorsManager.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.playReciters(reciter);
                        },
                        icon: Icon(
                          provider.selectedReciters == reciter
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: ColorsManager.black,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.nextSura(reciter);
                        },
                        icon: Icon(
                          Icons.skip_next_rounded,
                          color: ColorsManager.black,
                        ),
                      ),
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
