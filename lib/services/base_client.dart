import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/constants/constant.dart';
import 'package:weather/model/model.dart';

class WeatherApiCall {
  Future<dynamic> getData(double lat, double long) async {
    final userEndPoint = "lat=$lat&lon=$long&appid=$apiKey";
    final url = Uri.parse(baseUrl + userEndPoint);
    debugPrint(url.toString());

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseAsMap = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint(responseAsMap.toString());

      /* Weather data = Weather.fromJson(responseAsMap);
      debugPrint(data.locationName); */
      return Weather.fromJson(responseAsMap);
    } else {
      print("returning null");
      return null;
    }
  }
}
