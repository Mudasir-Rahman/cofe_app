class ProfileEntity {
  final String id;
  final String fullName;
  final String? phoneNumber;
  final String? avatarUrl;

  const ProfileEntity({
    required this.id,
    required this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });
}

