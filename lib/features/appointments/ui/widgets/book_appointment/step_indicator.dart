import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildStepSegment(1, 'Date & Time')),
          Expanded(child: _buildStepSegment(2, 'Payment')),
          Expanded(child: _buildStepSegment(3, 'Summary', isLast: true)),
        ],
      ),
    );
  }

  Widget _buildStepSegment(int step, String label, {bool isLast = false}) {
    bool isCompleted = step < currentStep;
    bool isActive = step == currentStep;
    bool isUpcoming = step > currentStep;

    Color circleColor = isCompleted
        ? AppColors.success
        : (isActive ? AppColors.primary : AppColors.bgSurface);
    Color borderColor = isCompleted
        ? AppColors.success
        : (isActive ? AppColors.primary : AppColors.bgSurface);
    Color textColor = isUpcoming
        ? AppColors.bgCard
        : (isActive || isCompleted ? AppColors.bgCard : AppColors.textGray);

    Color labelColor = isCompleted
        ? AppColors.success
        : (isActive ? AppColors.textDark : AppColors.textGray);

    // Line logic: 
    // - Green between completed steps and towards an active step.
    // - Gray towards an upcoming step.
    Color lineColorBefore = isCompleted || isActive ? AppColors.success : AppColors.strokeGray;
    Color lineColorAfter = isCompleted ? AppColors.success : AppColors.strokeGray;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: step == 1
                  ? const SizedBox.shrink()
                  : Container(
                      margin: EdgeInsets.only(right: 8.w),
                      height: 2.h,
                      color: lineColorBefore,
                    ),
            ),
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
              ),
              child: Center(
                child: isCompleted
                    ? Icon(Icons.check, color: AppColors.bgCard, size: 16.w)
                    : Text(
                        '$step',
                        style: TextStyles.font14WhiteSemiBold.copyWith(
                          color: textColor,
                        ),
                      ),
              ),
            ),
            Expanded(
              child: isLast
                  ? const SizedBox.shrink()
                  : Container(
                      margin: EdgeInsets.only(left: 8.w),
                      height: 2.h,
                      color: lineColorAfter,
                    ),
            ),

          ],
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: TextStyles.font12GrayRegular.copyWith(
            color: labelColor,
            fontWeight: (isActive || isCompleted) ? FontWeight.w600 : FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }


}
