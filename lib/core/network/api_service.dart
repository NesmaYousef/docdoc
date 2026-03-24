import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/appointments/data/models/appointments_response_model.dart';
import '../../features/appointments/data/models/store_appointment_request_body.dart';
import '../../features/auth/login/data/models/login_request_body.dart';
import '../../features/auth/login/data/models/login_response.dart';
import '../../features/auth/signup/data/models/signup_request_body.dart';
import '../../features/auth/signup/data/models/signup_response.dart';
import '../../features/home/data/models/specializations_response_model.dart';
import '../../features/profile/data/models/profile_response.dart';
import 'api_constants.dart';
import 'api_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

// Auth Module
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signUpRequestBody);

  @POST(ApiConstants.logout)
  Future<dynamic> logout();

// Home Module
  @GET(ApiConstants.specializationsEP)
  Future<SpecializationsResponseModel> getSpecialization();


// Appointments Module
  @GET(ApiConstants.getAllAppointments)
  Future<ApiResponse<List<AppointmentModel>>> getAllAppointments();

  @POST(ApiConstants.storeAppointment)
  Future<ApiResponse<AppointmentModel>> storeAppointment(
      @Body() StoreAppointmentRequestBody appointmentRequestBody,
      );

// Profile Module
  @GET(ApiConstants.userProfile)
  Future<ProfileResponse> getUserProfile();
}
