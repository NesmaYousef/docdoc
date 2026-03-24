import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors_manager.dart';
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
            iconBackgroundColor: const Color(0xffEAF2FF),
            iconColor: ColorsManager.mainBlue,
            iconShape: BoxShape.circle,
            title: 'Personal Information',
            onTap: () =>
                Navigator.pushNamed(context, Routes.personalInformation),
          ),
          const Divider(height: 1, color: Color(0xffF0F0F0)),
          SettingsTile(
            icon: Icons.medical_services_outlined,
            iconBackgroundColor: const Color(0xffE8F8EF),
            iconColor: const Color(0xff22C55E),
            iconShape: BoxShape.circle,
            title: 'My Test & Diagnostic',
            onTap: () => Navigator.pushNamed(context, Routes.medicalRecords),
          ),
          const Divider(height: 1, color: Color(0xffF0F0F0)),
          SettingsTile(
            icon: Icons.account_balance_wallet_outlined,
            iconBackgroundColor: const Color(0xffFCE8E8),
            iconColor: const Color(0xffE53935),
            iconShape: BoxShape.circle,
            title: 'Payment',
            onTap: () => Navigator.pushNamed(context, Routes.payment),
          ),
          const Divider(height: 1, color: Color(0xffF0F0F0)),
        ],
      ),
    );
  }
}
