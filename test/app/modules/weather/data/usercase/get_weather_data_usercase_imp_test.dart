import 'package:cloudwalkone/app/core/models/weather_model.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/modules/weather/data/usercase/get_weather_data_usercase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalkone/app/modules/weather/data/datasource/weather_data/get_weather_data_datasource.dart';


class MockGetWeatherDataDatasource extends GetWeatherDataDatasource {
  @override
  Future<Map<String, dynamic>> call({WeatherEntity? data}) async {
    // Mock response data for testing
    return {
      'temperature': 25.5,
      'humidity': 70,
      'windSpeed': 10.0,
      // Add other necessary fields based on your actual implementation
    };
  }
}

void main() {
  test('GetWeatherDataUsercase should return WeatherData on success', () async {
    // Arrange
    final datasource = MockGetWeatherDataDatasource();
    final usecase = GetWeatherDataUsercaseImp(datasource: datasource);
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current, queryType: OpenWeatherApiQueryType.latlon, queries: []);

    // Act
    final result = await usecase.call(data: weatherEntity);

    // Assert
    expect(result.isSuccess, true);
    expect(result.getOrThrow(), isA<WeatherData>());
  });

  test('GetWeatherDataUsercase should return ServerFailure on failure', () async {
    // Arrange
    final datasource = MockGetWeatherDataDatasource();
    final usecase = GetWeatherDataUsercaseImp(datasource: datasource);
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current, queryType: OpenWeatherApiQueryType.latlon, queries: []);

    // Act
    final result = await usecase.call(data: weatherEntity);

    // Assert
    expect(result.isError(), true);
  });
}
