import 'package:cloudwalkone/app/core/services/location/location_approximate/location_approximate_service.dart';
import 'package:package_module/package_module.dart';
import '../api/api_service_module.dart';
import 'location_geolocator/location_geolocator_service.dart';

class LocationServiceModule extends BaseModule {
  @override
  List<BaseModule> get imports => [
        ApiServiceModule(),
      ];

  @override
  void exportedBinds(i) {
    i.addSingleton(LocationGeolocatorService.new);
    i.addSingleton(LocationApproximateService.new);
  }
}
