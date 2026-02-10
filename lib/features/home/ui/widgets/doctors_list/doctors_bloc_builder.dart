import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: (doctorsList) => setupSuccess(doctorsList),
          doctorsError: (error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
      );
  }
}

Widget setupSuccess(doctorsList) {
  return DoctorsListView(
    doctorsList: doctorsList,
  );
}

Widget setupError() {
  return Container(
    height: 100,
    color: Colors.red,
    child: const Center(child: Text('Failed to load doctors')),
  );
}