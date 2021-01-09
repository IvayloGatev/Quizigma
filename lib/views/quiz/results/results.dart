import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/join_quiz.dart';
import 'package:quizigma/views/quiz/results/load_check_answers.dart';
import 'package:quizigma/views/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

/* This file is the results page which appears after the user submits their answers
or the quiz timer runs out. This page will display a score to the user, alongside how 
many questions the quiz had and how many they got correct. The score simply reflects the
% of questions the user got correct. This page has 3 buttons, offering the user 3 options:
1) Retake the quiz
2) Check their answers
3) Return pages, 
*/

class Results extends StatelessWidget {
  final Quiz quiz;
  final int score;

  final List<String> selectedAnswersAsStringList;
  final List<String> correctAnswersAsStringList;
  final List<String> questionTextAsStringList;

  Results(
      {this.quiz,
      this.score,
      this.selectedAnswersAsStringList,
      this.correctAnswersAsStringList,
      this.questionTextAsStringList});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Quiz Results',
            style: GoogleFonts.cabin(
                color: Colors.white, fontWeight: FontWeight.w700)),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple[50], Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions",
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                  trailing: Text(quiz.numofQuestions.toString(),
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score",
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                  trailing: Text(
                      ((score / quiz.numofQuestions) * 100).toStringAsFixed(2) +
                          "%",
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers",
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                  trailing: Text(score.toString(),
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 20)),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers",
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                  trailing: Text((quiz.numofQuestions - score).toString(),
                      style: GoogleFonts.cabin(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text("Home",
                        style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Home()));
                    },
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text("Check Answers",
                        style: GoogleFonts.cabin(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CheckAnswersPage(
                              quiz,
                              selectedAnswersAsStringList,
                              correctAnswersAsStringList,
                              questionTextAsStringList)));
                    },
                  ),
                  RaisedButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.deepPurple,
                      child: Text("Retake Quiz",
                          style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => JoinQuiz(
                                  quiz: quiz,
                                  quizId: quiz.id,
                                )));
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
