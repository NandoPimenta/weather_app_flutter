import 'package:package_module/package_module.dart';
import 'weather_service.dart';

class WeatherServiceModule extends BaseModule {
  @override
  void exportedBinds(i) {
    i.addSingleton(WeatherService.new);
  }
}
