import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_result.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/constants.dart';
import '../../data/repos/profile_repo.dart';
import '../../data/models/profile_response.dart';
import 'profile_state.dart';
import 'package:image_picker/image_picker.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final ImagePicker _imagePicker = ImagePicker();
  
  String? avatarPath;
  ProfileData? profileData;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void getUserProfile() async {
    emit(const ProfileState.profileLoading());
    // Load cached image path
    avatarPath = await SharedPrefHelper.getString(SharedPrefKeys.profileImage);
    if (avatarPath != null && avatarPath!.isNotEmpty) {
      emit(ProfileState.profileImageUpdated(avatarPath!));
    }
    
    final result = await _profileRepo.getUserProfile();
    result.when(
      success: (profileResponse) {
        if (profileResponse.data != null && profileResponse.data!.isNotEmpty) {
          profileData = profileResponse.data!.first;
          // Cache the name so the home screen can display it
          if (profileData!.name != null) {
            SharedPrefHelper.setData(SharedPrefKeys.userName, profileData!.name!);
          }
          emit(ProfileState.profileSuccess(profileData!));
        } else {
          emit(const ProfileState.profileError('User data is empty'));
        }
      },

      failure: (error) {
        emit(ProfileState.profileError(error.message ?? 'Unknown error occurred'));
      },
    );
  }

  Future<void> logout() async {
    emit(const ProfileState.logoutLoading());
    try {
      // Clear token and user data locally
      await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
      emit(const ProfileState.logoutSuccess());
    } catch (e) {
      emit(ProfileState.logoutError(e.toString()));
    }
  }

  Future<void> pickProfileImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        avatarPath = image.path;
        await SharedPrefHelper.setData(SharedPrefKeys.profileImage, image.path);
        emit(ProfileState.profileImageUpdated(image.path));
      }
    } catch (e) {
      // Fallback silently or emit error
    }
  }
}

