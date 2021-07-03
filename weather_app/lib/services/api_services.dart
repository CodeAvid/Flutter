import 'dart:convert';

import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/services/api.dart';
import 'package:http/http.dart' as http;

class APIService {
  final API api;
  APIService(this.api);

  Future<WeatherData> currentWeatherStatus() async {
    final response = await http.get(api.currentWeatherUri());
    if (response.statusCode == 200) {
      String content = response.body;
      WeatherData _data = WeatherData.fromJson(json.decode(content));
      return _data;
    }
    throw response;
  }
}
