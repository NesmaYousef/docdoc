import 'package:mediqa/core/helpers/constants.dart';
import 'package:mediqa/core/helpers/shared_pref_helper.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/text_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final name = SharedPrefHelper.getString(SharedPrefKeys.userName);
    final displayName = name.isNotEmpty ? name : 'There';

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $displayName!',
              style: TextStyles.font14DarkBold,
            ),
            Text(
              'How are you today?',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.bgSurface,
          child: SvgPicture.asset('assets/svgs/alert.svg'),
        ),
      ],
    );
  }
}
