import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/specializations_response_model.dart';

part 'appointments_response_model.g.dart';

// ─── GET /appointment/index ───────────────────────────────────────────────────

// ─── Appointment ─────────────────────────────────────────────────────────────

@JsonSerializable()
class AppointmentModel {
  int? id;
  Doctors? doctor;
  @JsonKey(name: 'appointment_time')
  String? appointmentTime;
  @JsonKey(name: 'appointment_end_time')
  String? appointmentEndTime;
  String? status;
  String? notes;
  @JsonKey(name: 'appointment_price')
  num? appointmentPrice;

  AppointmentModel({
    this.id,
    this.doctor,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
}