import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'By logging, you agree to our ',
          style: Styles.font13DarkGrayRegular,
        ),
        TextSpan(
          text: 'Terms & Conditions ',
          style: Styles.font13DarkBlueMeduim,
        ),
        TextSpan(
            text: 'and ',
            style: Styles.font13DarkGrayRegular.copyWith(
              height: 1.5,
            )),
        TextSpan(
          text: 'PrivacyPolicy.',
          style: Styles.font13DarkBlueMeduim,
        ),
      ]),
    );
  }
}
