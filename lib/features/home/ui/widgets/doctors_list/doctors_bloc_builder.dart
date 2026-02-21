import 'package:docdoc/core/helpers/extensions.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/core/theming/styles.dart';
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
          doctorsSuccess: (doctorsList) {
            final specialtyName = context.read<HomeCubit>().selectedSpecialization?.name ?? 'Doctors';
            return setupSuccess(doctorsList, specialtyName, context);
          },
          doctorsError: () => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
      );
  }
}

Widget setupSuccess(doctorsList, String specialtyName, BuildContext context) {
  return Expanded(
    child: Column(
      children: [
        Row(
          children: [
            Text(
              '$specialtyName Doctors',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.specialityDoctorsScreen,
                  arguments: {
                    'specialtyName': specialtyName,
                    'doctorsList': doctorsList,
                  },
                );
              },
              child: Text(
                'See All',
                style: TextStyles.font12BlueRegular,
              ),
            ),
          ],
        ),
        verticalSpace(14),
        DoctorsListView(
          doctorsList: doctorsList,
          specialtyName: specialtyName,
        ),
      ],
    ),
  );
}

Widget setupError() {
  return Container(
    height: 100,
    color: Colors.red,
    child: const Center(child: Text('Failed to load doctors')),
  );
}