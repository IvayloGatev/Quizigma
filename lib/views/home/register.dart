import 'package:flutter/material.dart';
import 'package:quizigma/views/home/register/body.dart';

class Register extends StatelessWidget {
  final Function setStatus;

  Register({this.setStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(setStatus: setStatus),
    );
  }
}
