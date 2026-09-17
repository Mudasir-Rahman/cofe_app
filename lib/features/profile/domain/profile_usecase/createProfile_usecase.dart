import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:cofe_app/features/profile/domain/profile_repository/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class CreateProfileUsecase extends UseCase<ProfileEntity, CreateProfileUsecaseParams> {
  final ProfileRepository profileRepository;
  CreateProfileUsecase(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(CreateProfileUsecaseParams params) {
    return profileRepository.createProfile(
      fullName: params.fullName,
      phoneNumber: params.phoneNumber,
      avatarUrl: params.avatarUrl,
    );
  }
}

class CreateProfileUsecaseParams {
  final String fullName;
  final String? phoneNumber;
  final String? avatarUrl;
  const CreateProfileUsecaseParams({
    required this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });
}


