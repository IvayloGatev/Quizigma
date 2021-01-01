import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/quiz_list.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';

class JoinQuiz extends StatelessWidget {
  final String title;
  const JoinQuiz({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StreamProvider<List<Quiz>>.value(
        value: QuizController().database.quizes,
        child: Scaffold(
          backgroundColor: Colors.purple[50],
          appBar: AppBar(
            title: Text('Quizzes'),
            backgroundColor: Colors.deepPurple,
            elevation: 0.0,
          ),
          body: QuizList(title: title),
        ),
      ),
    );
  }
}
