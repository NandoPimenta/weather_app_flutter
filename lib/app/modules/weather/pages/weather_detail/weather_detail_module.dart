import 'package:cloudwalkone/app/modules/weather/pages/weather_list/weather_list_controller.dart';
import 'package:package_module/package_module.dart';

import 'weather_detail_page.dart';

class WeatherDetailModule extends BaseModule {
  @override
  void binds(i) {
    i.add(WeatherListController.new);
  }

  @override
  void routes(r) {
    r.child(StaticRoutes.initial,
        child: (context) => WeatherDetailPage(
              controller: ModularSinglito.get(),
            ));
  }
}
