import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/home/ui/screens/home_screen.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/ui/screens/login_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/signup/ui/screens/signup_screen.dart';

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

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
