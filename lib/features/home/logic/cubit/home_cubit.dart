
import 'package:docdoc/core/helpers/constants.dart';
import 'package:docdoc/core/helpers/shared_pref_helper.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/repos/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeState.initial());

  void getSpecializations() async{
    emit(HomeState.specializationLoading());

   // debugPrint('3- : ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}');

    final response = await _homeRepo.getSpecializations();

    response.when(
        success: (specializationsResponseModel){
          emit(HomeState.specializationSuccess(specializationsResponseModel));
        },
        failure: (error){
          emit(HomeState.specializationError(error: error.apiErrorModel.message??""));
        },);


  }
}
