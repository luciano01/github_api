import 'package:github_api/app/modules/user_profile/userProfile_Page.dart';
import 'package:github_api/app/modules/user_profile/userProfile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => UserProfilePage(
        userProfile: args.data!,
      ),
    ),
  ];
}
