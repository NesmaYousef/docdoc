import 'package:mediqa/core/helpers/spacing.dart';
import 'package:mediqa/features/onboarding/ui/widgets/mediqa_logo_and_name.dart';
import 'package:mediqa/features/onboarding/ui/widgets/doctor_image_and_text.dart';
import 'package:mediqa/features/onboarding/ui/widgets/get_started_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h,),
            child:  Column(
              children: [
                const MediqaLogoAndName(),
                verticalSpace(30),
                const DoctorImageAndText(),
                verticalSpace(30),
                const GetStartedBtn(),
              ],
            ),
          )),
    );
  }
}
