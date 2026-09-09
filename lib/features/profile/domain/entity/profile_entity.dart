class ProfileEntity {
  final String id;
  final String fullName;
  final String? phoneNumber;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const ProfileEntity({
    required this.id,
    required this.fullName,
    this.phoneNumber,
    this.avatarUrl,
    required this.createdAt,
    this.updatedAt,
  });
}
