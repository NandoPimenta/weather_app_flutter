import 'package:cloudwalkone/app/core/services/location/location_approximate/location_approximate_service.dart';
import 'package:cloudwalkone/app/core/services/weather/weather_service.dart';
import 'package:cloudwalkone/app/core/stores/settings/settings_store.dart';
import 'package:package_api/package_api.dart';
import 'package:package_module/module/routes.dart';
import 'package:package_module/static_routes/app_routes.dart';
import 'core/services/location/location_geolocator/location_geolocator_service.dart';
import 'core/stores/user/user_store.dart';
import 'modules/weather/weather_route.dart';

class AppStore {
  SettingsStore settingsStore;
  ApiService apiService;
  LocationGeolocatorService locationGeolocatorService;
  LocationApproximateService approximateService;
  UserStore userStore;
  WeatherService weatherService;
  AppStore(
      {required this.settingsStore,
      required this.apiService,
      required this.locationGeolocatorService,
      required this.approximateService,
      required this.userStore,
      required this.weatherService
      }) {
    initApp();
  }

  initApp() async {
    
    weatherService.weatherBaseUrl = "https://api.openweathermap.org/data/";
    weatherService.weatherVersion = "2.5";
    weatherService.weatherApiKey = "1ea1e21de670cb24f38cea821293324b";
    await apiService.init(url: weatherService.weatherBaseUrl);
    await Future.delayed(const Duration(seconds: 2));
    await settingsStore.getSettings();
    var loc = await locationGeolocatorService.getCurrentPossition();

    loc.fold((success) {
      userStore.lat = success.lat!;
      userStore.lon = success.lon!;
       _goToRoute();
    }, (error) async {
      var locApproximate = await approximateService.getCurrentPossition();
      locApproximate.fold((success) {
        userStore.lat = success.lat!;
        userStore.lon = success.lon!;
        _goToRoute();
      }, (failure) {_goToRoute();});
    });
  }

  _goToRoute() {
    AppRoutes.navigation(path: StaticRoutes.get(WeatherRoute.list));
  }
}
