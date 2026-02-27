import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/network/api_error_model.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.signupInitial() = _InitialSignup;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;
  const factory SignupState.signupError(ApiErrorModel apiErrorModel) =
      SignupError;
}
