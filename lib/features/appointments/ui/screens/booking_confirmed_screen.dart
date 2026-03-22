import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/ui/widgets/doctors_list/doctors_list_view_item.dart';
import '../../data/models/appointments_response_model.dart';

class BookingConfirmedScreen extends StatelessWidget {
  final AppointmentModel appointment;

  const BookingConfirmedScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBookingConfirmed(),
            SizedBox(height: 32.h),
            _buildBookingInfo(),
            SizedBox(height: 24.h),
            _buildDoctorInfo(),
            SizedBox(height: 48.h),
            AppTextButton(
              buttonText: 'Done',
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(Routes.mainLayout, (route) => false);
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingInfo() {
    return Column(
            children: [
              Text('Booking Information', style: TextStyles.font16BlackBold),
              SizedBox(height: 16.h),
              _buildInfoRow(
                icon: Icons.calendar_today_outlined,
                title: 'Date & Time',
                subtitle: '${appointment.appointmentTime}',
              ),
              SizedBox(height: 16.h),
               _buildInfoRow(
                icon: Icons.person_outline,
                title: 'Appointment Type',
                subtitle: 'In Person',
                iconColor: ColorsManager.successGreen,
                backgroundColor: ColorsManager.successGreen.withOpacity(0.1),

              ),
            ],
          );
  }

  Widget _buildDoctorInfo() {
    return Column(
            children: [
              Text('Doctor Information', style: TextStyles.font16BlackBold),
              SizedBox(height: 16.h),
              if (appointment.doctor != null) DoctorsListViewItem(doctorsModel: appointment.doctor),

            ],
          );
  }

  Widget _buildBookingConfirmed() {
    return Center(
      child: Column(
                children: [
                  Container(
                    width: 72.w,
                    height: 72.w,
                    decoration: BoxDecoration(
                      color: ColorsManager.successGreen,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.check, color: Colors.white, size: 40.w),
                  ),
                  SizedBox(height: 16.h),
                  Text('Booking Confirmed', style: TextStyles.font16BlackBold),
                ],
              ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String title, required String subtitle, Color? iconColor, Color? backgroundColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorsManager.moreLighterGray,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor ?? ColorsManager.mainBlue, size: 24.w),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.font14DarkBlueMedium),
             SizedBox(height: 4.h),
            Text(subtitle, style: TextStyles.font12GrayRegular),
          ],
        )
      ],
    );
  }
}
