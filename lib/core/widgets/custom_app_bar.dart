import 'package:mediqa/core/theme/app_colors.dart';
import 'package:mediqa/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onLeadingTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.height = 56.0,
    this.leading,
    this.trailing,
    this.onLeadingTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgCard,
      elevation: 0,
      surfaceTintColor: AppColors.bgCard,
      toolbarHeight: height,
      leading:
          leading ??
          (Navigator.canPop(context)
              ? Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        if (onLeadingTap != null) {
                          onLeadingTap!();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.strokeGray,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/arrow_left.svg',
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null),
      title: Text(
        title,
        style: TextStyles.font18DarkBold.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      
      centerTitle: true,
      actions: trailing != null ? [trailing!] : null,
    );
  }
}
