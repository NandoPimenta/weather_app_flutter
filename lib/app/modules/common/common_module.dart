import 'package:package_module/package_module.dart';

import 'common_route.dart';
import 'splash/splash_module.dart';

class CommonModule extends BaseModule {
  
    @override
  nameRoutes() {
    StaticRoutes.routes = {
      "/":[
      Route(module: "", tag: CommonRoute.splash),
   
    ]
    };
  }


  @override
  void routes(r) {
    r.module(StaticRoutes.initial, module: SplashModule());
   
  }
}
