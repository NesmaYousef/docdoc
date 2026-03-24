import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderBackground extends StatelessWidget {
  const ProfileHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 121.h, // Adjusted to achieve the perfect avatar overlap
      decoration: const BoxDecoration(
        color: Color(0xff247CFF),
      ),
    );
  }
}
