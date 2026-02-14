import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';

class SpecialityItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int? selectedIndex;
  final bool isGridView;

  const SpecialityItem({
    super.key,
    required this.specializationsData,
    required this.itemIndex,
    this.selectedIndex,
    this.isGridView = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isGridView) {
      return _buildGridItem();
    }
    return _buildListItem();
  }

  // Grid view item (for specializations screen)
  Widget _buildGridItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 72.w,
          height: 72.h,
          decoration: BoxDecoration(
            color: ColorsManager.lightBlue,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/svgs/doctor_speciality.svg',
              width: 32.w,
              height: 32.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        verticalSpace(10),
        Text(
          specializationsData?.name ?? 'Specialization',
          style: TextStyles.font14BlackRegular,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  // List view item (for home screen horizontal scroll)
  Widget _buildListItem() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManager.darkBlue),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svgs/doctor_speciality.svg',
                      height: 32.h,
                      width: 32.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/doctor_speciality.svg',
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
          verticalSpace(8),
          Text(
            specializationsData?.name ?? 'Specialization',
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
