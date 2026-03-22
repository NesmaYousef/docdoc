import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/ui/screens/home_screen.dart';
import 'package:docdoc/features/home/ui/screens/specializations_screen.dart';
import 'package:docdoc/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/main_layout/ui/main_layout.dart';
import 'package:docdoc/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/screens/doctor_details_screen.dart';
import '../../features/home/ui/screens/speciality_doctors_screen.dart';
import '../../features/auth/login/ui/screens/login_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/auth/signup/ui/screens/signup_screen.dart';
import '../../features/appointments/logic/cubit/book_appointment_cubit.dart';
import '../../features/appointments/ui/screens/book_appointment_screen.dart';

import '../../features/appointments/ui/screens/booking_confirmed_screen.dart';
import '../../features/appointments/data/models/appointments_response_model.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    //This arguments to be passed to screens like this: (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
        );

        
      case Routes.mainLayout:
        return MaterialPageRoute(builder: (context) => MainLayout(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context)=> HomeScreen(),
        );
        
      case Routes.specializationsScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (_) => getIt<HomeCubit>()..getSpecializations(),
              child: const SpecializationsScreen(),
            );
          },
        );

      case Routes.specialityDoctorsScreen:
        final args = arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (context) => SpecialityDoctorsScreen(
            doctorsList: args?['doctorsList'],
            specialtyName: args?['specialtyName'] ?? 'Doctors',
          ),
        );

        case Routes.doctorDetailsScreen:
        final doctor = arguments as Doctors?;
        return MaterialPageRoute(
          builder: (context) => DoctorDetailsScreen(doctorModel: doctor),
        );
        
      case Routes.bookAppointmentScreen:
        final doctor = arguments as Doctors?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<BookAppointmentCubit>(),
            child: BookAppointmentScreen(doctor: doctor!),
          ),
        );

        
      case Routes.bookingConfirmedScreen:
        final appointment = arguments as AppointmentModel?;
        return MaterialPageRoute(
          builder: (context) => BookingConfirmedScreen(appointment: appointment!),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
