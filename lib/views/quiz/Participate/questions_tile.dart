import 'package:flutter/material.dart';
import 'package:quizigma/models/question.dart';

class QuestionTile extends StatelessWidget {
  final Question question;

  QuestionTile({this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              title: Text(question.id.toString() +
                  ' ' +
                  question.text +
                  '  ' +
                  question.answers.toString()),
            )));
  }
}
