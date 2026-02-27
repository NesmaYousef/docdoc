import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/network/api_error_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.loginInitial() = Initial;
  const factory LoginState.loginLoading() = Loading;
  const factory LoginState.loginSuccess(T data) = Success<T>;
  const factory LoginState.loginError(ApiErrorModel apiErrorModel) = Error;
}
