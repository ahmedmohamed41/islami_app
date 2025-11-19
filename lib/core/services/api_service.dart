import 'dart:convert';
import 'dart:developer';

import 'package:islami_app/features/main_layout/radio/models/radio_model.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/features/main_layout/radio/models/reciter_model.dart';

class ApiService {
  static const String _baseUrl = 'https://mp3quran.net/api/v3/';
  static const String _radioEndPoint = 'radios?language=ar';
  static const String _recitersEndPoint = 'reciters?language=ar';
  static Future<RadioModel> getRadio() async {
    try {
      Uri url = Uri.parse(_baseUrl + _radioEndPoint);
      http.Response response = await http.get(url);
      final json = jsonDecode(response.body);
      RadioModel radioModel = RadioModel.fromJson(json);
      return radioModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<ReciterModel> getReciters() async {
    try {
      Uri url = Uri.parse(_baseUrl + _recitersEndPoint);
      http.Response response = await http.get(url);
      final json = jsonDecode(response.body);
      ReciterModel reciterModel = ReciterModel.fromJson(json);
      return reciterModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
