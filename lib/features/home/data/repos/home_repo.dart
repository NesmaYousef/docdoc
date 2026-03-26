import 'package:hive_flutter/hive_flutter.dart';
import 'package:mediqa/core/network/api_error_handler.dart';
import 'package:mediqa/core/network/api_result.dart';
import 'package:mediqa/core/network/api_service.dart';
import 'package:mediqa/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final ApiServices _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      // Write to cache (no await strictly needed since memory is updated instantly)
      Hive.box('home_cache').put('specializations', response);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
