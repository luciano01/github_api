import 'package:flutter/material.dart';
import 'package:github_api/app/modules/starred/starred_Page.dart';
import 'package:github_api/app/modules/starred/starred_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StarredModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StarredStore()),
  ];

  @override
  Widget get view => StarredPage();
}
