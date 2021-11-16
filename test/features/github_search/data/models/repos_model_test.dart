import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/features/github_search/data/models/repos_model.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tReposModel = ReposModel(
    fullName: 'fullName',
    description: 'description',
    language: 'language',
    forksCount: 0,
  );

  final tListOfReposModel = <ReposModel>[tReposModel];

  setUp(() {});

  test('Should be a subclass of Repos entity.', () {
    // assert
    expect(tReposModel, isA<Repos>());
  });

  group('fromJson', () {
    test('Should return a valid JSON.', () {
      // arrange
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('repos.json'));
      // act
      final result = ReposModel.fromJson(jsonMap);
      // assert
      expect(result, tReposModel);
    });
  });

  group('fromListJson', () {
    test('Should return a valid List of Repos', () {
      // arrange
      final List list = jsonDecode(fixture('list_repos.json'));
      // act
      final result = ReposModel.fromJsonList(list);
      // assert
      expect(result, tListOfReposModel);
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data.', () {
      // act
      final result = tReposModel.toJson();
      // assert
      final expectedMap = {
        "full_name": "fullName",
        "description": "description",
        "language": "language",
        "forks_count": 0
      };
      expect(result, expectedMap);
    });
  });
}
