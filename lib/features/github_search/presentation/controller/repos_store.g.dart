// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReposStore on _ReposStoreBase, Store {
  final _$stateAtom = Atom(name: '_ReposStoreBase.state');

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userRepositoriesAtom = Atom(name: '_ReposStoreBase.userRepositories');

  @override
  List<Repos> get userRepositories {
    _$userRepositoriesAtom.reportRead();
    return super.userRepositories;
  }

  @override
  set userRepositories(List<Repos> value) {
    _$userRepositoriesAtom.reportWrite(value, super.userRepositories, () {
      super.userRepositories = value;
    });
  }

  final _$getUserRepositoriesAsyncAction =
      AsyncAction('_ReposStoreBase.getUserRepositories');

  @override
  Future getUserRepositories({required String userName}) {
    return _$getUserRepositoriesAsyncAction
        .run(() => super.getUserRepositories(userName: userName));
  }

  @override
  String toString() {
    return '''
state: ${state},
userRepositories: ${userRepositories}
    ''';
  }
}
