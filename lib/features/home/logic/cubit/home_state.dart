import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_handler.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with  _$HomeState <T>{
  const factory HomeState.initial() = _initial;

  // Specializations
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(List<SpecializationsData?>? specializationDataList) = SpecializationSuccess<T>;
  const factory HomeState.specializationError(ErrorHandler errorHandler) = SpecializationError;

  // Doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess<T>;
  const factory HomeState.doctorsError(ErrorHandler errorHandler) = DoctorsError;
}
