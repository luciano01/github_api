import 'package:github_api/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';
import 'package:github_api/features/github_search/domain/repositories/repos_repository.dart';

class GetUserRepositories implements ReposRepository {
  final ReposRepository repository;

  GetUserRepositories({required this.repository});

  @override
  Future<Either<Failure, Repos>> getUserRepositories(
      {required String userName}) async {
    return await repository.getUserRepositories(userName: userName);
  }
}
