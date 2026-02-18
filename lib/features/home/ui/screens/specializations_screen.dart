import 'package:docdoc/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/specializations_list/specializations_bloc_builder.dart';

class SpecializationsScreen extends StatelessWidget {
  const SpecializationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Doctor Speciality', height: 70.h),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const SpecializationsBlocBuilder(gridView: true),
      ),
    );
  }
}
