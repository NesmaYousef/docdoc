import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/enums.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/appointments_response_model.dart';
import 'package:mediqa/core/helpers/extensions/date_extension.dart';

class AppointmentCardItem extends StatelessWidget {
  final AppointmentModel appointment;
  final AppointmentType type;

  const AppointmentCardItem({
    super.key,
    required this.appointment,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DoctorInfo(appointment: appointment),
          verticalSpace(16),
          const Divider(height: 1, color: AppColors.strokeGray),
          verticalSpace(16),
          _TimeRow(appointment: appointment),
        ],
      ),
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  final AppointmentModel appointment;

  const _DoctorInfo({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72.w,
          height: 72.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.primarySurface,
          ),
          child: Center(
            child: Text(
              appointment.doctor?.name.initials ?? 'D',
              style: TextStyles.font24PrimaryBold.copyWith(
                color: AppColors.primary,
                fontSize: 28.sp,
              ),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.doctor?.name ?? 'Doctor Name',
                style: TextStyles.font14DarkMedium,
              ),
              verticalSpace(4),
              Text(
                '${appointment.doctor?.phone ?? "phone"} | ${appointment.doctor?.degree ?? ""}',
                style: TextStyles.font12GrayRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimeRow extends StatelessWidget {
  final AppointmentModel appointment;

  const _TimeRow({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today_outlined,
            size: 16.sp, color: AppColors.textGray),
        horizontalSpace(8),
        Text(
          appointment.appointmentTime.readableDate,
          style: TextStyles.font12GrayRegular,
        ),
      ],
    );
  }
}
