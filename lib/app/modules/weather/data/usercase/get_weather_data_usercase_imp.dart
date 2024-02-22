import 'package:cloudwalkone/app/core/models/weather_model.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:package_architecture/errors/errors.dart';
import 'package:result_dart/src/result.dart';
import '../../domain/get_weather_data_usercase.dart';
import '../datasource/weather_data/get_weather_data_datasource.dart';

class GetWeatherDataUsercaseImp extends GetWeatherDataUsercase {
  GetWeatherDataDatasource datasource;

  GetWeatherDataUsercaseImp({required this.datasource});

  @override
  Future<Result<WeatherData, CodeFailure>> call({WeatherEntity? data}) async {
    try {
      var resp = await datasource(data: data!);

      return Result.success(WeatherData.fromJson(resp));
    } catch (e) {
      return Result.failure(ServerFailure(error: ErrorModel.unknownError()));
    }
  }
}
