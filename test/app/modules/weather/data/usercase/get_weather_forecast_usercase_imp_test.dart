import 'package:cloudwalkone/app/core/models/weather_forecast_model.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/modules/weather/data/usercase/get_weather_forecast_usercase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalkone/app/modules/weather/data/datasource/weather_forecast/get_weather_forecast_datasource.dart';

class MockGetWeatherForecastDatasource extends GetWeatherForecastDatasource {
  @override
  Future<Map<String, dynamic>> call({WeatherEntity? data}) async {
    // Mock response data for testing
    return {
      'cod': '200',
      'message': 0.01,
      'cnt': 5,
      // Add other necessary fields based on your actual implementation
    };
  }
}

void main() {
  test('GetWeatherForecastUsercase should return WeatherForecast on success', () async {
    // Arrange
    final datasource = MockGetWeatherForecastDatasource();
    final usecase = GetWeatherForecastUsercaseImp(datasource: datasource);
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current, queryType: OpenWeatherApiQueryType.latlon, queries: []);

    // Act
    final result = await usecase.call(data: weatherEntity);

    // Assert
    expect(result.isSuccess, true);
    expect(result.getOrThrow(), isA<WeatherForecast>());
  });

  test('GetWeatherForecastUsercase should return ServerFailure on failure', () async {
    // Arrange
    final datasource = MockGetWeatherForecastDatasource();
    final usecase = GetWeatherForecastUsercaseImp(datasource: datasource);
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current, queryType: OpenWeatherApiQueryType.latlon, queries: []);

    // Act
    final result = await usecase.call(data: weatherEntity);

    // Assert
    expect(result.isError(), true);
  });
}
