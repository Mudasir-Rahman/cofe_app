//
// import 'package:cofe_app/core/usecase/usecase.dart';
// import 'package:cofe_app/features/auth/domain/repository/auth_repository.dart';
// import 'package:cofe_app/features/auth/presentation/auth_event.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dartz/dartz.dart';
//
//
// import '../domain/auth_usecase/getcurrentuser_usecase.dart';
// import '../domain/auth_usecase/signin_usecase.dart';
// import '../domain/auth_usecase/signout_usecase.dart';
// import '../domain/auth_usecase/singup_usecase.dart';
// import 'auth_state.dart';
//
// class NoParams {
//   const NoParams();
// }
// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//
//   final SingUpUseCase singUpUseCase;
//   final  SignInUseCase signInUseCase;
//   final SignOutUseCase signOutUseCase;
//   final GetCurrentUserUseCase getCurrentUserUseCase;
//
//   AuthBloc(
//       this.singUpUseCase,
//       this.signInUseCase,
//      this.signOutUseCase,
//      this.getCurrentUserUseCase,
//       ) : super(AuthInitial()) {
//     on<SignUpEvent>((event, emit) {
//       emit(AuthLoading());
//     });
//     on<SignInEvent>((event, emit) {
//       emit(AuthLoading());
//     });
//     on<SignOutEvent>((event, emit) {
//       emit(AuthLoading());
//     });
//     on<GetCurrentUserEvent>((event, emit) {
//       emit(AuthLoading());
//     });
//
//     on<SignUpEvent>((event, emit) async {
//       emit(const AuthLoading());
//
//       final result = await singUpUseCase(
//         SingUpParams(
//             name: event.name,
//             email: event.email,
//             password: event.password),
//       );
//       result.fold(
//             (failure) => emit(AuthError(message: failure.message)),
//             (user) => emit(AuthAuthenticated(user: user)),
//       );
//     });
//
//     on<SignInEvent>((event , emit) async {
//       emit(const AuthLoading());
//       final result = await signInUseCase(
//
//         SignInParams(
//           email: event.email,
//           password: event.password,
//         ),
//       );
//        result.fold(
//            (failure)=> emit(AuthError(message: failure.message)),
//                (user)=> emit(AuthAuthenticated(user: user) )
//        );
//
//     });
//     on<SignOutEvent>((event, emit) async {
//       emit(const AuthLoading());
//       final result = await signOutUseCase(SignOutParams());
//       result.fold(
//             (failure) => emit(AuthError(message: failure.message)),
//             (user) => emit(AuthUnauthenticated()),
//
//       );
//       });
//     on<GetCurrentUserEvent>((event , emit) async{
//       emit(const AuthLoading());
//       final result = await getCurrentUserUseCase(getCurrentUserParams() );
//       result.fold(
//           (failure) => emit(AuthError(message: failure.message)),
//               if(
//
//       )
//       );
//     });
//   }}

import 'package:cofe_app/features/auth/presentation/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/auth_usecase/getcurrentuser_usecase.dart';
import '../domain/auth_usecase/signin_usecase.dart';
import '../domain/auth_usecase/signout_usecase.dart';
import '../domain/auth_usecase/singup_usecase.dart';
import 'auth_state.dart';

class NoParams {
  const NoParams();
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SingUpUseCase singUpUseCase;
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc(
      this.singUpUseCase,
      this.signInUseCase,
      this.signOutUseCase,
      this.getCurrentUserUseCase,
      ) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
    on<GetCurrentUserEvent>(_onGetCurrentUser);
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await singUpUseCase(
      SingUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await signOutUseCase(SignOutParams());
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onGetCurrentUser(GetCurrentUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final result = await getCurrentUserUseCase(getCurrentUserParams());
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => user != null
          ? emit(AuthAuthenticated(user: user))
          : emit(AuthUnauthenticated()),
    );
  }
}