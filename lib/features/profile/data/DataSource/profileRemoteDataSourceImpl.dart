import 'package:cofe_app/features/profile/data/DataSource/profileRemoteDataSource.dart';
import 'package:cofe_app/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final SupabaseClient supabase;
  ProfileRemoteDataSourceImpl(this.supabase);

  @override
  Future<ProfileModel> createProfile({
    required fullName,
    required phoneNumber,
    required avatarUrl
  }) {
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
  Future<ProfileModel> updateProfile({required fullName, required phoneNumber, required avatarUrl}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

}