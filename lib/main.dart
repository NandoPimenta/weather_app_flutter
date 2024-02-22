import 'package:flutter/material.dart';
import 'package:package_module/module/base_modular_app.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BaseModularApp(module: AppModule(), child: const AppWidget()));
}
