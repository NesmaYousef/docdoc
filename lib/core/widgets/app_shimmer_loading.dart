import 'package:mediqa/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerLoading extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;

  const AppShimmerLoading({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.strokeGray,
      highlightColor: AppColors.bgCard,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 100.h,
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
      ),
    );
  }
}
