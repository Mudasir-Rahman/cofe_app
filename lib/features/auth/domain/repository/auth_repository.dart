import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });
Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
});
Future<Either<Failure, void>> signOut();
Future<Either<Failure, UserEntity>> getCurrentUser();
}