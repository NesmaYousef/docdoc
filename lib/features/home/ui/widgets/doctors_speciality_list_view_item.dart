import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final List<SpecializationsData?> specializationsData;
  final int itemIndex;

  const DoctorsSpecialityListViewItem({
    super.key,
    required this.specializationsData,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0.0 : 24.0.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(
              'assets/svgs/doctor_speciality.svg',
              height: 30.h,
              width: 30.w,
            ),
          ),
          verticalSpace(8),
          Text(
            specializationsData[itemIndex]?.name ?? 'Specialization',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
