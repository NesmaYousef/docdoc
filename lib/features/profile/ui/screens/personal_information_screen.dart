import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../logic/cubit/profile_cubit.dart';
import '../../logic/cubit/profile_state.dart';
import '../widgets/profile_field.dart';
import '../widgets/profile_save_button.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCard,
      appBar: const CustomAppBar(title: 'Personal information'),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final data = cubit.profileData;
          final avatarPath = cubit.avatarPath;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              children: [
                // Avatar
                Center(
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.primarySurface,
                    child: ClipOval(
                      child: (avatarPath != null && avatarPath.isNotEmpty)
                          ? Image.file(
                              File(avatarPath),
                              fit: BoxFit.cover,
                              width: 100.w,
                              height: 100.h,
                            )
                          : Image.asset(
                              'assets/images/user_avatar.png',
                              fit: BoxFit.cover,
                              width: 100.w,
                              height: 100.h,
                            ),
                    ),
                  ),
                ),
                verticalSpace(28),

                if (state is ProfileLoading)
                  const Center(child: CircularProgressIndicator())
                else ...[
                  ProfileField(label: 'Full Name', value: data?.name ?? ''),
                  verticalSpace(16),
                  ProfileField(label: 'Email Address', value: data?.email ?? ''),
                  verticalSpace(16),
                  const ProfileField(
                      label: 'Password', value: '••••••••', obscure: true),
                  verticalSpace(16),
                  ProfileField(
                    label: 'Phone Number',
                    value: data?.phone ?? '',
                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.flag, size: 20),
                        horizontalSpace(4),
                        Text('+20 ', style: TextStyles.font14DarkMedium),
                      ],
                    ),
                  ),
                  if (state is ProfileError) ...[
                    verticalSpace(8),
                    Text(
                      state.error,
                      style: TextStyles.font14GrayRegular
                          .copyWith(color: AppColors.error),
                    ),
                  ],
                ],

                verticalSpace(32),
                Text(
                  'When you set up your personal information settings, you should feel free to update personal information.',
                  style: TextStyles.font14GrayRegular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(28),
                ProfileSaveButton(onTap: () => Navigator.pop(context)),
                verticalSpace(24),
              ],
            ),
          );
        },
      ),
    );
  }
}
