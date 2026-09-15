import 'package:cofe_app/features/profile/data/model/profile_model.dart';

abstract class  ProfileRemoteDataSource {
  Future<ProfileModel>createProfile(

  {
    required fullName ,
    required phoneNumber,
    required avatarUrl,

});

  Future<ProfileModel>updateProfile({
    required fullName ,
    required phoneNumber,
    required avatarUrl,
});
  Future<ProfileModel>getProfile();
  Future<ProfileModel>deleteProfile();
}