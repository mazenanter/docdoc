import 'package:bloc/bloc.dart';
import 'package:docdoc/features/signup/data/repo/signup_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/sign_up_request_body.dart';

part 'signup_cubit.freezed.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(const SignupState.initial());
  final SignupRepo signupRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final result = await signupRepo.signup(
      signUpRequestBody: SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
        passwordConfirmation: confirmPasswordController.text,
        gender: 0,
      ),
    );
    result.when(
      success: (data) {
        emit(SignupState.success(data));
      },
      error: (error) {
        emit(SignupState.error(message: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
