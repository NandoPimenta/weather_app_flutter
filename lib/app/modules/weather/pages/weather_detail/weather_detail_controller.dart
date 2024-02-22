import 'package:cloudwalkone/app/core/models/weather_forecast_model.dart';
import 'package:cloudwalkone/app/core/models/weather_query_model.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:package_architecture/state/store_events/controller.dart';

import '../../domain/get_weather_forecast_usercase.dart';

class WeatherDetailController extends BaseController {
  ValueNotifier<WeatherForecast?> weather = ValueNotifier(null);
  ValueNotifier<List<ListForecast>> listWeather = ValueNotifier([]);

  ValueNotifier<bool> listLoaded = ValueNotifier(false);
  GetWeatherForecastUsercase getWeatherForecastUsercase;
  WeatherDetailController({
    required this.getWeatherForecastUsercase,
  });
  late num id;

  init(id) {
    this.id = id;
    _getWeatherByCityId();
  }

  _getWeatherByCityId() async {
    var resp = await getWeatherForecastUsercase(
        data: WeatherEntity(
            queryById: true,
            type: OpenWeatherApiType.forecast,
            queryType: OpenWeatherApiQueryType.query,
            queries: [
          WeatherQuery(key: "id", value: id.toString()),
        ]));
    resp.fold((success) {
      weather.value = success;

      for (var element in weather.value!.list!) {
        var i = listWeather.value
            .indexWhere((e) => e.dateTime!.day == element.dateTime!.day);
        if (i == -1) {
          listWeather.value.add(element);
        }
      }

      listLoaded.value = true;
    }, (failure) {
      debugPrint("erro");
    });
  }
}
