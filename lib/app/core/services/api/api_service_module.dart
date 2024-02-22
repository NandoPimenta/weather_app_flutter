import 'package:package_api/package_api.dart';
import 'package:package_module/package_module.dart';

class ApiServiceModule extends BaseModule {
  @override
  void exportedBinds(i) {
    i.addSingleton(ApiService.new);
  }
}
