import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'dart:math';
import 'radio_buttons.dart';
import 'package:quizigma/views/quiz/results/results.dart';

class QuestionList extends StatefulWidget {
  final Quiz quiz;

  final Function(int score, List<String> selectedString,
      List<String> correctString, List<String> questionName) submit;
  QuestionList({this.quiz, this.submit});

  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  String category;
  Question question;
  int score = 0;

  List<int> selectedAnswers = List<int>();
  List<int> correctAnswers = List<int>();
  List<String> questionName = List<String>();
  List<String> selectedString = List<String>();
  List<String> correctString = List<String>();

// compare array values, give score if they match
  int calculateScore(List<int> selections, List<int> answers) {
    int score = 0;
    // print(answers.toString());
    // print(selections.toString());

    for (int i = 0; i < answers.length; i++) {
      if (selections[i] == answers[i]) {
        score++;
      }
    }
    return score;
  }

  Widget build(BuildContext context) {
    // set the length of arrays
    correctAnswers.length = widget.quiz.numofQuestions;
    selectedAnswers.length = widget.quiz.numofQuestions;
    questionName.length = widget.quiz.numofQuestions;
    selectedString.length = widget.quiz.numofQuestions;
    correctString.length = widget.quiz.numofQuestions;

    // print('questions ${questionName.toString()}');
    // print('selections ${selectedString.toString()}');
    // print('correct ${correctAnswers.toString()}');

    final questions = Provider.of<List<Question>>(context);

    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: questions.length,
            itemBuilder: (context, index) {
              // fill correct answer array

              correctAnswers[index] = questions[index].correctAnswer;
              questionName[index] = questions[index].text;

              correctString[index] =
                  questions[index].answers[questions[index].correctAnswer];

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        )),
                        child: Column(
                          children: [
                            QuestionTile(question: questions[index]),
                            SizedBox(height: 2),
                            Column(children: [
                              RadioSet(
                                question: questions[index],
                                buttonSelected: (selectedListFromRadio,
                                    selectedStringList) {
                                  setState(() {
                                    // get the selected answer array

                                    selectedAnswers = selectedListFromRadio;
                                    selectedString = selectedStringList;
                                    score = calculateScore(
                                        selectedAnswers, correctAnswers);

                                    //  print('checkscore $score');
                                    // submit score to "take_quiz"
                                    widget.submit(score, selectedString,
                                        correctString, questionName);
                                  });
                                },
                                selectedAnswers: selectedAnswers,
                                selectedAnswersString: selectedString,
                              )
                            ]),
                          ],
                        )),
                  ]);
            },
          );
  }
}
