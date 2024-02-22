import 'dart:io';
import 'dart:math';

import 'package:cloudwalkone/app/core/services/location/location_service.dart';
import 'package:cloudwalkone/app/core/services/location/model/location_model.dart';
import 'package:package_api/package_api.dart';
import 'package:package_architecture/errors/models/error_model.dart';
import 'package:result_dart/src/result.dart';

class LocationApproximateService extends LocationService {
  ApiService apiService;
  LocationApproximateService({required this.apiService});

  @override
  Future<Result<LocationModel, ErrorModel>> getCurrentPossition() async {
    try {
      var ip = await _retrieveIPAddress();
      var position =
          await apiService.get(path: "http://ip-api.com/json/${ip.address}");
      return Result.success(LocationModel.fromJson({
        "lat": position.data["lat"].toString(),
        "lon": position.data["lon"].toString()
      }));
    } catch (e) {
      return Result.failure(ErrorModel());
    }
  }
}

Future<InternetAddress> _retrieveIPAddress() async {
  InternetAddress result;

  int code = Random().nextInt(255);
  var dgSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  dgSocket.readEventsEnabled = true;
  dgSocket.broadcastEnabled = true;
  Future<InternetAddress> ret =
      dgSocket.timeout(const Duration(milliseconds: 100), onTimeout: (sink) {
    sink.close();
  }).expand<InternetAddress>((event) {
    if (event == RawSocketEvent.read) {
      Datagram? dg = dgSocket.receive();
      if (dg != null && dg.data.length == 1 && dg.data[0] == code) {
        dgSocket.close();
        return [dg.address];
      }
    }
    return [];
  }).firstWhere((InternetAddress a) => a != null);

  dgSocket.send([code], InternetAddress("255.255.255.255"), dgSocket.port);
  return ret;
}
