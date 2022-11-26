import 'package:assignment3/bloc/weather_bloc.dart';
import 'package:assignment3/models/weather_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputCityController = TextEditingController();
  final weatherBloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: weatherBloc.weatherStream,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Enter city name then click the "Check" button!');
                }
                return Column(
                  children: [
                    Text('City Name: ${snapshot.data.cityName}'),
                    Text('Weather : ${snapshot.data.weather}'),
                    Text('Temperature : ${snapshot.data.temp} Celcius'),
                  ],
                );
              },
            ),
            TextField(
              controller: inputCityController,
            ),
            ElevatedButton(
              onPressed: () {
                weatherBloc.checkWeather(inputCityController.text);
              },
              child: const Text('Check'),
            )
          ],
        ),
      ),
    );
  }
}
