import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';
import 'package:cofe_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';

class SingUpUseCase extends UseCase<UserEntity, SingUpParams>{
  AuthRepository authRepository;
  SingUpUseCase(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(SingUpParams params) {
    return  authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }

  }
class SingUpParams {
  final String name;
  final  String email;
  final String password;
  SingUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}