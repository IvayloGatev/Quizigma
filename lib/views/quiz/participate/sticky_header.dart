import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class StickyHeaderForQuiz extends StatefulWidget {
  final Quiz quiz;
  final int score;
  final List<String> selectionList;
  final List<String> correctList;
  final List<String> questionName;

  StickyHeaderForQuiz(
      {this.quiz,
      this.score,
      this.selectionList,
      this.correctList,
      this.questionName});

  _StickyHeaderForQuizState createState() => _StickyHeaderForQuizState();
}

class _StickyHeaderForQuizState extends State<StickyHeaderForQuiz> {
  List<String> selectionString = new List<String>();
  List<String> answersString = new List<String>();
  List<String> questionNameString = new List<String>();

  Widget build(BuildContext context) {
    selectionString.length = widget.quiz.numofQuestions;
    answersString.length = widget.quiz.numofQuestions;
    questionNameString.length = widget.quiz.numofQuestions;

    selectionString = widget.selectionList;
    answersString = widget.correctList;
    questionNameString = widget.questionName;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
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

        //Spacer(),
        QuestionTimer(
          quizTime: widget.quiz.timeInSeconds,
          quiz: widget.quiz,
          score: widget.score,
          selectionList: selectionString,
          correctList: answersString,
          questionName: questionNameString,
        ),
      ],
    );
  }
}
