import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/core/services/weather/weather_service.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:package_api/package_api.dart';

import 'get_weather_forecast_datasource.dart';

class GetWeatherForecastDatasourceImp extends GetWeatherForecastDatasource {
  ApiService apiService;
  WeatherService weatherService;

  GetWeatherForecastDatasourceImp(
      {required this.apiService, required this.weatherService});

  @override
  Future<Map<String, dynamic>> call({WeatherEntity? data}) async {
    String path = switch (data!.queryType) {
      OpenWeatherApiQueryType.latlon => weatherService.mountByLatLonUrl(
          lat: data.lat!, lon: data.lon!, type: data.type),
      OpenWeatherApiQueryType.query =>
        weatherService.mountByQueryUrl(query: data.queries!, type: data.type,queryById: data.queryById),
    };

    var resp = await apiService.get(
      path: path,
    );

    return resp.data;
  }
}
