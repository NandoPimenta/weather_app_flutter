import 'package:cloudwalkone/app/core/services/api/api_service_module.dart';
import 'package:cloudwalkone/app/core/services/weather/weather_module.dart';
import 'package:cloudwalkone/app/modules/weather/data/datasource/weather_forecast/get_weather_forecast_datasource.dart';
import 'package:cloudwalkone/app/modules/weather/data/datasource/weather_forecast/get_weather_forecast_datasource_imp.dart';
import 'package:cloudwalkone/app/modules/weather/data/usercase/get_weather_forecast_usercase_imp.dart';
import 'package:cloudwalkone/app/modules/weather/domain/get_weather_forecast_usercase.dart';
import 'package:package_module/package_module.dart';

import 'weather_detail_controller.dart';
import 'weather_detail_page.dart';

class WeatherDetailModule extends BaseModule {
  @override
  List<BaseModule> get imports => [ApiServiceModule(), WeatherServiceModule()];

  @override
  void binds(i) {
    i.add<GetWeatherForecastDatasource>(GetWeatherForecastDatasourceImp.new);
    i.add<GetWeatherForecastUsercase>(GetWeatherForecastUsercaseImp.new);
    i.add(WeatherDetailController.new);
  }

  @override
  void routes(r) {
    r.child(StaticRoutes.initial,
        child: (context) => WeatherDetailPage(
              controller: ModularSinglito.get(),
              id: r.args.data,
            ));
  }
}
