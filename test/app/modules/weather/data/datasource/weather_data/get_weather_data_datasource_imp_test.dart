import 'package:cloudwalkone/app/core/services/weather/weather_service.dart';
import 'package:cloudwalkone/app/modules/weather/data/datasource/weather_data/get_weather_data_datasource_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:package_api/api/api_services.dart';




void main() {
  test('GetWeatherDataDatasourceImp should return data on success', () async {
    // Arrange
    final apiService = ApiService();
    final weatherService = WeatherService();
    final datasource = GetWeatherDataDatasourceImp(apiService: apiService, weatherService: weatherService);
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current, queryType: OpenWeatherApiQueryType.latlon, queries: []);

    // Act
    final result = await datasource.call(data: weatherEntity);

    // Assert
    expect(result, isA<Map<String, dynamic>>());
    // Add more specific assertions based on your actual implementation
  });

  test('GetWeatherDataDatasourceImp should throw an exception on failure', () async {
    // Arrange
    final apiService = ApiService(); // You can modify this to simulate a failure
    final weatherService = WeatherService();
    final datasource = GetWeatherDataDatasourceImp(apiService: apiService, weatherService: weatherService);
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current, queryType: OpenWeatherApiQueryType.latlon, queries: []);

    // Act
    expect(() => datasource.call(data: weatherEntity), throwsA(isA<Exception>()));
    // Add more specific assertions based on your actual implementation
  });
}
