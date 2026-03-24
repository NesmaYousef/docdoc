import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/logout_bloc_listener.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  textColor: const Color(0xffFF4C4C),
                  iconColor: const Color(0xffFF4C4C),
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
      builder: (dialogContext) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Logout',
          style: TextStyles.font18DarkBlueBold.copyWith(color: Colors.black),
        ),
        content: Text(
          "You'll need to enter your username and password next time to sign in.",
          style: TextStyles.font14GrayRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: TextStyles.font14DarkBlueMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ProfileCubit>().logout();
            },
            child: Text(
              'Logout',
              style: TextStyles.font14DarkBlueMedium.copyWith(
                color: const Color(0xffFF4C4C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
