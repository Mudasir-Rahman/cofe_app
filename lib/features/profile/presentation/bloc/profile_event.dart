import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class CreateProfileEvent extends ProfileEvent {
  final String? fullName;
  final String? phoneNumber;
  final String? avatarUrl;

  const CreateProfileEvent({
    this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [fullName, phoneNumber, avatarUrl];
}

class UpdateProfileEvent extends ProfileEvent {
  final String? fullName;
  final String? phoneNumber;
  final String? avatarUrl;

  const UpdateProfileEvent({
    this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [fullName, phoneNumber, avatarUrl];
}

class DeleteProfileEvent extends ProfileEvent {
  const DeleteProfileEvent();

  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent();

  @override
  List<Object?> get props => [];
}
