import 'package:docdoc/core/helpers/extenstions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Alreade have an account yet?',
              style: Styles.font13DarkBlueRegular),
          TextSpan(
            text: 'Login',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
            style: Styles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
