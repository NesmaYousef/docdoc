import 'package:docdoc/core/network/api_error_handler.dart';
import 'package:docdoc/core/network/api_result.dart';
import 'package:docdoc/core/network/api_service.dart';
import 'package:docdoc/features/appointments/data/models/appointments_response_model.dart';
import 'package:docdoc/features/appointments/data/models/store_appointment_request_body.dart';


class AppointmentsRepo {
  final ApiServices _apiServices;

  AppointmentsRepo(this._apiServices);

  Future<ApiResult<List<AppointmentModel>>> getAllAppointments() async {
    try {
      final response = await _apiServices.getAllAppointments();
      return ApiResult.success(response.data ?? []);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AppointmentModel>> storeAppointment(
      StoreAppointmentRequestBody requestBody,
      ) async {
    try {
      final response = await _apiServices.storeAppointment(requestBody);
      return ApiResult.success(response.data!);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}