import 'package:cloudwalkone/app/core/stores/user/user_store.dart';
import 'package:package_module/package_module.dart';
import '../../services/database/database_service_module.dart';

class UserModule extends BaseModule {
  @override
  List<BaseModule> get imports => [DataBaseServiceModule()];

  @override
  void binds(i) {
    i.addSingleton(UserStore.new);
    super.binds(i);
  }
}
