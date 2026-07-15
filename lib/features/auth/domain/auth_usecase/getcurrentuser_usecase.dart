import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';
import '../repository/auth_repository.dart';

class GetCurrentUserUseCase extends UseCase<UserEntity? , getCurrentUserParams>{
  AuthRepository authRepository;
  GetCurrentUserUseCase(this.authRepository);
  @override
  Future<Either<Failure, UserEntity?>> call(getCurrentUserParams params) {
    return  authRepository.getCurrentUser();
  }
}
class getCurrentUserParams {
  const getCurrentUserParams();
}