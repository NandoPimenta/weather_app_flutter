import 'package:package_architecture/package_architecture.dart';
import '../../../domain/entity/weather_entity.dart';

abstract class GetWeatherForecastDatasource extends Datasource<WeatherEntity> {}