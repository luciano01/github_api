// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StartStore on _StartStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_StartStoreBase.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_StartStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$userProfileAtom = Atom(name: '_StartStoreBase.userProfile');

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

  final _$listOfStarredsAtom = Atom(name: '_StartStoreBase.listOfStarreds');

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

  final _$getUserDataAsyncAction = AsyncAction('_StartStoreBase.getUserData');

  @override
  Future<dynamic> getUserData({String? username}) {
    return _$getUserDataAsyncAction
        .run(() => super.getUserData(username: username));
  }

  final _$_StartStoreBaseActionController =
      ActionController(name: '_StartStoreBase');

  @override
  dynamic setErrorMessage(String? value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
userProfile: ${userProfile},
listOfRepositories: ${listOfRepositories},
listOfStarreds: ${listOfStarreds}
    ''';
  }
}
