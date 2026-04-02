import 'package:fruits_market/core/services/auth_service.dart';
import 'package:fruits_market/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_market/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authService: getIt<AuthService>()),
  );
}
