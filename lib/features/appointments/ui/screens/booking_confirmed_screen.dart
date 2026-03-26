import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/models/appointments_response_model.dart';
import 'package:mediqa/core/helpers/extensions/date_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookingConfirmedScreen extends StatefulWidget {
  final AppointmentModel appointment;

  const BookingConfirmedScreen({super.key, required this.appointment});

  @override
  State<BookingConfirmedScreen> createState() => _BookingConfirmedScreenState();
}

class _BookingConfirmedScreenState extends State<BookingConfirmedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSurface,
      appBar: const CustomAppBar(
        title: 'Booking Confirmed',
      ),
      body: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 800),
        tween: Tween(begin: 0.0, end: 1.0),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: child,
            ),
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            children: [
              _buildAnimatedSuccessIcon(),
              verticalSpace(24),
              Text(
                'Booking Confirmed!',
                style: TextStyles.font18DarkBold.copyWith(fontSize: 22.sp),
              ),
              verticalSpace(8),
              Text(
                'Your appointment has been successfully booked with us.',
                style: TextStyles.font14GrayRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(40),
              _buildAppointmentSummaryCard(),
              verticalSpace(40),
              _buildActionButtons(),
              verticalSpace(24),
              AppTextButton(
                buttonText: 'Done',
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.mainLayout, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedSuccessIcon() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 60.w,
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppointmentSummaryCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.primarySurface,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: widget.appointment.doctor?.photo ?? '',
                    width: 60.r,
                    height: 60.r,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.primarySurface,
                      child: Center(
                        child: Text(
                          widget.appointment.doctor?.name.initials ?? 'D',
                          style: TextStyles.font18DarkBold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
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
                      widget.appointment.doctor?.name ?? 'Doctor Name',
                      style: TextStyles.font16BlackBold,
                    ),
                    verticalSpace(4),
                    Text(
                      widget.appointment.doctor?.degree ??
                          'Specialist',
                      style: TextStyles.font14GrayRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(24),
          const Divider(height: 1),
          verticalSpace(24),
          _buildSummaryRow(
            Icons.calendar_month_outlined,
            'Date & Time',
            '${widget.appointment.appointmentTime.readableDate} | ${widget.appointment.appointmentTime.readableTime}',
          ),
          verticalSpace(16),
          _buildSummaryRow(
            Icons.location_on_outlined,
            'Location',
            '70-90 Fifth Avenue, New York',
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.primarySurface,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20.sp),
        ),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font12GrayRegular,
                overflow: TextOverflow.ellipsis,
              ),
              verticalSpace(2),
              Text(
                value,
                style: TextStyles.font14DarkMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today_outlined),
                label: const Text('Add to Calendar'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
            horizontalSpace(12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.share_outlined, color: AppColors.primary),
                padding: EdgeInsets.all(12.w),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
