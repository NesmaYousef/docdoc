import 'package:docdoc/core/network/api_error_handler.dart';
import 'package:docdoc/core/network/api_result.dart';
import 'package:docdoc/core/network/api_service.dart';
import 'package:docdoc/features/auth/login/data/models/login_request_body.dart';
import 'package:docdoc/features/auth/login/data/models/login_response.dart';

class LoginRepo {
  final ApiServices _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
