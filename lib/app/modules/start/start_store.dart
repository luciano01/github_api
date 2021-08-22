import 'package:github_api/app/shared/repository/app_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  final IAppRepository _repository;

  _StartStoreBase(this._repository);

  @observable
  ObservableFuture listOfRepositories = ObservableFuture.value([]);

  @action
  getRepositories({String? user}) async {
    listOfRepositories = _repository.getRepositories(user: user).asObservable();
  }
}
