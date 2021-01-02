import 'package:flutter/material.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/quiz.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/results/check_answers.dart';
import 'package:quizigma/views/home/home.dart';

class Results extends StatelessWidget {
  final Quiz quiz;

  Results({this.quiz});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
        color: Colors.deepPurple, fontSize: 16.0, fontWeight: FontWeight.bold);
    final TextStyle trailingStyle = TextStyle(
        color: Colors.purple, fontSize: 20.0, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
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
                  title: Text("Total Questions", style: titleStyle),
                  trailing: Text(quiz.numofQuestions.toString(),
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text(
                      "correct/ " + quiz.numofQuestions.toString() + " *100 %",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("correct/ " + quiz.numofQuestions.toString(),
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(quiz.numofQuestions.toString() + " - correct",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text("Go to Home"),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Home()));
                    },
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.deepPurple,
                    child: Text("Check Answers"),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CheckAnswersPage()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
