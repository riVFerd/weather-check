import 'package:assignment3/bloc/weather_bloc.dart';
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
                  return const Text(
                      'Enter city name then click the "Check" button!');
                }
                String imageAsset;
                switch (snapshot.data.weather) {
                  case 'Clear':
                    imageAsset = 'assets/clear.png';
                    break;
                  case 'Clouds':
                    imageAsset = 'assets/cloudy.png';
                    break;
                  case 'Rain':
                    imageAsset = 'assets/rainy.png';
                    break;
                  default:
                    imageAsset = 'assets/other.png';
                }
                return Column(
                  children: [
                    Text(
                      snapshot.data.cityName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      imageAsset,
                      height: 200,
                    ),
                    Text(
                      '${snapshot.data.weather} | ${snapshot.data.temp} C',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: inputCityController,
                textAlign: TextAlign.center,
              ),
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
