import 'package:mobx/mobx.dart';

part 'starred_store.g.dart';

class StarredStore = _StarredStoreBase with _$StarredStore;
abstract class _StarredStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}