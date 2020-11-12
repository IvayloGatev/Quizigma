import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/shared/components/already_have_an_account_acheck.dart';
import 'package:quizigma/shared/components/rounded_button.dart';
import 'package:quizigma/shared/components/rounded_input_field.dart';
import 'package:quizigma/shared/components/rounded_password_field.dart';
import 'package:quizigma/views/home/register/background.dart';
import 'package:quizigma/views/home/register/or_divider.dart';
import 'package:quizigma/views/home/register/social_icon.dart';

class Body extends StatefulWidget {
  final Function setStatus;

  Body({this.setStatus});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller = HomeController();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: AppLocalizations.of(context).translate('email_hint'),
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: AppLocalizations.of(context).translate('register'),
                press: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _controller
                        .registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = AppLocalizations.of(context)
                            .translate('register_error');
                      });
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  widget.setStatus('login');
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
