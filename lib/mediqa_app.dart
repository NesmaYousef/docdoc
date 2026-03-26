import 'package:mediqa/core/helpers/constants.dart';
import 'package:mediqa/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mediqa/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';

class MediqaApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isLoggedInUser;
  const MediqaApp({super.key, required this.appRouter, required this.isLoggedInUser});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Mediqa App',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedInUser ? Routes.mainLayout : Routes.onboardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
