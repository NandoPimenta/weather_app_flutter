import 'package:cloudwalkone/app/core/models/weather_query_model.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';

class WeatherEntity {
  OpenWeatherApiType type;
  OpenWeatherApiQueryType queryType;
  String? lat;
  String? lon;
  List<WeatherQuery>? queries;
  WeatherEntity({required this.type, required this.queryType, this.lat, this.lon, this.queries});
}