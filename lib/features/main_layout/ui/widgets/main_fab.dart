import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainFAB extends StatelessWidget {
  const MainFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 4,
      backgroundColor: ColorsManager.mainBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.r), // Rounded corners
      ),
      child: Icon(
        CupertinoIcons.search,
        size: 28,
        color: Colors.white,
      ),
    );
  }
}
