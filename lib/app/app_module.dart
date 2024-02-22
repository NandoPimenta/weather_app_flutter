import 'package:cloudwalkone/app/core/services/api/api_service_module.dart';
import 'package:cloudwalkone/app/modules/weather/weather_module.dart';
import 'package:package_module/package_module.dart';
import 'app_base_route.dart';
import 'app_store.dart';
import 'core/services/location/location_module.dart';
import 'core/services/weather/weather_module.dart';
import 'core/stores/settings/settings_module.dart';
import 'core/stores/user/user_module.dart';
import 'core/theme/color/colors.dart';
import 'modules/common/common_module.dart';

class AppModule extends BaseModule {
  @override
  List<BaseModule> get imports => [
        SettingsModule(),
        ApiServiceModule(),
        UserModule(),
        LocationServiceModule(),
        WeatherServiceModule()
      ];

  @override
  nameRoutes() {
    StaticRoutes.routes = {
      "": [
        Route(module: "", tag: AppBaseRoute.common),
        Route(module: "weather", tag: AppBaseRoute.weather),
      ]
    };
  }

  @override
  void binds(i) {
    i.addSingleton(AppColor.new);
    i.addSingleton(AppStore.new);
  }

  @override
  void routes(r) {
    r.module(StaticRoutes.initial, module: CommonModule());
    r.module(StaticRoutes.module(AppBaseRoute.weather),
        module: WeatherModule());
  }
}
