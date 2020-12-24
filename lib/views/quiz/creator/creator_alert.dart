import 'package:flutter/material.dart';
import 'package:quizigma/views/home/home.dart';

class CreatorAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Quiz Created"),
      content: Text("You have sucessfully created a quiz."),
      actions: [
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ],
    );
  }
}
