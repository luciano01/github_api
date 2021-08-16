import 'package:github_api/app/shared/repository/app_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IAppRepository _repository;

  HomeStoreBase(this._repository) {
    getRepositories();
  }

  @observable
  ObservableFuture listOfRepositories = ObservableFuture.value([]);

  @action
  getRepositories({String? user}) async {
    listOfRepositories = _repository.getRepositories(user: user).asObservable();
  }
}
