import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            padding:EdgeInsetsDirectional.only(
                start: index==0? 0.0 : 24.0.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child:
                  SvgPicture.asset(
                      'assets/svgs/doctor_speciality.svg',
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
                verticalSpace(8),
                Text('speciality $index', style: TextStyles.font12DarkBlueRegular,),

              ],
            ),
          );
        },
      ),
    );
  }
}
