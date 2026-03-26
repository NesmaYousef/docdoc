import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/profile_action_buttons.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_header_background.dart';
import '../widgets/profile_options_list.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback? onBack;
  const ProfileScreen({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCard,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const ProfileHeaderBackground(),
            Container(
              margin: EdgeInsets.only(top: 100.h),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
            ),
            Column(
              children: [
                const ProfileHeader(),
                verticalSpace(16),
                const ProfileActionButtons(),
                verticalSpace(24),
                const ProfileOptionsList(),
                verticalSpace(100),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: (onBack != null || Navigator.canPop(context))
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.bgCard),
              onPressed: onBack ?? () => Navigator.maybePop(context),
            )
          : null,
      title: Text(
        'Profile',
        style: TextStyles.font18DarkBold.copyWith(color: AppColors.bgCard),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings_outlined, color: AppColors.bgCard),
          onPressed: () => Navigator.pushNamed(context, Routes.settings),
        ),
      ],
    );
  }
}