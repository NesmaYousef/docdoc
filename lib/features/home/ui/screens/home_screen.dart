import 'package:docdoc/features/home/ui/widgets/home/home_top_bar.dart';
import 'package:docdoc/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/home/doctor_blue_container.dart';
import '../widgets/doctors_list/doctors_bloc_builder.dart';
import '../widgets/home/doctors_speciality_see_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorBlueContainer(),
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(4),
              SpecializationsBlocBuilder(),
              verticalSpace(14),
              DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
