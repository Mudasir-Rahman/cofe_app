import 'package:cofe_app/core/%20error/failure.dart';
import 'package:cofe_app/features/profile/data/DataSource/profileRemoteDataSourceImpl.dart';
import 'package:cofe_app/features/profile/data/model/profile_model.dart';
import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase/src/supabase_client.dart';

import '../DataSource/profileRemoteDataSource.dart';

class ProfileRepositoryImpl implements ProfileRemoteDataSource{
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl(this.profileRemoteDataSource);

  @override
  Future<Either<Failure,ProfileEntity>> createProfile({
    required fullName,
    required phoneNumber,
    required avatarUrl

  }) async {
    try{
      final user=await profileRemoteDataSource.createProfile(
          fullName: fullName,
          phoneNumber: phoneNumber,
          avatarUrl: avatarUrl
      );

    }
    // TODO: implement createProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> deleteProfile() {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  // TODO: implement supabase
  SupabaseClient get supabase => throw UnimplementedError();

  @override
  Future<ProfileModel> updateProfile({required fullName, required phoneNumber, required avatarUrl}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

}