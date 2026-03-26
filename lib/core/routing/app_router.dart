import 'package:mediqa/core/di/dependency_injection.dart';
import 'package:mediqa/core/routing/routes.dart';
import 'package:mediqa/features/home/data/models/specializations_response_model.dart';
import 'package:mediqa/features/home/logic/cubit/home_cubit.dart';
import 'package:mediqa/features/home/ui/screens/home_screen.dart';
import 'package:mediqa/features/home/ui/screens/specializations_screen.dart';
import 'package:mediqa/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:mediqa/features/main_layout/ui/main_layout.dart';
import 'package:mediqa/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/search/ui/screens/search_screen.dart';
import '../../features/home/ui/screens/doctor_details_screen.dart';
import '../../features/home/ui/screens/speciality_doctors_screen.dart';
import '../../features/auth/login/ui/screens/login_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/auth/signup/ui/screens/signup_screen.dart';
import '../../features/appointments/logic/cubit/book_appointment_cubit.dart';
import '../../features/appointments/ui/screens/book_appointment_screen.dart';

import '../../features/appointments/ui/screens/appointments_screen.dart';
import '../../features/appointments/ui/screens/booking_confirmed_screen.dart';
import '../../features/appointments/data/models/appointments_response_model.dart';

import '../../features/profile/ui/screens/personal_information_screen.dart';
import '../../features/profile/ui/screens/medical_record_screen.dart';
import '../../features/profile/ui/screens/payment_screen.dart';
import '../../features/profile/ui/screens/notification_screen.dart';
import '../../features/profile/ui/screens/faq_screen.dart';
import '../../features/profile/ui/screens/security_screen.dart';
import '../../features/profile/ui/screens/language_screen.dart';
import '../../features/profile/ui/screens/settings_screen.dart';
import '../../features/profile/logic/cubit/profile_cubit.dart';
class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    //This arguments to be passed to screens like this: (arguments as ClassName)
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
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
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getUserProfile(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()..getSpecializations(),
              ),
            ],
            child: const MainLayout(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context)=> HomeScreen(),
        );

      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const SearchScreen(),
          ),
        );

      case Routes.specializationsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const SpecializationsScreen(),
          ),
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

      case Routes.appointmentsScreen:
        return MaterialPageRoute(
          builder: (context) => const AppointmentsScreen(),
        );

      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const SettingsScreen(),
          ),
        );

      case Routes.personalInformation:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: const PersonalInformationScreen(),
          ),
        );

      case Routes.medicalRecords:
        return MaterialPageRoute(builder: (_) => const MedicalRecordScreen());

      case Routes.payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());

      case Routes.notificationSettings:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      case Routes.faq:
        return MaterialPageRoute(builder: (_) => const FaqScreen());

      case Routes.security:
        return MaterialPageRoute(builder: (_) => const SecurityScreen());

      case Routes.language:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
