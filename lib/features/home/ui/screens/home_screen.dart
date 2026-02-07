import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../widgets/doctor_blue_container.dart';
import '../widgets/doctors_list_view.dart';
import '../widgets/doctors_speciality_list_view.dart';
import '../widgets/doctors_speciality_see_all.dart';
import '../widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(4),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is SpecializationLoading ||
                    current is SpecializationSuccess ||
                    current is SpecializationError,
                builder: (context, state) {
                  return state.maybeWhen(
                    specializationLoading: () => SizedBox(
                      height: 100.h,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    specializationSuccess: (specializationsResponseModel) {
                      var specializationsList = specializationsResponseModel.specializationDataList;
                      return    Expanded(
                        child: Column(
                          children: [
                            DoctorsSpecialityListView(
                              specializationsList: specializationsList??[],
                            ),
                            verticalSpace(8),
                            DoctorsListView(

                            ),
                          ],
                        ),
                      );
                    }

                    ,
                    specializationError: (error) => const SizedBox.shrink(),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
