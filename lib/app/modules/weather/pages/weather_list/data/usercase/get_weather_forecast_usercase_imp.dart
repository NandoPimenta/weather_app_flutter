import 'package:cloudwalkone/app/core/models/weather_forecast_model.dart';
import 'package:cloudwalkone/app/modules/weather/pages/weather_list/domain/entity/weather_entity.dart';
import 'package:package_architecture/errors/errors.dart';
import 'package:result_dart/src/result.dart';
import '../../domain/get_weather_forecast_usercase.dart';
import '../datasource/weather_forecast/get_weather_forecast_datasource.dart';

class GetWeatherForecastUsercaseImp extends GetWeatherForecastUsercase {
  GetWeatherForecastDatasource datasource;

  GetWeatherForecastUsercaseImp({required this.datasource});

  @override
  Future<Result<WeatherForecast, CodeFailure>> call({WeatherEntity? data}) async {
    try {
      var resp = await datasource(data: data!);

      return Result.success(WeatherForecast.fromJson(resp));
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(error: e.error));
    } catch (e) {
      return Result.failure(ServerFailure(error: ErrorModel.unknownError()));
    }
  }
}
