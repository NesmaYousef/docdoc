import 'package:mediqa/core/helpers/enums.dart';
import 'package:mediqa/features/appointments/data/models/appointments_response_model.dart';
import 'package:mediqa/features/appointments/ui/widgets/appointment_card_item.dart';
import 'package:mediqa/features/appointments/ui/widgets/appointment_empty_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsList extends StatelessWidget {
  final List<AppointmentModel> appointments;
  final AppointmentType type;

  const AppointmentsList({
    super.key,
    required this.appointments,
    required this.type,
  });

  static const _emptyLabel = {
    AppointmentType.upcoming: 'No upcoming appointments',
    AppointmentType.completed: 'No completed appointments',
    AppointmentType.cancelled: 'No cancelled appointments',
  };

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return AppointmentEmptyState(type: type);
    }

    return ListView.builder(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 90.h),

      itemCount: appointments.length,
      itemBuilder: (_, i) =>
          AppointmentCardItem(appointment: appointments[i], type: type),
    );
  }

}

