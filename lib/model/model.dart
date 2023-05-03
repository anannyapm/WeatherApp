import 'package:flutter/material.dart';

class Weather {
  String? locationName;
  String? iconUrl;
  double? temperature;
  String? description;
  double? windSpeed;
  int? humidity;
  int? pressure;
  double? gust;
  int? windDegree;
  num? sunrise;
  num? sunset;

  Weather(
      {required this.locationName,
      required this.iconUrl,
      required this.temperature,
      required this.description,
      required this.gust,
      required this.humidity,
      required this.pressure,
      required this.windDegree,
      required this.windSpeed,
      required this.sunrise,
      required this.sunset});

  Weather.fromJson(Map<String, dynamic> json) {
    debugPrint("In constructor");
    try {
      final weather = json['weather'][0];
      final main = json['main'];
      final wind = json['wind'];
      final sys = json['sys'];
      final iconCode = weather['icon'];
      iconUrl = 'https://openweathermap.org/img/w/$iconCode.png';
      temperature = (main['temp'] - 273.15);
      description = weather['description'];
      locationName = json['name'];
      gust = wind['gust'];
      humidity = main['humidity'];
      pressure = main['pressure'];
      windDegree = wind['deg'];
      windSpeed = wind['speed'];
      sunrise = sys['sunrise'];
      sunset = sys['sunset'];
    } catch (e) {
      debugPrint(e.toString());
    }
  } 
}
