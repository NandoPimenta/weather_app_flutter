import 'package:cloudwalkone/app/core/services/location/model/location_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_architecture/package_architecture.dart';
import 'package:result_dart/result_dart.dart';

import '../location_service.dart';

class LocationGeolocatorService extends LocationService {
  @override
  Future<Result<LocationModel, ErrorModel>> getCurrentPossition() async {
    try {
      Position position = await _currentPosition();
      return Result.success(LocationModel.fromJson({
        "lat":position.latitude.toString(),
        "lon":position.longitude.toString()
      }));
    } catch (e) {
      return Result.failure(ErrorModel());
    }
  }

  Future<Position> _currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
