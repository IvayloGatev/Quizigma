import 'package:flutter/material.dart';
import 'package:quizigma/views/home/login/body.dart';

class Login extends StatelessWidget {
  final Function setStatus;

  Login({this.setStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(setStatus: setStatus),
    );
  }
}
