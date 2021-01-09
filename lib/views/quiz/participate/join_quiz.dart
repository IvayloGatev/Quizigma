import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/load_quiz.dart';
import 'package:google_fonts/google_fonts.dart';

/* This file is used to show the screen showing the quiz the
user wishes to take and answer */

class JoinQuiz extends StatelessWidget {
  final String quizId;
  final Quiz quiz;

  const JoinQuiz({this.quizId, this.quiz});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Question>>.value(
      value: QuizController().database.getquestions(quizId),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to your Quiz',
              style: GoogleFonts.cabin(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.deepPurple,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: LoadQuiz(quiz: quiz),
        ),
      ),
    );
  }
}
