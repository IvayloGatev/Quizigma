import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/results/check_answers.dart';
import 'package:google_fonts/google_fonts.dart';

/* This file displays the check answers page by calling the 'CheckAnswers' widget
and passing the necessary data.*/

class CheckAnswersPage extends StatelessWidget {
  final Quiz quiz;
  final List<String> selectedAnswersAsStringList;
  final List<String> correctAnswersAsStringList;
  final List<String> questionTextAsStringList;
  CheckAnswersPage(this.quiz, this.selectedAnswersAsStringList,
      this.correctAnswersAsStringList, this.questionTextAsStringList);

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
              // Provide the arrays with data to the check answers widget
              child: CheckAnswers(
                  quiz: quiz,
                  selectedAnswersAsStringList: selectedAnswersAsStringList,
                  correctAnswersAsListString: correctAnswersAsStringList,
                  questionTextAsStringList: questionTextAsStringList),
            )
          ],
        )));
  }
}
