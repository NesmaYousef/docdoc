import 'package:mediqa/core/helpers/extensions.dart';
import 'package:mediqa/core/routing/routes.dart';
import 'package:mediqa/features/home/ui/widgets/home/home_top_bar.dart';
import 'package:mediqa/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/home/hero_booking_card.dart';
import '../widgets/doctors_list/doctors_bloc_builder.dart';
import '../widgets/home/doctors_speciality_see_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: HomeTopBar(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: HeroBookingCard(),
                ),
                verticalSpace(24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DoctorsSpecialitySeeAll(
                    onTap: () => context.pushNamed(Routes.specializationsScreen),
                  ),
                ),
                verticalSpace(4),
                const SpecializationsBlocBuilder(),
                verticalSpace(14),
                const Expanded(
                  child: DoctorsBlocBuilder(),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
