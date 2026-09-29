import 'package:cofe_app/core/usecase/usecase.dart';
import 'package:cofe_app/features/profile/domain/profile_usecase/createProfile_usecase.dart';
import 'package:cofe_app/features/profile/domain/profile_usecase/deleteProfile_usecase.dart';
import 'package:cofe_app/features/profile/domain/profile_usecase/getProfile_usecase.dart';
import 'package:cofe_app/features/profile/domain/profile_usecase/updateProfile_usecase.dart';
import 'package:cofe_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:cofe_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CreateProfileUsecase createProfileUseCase;
  final UpdateProfileUsecase updateProfileUseCase;
  final DeleteProfileUsecase deleteProfileUseCase;
  final GetProfileUsecase getProfileUseCase;
  ProfileBloc(
    this.createProfileUseCase,
    this.updateProfileUseCase,
    this.deleteProfileUseCase,
    this.getProfileUseCase,
  ) : super(const ProfileInitial()) {
    on<CreateProfileEvent>(_onCreateProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<DeleteProfileEvent>(_onDeleteProfile);
    on<GetProfileEvent>(_onGetProfile);
  }
  Future<void> _onCreateProfile(
    CreateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    final result = await createProfileUseCase(
      CreateProfileUsecaseParams(
        fullName: event.fullName!,
        phoneNumber: event.phoneNumber,
        avatarUrl: event.avatarUrl,
      ),
    );
    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (profile) => emit(ProfileCreated(profile: profile)),
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    final result = await updateProfileUseCase(
      UpdateProfileParams(
        fullName: event.fullName!,
        phoneNumber: event.phoneNumber,
        avatarUrl: event.avatarUrl,
      ),
    );
    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (profile) => emit(ProfileUpdated(profile: profile)),
    );
  }

  Future<void> _onDeleteProfile(
    DeleteProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    final result = await deleteProfileUseCase(NoParams());
    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (_) => emit(const ProfileDeleted()),
    );
  }

  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    final result = await getProfileUseCase(NoParams());
    result.fold(
      (failure) => emit(ProfileError(message: failure.message)),
      (profile) => emit(ProfileLoaded(profile: profile)),
    );
  }
}
