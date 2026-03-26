import 'package:mediqa/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/cubit/home_cubit.dart';
import '../widgets/specializations_list/specializations_bloc_builder.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsScreen extends StatefulWidget {
  const SpecializationsScreen({super.key});

  @override
  State<SpecializationsScreen> createState() => _SpecializationsScreenState();
}

class _SpecializationsScreenState extends State<SpecializationsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSpecializations();
  }

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
