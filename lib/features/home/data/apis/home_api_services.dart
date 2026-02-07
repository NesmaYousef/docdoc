
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/specializations_response_model.dart';
import 'home_api_constants.dart';

part 'home_api_services.g.dart';


@RestApi(baseUrl:ApiConstants.apiBaseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio) = _HomeApiServices;

  @GET(HomeApiConstants.specializationsEP)
  Future<SpecializationsResponseModel> getSpecialization();
}