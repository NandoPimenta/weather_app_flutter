import 'package:package_module/package_module.dart';

import 'pages/weather_detail/weather_detail_module.dart';
import 'pages/weather_list/weather_list_module.dart';
import 'weather_route.dart';

class WeatherModule extends BaseModule {
  @override
  nameRoutes() {
    StaticRoutes.routes = {
      "weather": [
        Route(module: "list", tag: WeatherRoute.list),
        Route(module: "detail", tag: WeatherRoute.detail),
      ]
    };
  }

  @override
  void routes(r) {
    r.module(StaticRoutes.module(WeatherRoute.list),
        module: WeatherListModule());
    r.module(StaticRoutes.module(WeatherRoute.detail),
        module: WeatherDetailModule());
  }
}
