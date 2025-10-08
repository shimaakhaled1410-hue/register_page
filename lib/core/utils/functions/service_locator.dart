import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_page/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:register_page/features/register/data/repos/register_repo_impl.dart';
import 'package:register_page/features/register/domain/use_cases/register_use_case.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // register firebaseAuth instance
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // register remote data source
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(getIt<FirebaseAuth>()),
  );

  // register repo implementation
  getIt.registerLazySingleton<RegisterRepoImpl>(
    () => RegisterRepoImpl(getIt<RegisterRemoteDataSource>()),
  );

  // register useCase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<RegisterRepoImpl>()),
  );
}
