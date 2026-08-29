

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../domain/auth_usecase/getcurrentuser_usecase.dart';
import '../../domain/auth_usecase/signin_usecase.dart';
import '../../domain/auth_usecase/signout_usecase.dart';
import '../../domain/auth_usecase/singup_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class NoParams {
  const NoParams();
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase singUpUseCase;
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
      SignUpParams (
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
    final result = await getCurrentUserUseCase(GetCurrentUserParams());
    result.fold(
          (failure) => emit(AuthError(message: failure.message)),
          (user) => user != null
          ? emit(AuthAuthenticated(user: user))
          : emit(AuthUnauthenticated()),
    );
  }
}