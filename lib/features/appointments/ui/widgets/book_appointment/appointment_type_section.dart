import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/text_styles.dart';

class AppointmentTypeSection extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeSelected;

  const AppointmentTypeSection({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appointment Type',
          style: TextStyles.font16BlackBold,
        ),
        SizedBox(height: 16.h),
        _buildTypeOption(
          icon: Icons.person_outline,
          title: 'In Person',
          value: 'In Person',
          iconColor: ColorsManager.mainBlue,
          bgColor: ColorsManager.mainBlue.withOpacity(0.1),
        ),
        SizedBox(height: 12.h),
        _buildTypeOption(
          icon: Icons.videocam_outlined,
          title: 'Video Call',
          value: 'Video Call',
          iconColor: ColorsManager.successGreen,
          bgColor: ColorsManager.successGreen.withOpacity(0.1),
        ),

        SizedBox(height: 12.h),
        _buildTypeOption(
          icon: Icons.call_outlined,
          title: 'Phone Call',
          value: 'Phone Call',
          iconColor: Colors.orange,
          bgColor: Colors.orange.withOpacity(0.1),
        ),
      ],
    );
  }

  Widget _buildTypeOption({
    required IconData icon,
    required String title,
    required String value,
    required Color iconColor,
    required Color bgColor,
  }) {
    final isSelected = selectedType == value;

    return GestureDetector(
      onTap: () => onTypeSelected(value),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? ColorsManager.mainBlue : Colors.transparent,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20.w,
              ),
            ),

            SizedBox(width: 16.w),
            Text(
              title,
              style: isSelected
                  ? TextStyles.font14DarkBlueMedium
                  : TextStyles.font14DarkBlueMedium.copyWith(color: ColorsManager.gray),
            ),
            const Spacer(),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? ColorsManager.mainBlue : ColorsManager.lightGray,
                  width: isSelected ? 6 : 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
