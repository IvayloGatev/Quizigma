import 'package:flutter/material.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/views/quiz/participate/join_questions.dart';
import 'package:quizigma/views/quiz/results/check_answers.dart';
import 'package:quizigma/views/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatelessWidget {
  final Quiz quiz;
  final int score;

  final List<String> selectionListString;
  final List<String> correctListString;
  final List<String> questionName;

  Results(
      {this.quiz,
      this.score,
      this.selectionListString,
      this.correctListString,
      this.questionName});

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
                              selectionListString,
                              correctListString,
                              questionName)));
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
                            builder: (_) => JoinQuestions(
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
