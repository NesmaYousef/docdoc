import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../logic/cubit/profile_cubit.dart';
import '../widgets/logout_bloc_listener.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCard,
      appBar: const CustomAppBar(title: 'Setting'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              SettingsTile(
                icon: Icons.notifications_none_outlined,
                title: 'Notification',
                onTap: () =>
                    Navigator.pushNamed(context, Routes.notificationSettings),
              ),
              SettingsTile(
                icon: Icons.help_outline,
                title: 'FAQ',
                onTap: () => Navigator.pushNamed(context, Routes.faq),
              ),
              SettingsTile(
                icon: Icons.security_outlined,
                title: 'Security',
                onTap: () => Navigator.pushNamed(context, Routes.security),
              ),
              SettingsTile(
                icon: Icons.language_outlined,
                title: 'Language',
                onTap: () => Navigator.pushNamed(context, Routes.language),
              ),
              LogoutBlocListener(
                child: SettingsTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  textColor: AppColors.error,
                  iconColor: AppColors.error,
                  onTap: () => _showLogoutDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(24),
            Text(
              'Logout',
              style: TextStyles.font16BlackBold,
            ),
            verticalSpace(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "You'll need to enter your username\nand password next time\nyou want to login",
                textAlign: TextAlign.center,
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5),
              ),
            ),
            verticalSpace(24),
            const Divider(height: 1, color: AppColors.strokeGray),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r)),
                        ),
                      ),
                      onPressed: () => Navigator.pop(dialogContext),
                      child: Text(
                        'Cancel',
                        style: TextStyles.font14DarkMedium.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1, color: AppColors.strokeGray),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.r)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        context.read<ProfileCubit>().logout();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyles.font14DarkMedium.copyWith(color: AppColors.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
