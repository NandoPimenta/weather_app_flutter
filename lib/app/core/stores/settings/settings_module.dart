import 'package:package_module/package_module.dart';
import '../../services/database/database_service_module.dart';
import 'settings_store.dart';

class SettingsModule extends BaseModule {
  @override
  List<BaseModule> get imports => [DataBaseServiceModule()];

  @override
  void binds(i) {
    i.addSingleton(SettingsStore.new);
    super.binds(i);
  }
}
