import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quizigma/models/quiz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/views/quiz/participate/quiz_timer.dart';

/* This file implements what is shown in the sticky header:
1) Quiz Name
2) Quiz category
3) Quiz timer
*/

class StickyHeaderBody extends StatefulWidget {
  final Quiz quiz;
  final int score;
  final List<String> selectedAnswersAsStringList;
  final List<String> correctAnswersAsStringList;
  final List<String> questionTextAsStringList;

  StickyHeaderBody(
      {this.quiz,
      this.score,
      this.selectedAnswersAsStringList,
      this.correctAnswersAsStringList,
      this.questionTextAsStringList});

  _StickyHeaderBodyState createState() => _StickyHeaderBodyState();
}

class _StickyHeaderBodyState extends State<StickyHeaderBody> {
  List<String> selectedAnswersAsStringList = new List<String>();
  List<String> correctAnswersAsStringList = new List<String>();
  List<String> questionTextAsStringList = new List<String>();

  Widget build(BuildContext context) {
    selectedAnswersAsStringList.length = widget.quiz.numofQuestions;
    correctAnswersAsStringList.length = widget.quiz.numofQuestions;
    questionTextAsStringList.length = widget.quiz.numofQuestions;

    selectedAnswersAsStringList = widget.selectedAnswersAsStringList;
    correctAnswersAsStringList = widget.correctAnswersAsStringList;
    questionTextAsStringList = widget.questionTextAsStringList;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          // Column for the quiz category & name
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '${widget.quiz.category}' '\n' '${widget.quiz.name}',
                style: GoogleFonts.cabin(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        // Pass data to the quiz timer, so it has data to use when timer runs out
        QuizTimer(
          quizTime: widget.quiz.timeInSeconds,
          quiz: widget.quiz,
          score: widget.score,
          selectedAnswersAsStringList: selectedAnswersAsStringList,
          correctAnswersAsStringList: correctAnswersAsStringList,
          questionTextAsStringList: questionTextAsStringList,
        ),
      ],
    );
  }
}
