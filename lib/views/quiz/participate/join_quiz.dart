import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/Participate/quiz_list.dart';

class JoinQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Quiz>>.value(
      value: QuizController().database.quizes,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Welcome to your Quiz'),
          backgroundColor: Colors.purple[200],
          elevation: 0.0,
        ),
        body: QuizList(),
      ),
    );
  }
}
