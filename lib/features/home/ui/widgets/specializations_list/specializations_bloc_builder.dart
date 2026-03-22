import 'package:docdoc/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/widgets/specializations_list/speciality_list_view.dart';
import 'package:docdoc/features/home/ui/widgets/specializations_list/speciality_list_shimmer_loading.dart';
import 'package:docdoc/features/home/ui/widgets/specializations_list/speciality_grid_view.dart';
import 'package:docdoc/features/home/ui/widgets/specializations_list/speciality_grid_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_state.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  final bool gridView; // Add parameter for grid view
  
  const SpecializationsBlocBuilder({super.key, this.gridView = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
            specializationLoading: () {
              return setupLoading();
            },
            specializationSuccess: (specializationDataList) {
              var specializationsList = specializationDataList;
              return setupSuccess(specializationsList);
            },
            specializationsError: (errorHandler) => setupError(errorHandler),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  /// shimmer loading for specializations (and doctors for home screen)
  Widget setupLoading() {
    if (gridView) {
      return const SpecialityGridShimmerLoading();
    }
    // Horizontal list shimmer for home screen
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const Expanded(child: DoctorsShimmerLoading()),
        ],
      ),
    );
  }



  Widget setupSuccess(dynamic specializationsList) {
    if (gridView) {
      // Grid view for specializations screen
      return SpecialityGridView(
        specializationsList: specializationsList ?? [],
      );
    }
    // Horizontal list for home screen
    return SpecialityListView(
      specializationsList: specializationsList ?? [],
    );
  }

  Widget setupError(dynamic errorHandler) {
    return Center(child: Text(errorHandler.message ?? 'An error occurred'));
  }

}