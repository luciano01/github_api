import 'package:flutter/material.dart';
import 'package:github_api/app/modules/repos/repos_Page.dart';
import 'package:github_api/app/modules/repos/repos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReposModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReposStore()),
  ];

  @override
  Widget get view => ReposPage();
}
