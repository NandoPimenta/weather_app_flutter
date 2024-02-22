import 'package:cloudwalkone/app/core/models/weather_query_model.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';

import 'open_weather_model.dart';

class WeatherService {
   late OpenWeatherModel _openWeather;
    WeatherService(){
      _openWeather = OpenWeatherModel(apiKey: "",baseUrl: "",version: "");
    }
  String get weatherBaseUrl => _openWeather.baseUrl;
  set weatherBaseUrl(String s) => _openWeather.baseUrl = s;

  String get weatherApiKey => _openWeather.apiKey;
  set weatherApiKey(String s) => _openWeather.apiKey = s;

  String get weatherVersion => _openWeather.version;
  set weatherVersion(String s) => _openWeather.version = s;

  String mountByLatLonUrl(
      {required String lat,
      required String lon,
      OpenWeatherApiType type = OpenWeatherApiType.current}) {
    String typeCall = switch (type) {
      OpenWeatherApiType.current => "weather",
      OpenWeatherApiType.forecast => "forecast"
    };

    return "$weatherVersion/$typeCall?lat=$lat&lon=$lon&appid=$weatherApiKey";
  }

    String mountByQueryUrl(
      { required List<WeatherQuery> query,
      OpenWeatherApiType type = OpenWeatherApiType.current}) {
    String typeCall = switch (type) {
      OpenWeatherApiType.current => "weather",
      OpenWeatherApiType.forecast => "forecast"
    };
    String queries = query.map((e) => e.value).toList().toString().replaceAll("[","").replaceAll("]","");
    return "$weatherVersion/$typeCall?q=$queries&appid=$weatherApiKey";
  }
}
