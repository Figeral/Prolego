import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prolego/models/weather_data.dart';

class WeatherApi {
  bool isClicked = false;

  WeatherApi(bool param) {
    isClicked = param;
  }

  var apiKey = "f3e80f9ea67c6e61ad6e3bc2fd5efe34";
  String path = "/data/2.5/weather";
  String apiURL = "api.openweathermap.org";

  WeatherData? _data;
  WeatherLocation? _location;
  getWeatherDataFetched() => _data;
  getWeatherLocationFetched() => _location;

  Future<void> fetchFromApi(String inputCity) async {
    if (isClicked == true) {
      print("$isClicked");
      final response = await http.get(Uri.https(
          apiURL, path, {"appid": apiKey, "q": inputCity, "cnt": "1"}));
      print(response.body);
      try {
        if (response.statusCode.toString().startsWith("2")) {
          _data = WeatherData.toJson(jsonDecode(response.body));
          print(_data!.getWeatherData());
          _location = WeatherLocation.toJson(jsonDecode(response.body));
          print(_location!.getLocationData());
        } else {
          print("city not found ");
        }
      } on Exception catch (e) {
        print("Following error arise $e");
      }
    }
  }
}
