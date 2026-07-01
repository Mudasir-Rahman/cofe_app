import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';
import 'package:cofe_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';

class SignOutUseCase extends UseCase<void , SignOutParams>{
  AuthRepository authRepository;
  SignOutUseCase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(SignOutParams params) {
    return  authRepository.signOut();
  }
}
class SignOutParams {
  const SignOutParams();
}

