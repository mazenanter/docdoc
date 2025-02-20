import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:docdoc/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:docdoc/features/signup/ui/widgets/bloc_listener_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: Styles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: Styles.font14GrayRegular,
              ),
              verticalSpace(31),
              Column(
                children: [
                  const SignupForm(),
                  verticalSpace(40),
                  AppTextButton(
                    text: 'Create Account',
                    textStyle: Styles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                  verticalSpace(16),
                  const TermsAndConditionsText(),
                  verticalSpace(30),
                  const AlreadyHaveAnAccount(),
                  const BlocListenerSignup(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
