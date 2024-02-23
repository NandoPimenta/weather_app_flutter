import 'package:cloudwalkone/app/core/constants/local_table_consts.dart';
import 'package:cloudwalkone/app/core/models/base_city_model.dart';
import 'package:cloudwalkone/app/core/models/weather_forecast_model.dart';
import 'package:cloudwalkone/app/core/models/weather_model.dart';
import 'package:package_database/package_database.dart';

class UserStore {
  DatabaseService databaseService;

  UserStore({required this.databaseService});
  WeatherData? currentWeather;
  List<WeatherForecast> listWeather = [];

  String lat = "";
  String lon = "";

  List<BaseCity> baseCity = [
    BaseCity(city: "Silverstone", country: "UK"),
    BaseCity(city: "São Paulo", country: "Brazil"),
    BaseCity(city: "Melbourne", country: "Australia"),
    BaseCity(city: "Monte Carlo", country: "Monaco"),
  ];

  

  saveCurrent(WeatherData currentWeather) async {
    this.currentWeather = currentWeather;
    await databaseService.save(LocalTableConstants.current, this.currentWeather!.toJson());
  }

  saveListWeather(WeatherForecast listWeather) async {
    this.listWeather.add(listWeather);
    await databaseService.save(LocalTableConstants.listBase, this.listWeather.map((e) => e.toJson()).toList());
  }

  getCurrent()async{
    var data = await databaseService.getAll(LocalTableConstants.current);
   
    if(data!=null && data.isNotEmpty){
      currentWeather = WeatherData.fromJson(data);
      return currentWeather;
    }
  }
  getListWeather()async{
    listWeather.clear();
    var data = await databaseService.getAll(LocalTableConstants.listBase);
    if(data!=null && data.isNotEmpty){
      for (var element in (data as List)) { 
        listWeather.add(WeatherForecast.fromJson(element));
      }
      return listWeather ?? [];
      
    }
  }
}
