import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';
import 'package:github_api/features/github_search/domain/repositories/repos_repository.dart';
import 'package:github_api/features/github_search/domain/usecases/get_user_repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_repositories_test.mocks.dart';

@GenerateMocks([ReposRepository])
void main() {
  late GetUserRepositories usecase;
  late MockReposRepository mockReposRepository;

  setUp(() {
    mockReposRepository = MockReposRepository();
    usecase = GetUserRepositories(repository: mockReposRepository);
  });

  final tUserName = 'luciano01';

  final tRepos = Repos(
    fullName: 'fullName',
    description: 'description',
    language: 'language',
    forksCount: 0,
  );

  final listOfRepos = <Repos>[tRepos];

  test('Should a List<Repos> from the repository.', () async {
    // arrange
    when(mockReposRepository.getUserRepositories(userName: tUserName))
        .thenAnswer((_) async => Right(listOfRepos));
    // act
    final result = await usecase.getUserRepositories(userName: tUserName);
    // assert
    expect(result, Right(listOfRepos));
    verify(mockReposRepository.getUserRepositories(userName: tUserName));
    verifyNoMoreInteractions(mockReposRepository);
  });
}
