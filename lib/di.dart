import 'package:clean_architecture_flutter/features/auth/signup/data/repository/isTenant_available_repository_imp.dart%20copy/tenant_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/base/base_cache.dart';
import 'core/base/base_dio.dart';
import 'core/network/network_info.dart';
import 'features/auth/auth_checker/data/reposutory/auth_checker_repository_imp.dart';
import 'features/auth/auth_checker/domain/repository/auth_checker_repo.dart';
import 'features/auth/auth_checker/domain/use_case/auth_checker_use_case.dart';
import 'features/auth/auth_checker/presentation/bloc/auth_checker_bloc.dart';
import 'features/auth/signup/data/repository/password_repository_imp.dart/password_repo.dart';
import 'features/auth/signup/data/repository/signup_repository_imp.dart/signup_repo.dart';
import 'features/auth/signup/domain/repository/isTenant__available_repository.dart';
import 'features/auth/signup/domain/repository/password_validation_repository.dart';
import 'features/auth/signup/domain/repository/signup_repository.dart';
import 'features/auth/signup/domain/use_case/isTenant_available_use_vase.dart';
import 'features/auth/signup/domain/use_case/password_validation_use_case.dart';
import 'features/auth/signup/domain/use_case/signup_use_case.dart';
import 'features/auth/signup/presentation/bloc/sign_up_bloc.dart';

final GetIt getIt = GetIt.instance;

class AppDependencies {
  Future<void> initialize() async {
    // Business logic
    getIt.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
    getIt.registerLazySingleton<AuthCheckerBloc>(() => AuthCheckerBloc());

    // Use cases
    getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
    getIt.registerLazySingleton<IsTenantAvailableUseCase>(() => IsTenantAvailableUseCase(getIt()));
    getIt.registerLazySingleton<PasswordValidationUseCase>(
        () => PasswordValidationUseCase(getIt()));
    getIt.registerLazySingleton<AuthCheckerUseCase>(
        () => AuthCheckerUseCase(getIt()));

    // Repositories
    getIt.registerLazySingleton<AuthCheckerRepository>(
      () => AuthCheckerRepositoryImp(
        localData: getIt(),
        networkInfo: getIt(),
        remoteData: getIt(),
      ),
    );

    getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImp(
        localData: getIt(),
        networkInfo: getIt(),
        remoteData: getIt(),
      ),
    );
    getIt.registerLazySingleton<PasswordValidationsRepository>(
      () => PasswordRepositoryImp(
        localData: getIt(),
        networkInfo: getIt(),
        remoteData: getIt(),
      ),
    );
        getIt.registerLazySingleton<IsTenantValidationsRepository>(
      () => TenantRepositoryImp(
        localData: getIt(),
        networkInfo: getIt(),
        remoteData: getIt(),
      ),
    );

    // Core
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
    getIt.registerLazySingleton<TheHttpExecuter>(() => TheHttpExecuter());
    getIt.registerLazySingleton<Memento>(() => Memento(getIt()));

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }
}
