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
