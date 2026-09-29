import 'package:cofe_app/features/profile/domain/entity/profile_entity.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final ProfileEntity profile;
  const ProfileLoaded({required this.profile});
  @override
  List<Object> get props => [profile];
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});
  @override
  List<Object> get props => [message];
}

class ProfileUpdated extends ProfileState {
  final ProfileEntity profile;
  const ProfileUpdated({required this.profile});
  @override
  List<Object> get props => [profile];
}

class ProfileDeleted extends ProfileState {
  const ProfileDeleted();
  @override
  List<Object> get props => [];
}

class ProfileCreated extends ProfileState {
  final ProfileEntity profile;
  const ProfileCreated({required this.profile});
  @override
  List<Object> get props => [profile];
}

class GetProfileState extends ProfileState {
  final ProfileEntity profile;
  const GetProfileState({required this.profile});
  @override
  List<Object> get props => [profile];
}
