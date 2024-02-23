import 'package:cloudwalkone/app/app_store.dart';
import 'package:package_architecture/state/store_events/controller.dart';
import 'package:package_module/package_module.dart';

class SplashController extends BaseController {
  SplashController();
  init()async{
    ModularSinglito.get<AppStore>().initApp();
  }
}
