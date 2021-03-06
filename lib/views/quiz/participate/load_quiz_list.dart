import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/quiz_list.dart';
import 'package:google_fonts/google_fonts.dart';

/* This file is used to show the screen showing the list of
quizzes for a given category to the user. It is comprised by the body 'QuizList' */

class LoadQuizList extends StatelessWidget {
  final String title;
  const LoadQuizList({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: StreamProvider<List<Quiz>>.value(
        value: QuizController().database.quizes,
        child: Scaffold(
          appBar: AppBar(
            title: Text('$title',
                style: GoogleFonts.cabin(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            backgroundColor: Colors.deepPurple,
            elevation: 0.0,
          ),
          body: QuizList(title: title),
        ),
      ),
    );
  }
}
