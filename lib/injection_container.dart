import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'features/auth/data/repositories/auth_repositoriesimpl.dart';
import 'features/auth/domain/auth_usecase/getcurrentuser_usecase.dart';
import 'features/auth/domain/auth_usecase/signin_usecase.dart';
import 'features/auth/domain/auth_usecase/signout_usecase.dart';
import 'features/auth/domain/auth_usecase/singup_usecase.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/presentation/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Auth
  
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SingUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => Supabase.instance.client);
}
