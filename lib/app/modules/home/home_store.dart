import 'package:dio/dio.dart';
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

  @observable
  String? errorMessage;

  @action
  setErrorMessage(String? value) => errorMessage = value;

  @action
  Future getAllDatas({String? username}) async {
    isLoading = true;
    try {
      await Future.wait([
        getUserProfile(user: username),
        getRepositories(user: username),
        getStarreds(user: username),
      ]);
    } on DioError catch (error) {
      isLoading = false;
      if (error.response?.statusCode == 403) {
        print('DIO ERROR: ${error.message}');
        errorMessage = error.message;
      } else {
        print('DIO ERROR: $error');
        errorMessage = error.message;
      }
    }
  }

  @action
  Future getUser({String? user}) async {
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
  Future getUserProfile({String? user}) async {
    userProfile = await _repository.getUser(user: user).asObservable();
  }

  @action
  Future getRepositories({String? user}) async {
    listOfRepositories = _repository.getRepositories(user: user).asObservable();
  }

  @action
  Future getStarreds({String? user}) async {
    listOfStarreds = _repository.getStarreds(user: user).asObservable();
  }
}
