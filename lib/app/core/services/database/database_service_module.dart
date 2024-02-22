import 'package:package_database/package_database.dart';
import 'package:package_database/shared_preferences/shared_preferences_service.dart';
import 'package:package_module/package_module.dart';

class DataBaseServiceModule extends BaseModule {
  @override
  void exportedBinds(i) {
    i.addSingleton<DatabaseService>(SharedPreferencesService.new);
  }
}
