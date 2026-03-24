import 'package:docdoc/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainFAB extends StatelessWidget {
  const MainFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white, width: 4.w),
        color: ColorsManager.mainBlue,
        boxShadow: [
          BoxShadow(
            color: ColorsManager.mainBlue.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: SvgPicture.asset(
              'assets/svgs/search.svg',
              width: 24.w,
              height: 24.w,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
