import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/services/api_service.dart';
import 'package:islami_app/features/main_layout/radio/models/radio_model.dart';
import 'package:islami_app/features/main_layout/radio/models/reciter_model.dart';
import 'package:just_audio/just_audio.dart';

class RadioProvider extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();
  RadioProvider() {
    getRadio();
  }
  Radios? selectedRadio;
  Future<void> playRadio(Radios radio) async {
    try {
      if (selectedRadio == radio) {
        await player.pause();
        selectedRadio = null;
      } else {
        await player.setUrl(radio.url ?? '');
        player.play();
        selectedRadio = radio;
      }
    } catch (exception) {
      log(exception.toString());
    }

    notifyListeners();
  }

  Radios? selectedVolumeRadio;
  Future<void> changeVolumeRadio(Radios radio) async {
    if (selectedRadio != radio) {
      return;
    }
    if (selectedVolumeRadio == radio) {
      await player.setVolume(1);
      selectedVolumeRadio = null;
    } else {
      player.setVolume(0);
      selectedVolumeRadio = radio;
    }

    notifyListeners();
  }

  Reciters? selectedReciters;
  Future<void> playReciters(Reciters reciter) async {
    try {
      if (selectedReciters == reciter) {
        await player.pause();
        selectedReciters = null;
      } else {
        String url = '${reciter.moshaf?.first.server}001.mp3';
        await player.setUrl(url);
        player.play();
        selectedReciters = reciter;
      }
    } catch (exception) {
      log(exception.toString());
    }

    notifyListeners();
  }

  int _currentSura = 1;
  String get formttedIndex => _currentSura.toString().padLeft(3, '0'); // 001
  Future<void> previousSura(Reciters reciter) async {
    if (_currentSura > 1) {
      _currentSura--;
      String url = '${reciter.moshaf?.first.server}$formttedIndex.mp3';
      await player.setUrl(url);
      player.play();
      selectedReciters = reciter;
    }
    notifyListeners();
  }

  Future<void> nextSura(Reciters reciter) async {
    if (_currentSura < 114) {
      _currentSura++;
      String url = '${reciter.moshaf?.first.server}$formttedIndex.mp3';
      await player.setUrl(url);
      player.play();
      selectedReciters = reciter;
    }
    notifyListeners();
  }

  List<Radios> radios = [];
  bool radiosLoading = false;
  String radiosErrorMessage = '';

  Future<void> getRadio() async {
    radiosLoading = true;
    notifyListeners();
    try {
      RadioModel radioModel = await ApiService.getRadio();
      radiosLoading = false;
      notifyListeners();
      radios = radioModel.radios ?? [];
    } catch (exception) {
      log(exception.toString());
      radiosErrorMessage = 'SomthThing went Wrong!';
      radiosLoading = false;
      notifyListeners();
    }
  }

  List<Reciters> reciters = [];
  bool recitersLoading = false;
  String recitersErrorMessage = '';

  Future<void> getReciter() async {
    recitersLoading = true;
    notifyListeners();
    try {
      ReciterModel reciterModel = await ApiService.getReciters();
      recitersLoading = false;
      notifyListeners();
      reciters = reciterModel.reciters ?? [];
    } catch (exception) {
      log(exception.toString());
      recitersErrorMessage = 'SomthThing went Wrong!';
      recitersLoading = false;
      notifyListeners();
    }
  }

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  TextStyle changeTextStyle(int index) {
    final defultStyle = TextStyle(
      color: ColorsManager.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    if (index == currentIndex) {
      return defultStyle;
    } else {
      return defultStyle.copyWith(color: ColorsManager.white);
    }
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
