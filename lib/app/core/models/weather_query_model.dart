
enum WeatherQueryType{
  city,
  country,
  state,
  zip,
  id
}

class WeatherQuery{
  String key;
  String value;
  WeatherQuery({required this.key, required this.value});
}