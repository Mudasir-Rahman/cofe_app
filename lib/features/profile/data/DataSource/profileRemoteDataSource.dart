import 'package:cofe_app/features/profile/data/model/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> createProfile({
    required String fullName,
    String? phoneNumber,
    String? avatarUrl,
  });

  Future<ProfileModel> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  });
  Future<ProfileModel> getProfile();
  Future<ProfileModel> deleteProfile();
}