import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Widget? leading;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    required this.title,
    this.height = 56.0,
    this.leading,
    this.trailing,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      toolbarHeight: height,
      leading:
          leading ??
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.lighterGray,
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
          ),
      title: Text(
        title,
        style: TextStyles.font18DarkBlueBold.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      
      centerTitle: true,
      actions: trailing != null ? [trailing!] : null,
    );
  }
}
