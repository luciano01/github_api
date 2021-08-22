// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$userProfileAtom = Atom(name: '_HomeStoreBase.userProfile');

  @override
  UserModel? get userProfile {
    _$userProfileAtom.reportRead();
    return super.userProfile;
  }

  @override
  set userProfile(UserModel? value) {
    _$userProfileAtom.reportWrite(value, super.userProfile, () {
      super.userProfile = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$listOfRepositoriesAtom =
      Atom(name: '_HomeStoreBase.listOfRepositories');

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

  final _$listOfStarredsAtom = Atom(name: '_HomeStoreBase.listOfStarreds');

  @override
  ObservableFuture<dynamic> get listOfStarreds {
    _$listOfStarredsAtom.reportRead();
    return super.listOfStarreds;
  }

  @override
  set listOfStarreds(ObservableFuture<dynamic> value) {
    _$listOfStarredsAtom.reportWrite(value, super.listOfStarreds, () {
      super.listOfStarreds = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_HomeStoreBase.getUser');

  @override
  Future getUser({String? user}) {
    return _$getUserAsyncAction.run(() => super.getUser(user: user));
  }

  final _$getRepositoriesAsyncAction =
      AsyncAction('_HomeStoreBase.getRepositories');

  @override
  Future getRepositories({String? user}) {
    return _$getRepositoriesAsyncAction
        .run(() => super.getRepositories(user: user));
  }

  final _$getStarredsAsyncAction = AsyncAction('_HomeStoreBase.getStarreds');

  @override
  Future getStarreds({String? user}) {
    return _$getStarredsAsyncAction.run(() => super.getStarreds(user: user));
  }

  @override
  String toString() {
    return '''
userProfile: ${userProfile},
isLoading: ${isLoading},
listOfRepositories: ${listOfRepositories},
listOfStarreds: ${listOfStarreds}
    ''';
  }
}
