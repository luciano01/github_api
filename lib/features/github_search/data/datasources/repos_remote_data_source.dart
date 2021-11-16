import 'dart:convert';

import 'package:github_api/core/error/exceptions.dart';
import 'package:github_api/features/github_search/data/models/repos_model.dart';
import 'package:http/http.dart' as http;

abstract class ReposRemoteDataSource {
  Future<List<ReposModel>> getUseRepositories({required String userName});
}

class ReposRemoteDataSourceImpl implements ReposRemoteDataSource {
  final http.Client client;

  ReposRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ReposModel>> getUseRepositories(
      {required String userName}) async {
    final response = await client.get(
      Uri.parse('https://api.github.com/users/$userName/repos'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ReposModel.fromJsonList(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
