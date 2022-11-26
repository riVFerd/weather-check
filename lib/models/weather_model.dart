import 'dart:convert';
import 'package:http/http.dart';

class WeatherModel {
  String cityName;
  String weather;
  String temp;

  WeatherModel(this.cityName, this.weather, this.temp);

  factory WeatherModel.fromJson(Map<String, dynamic> jsonObject) {
    return WeatherModel(
      jsonObject['name'],
      jsonObject['weather'][0]['main'],
      jsonObject['main']['temp'].toString(),
    );
  }

  static Future<WeatherModel> getWeather(String cityName) async {
    var apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=57e0534212a1fe5e76970964e124901a&units=metric');
    var jsonObject = json.decode((await get(apiUrl)).body);

    return WeatherModel.fromJson(jsonObject as Map<String, dynamic>);
  }
}
