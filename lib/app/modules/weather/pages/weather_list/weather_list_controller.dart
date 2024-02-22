import 'package:cloudwalkone/app/core/models/base_city_model.dart';
import 'package:cloudwalkone/app/core/models/weather_forecast_model.dart';
import 'package:cloudwalkone/app/core/models/weather_model.dart';
import 'package:cloudwalkone/app/core/models/weather_query_model.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/core/stores/user/user_store.dart';
import 'package:cloudwalkone/app/modules/weather/domain/get_weather_data_usercase.dart';
import 'package:cloudwalkone/app/modules/weather/domain/get_weather_forecast_usercase.dart';
import 'package:cloudwalkone/app/modules/weather/weather_route.dart';
import 'package:cloudwalkone/app/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:package_architecture/state/store_events/controller.dart';
import 'package:package_module/package_module.dart';
import 'package:package_uikit/widgets/loading/loading_dialog.dart';

import '../../domain/entity/weather_entity.dart';

class WeatherListController extends BaseController {
  GetWeatherDataUsercase getWeatherdataUsercase;
  GetWeatherForecastUsercase getWeatherForecastUsercase;
  UserStore userStore;
  WeatherListController(
      {required this.getWeatherdataUsercase,
      required this.getWeatherForecastUsercase,
      required this.userStore});

  ValueNotifier<WeatherData?> currentWeather = ValueNotifier(null);
  ValueNotifier<WeatherForecast?> searchWeather = ValueNotifier(null);
  ValueNotifier<List<WeatherForecast>> listWeather = ValueNotifier([]);
  ValueNotifier<bool> listLoaded = ValueNotifier(false);

  String _searchCity = "";

  onChange(String s) {
    _searchCity = s;
  }

  searchByCity(context) async {
    LoadingDialog.show();
    searchWeather.value = null;
    var resp = await getWeatherForecastUsercase(
        data: WeatherEntity(
            type: OpenWeatherApiType.forecast,
            queryType: OpenWeatherApiQueryType.query,
            queries: [
          WeatherQuery(key: "city", value: _searchCity),
        ]));
    resp.fold((success) {
      searchWeather.value = success;
      LoadingDialog.dismiss();
    }, (failure) {
      LoadingDialog.dismiss();
      CustomDialog.errorDialog(context,
          title: "Erro", text: "Cidade não encontrada");
    });
  }

  init() async {
    await _currentWeather();
    for (var element in userStore.baseCity) {
      await _listWeather(element);
    }
    listLoaded.value = true;
  }

  _currentWeather() async {
    var resp = await getWeatherdataUsercase(
        data: WeatherEntity(
            type: OpenWeatherApiType.current,
            queryType: OpenWeatherApiQueryType.latlon,
            lat: userStore.lat,
            lon: userStore.lon));
    resp.fold((success) {
      currentWeather.value = success;
    }, (failure) {
      debugPrint("erro");
    });
  }

  _listWeather(BaseCity city) async {
    var resp = await getWeatherForecastUsercase(
        data: WeatherEntity(
            type: OpenWeatherApiType.forecast,
            queryType: OpenWeatherApiQueryType.query,
            queries: [
          WeatherQuery(key: "city", value: city.city),
          WeatherQuery(key: "country", value: city.country),
        ]));
    resp.fold((success) {
      listWeather.value.add(success);
    }, (failure) {
      debugPrint("erro");
    });
  }



  openDetail({required num id}){
    AppRoutes.pushNamed(path: StaticRoutes.get(WeatherRoute.detail),argument: id);
  }

}
