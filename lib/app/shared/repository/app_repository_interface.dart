import 'package:github_api/app/shared/models/owner_model.dart';
import 'package:github_api/app/shared/models/repository_model.dart';

abstract class IAppRepository {
  Future<List<RepositoryModel>?> getRepositories({String? user});
  Future<OwnerModel> getOwner();
}
