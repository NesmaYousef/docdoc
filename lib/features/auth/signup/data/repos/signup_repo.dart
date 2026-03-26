import 'package:mediqa/core/network/api_error_handler.dart';
import 'package:mediqa/core/network/api_result.dart';
import 'package:mediqa/core/network/api_service.dart';
import 'package:mediqa/features/auth/signup/data/models/signup_request_body.dart';
import 'package:mediqa/features/auth/signup/data/models/signup_response.dart';

class SignupRepo {
  final ApiServices _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
