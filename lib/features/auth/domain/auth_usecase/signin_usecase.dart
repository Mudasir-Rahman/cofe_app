import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';
import 'package:cofe_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';

class SignInUseCase extends UseCase<UserEntity, SignInParams>{
  AuthRepository authRepository;
  SignInUseCase(this.authRepository);
@override
  Future<Either<Failure, UserEntity>> call(SignInParams params) {
return  authRepository.signIn(
    email: params.email,
    password: params.password);
}
}
class SignInParams {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });
}