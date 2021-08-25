import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'launch_store.g.dart';

class LaunchStore = _LaunchStoreBase with _$LaunchStore;

abstract class _LaunchStoreBase with Store {
  void waitAndSwitchToStartModule() async {
    await Future.delayed(Duration(seconds: 5)).whenComplete(() {
      Modular.to.pushReplacementNamed('/start');
    });
  }
}
