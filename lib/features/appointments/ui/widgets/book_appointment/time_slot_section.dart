import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';

class TimeSlotSection extends StatelessWidget {
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  const TimeSlotSection({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> availableTimes = [
      '08:00 AM',
      '08:30 AM',
      '09:00 AM',
      '09:30 AM',
      '10:00 AM',
      '11:00 AM',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available time',
          style: TextStyles.font16BlackBold,
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 16.w,
          runSpacing: 16.h,
          children: availableTimes.map((time) {
            final isSelected = time == selectedTime;
            return GestureDetector(
              onTap: () => onTimeSelected(time),
              child: Container(
                width: 155.w,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.bgSurface,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    time,
                    style: isSelected
                        ? TextStyles.font14WhiteSemiBold
                        : TextStyles.font14DarkMedium.copyWith(
                            color: AppColors.textGray,
                          ),
                  ),
                ),
              ),


            );
          }).toList(),
        ),
      ],
    );
  }
}
