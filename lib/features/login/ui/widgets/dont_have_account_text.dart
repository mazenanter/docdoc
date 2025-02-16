import 'package:docdoc/core/helpers/extenstions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Don\'t have an account yet?',
              style: Styles.font13DarkBlueRegular),
          TextSpan(
            text: 'Sign Up',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signUpScreen);
              },
            style: Styles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
