import 'package:docdoc/core/helpers/app_regex.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:docdoc/features/login/ui/widgets/password_validations.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;
  bool isObscure = true;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasUpperCase = AppRegex.hasUpperCase(password);
        hasLowerCase = AppRegex.hasLowerCase(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignupCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: context.read<SignupCubit>().nameController,
              hintText: 'Name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: context.read<SignupCubit>().phoneController,
              hintText: 'Phone number',
              validator: (value) {
                if (value!.isEmpty || !AppRegex.hasNumber(value)) {
                  return 'Please enter valid name';
                }
                return null;
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: context.read<SignupCubit>().emailController,
              hintText: 'Email',
              validator: (value) {
                if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              controller: context.read<SignupCubit>().passwordController,
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
                child:
                    Icon(isObscure ? Icons.visibility_off : Icons.visibility),
              ),
              obsucreText: isObscure,
            ),
            verticalSpace(18),
            AppTextFormField(
              obsucreText: isObscure,
              controller: context.read<SignupCubit>().confirmPasswordController,
              hintText: 'Password confirmation',
              validator: (value) {
                if (value!.isEmpty || !AppRegex.isPasswordValid(value)) {
                  return 'Please enter valid name';
                }
                return null;
              },
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility)),
            ),
            verticalSpace(24),
            PasswordValidations(
              hasUpperCase: hasUpperCase,
              hasLowerCase: hasLowerCase,
              hasNumber: hasNumber,
              hasSpecialCharacter: hasSpecialCharacter,
              hasMinLength: hasMinLength,
            ),
          ],
        ));
  }
}
