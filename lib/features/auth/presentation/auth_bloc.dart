
import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/auth/presentation/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';


import '../domain/auth_usecase/getcurrentuser_usecase.dart';
import '../domain/auth_usecase/signin_usecase.dart';
import '../domain/auth_usecase/signout_usecase.dart';
import '../domain/auth_usecase/singup_usecase.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final SingUpUseCase singUpUseCase;
  final  SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc(
      this.singUpUseCase,
      this.signInUseCase,
     this.signOutUseCase,
     this.getCurrentUserUseCase,
      ) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) {
      emit(AuthLoading());
    });
    on<SignInEvent>((event, emit) {
      emit(AuthLoading());
    });
    on<SignOutEvent>((event, emit) {
      emit(AuthLoading());
    });
    on<GetCurrentUserEvent>((event, emit) {
      emit(AuthLoading());
    });

    on<SignUpEvent>((event, emit) async {
      emit(const AuthLoading());

      final result = await singUpUseCase(
        SingUpParams(
            name: event.name,
            email: event.email,
            password: event.password),
      );
      result.fold(
            (failure) => emit(AuthError(message: failure.message)),
            (user) => emit(AuthAuthenticated(user: user)),
      );
    });

    on<SignInEvent>((event , emit) async {
      emit(const AuthLoading());
      final result = await signInUseCase(

        SignInParams(
          email: event.email,
          password: event.password,
        ),
      );
       result.fold(
           (failure)=> emit(AuthError(message: failure.message)),
               (user)=> emit(AuthAuthenticated(user: user) )
       );

    });
    on<SignOutEvent>((event, emit) async {
      emit(const AuthLoading());
      final result = await signOutUseCase(NoParams() as SignOutParams);
      result.fold(
            (failure) => emit(AuthError(message: failure.message)),
            (user) => emit(AuthUnauthenticated()),

      );
      });

  }}
