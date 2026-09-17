import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:cofe_app/features/profile/domain/profile_repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUsecase extends UseCase<ProfileEntity, UpdateProfileParams> {
  final ProfileRepository profileRepository;
  UpdateProfileUsecase(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(UpdateProfileParams params) {
    return profileRepository.updateProfile(
      fullName: params.fullName,
      avatarUrl: params.avatarUrl,
      phoneNumber: params.phoneNumber,
    );
  }
}

class UpdateProfileParams {
  final String? fullName;
  final String? phoneNumber;
  final String? avatarUrl;

  const UpdateProfileParams({
    this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });
}
