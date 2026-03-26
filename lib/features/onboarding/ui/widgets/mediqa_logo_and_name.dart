import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediqa/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Replaces DocLogoAndName — updated brand name + logo mark.
class MediqaLogoAndName extends StatelessWidget {
  const MediqaLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       SvgPicture.asset('assets/svgs/mediqa_logo.svg'),
        SizedBox(width: 10.w),
        // Brand wordmark
        Text(
          'Mediqa',
          style: TextStyles.font24DarkBold.copyWith(
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}