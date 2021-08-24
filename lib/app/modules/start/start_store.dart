import 'package:dio/dio.dart';
import 'package:github_api/app/shared/models/user_model.dart';
import 'package:github_api/app/shared/repository/app_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  final IAppRepository _repository;

  _StartStoreBase(this._repository);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  setErrorMessage(String? value) => errorMessage = value;

  @observable
  UserModel? userProfile;

  @observable
  ObservableFuture listOfRepositories = ObservableFuture.value([]);

  @observable
  ObservableFuture listOfStarreds = ObservableFuture.value([]);

  @action
  Future getUserData({String? username}) async {
    isLoading = true;
    try {
      await Future.wait([
        _getUserProfile(user: username),
        _getRepositories(user: username),
        _getStarreds(user: username),
      ]).whenComplete(() {
        isLoading = false;
      });
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

  Future _getUserProfile({String? user}) async {
    userProfile = await _repository.getUserProfile(user: user).asObservable();
  }

  Future _getRepositories({String? user}) async {
    listOfRepositories = _repository.getRepositories(user: user).asObservable();
  }

  Future _getStarreds({String? user}) async {
    listOfStarreds = _repository.getStarreds(user: user).asObservable();
  }
}
