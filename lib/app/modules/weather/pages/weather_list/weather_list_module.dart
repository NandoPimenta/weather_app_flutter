import 'package:cloudwalkone/app/core/services/api/api_service_module.dart';
import 'package:cloudwalkone/app/core/services/weather/weather_module.dart';
import 'package:cloudwalkone/app/core/stores/user/user_module.dart';
import 'package:package_module/package_module.dart';
import 'data/datasource/weather_data/get_weather_data_datasource.dart';
import 'data/datasource/weather_data/get_weather_data_datasource_imp.dart';
import 'data/datasource/weather_forecast/get_weather_forecast_datasource.dart';
import 'data/datasource/weather_forecast/get_weather_forecast_datasource_imp.dart';
import 'data/usercase/get_weather_data_usercase_imp.dart';
import 'data/usercase/get_weather_forecast_usercase_imp.dart';
import 'domain/get_weather_data_usercase.dart';
import 'domain/get_weather_forecast_usercase.dart';
import 'weather_list_controller.dart';
import 'weather_list_page.dart';

class WeatherListModule extends BaseModule {
  @override
  List<BaseModule> get imports => [ApiServiceModule(), WeatherServiceModule(), UserModule()];

  @override
  void binds(i) {
    i.add<GetWeatherDataDatasource>(GetWeatherDataDatasourceImp.new);
    i.add<GetWeatherDataUsercase>(GetWeatherDataUsercaseImp.new);
    i.add<GetWeatherForecastDatasource>(GetWeatherForecastDatasourceImp.new);
    i.add<GetWeatherForecastUsercase>(GetWeatherForecastUsercaseImp.new);
    i.add(WeatherListController.new);
  }

  @override
  void routes(r) {
    r.child(StaticRoutes.initial,
        child: (context) => WeatherListPage(
              controller: ModularSinglito.get(),
            ));
  }
}
