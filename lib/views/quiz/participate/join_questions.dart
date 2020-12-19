import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/Participate/questions_list.dart';

class JoinQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Question>>.value(
      value: QuizController().database.questions,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Welcome to your Quiz'),
          backgroundColor: Colors.purple[200],
          elevation: 0.0,
        ),
        body: QuestionList(),
      ),
    );
  }
}
