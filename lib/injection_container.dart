import 'package:get_it/get_it.dart';
import 'package:github_api/core/network/network_info.dart';
import 'package:github_api/features/github_search/data/datasources/repos_remote_data_source.dart';
import 'package:github_api/features/github_search/data/repositories/repos_repository_impl.dart';
import 'package:github_api/features/github_search/domain/repositories/repos_repository.dart';
import 'package:github_api/features/github_search/domain/usecases/get_user_repositories.dart';
import 'package:github_api/features/github_search/presentation/store/repos_store.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => ReposStore(
      usecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserRepositories(repository: sl()));

  // Repository
  sl.registerLazySingleton<ReposRepository>(
    () => ReposRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ReposRemoteDataSource>(
    () => ReposRemoteDataSourceImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
