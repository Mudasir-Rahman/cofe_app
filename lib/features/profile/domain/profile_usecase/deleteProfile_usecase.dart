import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/profile_entity.dart';
import '../profile_repository/profile_repository.dart';

class DeleteProfileUsecase
    extends UseCase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  DeleteProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) {
    return profileRepository.deleteProfile();
  }
}
