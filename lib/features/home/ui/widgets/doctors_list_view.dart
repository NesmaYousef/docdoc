import 'package:docdoc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context, index) {
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
                          'Dr. Randy Wigham',
                          style: TextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                        ),
                        Text('General | RSUD Gatot Subroto ',
                          style: TextStyles.font12GrayMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('wigham@gmail.com',
                          style: TextStyles.font12GrayMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            );
            },
        ),);
  }
}
