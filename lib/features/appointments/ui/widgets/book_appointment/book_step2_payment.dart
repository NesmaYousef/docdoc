import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/text_styles.dart';

class BookStep2Payment extends StatelessWidget {
  final String selectedPayment;
  final ValueChanged<String> onPaymentChanged;
  final VoidCallback onContinue;

  const BookStep2Payment({
    super.key,
    required this.selectedPayment,
    required this.onPaymentChanged,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Option',
            style: TextStyles.font16BlackBold,
          ),
          SizedBox(height: 24.h),
          _buildPaymentOption(
            title: 'Credit Card',
            isSelected: selectedPayment == 'Credit Card',
            isMain: true,
            onTap: () => onPaymentChanged('Credit Card'),
          ),
          if (selectedPayment == 'Credit Card') ...[
            SizedBox(height: 16.h),
            Container(
              margin: EdgeInsets.only(left: 32.w),
              child: Column(
                children: [
                  _buildCardItem(Colors.orange, 'Master Card'),
                  const Divider(color: ColorsManager.moreLighterGray),
                  _buildCardItem(Colors.blue, 'American Express'),
                  const Divider(color: ColorsManager.moreLighterGray),
                  _buildCardItem(Colors.red, 'Capital One'),
                  const Divider(color: ColorsManager.moreLighterGray),
                  _buildCardItem(Colors.lightBlue, 'Barclays'),
                ],
              ),
            ),
          ],

          SizedBox(height: 24.h),
          _buildPaymentOption(
            title: 'Bank Transfer',
             isSelected: selectedPayment == 'Bank Transfer',
            isMain: true,
            onTap: () => onPaymentChanged('Bank Transfer'),
          ),
           SizedBox(height: 24.h),
          _buildPaymentOption(
            title: 'Paypal',
             isSelected: selectedPayment == 'Paypal',
            isMain: true,
            onTap: () => onPaymentChanged('Paypal'),
          ),


          SizedBox(height: 48.h),
          AppTextButton(
            buttonText: 'Continue',
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: onContinue,
          ),
           SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    bool isMain = false,
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? ColorsManager.mainBlue : ColorsManager.lightGray,
                width: isSelected ? 6 : 1,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            title,
            style: isMain ? TextStyles.font14BlackRegular.copyWith(fontWeight: FontWeight.w500) : TextStyles.font14DarkBlueMedium,
          ),
          if (trailing != null) ...[
            const Spacer(),
            trailing,
          ],
        ],
      ),
    );
  }


  Widget _buildCardItem(Color color, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Icon(Icons.credit_card, size: 16.w, color: color),
          ),
          SizedBox(width: 12.w),
          Text(
            name,
            style: TextStyles.font14DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}


