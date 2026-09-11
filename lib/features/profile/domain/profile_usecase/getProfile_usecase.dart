
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:cofe_app/features/profile/domain/profile_repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';

class GetProfileUsecase
    extends UseCase< ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call (NoParams params) {
    return profileRepository.getProfile();
  }
}
class NoParams{
  NoParams();
}