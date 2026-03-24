import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/profile_response.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.logoutLoading() = LogoutLoading;
  const factory ProfileState.logoutSuccess() = LogoutSuccess;
  const factory ProfileState.logoutError(String error) = LogoutError;

  const factory ProfileState.profileLoading() = ProfileLoading;
  const factory ProfileState.profileSuccess(ProfileData data) = ProfileSuccess;
  const factory ProfileState.profileImageUpdated(String imagePath) = ProfileImageUpdated;
  const factory ProfileState.profileError(String error) = ProfileError;
}
