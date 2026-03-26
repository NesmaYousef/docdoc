import 'package:bloc/bloc.dart';
import 'package:mediqa/core/helpers/constants.dart';
import 'package:mediqa/core/helpers/shared_pref_helper.dart';
import 'package:mediqa/core/network/api_result.dart';
import 'package:mediqa/core/network/dio_factory.dart';
import 'package:mediqa/features/auth/login/data/models/login_request_body.dart';
import 'package:mediqa/features/auth/login/data/repos/login_repo.dart';
import 'package:flutter/cupertino.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.loginInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserInfo(
          loginResponse.userData?.token ?? '',
          loginResponse.userData?.userName ?? '',
        );
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (apiErrorModel) {
        emit(LoginState.loginError(apiErrorModel));
      },
    );
  }
}

Future<void> saveUserInfo(String token, String userName) async {
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  await SharedPrefHelper.setData(SharedPrefKeys.userName, userName);
  DioFactory.setTokenIntoHeaderAfterLogin(token);
}
