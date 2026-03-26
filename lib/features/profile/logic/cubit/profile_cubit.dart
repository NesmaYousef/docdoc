import 'dart:convert';
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

    // Load cached profile data instantly if available
    final cachedStr = await SharedPrefHelper.getString('cachedProfileData');
    if (cachedStr.isNotEmpty) {
      try {
        final map = jsonDecode(cachedStr);
        profileData = ProfileData(
          id: map['id'],
          name: map['name'],
          email: map['email'],
          phone: map['phone'],
          gender: map['gender'],
        );
        emit(ProfileState.profileSuccess(profileData!));
      } catch (e) {
        // Fallback silently if parsing fails
      }
    } else {
      // Fallback to legacy single-string cache if the user hasn't synced the new JSON cache yet
      final legacyName = await SharedPrefHelper.getString(SharedPrefKeys.userName);
      if (legacyName.isNotEmpty) {
        profileData = ProfileData(name: legacyName);
        emit(ProfileState.profileSuccess(profileData!));
      }
    }
    
    final result = await _profileRepo.getUserProfile();
    if (!isClosed) {
      result.when(
        success: (profileResponse) {
          if (profileResponse.data != null && profileResponse.data!.isNotEmpty) {
            profileData = profileResponse.data!.first;
            // Cache the complete profile JSON for offline access
            final profileMap = {
              'id': profileData!.id,
              'name': profileData!.name,
              'email': profileData!.email,
              'phone': profileData!.phone,
              'gender': profileData!.gender,
            };
            SharedPrefHelper.setData('cachedProfileData', jsonEncode(profileMap));
            
            // Cache the name so the home screen can display it
            if (profileData!.name != null) {
              SharedPrefHelper.setData(SharedPrefKeys.userName, profileData!.name!);
            }
            emit(ProfileState.profileSuccess(profileData!));
          } else if (profileData == null) {
            emit(const ProfileState.profileError('User data is empty'));
          }
        },

        failure: (error) {
          // Suppress API error natively if offline cache successfully populated the profile in advance
          if (profileData == null) {
            emit(ProfileState.profileError(error.message ?? 'Unknown error occurred'));
          }
        },
      );
    }
  }

  Future<void> logout() async {
    emit(const ProfileState.logoutLoading());
    final result = await _profileRepo.logout();
    result.when(
      success: (_) async {
        await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
        emit(const ProfileState.logoutSuccess());
      },
      failure: (error) {
        emit(ProfileState.logoutError(error.message ?? 'Logout failed'));
      },
    );
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

