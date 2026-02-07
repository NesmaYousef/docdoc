import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/apis/home_api_services.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;

  HomeRepo(this._homeApiServices);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations()async{
    try{
      final response = await _homeApiServices.getSpecialization();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}