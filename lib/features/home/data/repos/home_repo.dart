import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mediqa/core/network/api_error_handler.dart';
import 'package:mediqa/core/network/api_result.dart';
import 'package:mediqa/core/network/api_service.dart';
import 'package:mediqa/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final ApiServices _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecialization({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _homeApiService.getSpecialization(cancelToken);
      // Safe cache write with error handling
      try {
        final box = Hive.box('home_cache');
        await box.put('specializations', response);
      } catch (cacheError) {
        // Log but don't fail the API call
        print('Cache write failed: $cacheError');
      }
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
