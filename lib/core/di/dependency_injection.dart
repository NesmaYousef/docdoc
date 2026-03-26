import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/appointments/data/repos/appointments_repo.dart';
import '../../features/appointments/logic/cubit/appointments_view_cubit.dart';
import '../../features/appointments/logic/cubit/book_appointment_cubit.dart';

import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/profile/logic/cubit/profile_cubit.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/signup/data/repos/signup_repo.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/auth/signup/logic/cubit/signup_cubit.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';

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
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));


  // Appointments
  getIt.registerLazySingleton<AppointmentsRepo>(
        () => AppointmentsRepo(getIt()),
  );
  getIt.registerFactory<AppointmentsViewCubit>(() => AppointmentsViewCubit(getIt()));
  getIt.registerFactory<BookAppointmentCubit>(() => BookAppointmentCubit(getIt()));

  // Profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));

}

