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
  String error;

  void submit() async {
    if (_formKey.currentState.validate()) {
      dynamic result =
          await _controller.registerWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          error = AppLocalizations.of(context).translate('register_error');
        });
      }
    }
  }

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
                // added validator
                validator: (value) {
                  if (value.isEmpty) {
                    return 'E-mail is required';
                  }
                  if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    return 'Please enter a valid email Address';
                  }
                  return null;
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                // added validator
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (value.length > 25) {
                    return 'Password must be less than 25 characters';
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: AppLocalizations.of(context).translate('register'),
                press: () async {
                  submit();
                },
              ),
              SizedBox(height: size.height * 0.03), // added
              showAlert(),
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

  Widget showAlert() {
    if (error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(
                error,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }
}
