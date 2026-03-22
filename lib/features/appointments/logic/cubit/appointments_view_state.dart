import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/network/api_error_model.dart';
import '../../data/models/appointments_response_model.dart';

part 'appointments_view_state.freezed.dart';

@freezed
class AppointmentsViewState with _$AppointmentsViewState {
  const factory AppointmentsViewState.initial() = AppointmentsViewInitial;
  const factory AppointmentsViewState.loading() = AppointmentsViewLoading;
  const factory AppointmentsViewState.success(List<AppointmentModel> appointmentsList) = AppointmentsViewSuccess;
  const factory AppointmentsViewState.error(ApiErrorModel apiErrorModel) = AppointmentsViewError;
}
