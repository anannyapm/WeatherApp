import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/getlocation.dart';
import 'package:weather/model/model.dart';
import 'package:weather/services/base_client.dart';
import 'package:weather/string_extensions.dart';
import 'package:weather/widget/cardtext.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final client = WeatherApiCall();

  /* getWeatherData() async {
    final position = await getPosition();
    Weather data = await client.getData(11.25, 75.7667);
    return data;
  } */
  @override
  Widget build(BuildContext context) {
    final date = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
    List sector = ["N","NNE","NE","ENE","E","ESE","SE","SSE","S","SSW","SW","WSW","W","WNW","NW","NNW","N"];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: client.getData(11.25, 75.7667),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              height: size.height * 0.75,
              width: size.width,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 28, 47),
                      blurRadius: 2,

                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage("assets/cloud.png"),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data?.locationName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Image.network(
                    snapshot.data?.iconUrl,
                    scale: 0.5,
                  ),
                  Text(
                    "${snapshot.data?.description}".toTitleCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${(snapshot.data?.temperature).toStringAsFixed(2)}°",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Wind",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image.asset(
                              "assets/wind.png",
                              color: Colors.white,
                            ),
                             Text(
                              "${(snapshot.data?.windSpeed*3.6).toStringAsFixed(2)} km/hr",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Wind Direction",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image.asset(
                              "assets/dir.png",
                              color: Colors.white,
                            ),
                             Text(
                              "${sector[(((snapshot.data?.windDegree)%360)~/22.5)+1]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Humidity",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            Image.asset(
                              "assets/humidity.png",
                              color: Colors.white,
                            ),
                             Text(
                              "${snapshot.data?.humidity} %",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                         TextCard(property: "Gust", value: "${snapshot.data?.gust}"),
                        const SizedBox(
                          height: 25,
                        ),
                       TextCard(property: "Sunrise", value: "${DateFormat("hh:mm a").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data?.sunrise*1000))}"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                         TextCard(property: "Pressure", value: "${snapshot.data?.pressure} hPa"),
                        const SizedBox(
                          height: 25,
                        ),
                         TextCard(property: "Sunset", value: "${DateFormat("hh:mm a").format(DateTime.fromMillisecondsSinceEpoch(snapshot.data?.sunset*1000))}"),
                      ],
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        );
      },
    ));
  }
}
