

import 'package:cofe_app/features/profile/data/DataSource/profileRemoteDataSource.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:cofe_app/features/profile/domain/profile_repository/profile_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/ error/exceptions.dart';
import '../../../../core/ error/failure.dart';

class ProfileRepositoryImpl implements ProfileRepository {
final ProfileRemoteDataSource profileRemoteDataSource;

ProfileRepositoryImpl(this.profileRemoteDataSource);

// CREATE PROFILE
@override
Future<Either<Failure, ProfileEntity>> createProfile({
  required String fullName,
  String? phoneNumber,
  String? avatarUrl,
}) async {
  try {
    final profile = await profileRemoteDataSource.createProfile(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
    );

    return Right(profile);
  } on UnauthorizedException catch (e) {
    return Left(UnauthorizedFailure(e.message));
  } on ValidationException catch (e) {
    return Left(ValidationFailure(e.message));
  } on ConflictException catch (e) {
    return Left(ConflictFailure(e.message));
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on UnknownException catch (e) {
    return Left(UnknownFailure(e.message));
  }
}

// GET PROFILE
@override
Future<Either<Failure, ProfileEntity>> getProfile() async {
  try {
    final profile = await profileRemoteDataSource.getProfile();

    return Right(profile);
  } on UnauthorizedException catch (e) {
    return Left(UnauthorizedFailure(e.message));
  } on NotFoundException catch (e) {
    return Left(NotFoundFailure(e.message));
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on UnknownException catch (e) {
    return Left(UnknownFailure(e.message));
  }
}

// UPDATE PROFILE
@override
Future<Either<Failure, ProfileEntity>> updateProfile({
  String? fullName,
  String? phoneNumber,
  String? avatarUrl,
}) async {
  try {
    final profile = await profileRemoteDataSource.updateProfile(
      fullName: fullName,
      phoneNumber: phoneNumber,
      avatarUrl: avatarUrl,
    );

    return Right(profile);
  } on UnauthorizedException catch (e) {
    return Left(UnauthorizedFailure(e.message));
  } on NotFoundException catch (e) {
    return Left(NotFoundFailure(e.message));
  } on ValidationException catch (e) {
    return Left(ValidationFailure(e.message));
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on UnknownException catch (e) {
    return Left(UnknownFailure(e.message));
  }
}


// DELETE PROFILE
@override
Future<Either<Failure, ProfileEntity>> deleteProfile() async {
try {
final profile = await profileRemoteDataSource.deleteProfile();

return Right(profile);
} on UnauthorizedException catch (e) {
return Left(UnauthorizedFailure(e.message));
} on NotFoundException catch (e) {
return Left(NotFoundFailure(e.message));
} on NetworkException catch (e) {
return Left(NetworkFailure(e.message));
} on ServerException catch (e) {
return Left(ServerFailure(e.message));
} on UnknownException catch (e) {
return Left(UnknownFailure(e.message));
}
}
}
