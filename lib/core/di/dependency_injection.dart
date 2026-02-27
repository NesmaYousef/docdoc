import 'package:dio/dio.dart';
import 'package:docdoc/core/network/api_service.dart';
import 'package:docdoc/core/network/dio_factory.dart';
import 'package:docdoc/features/auth/login/data/repos/login_repo.dart';
import 'package:docdoc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';

import 'package:docdoc/features/auth/signup/data/repos/signup_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo.dart';
import '../../features/auth/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //SignUp
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
