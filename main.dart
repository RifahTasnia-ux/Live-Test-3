import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherInfoScreen(),
    );
  }
}

class WeatherInfoScreen extends StatelessWidget {
  final String jsonWeatherData =
  '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<dynamic> weatherData = json.decode(jsonWeatherData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          final cityWeather = weatherData[index];

          return Card(
            child: ListTile(
              title: Text(
                  'City: ${cityWeather['city']}',
                   style: TextStyle(fontSize: 18)
                     ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${cityWeather['temperature']}°C'),
                  Text('Condition: ${cityWeather['condition']}'),
                  Text('Humidity: ${cityWeather['humidity']}%'),
                  Text('Wind Speed: ${cityWeather['windSpeed']} m/s'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
