import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizigma/views/quiz/participate/join_quiz.dart';

/* This file returns a widget, specifically a button that the user can click
 which will, when clicked bring them to a quiz. The button displays information
 about the quiz it will route the user to. The infomation is as follows:
 1) Name
 2) Quiz ID
 3) Number of questions
 4) Time to complete the quiz in seconds 
 */
class QuizTile extends StatelessWidget {
  final Quiz quiz;
  final String quizId;
  final String title;

  QuizTile({this.quiz, this.title, this.quizId});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 8.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            title: Text(
              '${quiz.name}' + '\n' + 'ID: ${quiz.id}',
              style: GoogleFonts.cabin(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            subtitle: Text(
                'Questions: ${quiz.numofQuestions}' +
                    '\n' +
                    'Time: ${quiz.timeInSeconds} seconds',
                style: GoogleFonts.cabin(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)),
            tileColor: Colors.deepPurple,
          )),
      onPressed: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JoinQuiz(
                      quizId: quiz.id,
                      quiz: quiz,
                    )));
      },
    );
  }
}
