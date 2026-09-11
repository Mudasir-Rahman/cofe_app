import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:cofe_app/features/profile/domain/profile_repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateprofileUsecase extends UseCase<ProfileEntity,UpdateprofileParams>{
  ProfileRepository profileRepository;
  UpdateprofileUsecase(this.profileRepository);
  @override
Future<Either<Failure, ProfileEntity>>call(UpdateprofileParams params){
    return profileRepository.updateProfile(
      fullName: params.fullName,
        avatarUrl: params.avatarUrl,
        phoneNumber: params.phoneNumber,
    );
  }}


class UpdateprofileParams{
  final String? fullName;
  final String? phoneNumber;
  final String? avatarUrl;

  const UpdateprofileParams({
   required this.fullName,
    this.phoneNumber,
    this.avatarUrl,
});
}