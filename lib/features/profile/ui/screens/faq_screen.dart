import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCard,
      appBar: CustomAppBar(
        title: 'FAQ',
        trailing: Container(
          margin: EdgeInsets.only(right: 20.w),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.strokeGray, width: 1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.search, size: 20.sp, color: AppColors.textDark),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        children: [
          _buildFaqItem(
            'What should I expect during a doctor\'s appointment?',
            'During a doctor\'s appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.',
          ),
          _buildFaqItem(
            'What should I bring to my doctor\'s appointment?',
            'Bring your ID, insurance card, and a list of current medications.',
          ),
          _buildFaqItem(
            'What if I need to cancel or reschedule my appointment?',
            'You can reschedule or cancel through the app up to 24 hours before.',
          ),
          _buildFaqItem(
            'How do I make an appointment with a doctor?',
            'Select a doctor from the home screen and choose a time slot.',
          ),
          _buildFaqItem(
            'How early should I arrive for my doctor\'s appointment?',
            'We recommend arriving 15 minutes early to complete any paperwork.',
          ),
          _buildFaqItem(
            'How long will my doctor\'s appointment take?',
            'Most appointments last between 20 to 45 minutes.',
          ),
          _buildFaqItem(
            'How much will my doctor\'s appointment cost?',
            'Costs vary based on your insurance and the type of service.',
          ),
          _buildFaqItem(
            'What should I look for in a good doctor?',
            'Consider their specialty, experience, and patient reviews.',
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Column(
      children: [
        Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              question,
              style: TextStyles.font14DarkMedium.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
            iconColor: AppColors.textGray,
            collapsedIconColor: AppColors.textGray,
            tilePadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                child: Text(
                  answer,
                  style: TextStyles.font12GrayRegular.copyWith(height: 1.5, color: AppColors.textGray),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.bgSurface),
      ],
    );
  }
}
