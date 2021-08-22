import 'package:github_api/app/shared/models/user_model.dart';
import 'package:github_api/app/shared/repository/app_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final IAppRepository _repository;

  _HomeStoreBase(this._repository);

  @observable
  UserModel? userProfile;

  @observable
  bool isLoading = false;

  @action
  getUser({String? user}) async {
    isLoading = true;
    try {
      await _repository.getUser(user: user).asObservable().then((value) async {
        if (value != null) {
          await getRepositories(user: user);
          await getStarreds(user: user);
          isLoading = false;
          userProfile = value;
        }
      });
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @observable
  ObservableFuture listOfRepositories = ObservableFuture.value([]);

  @observable
  ObservableFuture listOfStarreds = ObservableFuture.value([]);

  @action
  getRepositories({String? user}) async {
    listOfRepositories = _repository.getRepositories(user: user).asObservable();
  }

  @action
  getStarreds({String? user}) async {
    listOfStarreds = _repository.getStarreds(user: user).asObservable();
  }
}
