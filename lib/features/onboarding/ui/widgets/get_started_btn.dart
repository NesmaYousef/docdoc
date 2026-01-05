import 'package:docdoc/core/helpers/extensions.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w),
      child: TextButton(

          onPressed: (){
            context.pushNamed(Routes.loginScreen);
          },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorManager.mainBlue),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStatePropertyAll(
            const Size(double.infinity, 52),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text(
          'Get Started',
          style: TextStyles.font16WhiteMedium,
        ),
      ),
    );
  }
}