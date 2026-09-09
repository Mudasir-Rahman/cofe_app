import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.id, required super.email});

  factory UserModel.fromSupabaseUser(String id, String? email) {
    return UserModel(id: id, email: email ?? '');
  }
}
