import 'package:mediqa/core/helpers/extensions.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:mediqa/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: double.infinity,
        height: 54.h,
        child: TextButton(
          onPressed: () => context.pushNamed(Routes.loginScreen),
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            overlayColor: WidgetStatePropertyAll(
              Colors.white.withOpacity(0.1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: TextStyles.font16WhiteSemiBold,
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}