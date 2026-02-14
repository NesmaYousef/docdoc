import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/specializations_list/specializations_bloc_builder.dart';

class SpecializationsScreen extends StatelessWidget {
  const SpecializationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildCustomAppBar(context),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const SpecializationsBlocBuilder(gridView: true),
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      toolbarHeight: 56.h,
      leadingWidth: 72.w,
      leading: Padding(
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
                border: Border.all(color: ColorsManager.lighterGray, width: 1),
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
      title: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueBold.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
