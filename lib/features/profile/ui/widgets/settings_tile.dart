import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final BoxShape iconShape;
  final double? iconSize;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    this.iconColor,
    this.iconBackgroundColor,
    this.iconShape = BoxShape.rectangle,
    this.iconSize,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: iconBackgroundColor ??
                    (iconColor ?? AppColors.primary).withOpacity(0.1),
                shape: iconShape,
                borderRadius: iconShape == BoxShape.rectangle
                    ? BorderRadius.circular(10.r)
                    : null,
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.primary,
                size: iconSize ?? 22.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyles.font14DarkMedium.copyWith(
                  color: textColor ?? AppColors.textDark,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColors.textGray,
                ),
          ],
        ),
      ),
    );
  }
}
