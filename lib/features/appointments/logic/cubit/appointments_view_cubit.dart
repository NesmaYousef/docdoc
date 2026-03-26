import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_result.dart';
import '../../data/models/appointments_response_model.dart';
import '../../data/repos/appointments_repo.dart';
import 'appointments_view_state.dart';

class AppointmentsViewCubit extends Cubit<AppointmentsViewState> {
  final AppointmentsRepo _appointmentsRepo;

  AppointmentsViewCubit(this._appointmentsRepo)
      : super(const AppointmentsViewState.initial());

  void getAppointments() async {
    emit(const AppointmentsViewState.loading());
    final response = await _appointmentsRepo.getAllAppointments();
    if (!isClosed) {
      response.when(
        success: (appointments) {
          emit(AppointmentsViewState.success(
            appointments.whereType<AppointmentModel>().toList(),
          ));
        },
        failure: (apiErrorModel) {
          emit(AppointmentsViewState.error(apiErrorModel));
        },
      );
    }
  }
}
