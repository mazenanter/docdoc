import 'package:docdoc/core/helpers/app_regex.dart';
import 'package:docdoc/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  bool isUpperCase = false;
  bool isLowerCase = false;
  bool isNumber = false;
  bool isSpecialCharacter = false;
  bool isMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        isUpperCase = AppRegex.hasUpperCase(password);
        isLowerCase = AppRegex.hasLowerCase(password);
        isNumber = AppRegex.hasNumber(password);
        isSpecialCharacter = AppRegex.hasSpecialCharacter(password);
        isMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter valid email';
              }
              return null;
            },
            hintText: 'Email',
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Please enter valid passowrd';
              }
              return null;
            },
            hintText: 'Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
            obsucreText: isObscure,
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: isLowerCase,
            hasUpperCase: isUpperCase,
            hasNumber: isNumber,
            hasSpecialCharacter: isSpecialCharacter,
            hasMinLength: isMinLength,
          ),
        ],
      ),
    );
  }
}
