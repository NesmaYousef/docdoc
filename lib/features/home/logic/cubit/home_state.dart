import 'package:docdoc/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with  _$HomeState <T>{
  const factory HomeState.initial() = _initial;

  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess( SpecializationsResponseModel specializationsResponseModel) = SpecializationSuccess<T>;
  const factory HomeState.specializationError({required String error}) = SpecializationError;

}
