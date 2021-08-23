import 'package:dio/dio.dart';
import 'package:github_api/app/shared/custom_dio/custom_dio.dart';
import 'package:github_api/app/shared/models/repository_model.dart';
import 'package:github_api/app/shared/models/starred_model.dart';
import 'package:github_api/app/shared/models/user_model.dart';

import 'app_repository_interface.dart';

class AppRepository implements IAppRepository {
  late Dio _dio;

  AppRepository() {
    _dio = CustomDio().instance;
  }

  @override
  Future<UserModel?> getUser({String? user}) async {
    var url = 'users/$user';
    Response response = await _dio.get(url);
    var data = response.data;
    return UserModel.fromJson(data);
  }

  @override
  Future<List<RepositoryModel>?> getRepositories({String? user}) async {
    var baseUrl = '/users/$user/repos';
    Response response = await _dio.get(baseUrl);
    var data = response.data;
    return RepositoryModel.fromJsonList(data);
  }

  @override
  Future<List<StarredModel>?> getStarreds({String? user}) async {
    var baseUrl = '/users/$user/starred';
    Response response = await _dio.get(baseUrl);
    var data = response.data;
    return StarredModel.fromJsonList(data);
  }
}
