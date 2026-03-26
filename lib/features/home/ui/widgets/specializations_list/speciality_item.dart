import 'package:mediqa/core/helpers/extensions.dart';
import 'package:mediqa/core/routing/routes.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:mediqa/features/home/data/models/specializations_response_model.dart';
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
    final bool isSelected = itemIndex == selectedIndex;
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 24.w),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(isSelected ? 2.w : 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2.w,
              ),
            ),
            child: specialityCircleAvatar(
              radius: 28,
              svgHeight: 32,
              svgWidth: 32,
              isSelected: isSelected,
            ),
          ),
          verticalSpace(8),
          specialityText(),
        ],
      ),
    );
  }

  Widget specialityCircleAvatar({
    required double radius,
    required double svgWidth,
    required double svgHeight,
    bool isSelected = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: radius.w * 2,
      height: radius.w * 2,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.primarySurface,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: _buildIcon(
          _getSpecialityAssetPath(specializationsData?.name),
          svgWidth.w,
          svgHeight.h,
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, double width, double height) {
    if (assetPath.endsWith('.svg')) {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      );
    }
  }

  String _getSpecialityAssetPath(String? name) {
    if (name == null) return 'assets/svgs/specializations/general.png';
    final lowerName = name.trim().toLowerCase();
    
    if (lowerName.contains('cardiology') || lowerName.contains('cardiologist')) return 'assets/svgs/specializations/cardiologist.svg';
    if (lowerName.contains('neurology') || lowerName.contains('neurologic') || lowerName.contains('psychiatry')) return 'assets/svgs/specializations/neurologic.png';
    if (lowerName.contains('pediatric')) return 'assets/svgs/specializations/pediatric.png';
    if (lowerName.contains('urology') || lowerName.contains('urologist')) return 'assets/svgs/specializations/urologist.png';
    if (lowerName.contains('ophthalmology') || lowerName.contains('optometry')) return 'assets/svgs/specializations/optometry.svg';
    if (lowerName.contains('gastroenterology') || lowerName.contains('intestine')) return 'assets/svgs/specializations/intrstine.svg';
    if (lowerName.contains('hepatology')) return 'assets/svgs/specializations/hepatology.svg';
    if (lowerName.contains('histology') || lowerName.contains('histologist')) return 'assets/svgs/specializations/histologist.svg';
    if (lowerName.contains('dentistry') || lowerName.contains('dental')) return 'assets/svgs/specializations/dentistry.svg';
    if (lowerName.contains('ent')) return 'assets/svgs/specializations/ent.svg';
    if (lowerName.contains('pulmonary') || lowerName.contains('pulmonology')) return 'assets/svgs/specializations/pulmonary.svg';
    
    // Fallback for Orthopedics, Dermatology, Gynecology, etc.
    return 'assets/svgs/specializations/general.png';
  }

  Text specialityText() {
    return Text(
      specializationsData?.name ?? 'Specialization',
      style: itemIndex == selectedIndex
          ? TextStyles.font14DarkBold
          : TextStyles.font12DarkRegular,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
