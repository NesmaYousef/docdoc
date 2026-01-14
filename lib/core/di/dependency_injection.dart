import 'package:dio/dio.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/signup/data/repos/signup_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async{
  //Dio & ApiServices
  Dio dio =  DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(()=>LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(()=>LoginCubit(getIt()));

  //SignUp
  getIt.registerLazySingleton<SignupRepo>(()=>SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(()=>SignupCubit(getIt()));
}