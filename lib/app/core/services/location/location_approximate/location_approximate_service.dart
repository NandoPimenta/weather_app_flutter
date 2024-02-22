import 'package:cloudwalkone/app/core/services/location/location_service.dart';
import 'package:cloudwalkone/app/core/services/location/model/location_model.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:package_api/package_api.dart';
import 'package:package_architecture/errors/models/error_model.dart';
import 'package:result_dart/src/result.dart';

class LocationApproximateService extends LocationService {
  ApiService apiService;
  LocationApproximateService({required this.apiService});

  @override
  Future<Result<LocationModel, ErrorModel>> getCurrentPossition() async {
    try {
      var ipAddress = IpAddress(type: RequestType.json);


      var ip = await  ipAddress.getIp();
      var position =
          await apiService.get(path: "http://ip-api.com/json/$ip");
      return Result.success(LocationModel.fromJson({
        "lat": position.data["lat"].toString(),
        "lon": position.data["lon"].toString()
      }));
    } catch (e) {
      return Result.failure(ErrorModel());
    }
  }
}

