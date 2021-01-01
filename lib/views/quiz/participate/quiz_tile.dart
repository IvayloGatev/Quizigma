import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';

class QuizTile extends StatelessWidget {
  final Quiz quiz;
  final String quizId;
  final String title;

  QuizTile({this.quiz, this.title, this.quizId});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            title: Text('ID: ${quiz.id}' + ' ' + 'Quiz name: ${quiz.name}'),
            subtitle: Text('number of Questions: ${quiz.numofQuestions}' +
                ' ' +
                'time to complete: ${quiz.timeInSeconds}'),
            tileColor: Colors.white,
          )),
      onPressed: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JoinQuestions(
                      quizId: quiz.id,
                      quiz: quiz,
                    )));
      },
    );
  }
}
