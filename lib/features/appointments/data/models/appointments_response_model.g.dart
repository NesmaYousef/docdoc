// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      id: (json['id'] as num?)?.toInt(),
      doctor: json['doctor'] == null
          ? null
          : Doctors.fromJson(json['doctor'] as Map<String, dynamic>),
      appointmentTime: json['appointment_time'] as String?,
      appointmentEndTime: json['appointment_end_time'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      appointmentPrice: json['appointment_price'] as num?,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'appointment_time': instance.appointmentTime,
      'appointment_end_time': instance.appointmentEndTime,
      'status': instance.status,
      'notes': instance.notes,
      'appointment_price': instance.appointmentPrice,
    };
