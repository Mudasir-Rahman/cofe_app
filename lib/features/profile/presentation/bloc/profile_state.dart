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

class PofileLoaded extends ProfileState {
  final ProfileEntity profile;
  const PofileLoaded({required this.profile});
  @override
  List<Object> get props => [profile];
}
