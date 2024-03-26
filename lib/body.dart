import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:prolego/homepage.dart';
import 'package:prolego/models/weather_data.dart';
import 'package:prolego/controller/api_fetcher.dart';

class Body extends StatefulWidget {
  final String value;
  Body({Key? key, required this.value}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

// final data = api.fetchData().getWeatherData();
// final loc = api.fetchLocation().getLocationData();

class _BodyState extends State<Body> {
  WeatherData? _data;
  WeatherLocation? _location;
  WeatherApi api = WeatherApi();
  void fetcher() {
    setState(() {
      try {
        print(widget.value);
        api.fetchFromApi("yaounde");
        _data = api.getWeatherDataFetched();

        _location = api.getWeatherLocationFetched();
      } catch (e) {
        print("The problem coming from :$e");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("Weather is ${_data?.getWeatherData()[0]}");
    fetcher();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 250,
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green, Colors.purple],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            // child: Lottie.asset("images/animation/rainy.json",
            //     alignment: Alignment.topCenter),
            child: Column(children: [
              Text("${_data?.getWeatherData()[0] ?? "Temperature here"}"),
              Text("${_location?.getLocationData()[0] ?? "Location here"}"),
            ])),
      ),
    );
  }
}
