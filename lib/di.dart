import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/base/base_cache.dart';
import 'core/base/base_dio.dart';
import 'core/network/network_info.dart';
import 'features/signup/data/repository/signup_repository_imp.dart/signup_repo.dart';
import 'features/signup/domain/repository/signup_repository.dart';
import 'features/signup/domain/use_case/signup_use_case.dart';
import 'features/signup/presentation/bloc/sign_up_bloc.dart';

final GetIt getIt = GetIt.instance;

class AppDependencies {


  Future<void> initialize() async {
    // Business logic
    getIt.registerLazySingleton<SignUpBloc>(() => SignUpBloc());

    // Use cases
    getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));

    // Repositories

    getIt.registerLazySingleton<SignUpRepository>(
          () => SignUpRepositoryImp(
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


