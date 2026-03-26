import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final String value;
  final bool obscure;
  final Widget? prefix;

  const ProfileField({
    super.key,
    required this.label,
    required this.value,
    this.obscure = false,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font14GrayRegular),
        verticalSpace(8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.strokeGray),
          ),
          child: Row(
            children: [
              if (prefix != null) ...[prefix!, horizontalSpace(4)],
              Expanded(
                child: Text(
                  value,
                  style: TextStyles.font14DarkMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
