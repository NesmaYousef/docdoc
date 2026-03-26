import 'package:mediqa/core/di/dependency_injection.dart';
import 'package:mediqa/core/helpers/extensions.dart';
import 'package:mediqa/core/helpers/shared_pref_helper.dart';
import 'package:mediqa/core/routing/app_router.dart';
import 'package:mediqa/mediqa_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mediqa/features/home/data/models/specializations_hive_adapters.dart';

import 'core/helpers/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(SpecializationsResponseModelAdapter());
  Hive.registerAdapter(SpecializationsDataAdapter());
  Hive.registerAdapter(DoctorsAdapter());
  await Hive.openBox('home_cache');
  await Hive.openBox('recent_searches');
  await checkIfLoggedInUser();
  setupGetIt();
  runApp(
      MediqaApp(
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