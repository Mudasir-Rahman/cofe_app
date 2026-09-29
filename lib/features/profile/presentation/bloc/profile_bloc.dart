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
}
