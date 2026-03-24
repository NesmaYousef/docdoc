import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Medical Records'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment_outlined,
                size: 80.sp, color: Colors.grey.withOpacity(0.5)),
            SizedBox(height: 16.h),
            Text(
              'No medical records found',
              style: TextStyles.font14GrayRegular,
            ),
          ],
        ),
      ),
    );
  }
}
