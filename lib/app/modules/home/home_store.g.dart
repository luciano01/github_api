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

  final _$getUserAsyncAction = AsyncAction('_HomeStoreBase.getUser');

  @override
  Future getUser({String? user}) {
    return _$getUserAsyncAction.run(() => super.getUser(user: user));
  }

  @override
  String toString() {
    return '''
userProfile: ${userProfile}
    ''';
  }
}
