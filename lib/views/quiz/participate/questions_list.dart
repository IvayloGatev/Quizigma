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
  final Function(int score) submit;
  QuestionList({this.quiz, this.submit});

  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  String category;
  Question question;
  int score = 0;

  // idea: get an array of the selected answers from radio buttons
  //       compare them to the array of the correct answers  from quiz
  List<int> selectedAnswers = List<int>();
  List<int> correctAnswers = List<int>();

// compare array values, give score if they match
  int calculateScore(List<int> selections, List<int> answers) {
    int score = 0;
    print(answers.toString());
    print(selections.toString());

    for (int i = 0; i < answers.length; i++) {
      if (selections[i] == answers[i]) {
        score++;
      }
    }
    return score;
  }

  Widget build(BuildContext context) {
    // set the length of correct answers, other array is set in "radio_buttons"
    correctAnswers.length = widget.quiz.numofQuestions;

    final questions = Provider.of<List<Question>>(context);
    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: questions.length,
            itemBuilder: (context, index) {
              // fill correct answer array
              correctAnswers[index] = questions[index].correctAnswer;

              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    QuestionTile(question: questions[index]),
                    SizedBox(height: 2),
                    Column(children: [
                      RadioSet(
                        question: questions[index],
                        buttonSelected:
                            (selectedFromRadio, selectedListFromRadio) {
                          setState(() {
                            // get the selected answer array
                            selectedAnswers = selectedListFromRadio;
                          });
                        },
                        numberOfQuestions: questions.length,
                      )
                    ]),
                    SizedBox(height: 10),
                    RaisedButton(
                      onPressed: () {
                        score = calculateScore(selectedAnswers, correctAnswers);

                        print('checkscore $score');
                        // submit score to "take_quiz"
                        widget.submit(score);
                      },
                      child: Text('Submit'),
                      color: Colors.white,
                    ),
                  ]);
            },
          );
  }
}
