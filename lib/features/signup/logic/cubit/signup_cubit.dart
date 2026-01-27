import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/signup/data/models/signup_request_body.dart';
import 'package:docdoc/features/signup/data/repos/signup_repo.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/cupertino.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupState.initialSignup());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignUp() async {
    emit(SignupState.initialSignup());
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
      failure: (error) {
        final errorsMap = error.apiErrorModel.data;
        final allErrors = errorsMap?.values
            .expand((e) => e)
            .join('\n')
            ?? '';
        emit(
          SignupState.signupError(
            error: allErrors,
          ),
        );

        //To show only the first error
        // final errorsMap = error.apiErrorModel.data;
        // final firstError = errorsMap?.values
        //     .expand((e) => e)
        //     .firstOrNull ?? '';
        // emit(SignupState.signupError(error: firstError));
        // old
        // emit(
        // SignupState.signupError(
        // error: error.apiErrorModel.data?['name']?.first ?? '',
        // );
      }


    );
  }
}
