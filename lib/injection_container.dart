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
import 'features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'features/profile/data/DataSource/profileRemoteDataSource.dart';
import 'features/profile/data/DataSource/profileRemoteDataSourceImpl.dart';
import 'features/profile/data/profile_repository/profile_repository_impl.dart';
import 'features/profile/domain/profile_repository/profile_repository.dart';
import 'features/profile/domain/profile_usecase/createProfile_usecase.dart';
import 'features/profile/domain/profile_usecase/deleteProfile_usecase.dart';
import 'features/profile/domain/profile_usecase/getProfile_usecase.dart';
import 'features/profile/domain/profile_usecase/updateProfile_usecase.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

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
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
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

  // Features - Profile
  sl.registerFactory(
    () => ProfileBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  sl.registerLazySingleton(() => CreateProfileUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProfileUsecase(sl()));
  sl.registerLazySingleton(() => GetProfileUsecase(sl()));

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl()),
  );

  // External
  sl.registerLazySingleton(() => Supabase.instance.client);
}
