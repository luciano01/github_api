import 'package:github_api/app/modules/home/home_module.dart';
import 'package:github_api/app/modules/start/start_module.dart';
import 'package:github_api/app/shared/repository/app_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
