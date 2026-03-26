import 'package:mediqa/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svgs/mediqa_logo_low_opacity.svg',

        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withAlpha(0),
                ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14,0.4]
            )
          ),
          child: Image.asset('assets/images/onboarding_doctor.png'),
        ),
        Positioned(
          bottom: 30,
            left: 0,
            right: 0,
            child:
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
              child:
              Column(
                children: [
                  Text(
                    'Your health,\nyour schedule.',
                    style: TextStyles.font24DarkBold.copyWith(height: 1.3),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(12),
                  Text(
                    'Book appointments with top doctors nearby — fast, simple, and stress-free.',
                    style: TextStyles.font14GrayRegular.copyWith(
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

            ), ),
      ]

    );
  }
}
