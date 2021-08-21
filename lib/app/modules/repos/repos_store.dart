import 'package:mobx/mobx.dart';

part 'repos_store.g.dart';

class ReposStore = _ReposStoreBase with _$ReposStore;
abstract class _ReposStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}