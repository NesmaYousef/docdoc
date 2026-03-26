import 'package:mediqa/core/helpers/spacing.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:mediqa/core/theme/text_styles.dart';
import 'package:mediqa/core/widgets/custom_app_bar.dart';
import 'package:mediqa/features/home/data/models/specializations_response_model.dart';
import 'package:mediqa/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityDoctorsScreen extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  final String specialtyName;

  const SpecialityDoctorsScreen({
    super.key,
    required this.doctorsList,
    required this.specialtyName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCard,
      appBar: CustomAppBar(title: "$specialtyName Doctors", height: 70.h),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              searchBar(),
              verticalSpace(24),
              Expanded(
                child: DoctorsListView(
                  doctorsList: doctorsList!,
                  specialtyName: specialtyName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container searchBar() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          horizontalSpace(16),
          Icon(Icons.search, color: AppColors.textGray, size: 24.sp),
          horizontalSpace(12),
          Text('Search', style: TextStyles.font14GrayRegular),
        ],
      ),
    );
  }
}
