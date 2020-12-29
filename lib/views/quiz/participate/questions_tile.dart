import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

class QuestionTile extends StatelessWidget {
  final Question question;
  QuestionTile({this.question});

  int selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        title: Text(
          question.id.toString() + '. ' + question.text + '?',
          style: TextStyle(
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    ));
  }
}
