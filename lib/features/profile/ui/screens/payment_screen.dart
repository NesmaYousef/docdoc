import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Payment'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        children: [
          _buildPaymentMethod(
            'Mastercard',
            '**** **** **** 1234',
            'assets/svgs/calendar.svg', // Placeholder
            true,
          ),
          _buildPaymentMethod(
            'Visa',
            '**** **** **** 5678',
            'assets/svgs/calendar.svg', // Placeholder
            false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsManager.mainBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildPaymentMethod(
      String title, String subtitle, String icon, bool isDefault) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDefault ? ColorsManager.mainBlue : const Color(0xffECECEC),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xffF9FAFB),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.credit_card, color: ColorsManager.mainBlue),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.font14DarkBlueMedium),
                Text(subtitle, style: TextStyles.font12GrayRegular),
              ],
            ),
          ),
          if (isDefault)
            const Icon(Icons.check_circle, color: ColorsManager.mainBlue),
        ],
      ),
    );
  }
}
