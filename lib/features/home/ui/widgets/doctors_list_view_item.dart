import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  const DoctorsListViewItem({super.key, required this.doctorsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12.r),
            child: Image.asset(
              'assets/images/doc1.png',
              height: 120.h,
              width: 110.w,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name??'name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${doctorsModel?.degree} | ${ doctorsModel?.phone}',
                  style: TextStyles.font12GrayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(doctorsModel?.email??'email', style: TextStyles.font12GrayMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
