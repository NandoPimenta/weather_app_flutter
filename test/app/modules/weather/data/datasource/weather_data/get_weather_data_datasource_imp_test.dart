import 'package:cloudwalkone/app/core/services/weather/enum_open_weather.dart';
import 'package:cloudwalkone/app/modules/weather/data/datasource/weather_data/get_weather_data_datasource.dart';
import 'package:cloudwalkone/app/modules/weather/data/usercase/get_weather_data_usercase_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloudwalkone/app/modules/weather/domain/entity/weather_entity.dart';
import 'package:cloudwalkone/app/core/models/weather_model.dart';
import 'package:package_architecture/errors/errors.dart';
import 'package:result_dart/result_dart.dart';

class MockGetWeatherDataDatasource extends Mock implements GetWeatherDataDatasource {}

void main() {
  late GetWeatherDataUsercaseImp usecase;
  late MockGetWeatherDataDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockGetWeatherDataDatasource();
    usecase = GetWeatherDataUsercaseImp(datasource: mockDatasource);
  });

  group('GetWeatherDataUsercaseImp Tests', () {
    final weatherEntity = WeatherEntity(type: OpenWeatherApiType.current,queryType: OpenWeatherApiQueryType.latlon);

    test('should return WeatherData when the call to datasource is successful', () async {
      // Arrange
      when(mockDatasource(data: weatherEntity)).thenAnswer((_) async => {"data":""});

      // Act
      final result = await usecase.call(data: weatherEntity);

      // Assert
      expect(result, isA<Result<WeatherData, CodeFailure>>());
      expect(result.isSuccess, true);
    });

    test('should return ServerFailure when the datasource throws ServerException', () async {
      // Arrange
      when(mockDatasource(data: weatherEntity)).thenThrow(ServerException(/* Provide an error message */));

      // Act
      final result = await usecase.call(data: weatherEntity);

      // Assert
      expect(result, isA<Result<WeatherData, CodeFailure>>());
      expect(result.isError(), true);
    
    });

    test('should return ServerFailure with unknown error when an unexpected error occurs', () async {
      // Arrange
      when(mockDatasource(data: weatherEntity)).thenThrow(Exception('Unexpected error'));

      // Act
      final result = await usecase.call(data: weatherEntity);

      // Assert
      expect(result, isA<Result<WeatherData, CodeFailure>>());
      expect(result.isError(), true);
    });
  });
}