import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/participate/questions_list.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/take_quiz.dart';
import 'package:quizigma/views/quiz/results/load_quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckAnswersPage extends StatelessWidget {
  final Quiz quiz;
  final List<String> selectionString;
  final List<String> correctString;
  final List<String> questionNameString;
  CheckAnswersPage(this.quiz, this.selectionString, this.correctString,
      this.questionNameString);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Answers',
              style: GoogleFonts.cabin(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              // color: Colors.yellow[200],
              child: LoadQuiz(
                  quiz: quiz,
                  selectedListString: selectionString,
                  correctListString: correctString,
                  questionNameString: questionNameString),
            )
          ],
        )));
  }
}
