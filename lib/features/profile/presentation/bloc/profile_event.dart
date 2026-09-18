import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
 const ProfileEvent();
  @override

  List<Object?> get props => throw [];

}
class CreateProfileEvent extends ProfileEvent{
String? fullName ;
String? phoneNumber;
String? avatarUrl;
 CreateProfileEvent({
  this.fullName,
  this.phoneNumber,
  this.avatarUrl,
});
@override
List<Object?> get props => [fullName,phoneNumber,avatarUrl];
}
class UpdateProfileEvent extends ProfileEvent{
  String? fullName ;
  String? phoneNumber;
  String? avatarUrl;
  UpdateProfileEvent({
    this.fullName,
    this.phoneNumber,
    this.avatarUrl,
  });
@override
  List<Object?> get props => [fullName,phoneNumber,avatarUrl];
}
class DeleteProfileEvent extends ProfileEvent{
  DeleteProfileEvent();
  @override
  List<Object?> get props => [];
}
class GetProfileEvent extends ProfileEvent{
  GetProfileEvent();
  @override
  List<Object?> get props => [];
}
