import 'package:docdoc/core/helpers/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theme/colors_manager.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/text_styles.dart';

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
      return _buildGridItem(context);
    }
    return _buildListItem();
  }

  // Grid view item (for specializations screen)
  Widget _buildGridItem(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.specialityDoctorsScreen,
              arguments: {
                'specialtyName': specializationsData?.name ?? 'Specialization',
                'doctorsList': specializationsData?.doctorsList ?? [],
              },
            );
          },
          child: specialityCircleAvatar(
            radius: 36,
            svgWidth: 38,
            svgHeight: 38
          ),
        ),
        verticalSpace(10),
        specialityText(),
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
                  child: specialityCircleAvatar(
                    radius: 28,
                    svgHeight: 32,
                    svgWidth: 32
                  ),
                )
              : specialityCircleAvatar(radius: 28, svgHeight: 32, svgWidth: 32),
          verticalSpace(8),
          specialityText(),
        ],
      ),
    );
  }

  CircleAvatar specialityCircleAvatar({
    required double radius,
    required double svgWidth,
    required double svgHeight,
  }) {
    return CircleAvatar(
      radius: radius.w,
      backgroundColor: ColorsManager.lightBlue,
      child: SvgPicture.asset(
        'assets/svgs/doctor_speciality.svg',
        width: svgWidth.w,
        height: svgHeight.h,
        fit: BoxFit.contain,
      ),
    );
  }

  Text specialityText() {
    return Text(
      specializationsData?.name ?? 'Specialization',
      style: itemIndex == selectedIndex
          ? TextStyles.font14DarkBlueBold
          : TextStyles.font12DarkBlueRegular,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
