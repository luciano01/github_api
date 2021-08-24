import 'package:github_api/app/modules/launch/launch_Page.dart';
import 'package:github_api/app/modules/launch/launch_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LaunchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LaunchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LaunchPage()),
  ];
}
