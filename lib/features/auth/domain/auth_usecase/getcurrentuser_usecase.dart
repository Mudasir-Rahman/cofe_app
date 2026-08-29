import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';
import 'package:cofe_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';



class GetCurrentUserUseCase
    extends UseCase<UserEntity, GetCurrentUserParams> {
  final AuthRepository authRepository;

  GetCurrentUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(
      GetCurrentUserParams params,
      ) {
    return authRepository.getCurrentUser();
  }
}

class GetCurrentUserParams {
  const GetCurrentUserParams();
}