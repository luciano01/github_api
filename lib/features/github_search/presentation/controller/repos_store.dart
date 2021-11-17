import 'package:github_api/core/error/failures.dart';
import 'package:github_api/core/utils/app_const.dart';
import 'package:github_api/core/utils/store_state.dart';
import 'package:github_api/features/github_search/domain/entities/repos.dart';
import 'package:github_api/features/github_search/domain/usecases/get_user_repositories.dart';
import 'package:mobx/mobx.dart';
part 'repos_store.g.dart';

class ReposStore = _ReposStoreBase with _$ReposStore;

abstract class _ReposStoreBase with Store {
  final GetUserRepositories usecase;

  _ReposStoreBase({required this.usecase}) : state = StoreState.initial;

  @observable
  StoreState state;

  @observable
  List<Repos> userRepositories = [];

  @action
  getUserRepositories({required String userName}) async {
    state = StoreState.loading;
    final result = await usecase.getUserRepositories(userName: userName);
    return result.fold((failure) => failureToMessage(failure), (listOfRepos) {
      userRepositories = listOfRepos;
      state = StoreState.loaded;
    });
  }

  String failureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppConst.serverFailureMessage;
      default:
        return AppConst.serverFailureDefault;
    }
  }
}
