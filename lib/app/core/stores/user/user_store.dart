import 'package:cloudwalkone/app/core/models/base_city_model.dart';
import 'package:package_database/package_database.dart';

class UserStore {
  DatabaseService databaseService;

  UserStore({required this.databaseService});

  String lat = "";
  String lon = "";

  List<BaseCity> baseCity = [
    BaseCity(city: "Silverstone", country: "UK"),
    BaseCity(city: "São Paulo", country: "Brazil"),
    BaseCity(city: "Melbourne", country: "Australia"),
    BaseCity(city: "Monte Carlo", country: "Monaco"),
  ];
}
