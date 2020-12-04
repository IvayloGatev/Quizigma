import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizigma/controllers/home_controller.dart';
import 'package:quizigma/services/app_localization.dart';
import 'package:quizigma/shared/components/already_have_an_account_acheck.dart';
import 'package:quizigma/shared/components/rounded_button.dart';
import 'package:quizigma/shared/components/rounded_input_field.dart';
import 'package:quizigma/shared/components/rounded_password_field.dart';
import 'package:quizigma/views/home/login/background.dart';
import 'email_field_validator.dart';
import 'password_field_validator.dart';

class Body extends StatefulWidget {
  final Function setStatus;

  Body({this.setStatus});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = '';
  String password = '';
  String error;

  final _controller = HomeController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState.validate()) {
      dynamic result =
          await _controller.signInWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          error = AppLocalizations.of(context).translate('login_error');
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
              AppLocalizations.of(context).translate('login'),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: AppLocalizations.of(context).translate('email_hint'),
              // added validator
              validator: EmailFieldValidator.validate,
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              // added validator
              validator: PasswordFieldValidator.validate,
              onChanged: (value) {
                password = value;
              },
            ),

            RoundedButton(
                text: AppLocalizations.of(context).translate('login'),
                press: () async {
                  submit();
                }),
            SizedBox(height: size.height * 0.03), // added
            showAlert(),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                widget.setStatus('register');
              },
            ),
          ],
        ),
      )),
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
