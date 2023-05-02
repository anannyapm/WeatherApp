import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Column(
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
                    image: AssetImage("assets/cloud.png"), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Constant Line",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                const Text(
                  "Monday,03 March",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Image.asset(
                  'assets/icons8-clouds-48.png',
                  scale: 0.4,
                ),
                const Text(
                  "Cloudy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  "15 deg",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Wind",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            "assets/wind.png",
                            color: Colors.white,
                          ),
                          const Text(
                            "17.1 km/h",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            "assets/dir.png",
                            color: Colors.white,
                          ),
                          const Text(
                            "17.1 km/h",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            "assets/humidity.png",
                            color: Colors.white,
                          ),
                          const Text(
                            "17.1 km/h",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
        ],
      ),
    ));
  }
}
