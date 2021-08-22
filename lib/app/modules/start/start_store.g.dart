// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StartStore on _StartStoreBase, Store {
  final _$listOfRepositoriesAtom =
      Atom(name: '_StartStoreBase.listOfRepositories');

  @override
  ObservableFuture<dynamic> get listOfRepositories {
    _$listOfRepositoriesAtom.reportRead();
    return super.listOfRepositories;
  }

  @override
  set listOfRepositories(ObservableFuture<dynamic> value) {
    _$listOfRepositoriesAtom.reportWrite(value, super.listOfRepositories, () {
      super.listOfRepositories = value;
    });
  }

  final _$getRepositoriesAsyncAction =
      AsyncAction('_StartStoreBase.getRepositories');

  @override
  Future getRepositories({String? user}) {
    return _$getRepositoriesAsyncAction
        .run(() => super.getRepositories(user: user));
  }

  @override
  String toString() {
    return '''
listOfRepositories: ${listOfRepositories}
    ''';
  }
}
