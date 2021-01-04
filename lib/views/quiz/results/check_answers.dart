import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/participate/questions_list.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/take_quiz.dart';
import 'package:quizigma/views/quiz/results/load_quiz.dart';

class CheckAnswersPage extends StatelessWidget {
  final Quiz quiz;
  final List<String> selectionString;
  final List<String> correctString;
  final List<String> questionNameString;
  CheckAnswersPage(this.quiz, this.selectionString, this.correctString,
      this.questionNameString);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Answers'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: LoadQuiz(
              quiz: quiz,
              selectedListString: selectionString,
              correctListString: correctString,
              questionNameString: questionNameString),
        ));
  }
}
