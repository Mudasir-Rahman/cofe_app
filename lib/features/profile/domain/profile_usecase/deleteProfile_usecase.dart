import 'package:dartz/dartz.dart';

import '../../../../core/ error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../profile_repository/profile_repository.dart';

class DeleteProfileUsecase
    extends UseCase<void, NoParams> {
  final ProfileRepository profileRepository;

  DeleteProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return profileRepository.deleteProfile();
  }
}