import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/core/error/exceptions.dart';
import 'package:github_api/features/github_search/data/datasources/repos_remote_data_source.dart';
import 'package:github_api/features/github_search/data/models/repos_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'repos_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ReposRemoteDataSourceImpl remoteDataSourceImpl;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    remoteDataSourceImpl = ReposRemoteDataSourceImpl(client: mockClient);
  });

  final tUserName = 'luciiano01';
  final tReposModel =
      ReposModel.fromJsonList(jsonDecode(fixture('list_repos.json')));

  test(
      'Should perform a GET request on a URL with userName being the endpoint and with application/json header.',
      () async {
    // arrange
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('list_repos.json'), 200));
    // act
    remoteDataSourceImpl.getUseRepositories(userName: tUserName);
    // assert
    verify(mockClient.get(
      Uri.parse('https://api.github.com/users/$tUserName/repos'),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  });

  test('Should return ReposModel when the responde code is 200 (success).',
      () async {
    // arrange
    when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('list_repos.json'), 200));
    // act
    final result =
        await remoteDataSourceImpl.getUseRepositories(userName: tUserName);
    // assert
    expect(result, equals(tReposModel));
  });

  test(
      'Should throw a ServerException when the response code is 4004 or other.',
      () async {
    // arrange
    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
    // act
    final result = remoteDataSourceImpl.getUseRepositories(userName: tUserName);
    // assert
    expect(result, throwsA(TypeMatcher<ServerException>()));
  });
}
