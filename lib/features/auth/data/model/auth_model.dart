import 'package:cofe_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.photoUrl,
    super.phoneNumber,
    required super.createdAt,
  });

  /// Creates UserModel from the profiles table.
  ///
  /// Email is NOT stored in profiles.
  /// It comes separately from Supabase Auth.
  factory UserModel.fromJson(
    Map<String, dynamic> json, {
    required String email,
  }) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: email,
      photoUrl: json['photo_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  /// Converts UserModel to JSON for the profiles table.
  ///
  /// Email is intentionally NOT included because
  /// email belongs to Supabase Auth.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'created_at': createdAt.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
