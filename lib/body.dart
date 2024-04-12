import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:prolego/utiles.dart';
import 'package:flutter/material.dart';
import 'package:prolego/homepage.dart';
import 'package:prolego/models/weather_data.dart';
import 'package:prolego/controller/api_fetcher.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  String value;
  Body({Key? key, required this.value}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void didUpdateWidget(covariant Body oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      fetcher();
    }
  }

  WeatherData? _data;
  WeatherLocation? _location;
  WeatherApi api = WeatherApi(true);

  Future<void> fetcher() async {
    await api.fetchFromApi(widget.value);
    setState(() {
      try {
        print("Input value is ${widget.value}");
        _data = api.getWeatherDataFetched();
        print("Weather is ${_data?.getWeatherData()[0]}");
        _location = api.getWeatherLocationFetched();
      } catch (e) {
        print("The problem coming from :$e");
      }
    });
  }

  String getAnimation(String? mainDesc) {
    String value = "";
    if (mainDesc != null) {
      if (mainDesc.contains("cloud")) {
        value = "images/animation/cloudy.json";
      } else if (mainDesc.contains("drizzle")) {
        value = "images/animation/rainy.json";
      } else if (mainDesc.contains("rain")) {
        value = "images/animation/rainy.json";
      } else if (mainDesc.contains("thunder")) {
        value = "images/animation/storm.json";
      } else {
        value = "images/animation/sunny.json";
      }
    }
    return value;
  }

  @override
  void initState() {
    super.initState();
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
            child: Column(children: [
              Lottie.asset(getAnimation(_data?.getWeatherData()[3]),
                  alignment: Alignment.topCenter, width: 220, height: 170),
              const SizedBox(height: 20),
              Text(
                "${_location?.getLocationData()[2] ?? "City Hear"} / ${_location?.getLocationData()[3] ?? "Country Here"} ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.thermostat,
                    size: 30,
                  ),
                  Text(
                    " ${_data?.getWeatherData()[0] ?? "Temperature here"} °C",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.wind_power,
                    size: 30,
                  ),
                  Text(
                      " ${_location?.getLocationData()[0] ?? "Location here"} km/s",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ])),
      ),
    );
  }
}
