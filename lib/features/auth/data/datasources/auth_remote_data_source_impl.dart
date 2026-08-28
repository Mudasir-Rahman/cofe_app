import 'package:cofe_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:cofe_app/features/auth/data/model/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/ error/exceptions.dart';



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );

      final user = response.user;

      if (user == null) {
        throw const ServerException(
          'User registration failed.',
        );
      }

      // The profiles row is created automatically
      // by the Supabase database trigger.

      return UserModel(
        id: user.id,
        name: name,
        email: user.email ?? email,
        photoUrl: null,
        createdAt: DateTime.now(),
      );
    } on AuthException catch (e) {
      throw UnauthorizedException(e.message);
    } on PostgrestException catch (e) {
      throw DatabaseException(e.message);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        throw const UnauthorizedException(
          'Invalid email or password.',
        );
      }

      final profile = await supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      return UserModel.fromJson(
        profile,
        email: user.email ?? email,
      );
    } on AuthException catch (e) {
      throw UnauthorizedException(e.message);
    } on PostgrestException catch (e) {
      throw DatabaseException(e.message);
    } on UnauthorizedException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      throw UnauthorizedException(e.message);
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) {
        throw const UnauthorizedException(
          'No authenticated user.',
        );
      }

      final profile = await supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      return UserModel.fromJson(
        profile,
        email: user.email ?? '',
      );
    } on AuthException catch (e) {
      throw UnauthorizedException(e.message);
    } on PostgrestException catch (e) {
      throw DatabaseException(e.message);
    } on UnauthorizedException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}