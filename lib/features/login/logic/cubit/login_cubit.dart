import 'package:docdoc/core/helpers/constants.dart';
import 'package:docdoc/core/helpers/shared_pref_helper.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/repo/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitLoginStates() async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (loginResonse) {
        saveToken(loginResonse.userData!.token);
        emit(LoginState.success(loginResonse));
      },
      error: (error) {
        emit(LoginState.error(message: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void saveToken(token) async {
    await SharedPrefHelper.saveData(SharedPrefKeys.TOKEN, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
