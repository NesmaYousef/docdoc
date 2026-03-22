import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class AppointmentErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppointmentErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 48.sp, color: Colors.redAccent),
          verticalSpace(12),
          Text(
            message,
            style: TextStyles.font14GrayRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(12),
          TextButton(
            onPressed: onRetry,
            child: Text('Try Again', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
