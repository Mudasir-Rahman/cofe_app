import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.fullName,
    super.phoneNumber,
    super.avatarUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      fullName: (json['full_name'] ?? json['name'] ?? '') as String,
      phoneNumber: json['phone_number'] as String?,
      avatarUrl: (json['avatar_url'] ?? json['photo_url']) as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'avatar_url': avatarUrl,
    };
  }
}

