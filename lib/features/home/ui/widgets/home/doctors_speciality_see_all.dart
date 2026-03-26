import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  const DoctorsSpecialitySeeAll({super.key, this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text ?? 'Doctor Speciality',
          style: TextStyles.font18DarkSemiBold,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap ?? () {},
          child: Text(
            'See All',
            style: TextStyles.font12PrimaryRegular,
          ),
        ),
      ],
    );
  }
}
