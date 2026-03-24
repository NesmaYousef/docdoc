import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xffF0F0F0), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildActionButton(
                title: 'My Appointment',
                onTap: () => Navigator.pushNamed(context, Routes.appointmentsScreen),
                showDivider: true,
              ),
            ),
            Expanded(
              child: _buildActionButton(
                title: 'Medical records',
                onTap: () => Navigator.pushNamed(context, Routes.medicalRecords),
                showDivider: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required VoidCallback onTap,
    required bool showDivider,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyles.font14DarkBlueMedium.copyWith(color: Colors.black),
              ),
            ),
          ),

          if (showDivider)
            Container(
              height: 40.h,
              width: 1.w,
              color: ColorsManager.lightGray.withValues(alpha: 0.3),
            ),
        ],
      ),
    );
  }
}
