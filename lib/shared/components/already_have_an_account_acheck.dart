import 'package:flutter/material.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/shared/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? AppLocalizations.of(context).translate('dont_have_account')
              : AppLocalizations.of(context).translate('have_account'),
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? AppLocalizations.of(context).translate('sign_up')
                : AppLocalizations.of(context).translate('sign_in'),
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
