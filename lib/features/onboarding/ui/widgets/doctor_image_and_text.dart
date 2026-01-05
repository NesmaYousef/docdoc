import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svgs/docdoc_logo_low_opacity.svg',

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
              padding:  EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Text('Best Doctor\n Appointment App',
                textAlign: TextAlign.center,
                style: TextStyles.font32BlueBold.copyWith(
                  height: 1.4,
                ),
              ),
            ), ),
      ]

    );
  }
}
