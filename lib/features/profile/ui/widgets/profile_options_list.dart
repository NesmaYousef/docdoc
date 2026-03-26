import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import 'settings_tile.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SettingsTile(
            icon: Icons.badge_outlined,
            iconBackgroundColor: AppColors.primarySurface,
            iconColor: AppColors.primary,
            iconShape: BoxShape.circle,
            title: 'Personal Information',
            onTap: () =>
                Navigator.pushNamed(context, Routes.personalInformation),
          ),
          const Divider(height: 1, color: AppColors.strokeGray),
          SettingsTile(
            icon: Icons.medical_services_outlined,
            iconBackgroundColor: AppColors.primarySurface,
            iconColor: AppColors.success,
            iconShape: BoxShape.circle,
            title: 'My Test & Diagnostic',
            onTap: () => Navigator.pushNamed(context, Routes.medicalRecords),
          ),
          const Divider(height: 1, color: AppColors.strokeGray),
          SettingsTile(
            icon: Icons.account_balance_wallet_outlined,
            iconBackgroundColor: AppColors.error.withOpacity(0.1),
            iconColor: AppColors.error,
            iconShape: BoxShape.circle,
            title: 'Payment',
            onTap: () => Navigator.pushNamed(context, Routes.payment),
          ),
          const Divider(height: 1, color: AppColors.strokeGray),
        ],
      ),
    );
  }
}
