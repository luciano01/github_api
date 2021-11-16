import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_api/core/error/exceptions.dart';
import 'package:github_api/core/error/failures.dart';
import 'package:github_api/core/network/network_info.dart';
import 'package:github_api/features/github_search/data/datasources/repos_remote_data_source.dart';
import 'package:github_api/features/github_search/data/models/repos_model.dart';
import 'package:github_api/features/github_search/data/repositories/repos_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repos_repository_impl_test.mocks.dart';

@GenerateMocks([
  ReposRemoteDataSource,
  NetworkInfo,
])
void main() {
  late ReposRepositoryImpl reposRepositoryImpl;
  late MockReposRemoteDataSource mockReposRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockReposRemoteDataSource = MockReposRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    reposRepositoryImpl = ReposRepositoryImpl(
      remoteDataSource: mockReposRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final tReposModel = ReposModel(
    fullName: 'fullName',
    description: 'description',
    language: 'language',
    forksCount: 0,
  );
  final listOfReposModel = <ReposModel>[tReposModel];

  final listOfRepos = listOfReposModel;

  final tUserName = 'luciiano01';

  group('Device is Online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
        'Should return remote data when call to remote data source is successful.',
        () async {
      // arrange
      when(mockReposRemoteDataSource.getUseRepositories(userName: tUserName))
          .thenAnswer((_) async => listOfReposModel);
      // act
      final result =
          await reposRepositoryImpl.getUserRepositories(userName: tUserName);
      // assert
      verify(mockReposRemoteDataSource.getUseRepositories(userName: tUserName));
      expect(result, equals(Right(listOfRepos)));
    });

    test(
        'Should return ServerFailure when the call to remote data source is unsuccessful.',
        () async {
      // arrange
      when(mockReposRemoteDataSource.getUseRepositories(userName: tUserName))
          .thenThrow(ServerException());
      // act
      final result =
          await reposRepositoryImpl.getUserRepositories(userName: tUserName);
      // assert
      verify(mockReposRemoteDataSource.getUseRepositories(userName: tUserName));
      verifyNoMoreInteractions(mockReposRemoteDataSource);
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
