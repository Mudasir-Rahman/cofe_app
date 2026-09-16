import 'package:cofe_app/features/profile/data/DataSource/profileRemoteDataSource.dart';
import 'package:cofe_app/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient supabase;
  ProfileRemoteDataSourceImpl(this.supabase);

  @override
  Future<ProfileModel> createProfile({
    required fullName,
    required phoneNumber,
    required avatarUrl,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw Exception('user not login');
      }
      final response = await supabase
          .from('profile')
          .insert({
            'id': user.id,
            'full_name': fullName,
            'phone_number': phoneNumber,
            'avatar_url': avatarUrl,
          })
          .select()
          .single();
      return ProfileModel.fromJson(response);
    } catch (e) {
      throw Exception('Field to create profile $e');
    }
  }

  @override
  Future<ProfileModel> deleteProfile() async {
    try{
      final user = await supabase.auth.currentUser;
      if(user==null){
        throw Exception('User is no login');
      }
      final response =await supabase
      .from('profile')
      .delete()
      .eq('id', user.id)
      .select()
      .single();
      return ProfileModel.fromJson(response);
    }catch (e){
    throw Exception('Field to delete profile $e');
  }}

  @override
  Future<ProfileModel> getProfile() async {
    try{
      final user = await supabase.auth.currentUser;
      if(user==null){
        throw Exception('User is not Login ');
      }
      final response= await supabase
      .from('profile')
      .select()
      .eq('id', user.id)
      .select()
      .single();
      return ProfileModel.fromJson(response);
    }catch (e){


    throw Exception('Field to get the user data $e');
  }}

  @override
  Future<ProfileModel> updateProfile({
    required fullName,
    required phoneNumber,
    required avatarUrl,
  })async {
    try{
      final user = await supabase.auth.currentUser;
      if(user==null){
        throw Exception( 'User is not login ');
      }
      final response= await supabase
      .from('profile')
      .update({
        'full_name': fullName,
        'phone_number': phoneNumber,
        'avatar_url': avatarUrl,
      })
      .eq('id', user.id)
      .select()
      .single();
return ProfileModel.fromJson(response);
    }catch (e) {
      throw Exception('field to update the profile ');
    }}
}
