import 'package:prolego/utiles.dart';

class WeatherData {
  double _temp, _windSpeed;
  int _humidity;
  String? _desc;

  WeatherData(this._temp, this._humidity, this._windSpeed, this._desc);

  ///With the Weather.toJson constructor They are two possible ways ie
  ///1.)Initialize the  main constructor with the Json map or initialize directly the private x-tics
  ///2.)Return an instance already usable of the WeatherData class
  ///NB:The two methods will give the same result i.e producing an instance of the weatherData class
  factory WeatherData.toJson(Map<String, dynamic> json) {
    return WeatherData(json['main']['temp'], json['main']['humidity'],
        json['wind']['speed'], json['weather'][0]['description']);
  }

  ///Create a  List variable that will receive the getter all together method.
  ///That will enable not to have initialize each element separately.
  void setWeatherData(
      double temp, int humidity, double windSpeed, String desc) {
    _temp = temp;
    _humidity = humidity;
    _windSpeed = windSpeed;
    _desc = desc;
  }

  List getWeatherData() {
    return [
      subtract(_temp, 273).toStringAsFixed(2),
      _humidity,
      _windSpeed,
      _desc
    ];
  }
}

// TODO: Encapsulate the model entities to private private getter and setters of the WeatherLocation class to modify all the elements at onces}

class WeatherLocation {
  double? _long, _lat;
  String? _city, _country;
  WeatherLocation(this._lat, this._long, this._city, this._country);

  ///With the Weather.toJson constructor They are two possible ways ie
  ///1.)Initialize the  main constructor with the Json map or initialize directly the private x-tics
  ///2.)Return an instance already usable of the WeatherData class
  ///NB:The two methods will give the same result i.e producing an instance of the weatherData class
  factory WeatherLocation.toJson(Map<String, dynamic> json) {
    return WeatherLocation(json['coord']['lat'], json['coord']['long'],
        json['name'], json['sys']['country']);
  }

  ///Create a  List variable that will receive the getter all together method.
  ///That will enable not to have initialize each element separately.
  void setLocationData(double long, double lat, String city, String country) {
    _long = long;
    _lat = lat;
    _city = city;
    _country = country;
  }

  List getLocationData() {
    return [_lat, _long, _city, _country];
  }
}

// TODO: Encapsulate the model entities to private private getter and setters to modify all the elements at onces
