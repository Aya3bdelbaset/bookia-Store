import 'package:bloc/bloc.dart';
import 'package:bookia/features/profile/data/model/profile_response.dart';
import 'package:bookia/features/profile/repo/profile_repo.dart';


import 'package:flutter/foundation.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(GetProfileLoading());

    try {
      final response = await ProfileRepo.getProfileData();

      if (isClosed) return;

      if (response != null) {
        emit(GetProfileSucsess(response));
      } else {
        emit(GetProfileError());
      }
    } catch (e, stackTrace) {
      debugPrint('PROFILE CUBIT ERROR: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!isClosed) {
        emit(GetProfileError());
      }
    }
  }
}
