import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/enums.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class AppointmentEmptyState extends StatelessWidget {
  final AppointmentType type;

  const AppointmentEmptyState({super.key, required this.type});

  static const _emptyLabel = {
    AppointmentType.upcoming: 'No upcoming appointments',
    AppointmentType.completed: 'No completed appointments',
    AppointmentType.cancelled: 'No cancelled appointments',
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svgs/calendar.svg',
            height: 56.h,
            width: 56.w,
            colorFilter: const ColorFilter.mode(
              AppColors.strokeGray,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(12),
          Text(
            _emptyLabel[type]!,
            style: TextStyles.font14GrayRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
