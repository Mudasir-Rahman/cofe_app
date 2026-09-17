import 'package:cofe_app/features/profile/data/DataSource/profileRemoteDataSource.dart';
import 'package:cofe_app/features/profile/data/model/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/ error/exceptions.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient supabase;
  ProfileRemoteDataSourceImpl(this.supabase);

  @override
  Future<ProfileModel> createProfile({
    required String fullName,
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw const UnauthorizedException('User not logged in');
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
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      if (e is AppException) rethrow;
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<ProfileModel> deleteProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw const UnauthorizedException('User not logged in');
      }
      final response = await supabase
          .from('profile')
          .delete()
          .eq('id', user.id)
          .select()
          .single();
      return ProfileModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      if (e is AppException) rethrow;
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw const UnauthorizedException('User not logged in');
      }
      final response = await supabase
          .from('profile')
          .select()
          .eq('id', user.id)
          .single();
      return ProfileModel.fromJson(response);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        throw const NotFoundException('Profile not found');
      }
      throw ServerException(e.message);
    } catch (e) {
      if (e is AppException) rethrow;
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
  }) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw const UnauthorizedException('User not logged in');
      }

      final Map<String, dynamic> updateData = {};
      if (fullName != null) updateData['full_name'] = fullName;
      if (phoneNumber != null) updateData['phone_number'] = phoneNumber;
      if (avatarUrl != null) updateData['avatar_url'] = avatarUrl;

      if (updateData.isEmpty) {
        return getProfile();
      }

      final response = await supabase
          .from('profile')
          .update(updateData)
          .eq('id', user.id)
          .select()
          .single();
      return ProfileModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      if (e is AppException) rethrow;
      throw UnknownException(e.toString());
    }
  }
}

