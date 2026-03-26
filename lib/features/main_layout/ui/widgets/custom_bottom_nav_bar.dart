import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mediqa/core/theme/app_colors.dart';
import 'package:mediqa/features/profile/logic/cubit/profile_cubit.dart';
import 'package:mediqa/features/profile/logic/cubit/profile_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(index: 0, iconName: 'home'),
          _buildNavItem(index: 1, iconName: 'message'),
          SizedBox(width: 60.w),
          _buildNavItem(index: 2, iconName: 'calendar'),
          _buildProfileItem(index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem({required int index, required String iconName}) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 60.w,
        height: 60.h,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/svgs/$iconName.svg',
          colorFilter: ColorFilter.mode(
            isActive ? AppColors.primary : AppColors.textDark,
            BlendMode.srcIn,
          ),
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }

  Widget _buildProfileItem({required int index}) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 60.w,
        height: 60.h,
        alignment: Alignment.center,
        child: Container(
          width: 30.w,
          height: 30.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColors.primary : Colors.transparent,
              width: 2.w,
            ),
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (_, current) => current is ProfileImageUpdated || current is ProfileLoading,
            builder: (context, state) {
              final path = context.read<ProfileCubit>().avatarPath;
              return CircleAvatar(
                radius: 14.r,
                backgroundColor: AppColors.bgSurface,
                backgroundImage: (path != null && path.isNotEmpty)
                    ? FileImage(File(path)) as ImageProvider
                    : const AssetImage('assets/images/user_avatar.png'),
              );
            },
          ),
        ),
      ),
    );
  }
}
