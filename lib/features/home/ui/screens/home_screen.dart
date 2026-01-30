

import 'package:flutter/material.dart';

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
              DoctorsSpecialityListView(),
              verticalSpace(8),
              DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}

