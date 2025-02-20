import 'package:docdoc/core/helpers/extenstions.dart';
import 'package:docdoc/core/theming/colors_manager.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  ),
                );
              },
            );
          },
          success: (loginResponseBody) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (message) {
            setupError(context, message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupError(BuildContext context, String message) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text(
            message,
            style: Styles.font15DarkBlueMeduim,
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'OK',
                style: Styles.font14BlueSemiBold,
              ),
            ),
          ],
        );
      },
    );
  }
}
