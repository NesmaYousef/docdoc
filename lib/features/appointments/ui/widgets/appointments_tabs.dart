import 'package:flutter/material.dart';
import '../../../../core/helpers/enums.dart';
import '../../data/models/appointments_response_model.dart';
import 'appointments_list.dart';

class AppointmentsTabs extends StatelessWidget {
  final TabController controller;
  final List<AppointmentModel> appointments;

  const AppointmentsTabs({
    super.key,
    required this.controller,
    required this.appointments,
  });

  List<AppointmentModel> _filter(String status) =>
      appointments.where((a) => a.status?.toLowerCase() == status).toList();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        AppointmentsList(
          appointments: _filter('pending'),
          type: AppointmentType.upcoming,
        ),
        AppointmentsList(
          appointments: _filter('completed'),
          type: AppointmentType.completed,
        ),
        AppointmentsList(
          appointments: _filter('cancelled'),
          type: AppointmentType.cancelled,
        ),
      ],
    );
  }
}
