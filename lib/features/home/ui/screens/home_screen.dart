import 'package:docdoc/core/helpers/extensions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/home/ui/widgets/home/home_top_bar.dart';
import 'package:docdoc/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../logic/cubit/home_cubit.dart';
import '../widgets/home/doctor_blue_container.dart';
import '../widgets/doctors_list/doctors_bloc_builder.dart';
import '../widgets/home/doctors_speciality_see_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..getSpecializations(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTopBar(),
                const DoctorBlueContainer(),
                verticalSpace(24),
                DoctorsSpecialitySeeAll(
                  onTap: () => context.pushNamed(Routes.specializationsScreen),
                ),
                verticalSpace(4),
                const SpecializationsBlocBuilder(),
                verticalSpace(14),
                const DoctorsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
