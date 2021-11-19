// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReposStore on _ReposStoreBase, Store {
  final _$stateAtom = Atom(name: '_ReposStoreBase.state');

  @override
  GitHubSearchState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GitHubSearchState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getUserRepositoriesAsyncAction =
      AsyncAction('_ReposStoreBase.getUserRepositories');

  @override
  Future<GitHubSearchState> getUserRepositories({required String userName}) {
    return _$getUserRepositoriesAsyncAction
        .run(() => super.getUserRepositories(userName: userName));
  }

  final _$_ReposStoreBaseActionController =
      ActionController(name: '_ReposStoreBase');

  @override
  dynamic setState(GitHubSearchState value) {
    final _$actionInfo = _$_ReposStoreBaseActionController.startAction(
        name: '_ReposStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_ReposStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
