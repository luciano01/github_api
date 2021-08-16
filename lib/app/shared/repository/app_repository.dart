import 'package:dio/dio.dart';
import 'package:github_api/app/shared/custom_dio/custom_dio.dart';
import 'package:github_api/app/shared/models/owner_model.dart';
import 'package:github_api/app/shared/models/repository_model.dart';

import 'app_repository_interface.dart';

class AppRepository implements IAppRepository {
  late Dio _dio;

  AppRepository() {
    _dio = CustomDio().instance;
  }

  @override
  Future<List<RepositoryModel>?> getRepositories({String? user}) async {
    var baseUrl = user == null ? '/repositories' : '/users/$user/repos';
    Response response = await _dio.get(baseUrl);
    var data = response.data;
    return RepositoryModel.fromJsonList(data);
  }

  @override
  Future<OwnerModel> getOwner() {
    throw UnimplementedError();
  }
}
