import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props =>[];
}
class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpEvent({

    required this.name,
    required this.email,
    required this.password,

  });
  @override
  List<Object> get props => [name, email, password,];
}
class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  const SignInEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
class SignOutEvent extends AuthEvent {
  const SignOutEvent();
  @override
  List<Object> get props => [];
}
class GetCurrentUserEvent extends AuthEvent {
  const GetCurrentUserEvent();
  @override
  List<Object> get props => [];
}


