import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:flutter/cupertino.dart';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async{
    emit(const LoginState.loading());
    final response =  await _loginRepo.login(
      LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
      ),
    );
    response.when(
        success: (loginResponse){
          emit ( LoginState.success(loginResponse));
        },
        failure: (error){
          emit( LoginState.error(error:error.apiErrorModel.message??''));
        },
    );
  }
}
