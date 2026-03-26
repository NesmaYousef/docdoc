import 'package:mediqa/core/helpers/spacing.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/text_styles.dart';

class HeroBookingCard extends StatelessWidget {
  const HeroBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220.h,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentGeometry.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book and\nschedule with\nnearest doctor',
                    style: TextStyles.font16WhiteMedium,
                    textAlign: TextAlign.start,
                  ),
                  verticalSpace(16),
                  _buildFindNearbyButton(),
                ],
              ),
            ),
            _buildDoctorAvatar(),
          ],
        ));
  }

  Widget _buildFindNearbyButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primary,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.r),
        ),
      ),
      child: Text(
        'Find Nearby',
        style: TextStyles.font12PrimaryRegular.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDoctorAvatar() {
    return Positioned(
      right: -42.w,
      bottom: 0,
      child: Image.asset(
        'assets/images/doctor.png',
        height: 220.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
