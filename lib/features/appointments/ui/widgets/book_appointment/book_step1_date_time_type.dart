import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointment_type_section.dart';
import 'date_picker_section.dart';
import 'time_slot_section.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/theme/text_styles.dart';

class BookStep1DateTimeType extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTime;
  final String appointmentType;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String> onTimeChanged;
  final ValueChanged<String> onTypeChanged;
  final VoidCallback onContinue;

  const BookStep1DateTimeType({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.appointmentType,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.onTypeChanged,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DatePickerSection(
            selectedDate: selectedDate,
            onDateSelected: onDateChanged,
          ),
          SizedBox(height: 32.h),
          TimeSlotSection(
            selectedTime: selectedTime,
            onTimeSelected: onTimeChanged,
          ),
          SizedBox(height: 32.h),
          AppointmentTypeSection(
            selectedType: appointmentType,
            onTypeSelected: onTypeChanged,
          ),
          SizedBox(height: 48.h),
          AppTextButton(
            buttonText: 'Continue',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: onContinue,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
