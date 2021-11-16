import 'package:dartz/dartz.dart';
import 'package:github_api/core/error/failures.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';

abstract class ReposRepository {
  Future<Either<Failure, List<Repos>>> getUserRepositories(
      {required String userName});
}
