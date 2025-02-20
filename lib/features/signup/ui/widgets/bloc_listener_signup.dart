import 'package:docdoc/core/helpers/extenstions.dart';
import 'package:docdoc/core/routing/routes.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';

class BlocListenerSignup extends StatelessWidget {
  const BlocListenerSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Success,
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
          error: (message) {
            setupError(context, message);
          },
          success: (data) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 32,
                  ),
                  content: Text(
                    'Account created successfully!',
                    style: Styles.font15DarkBlueMeduim,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginScreen);
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
