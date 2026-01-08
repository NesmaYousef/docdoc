import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:docdoc/features/onboarding/ui/widgets/doctor_image_and_text.dart';
import 'package:docdoc/features/onboarding/ui/widgets/get_started_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';

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
                const DocLogoAndName(),
                verticalSpace(30),
                const DoctorImageAndText(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text('Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font12GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                verticalSpace(30),
                AppTextButton(
                  horizontalPadding: 30,
                    buttonText: 'Get Started',
                    textStyle: TextStyles.font16WhiteMedium,
                    onPressed: (){}),
                verticalSpace(30),

                const GetStartedBtn(),
              ],
            ),
          )),
    );
  }
}
