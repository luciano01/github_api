import 'package:github_api/core/error/exceptions.dart';
import 'package:github_api/core/network/network_info.dart';
import 'package:github_api/features/github_search/data/datasources/repos_remote_data_source.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';
import 'package:github_api/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:github_api/features/github_search/domain/repositories/repos_repository.dart';

class ReposRepositoryImpl implements ReposRepository {
  final ReposRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ReposRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Repos>>> getUserRepositories(
      {required String userName}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRepos =
            await remoteDataSource.getUseRepositories(userName: userName);
        return Right(remoteRepos);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
