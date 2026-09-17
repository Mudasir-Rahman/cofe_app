import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> createProfile({
    required String fullName,
    String? phoneNumber,
    String? avatarUrl,
  });
  Future<Either<Failure, ProfileEntity>>getProfile();
  Future<Either<Failure, ProfileEntity>> updateProfile({
    String? fullName,
    String? avatarUrl,
    String? phoneNumber,
  });
  Future<Either<Failure,ProfileEntity>>deleteProfile();

}