import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/app_router.dart';
import 'package:docdoc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/extensions.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  setupGetIt();
  runApp(
      DocApp(
        appRouter: AppRouter(),
      ));

}
Future<void> checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  // await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}