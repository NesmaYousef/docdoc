import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/network/api_error_model.dart';
import '../../data/models/appointments_response_model.dart';

part 'book_appointment_state.freezed.dart';

@freezed
class BookAppointmentState with _$BookAppointmentState {
  const factory BookAppointmentState.initial() = BookAppointmentInitial;
  const factory BookAppointmentState.loading() = BookAppointmentLoading;
  const factory BookAppointmentState.success(AppointmentModel appointment) = BookAppointmentSuccess;
  const factory BookAppointmentState.error(ApiErrorModel apiErrorModel) = BookAppointmentError;
}
