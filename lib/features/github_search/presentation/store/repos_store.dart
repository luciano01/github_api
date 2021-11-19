import 'package:github_api/features/github_search/domain/usecases/get_user_repositories.dart';
import 'package:github_api/features/github_search/presentation/store/states/store_state.dart';
import 'package:mobx/mobx.dart';
part 'repos_store.g.dart';

class ReposStore = _ReposStoreBase with _$ReposStore;

abstract class _ReposStoreBase with Store {
  final GetUserRepositories usecase;

  _ReposStoreBase({required this.usecase});

  @observable
  GitHubSearchState state = StartState();

  @action
  setState(GitHubSearchState value) => state = value;

  @action
  Future<GitHubSearchState> getUserRepositories(
      {required String userName}) async {
    setState(LoadingState());
    final result = await usecase.getUserRepositories(userName: userName);
    return result.fold((l) {
      setState(ErrorState(l));
      return ErrorState(l);
    }, (r) {
      setState(SuccessState(r));
      return SuccessState(r);
    });
  }
}
