import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';

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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(index: 0, icon: 'home'),
          _buildNavItem(index: 1, icon: 'message'),
          // Space for the large FAB
          SizedBox(width: 60.w),
          _buildNavItem(index: 2, icon: 'calendar'),
          _buildNavItem(index: 3, icon: 'message'),
        ],
      ),
    );
  }

  Widget _buildNavItem({required int index, required String icon}) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 60.w,
        height: 60.h,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/svgs/$icon.svg',
          colorFilter: ColorFilter.mode(
            isActive ? ColorsManager.mainBlue : Colors.black,

            BlendMode.srcIn,
          ),
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}
