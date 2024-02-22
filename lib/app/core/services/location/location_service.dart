import 'package:package_architecture/errors/models/error_model.dart';
import 'package:result_dart/result_dart.dart';

import 'model/location_model.dart';

abstract class LocationService {
  Future<Result<LocationModel, ErrorModel>> getCurrentPossition();
}
