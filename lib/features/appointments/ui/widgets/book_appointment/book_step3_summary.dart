import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../home/data/models/specializations_response_model.dart';
import '../../../../home/ui/widgets/doctors_list/doctors_list_view_item.dart';

class BookStep3Summary extends StatelessWidget {
  final Doctors doctor;
  final String selectedDate; // String representation like "Wednesday, 08 May 2023"
  final String selectedTime;
  final String appointmentType;
  final String paymentMethod;
  final VoidCallback onBookNow;
  final bool isLoading;

  const BookStep3Summary({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
    required this.appointmentType,
    required this.paymentMethod,
    required this.onBookNow,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final int subtotal = doctor.price ?? 250;
    final double tax = subtotal * 0.1; // Example 10% tax
    final double total = subtotal + tax;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Booking Information', style: TextStyles.font16BlackBold),
          SizedBox(height: 16.h),
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            title: 'Date & Time',
            subtitle: '$selectedDate\n$selectedTime',
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            icon: Icons.person_outline,
            title: 'Appointment Type',
            subtitle: appointmentType,
            iconColor: AppColors.success,
            backgroundColor: AppColors.success.withOpacity(0.1),
          ),

          SizedBox(height: 24.h),
          Text('Doctor Information', style: TextStyles.font16BlackBold),
          SizedBox(height: 16.h),
          DoctorsListViewItem(doctorsModel: doctor),
          SizedBox(height: 24.h),
          Text('Payment Information', style: TextStyles.font16BlackBold),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.payment, color: AppColors.primary),
                  SizedBox(width: 12.w),
                  Text(paymentMethod, style: TextStyles.font14DarkMedium),
                ],
              ),
              Text(
                'Change',
                style: TextStyles.font13PrimaryRegular,
              )
            ],
          ),
          SizedBox(height: 24.h),
          Text('Payment Info', style: TextStyles.font16BlackBold),
          SizedBox(height: 16.h),
          _buildPriceRow('Subtotal', '\$${subtotal.toStringAsFixed(0)}'),
          SizedBox(height: 12.h),
          _buildPriceRow('Tax', '\$${tax.toStringAsFixed(0)}'),
          SizedBox(height: 12.h),
          const Divider(color: AppColors.strokeGray),
          SizedBox(height: 12.h),
          _buildPriceRow('Payment Total', '\$${total.toStringAsFixed(0)}', isTotal: true),
          SizedBox(height: 48.h),
          AppTextButton(
            buttonText: isLoading ? 'Booking...' : 'Book Now',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: isLoading ? () {} : onBookNow,
          ),
          SizedBox(height: 24.h),
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
            color: backgroundColor ?? AppColors.bgSurface,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor ?? AppColors.primary, size: 24.w),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.font14DarkMedium),
            SizedBox(height: 4.h),
            Text(subtitle, style: TextStyles.font12GrayRegular.copyWith(color: AppColors.textGray)),
          ],
        )
      ],
    );
  }

  Widget _buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal ? TextStyles.font14DarkBold : TextStyles.font14GrayRegular,
        ),
        Text(
          amount,
          style: isTotal ? TextStyles.font18DarkBold : TextStyles.font14BlackRegular,
        ),
      ],
    );
  }
}
