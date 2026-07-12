
import 'package:cofe_app/features/auth/data/model/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_remote_data_source.dart' show AuthRemoteDataSource;

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      throw Exception('User registration failed.');
    }

    await supabase.from('profiles').insert({
      'id': user.id,
      'name': name,
      'email': email,
      'photo_url': null,
    });

    final profile = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(profile);
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      throw Exception('Login failed.');
    }

    final profile = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(profile);
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception('No authenticated user.');
    }

    final profile = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(profile);
  }
}