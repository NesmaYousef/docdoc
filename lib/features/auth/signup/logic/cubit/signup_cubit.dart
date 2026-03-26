import 'package:bloc/bloc.dart';
import 'package:mediqa/core/network/api_result.dart';
import 'package:mediqa/features/auth/signup/data/models/signup_request_body.dart';
import 'package:mediqa/features/auth/signup/data/repos/signup_repo.dart';
import 'package:mediqa/features/auth/signup/logic/cubit/signup_state.dart';
import 'package:flutter/cupertino.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupState.signupInitial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignUp() async {
    emit(SignupState.signupInitial());
    final response = await signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (response) => emit(SignupState.signupSuccess(response)),
      failure: (apiErrorModel) {
        emit(SignupState.signupError(apiErrorModel));
      },
    );
  }
}
