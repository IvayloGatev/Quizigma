import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizigma/services/app_localization.dart';

import 'package:quizigma/shared/components/rounded_button.dart';
import 'package:quizigma/shared/constants.dart';
import 'package:quizigma/views/home/welcome/background.dart';
import 'package:quizigma/views/home/login/login.dart';

import '../register/register.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String status = "welcome";

  void setStatus(String view) {
    setState(() => status = view);
  }

  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;

    if (status == 'login') {
      return Login(setStatus: setStatus);
    } else if (status == 'register') {
      return Register(setStatus: setStatus);
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('welcome_title') +
                  "Quizigma",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: AppLocalizations.of(context).translate('login'),
              press: () {
                setStatus('login');
              },
            ),
            RoundedButton(
              text: AppLocalizations.of(context).translate('register'),
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                setStatus('register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
