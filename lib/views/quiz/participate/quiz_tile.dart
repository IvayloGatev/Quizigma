import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';

class QuizTile extends StatelessWidget {
  final Quiz quiz;
  final String title;
  QuizTile({this.quiz, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              title: Text(quiz.id + '  ' + quiz.name),
            )));
  }
}
