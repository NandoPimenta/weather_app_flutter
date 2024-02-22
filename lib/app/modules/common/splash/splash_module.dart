import 'package:package_module/package_module.dart';
import 'splash_controller.dart';
import 'splash_page.dart';

class SplashModule extends BaseModule {
  @override
  void binds(i) {
    i.add(SplashController.new);
  }

  @override
  void routes(r) {
    r.child(StaticRoutes.initial,
        child: (context) => SplashPage(
              controller: ModularSinglito.get(),
            ));
  }
}
