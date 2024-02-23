import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/core/services/weather/weather_service.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:package_api/package_api.dart';

import 'get_weather_data_datasource.dart';

class GetWeatherDataDatasourceImp extends GetWeatherDataDatasource {
  ApiService apiService;
  WeatherService weatherService;

  GetWeatherDataDatasourceImp(
      {required this.apiService, required this.weatherService});

  @override
  Future<Map<String, dynamic>> call({WeatherEntity? data}) async {
    String path = switch (data!.queryType) {
      OpenWeatherApiQueryType.latlon => weatherService.mountByLatLonUrl(
          lat: data.lat!, lon: data.lon!, type: data.type),
      OpenWeatherApiQueryType.query =>
        weatherService.mountByQueryUrl(query: data.queries!, type: data.type),
    };
    var resp = await apiService.get(
      path: path,
    );

    return resp.data;
  }
}
