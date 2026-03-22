import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/extensions/date_extension.dart';
import '../../../../core/network/api_result.dart';
import '../../data/models/store_appointment_request_body.dart';
import '../../data/repos/appointments_repo.dart';
import 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  final AppointmentsRepo _appointmentsRepo;

  BookAppointmentCubit(this._appointmentsRepo)
      : super(const BookAppointmentState.initial());

  void bookAppointment({
    required int doctorId,
    required DateTime selectedDate,
    required String selectedTime,
    String? appointmentType,
  }) async {
    emit(const BookAppointmentState.loading());
    
    // Combine date and time to Match API requirement: "yyyy-MM-dd HH:mm AM/PM"
    final String startTime = '${selectedDate.toApiDateString} $selectedTime';

    final response = await _appointmentsRepo.storeAppointment(
      StoreAppointmentRequestBody(
        doctorId: doctorId,
        startTime: startTime,
        notes: 'Appointment Type: $appointmentType',
      ),
    );
    response.when(
      success: (appointment) {
        emit(BookAppointmentState.success(appointment));
      },
      failure: (apiErrorModel) {
        emit(BookAppointmentState.error(apiErrorModel));
      },
    );
  }
}
