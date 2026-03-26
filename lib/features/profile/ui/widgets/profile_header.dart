import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/profile_response.dart';
import '../../logic/cubit/profile_cubit.dart';
import '../../logic/cubit/profile_state.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
      current is ProfileLoading ||
          current is ProfileSuccess ||
          current is ProfileImageUpdated ||
          current is ProfileError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 45.h),
          child: Column(
            children: [
              _Avatar(
                localAvatar: state.maybeWhen(
                  profileImageUpdated: (imagePath) => imagePath,
                  orElse: () => cubit.avatarPath,
                ),
                isLoading: state is ProfileLoading,
                onTap: cubit.pickProfileImage,
              ),
              verticalSpace(14),
              state.maybeWhen(
                profileLoading: () => setupLoading(),
                profileSuccess: (data) => setupSuccess(data),
                profileError: (error) => setupError(error, cubit.profileData),
                orElse: () => setupSuccess(cubit.profileData),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(
      width: 18.w,
      height: 18.h,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }

  Widget setupSuccess(ProfileData? data) {
    return Column(
      children: [
        Text(data?.name ?? 'User', style: TextStyles.font24DarkBold),
        verticalSpace(6),
        if (data?.email != null && data!.email!.isNotEmpty)
          Text(data.email!, style: TextStyles.font14GrayRegular),
      ],
    );
  }

  Widget setupError(String error, ProfileData? fallbackData) {
    return Column(
      children: [
        Text(fallbackData?.name ?? 'User', style: TextStyles.font24DarkBold),
        verticalSpace(6),
        if (fallbackData?.email != null)
          Text(fallbackData!.email!, style: TextStyles.font14GrayRegular),
        verticalSpace(6),
        Text(
          error,
          style: TextStyles.font14GrayRegular.copyWith(color: AppColors.error),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.localAvatar,
    required this.isLoading,
    required this.onTap,
  });

  final String? localAvatar;
  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 110.h,
          width: 110.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.strokeGray,
            border: Border.all(color: AppColors.bgCard, width: 4.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.textDark.withValues(alpha: 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
              : (localAvatar != null && localAvatar!.isNotEmpty)
              ? Image.file(File(localAvatar!), fit: BoxFit.cover)
              : Image.asset('assets/images/user_avatar.png', fit: BoxFit.cover),
        ),
        GestureDetector(
          onTap: isLoading ? null : onTap,
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: AppColors.textDark.withValues(alpha: 0.1), blurRadius: 5)],
            ),
            child: Icon(
              Icons.edit_outlined,
              size: 14.sp,
              color: isLoading ? AppColors.primary.withOpacity(0.4) : AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}