import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_service.dart';
import '../models/profile_response.dart';

class ProfileRepo {
  final ApiServices _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileResponse>> getUserProfile() async {
    try {
      final response = await _apiService.getUserProfile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
