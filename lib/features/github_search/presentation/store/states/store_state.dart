import 'package:github_api/core/error/failures.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';

abstract class GitHubSearchState {}

class StartState implements GitHubSearchState {
  const StartState();
}

class LoadingState implements GitHubSearchState {
  const LoadingState();
}

class ErrorState implements GitHubSearchState {
  final Failure message;

  const ErrorState(this.message);
}

class SuccessState implements GitHubSearchState {
  final List<Repos> list;

  const SuccessState(this.list);
}
