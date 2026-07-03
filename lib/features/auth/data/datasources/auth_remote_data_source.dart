import 'package:cofe_app/features/auth/data/model/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel>signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel>signIn({
    required String email,
    required String password,
  });
  Future<void>signOut();
  Future<UserModel>getCurrentUser();
}