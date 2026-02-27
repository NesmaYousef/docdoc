import 'package:dio/dio.dart';
import 'package:docdoc/features/auth/signup/data/models/signup_request_body.dart';
import 'package:docdoc/features/auth/signup/data/models/signup_response.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/login/data/models/login_request_body.dart';
import '../../features/auth/login/data/models/login_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

// Auth Module
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signUpRequestBody);

// Home Module
  @GET(ApiConstants.specializationsEP)
  Future<SpecializationsResponseModel> getSpecialization();



}
