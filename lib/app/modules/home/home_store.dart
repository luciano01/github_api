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

  @action
  getUser({String? user}) async {
    userProfile = await _repository.getUser(user: user).asObservable();
  }
}
