import 'package:cofe_app/core/%20error/exceptions.dart';
import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/features/profile/data/DataSource/profileRemoteDataSource.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:cofe_app/features/profile/domain/profile_repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> createProfile({
    required fullName,
    required phoneNumber,
    required avatarUrl
  }) async {
    try {
      final user = await profileRemoteDataSource.createProfile(
          fullName: fullName,
          phoneNumber: phoneNumber,
          avatarUrl: avatarUrl
      );
      return Right(user);
    } on
    UnauthorizedFailure catch (e) {
      throw left(UnauthorizedException(e.message));
    }
  }
  @override
  Future<Either<Failure, ProfileEntity>> deleteProfile() {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile({required fullName, required avatarUrl, required phoneNumber}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

}