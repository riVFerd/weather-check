import 'dart:async';

import 'package:assignment3/models/weather_model.dart';

class WeatherBloc {
  WeatherModel weatherModel = WeatherModel(" ", " ", " ");

  final _weatherController = StreamController<WeatherModel>();
  Stream<WeatherModel> get weatherStream => _weatherController.stream;

  void checkWeather(String cityName) async {
    weatherModel = await WeatherModel.getWeather(cityName);
    _weatherController.sink.add(weatherModel);
  }
}
