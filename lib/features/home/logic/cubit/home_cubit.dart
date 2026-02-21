import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/specializations_response_model.dart';

import '../../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  List<SpecializationsData?>? specializationsList = [];
  SpecializationsData? selectedSpecialization;

  // Specializations
  void getSpecializations() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        if (specializationsList?.isNotEmpty == true) {
          selectedSpecialization = specializationsList?.first;
          getDoctorsList(specializationId: selectedSpecialization?.id);
        }

        emit(HomeState.specializationSuccess(
            specializationsResponseModel.specializationDataList));
      },
      failure: (apiErrorModel) {
        emit(HomeState.specializationsError(apiErrorModel));
      },
    );
  }

  // Doctors
  void getDoctorsList({required int? specializationId}) {
    selectedSpecialization = specializationsList?.firstWhere(
            (specialization) => specialization?.id == specializationId,
        orElse: () => null);

    List<Doctors?>? doctorsList =
    getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorsError());
    }
  }

  /// returns the list of doctors based on the specialization id
  List<Doctors?>? getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}