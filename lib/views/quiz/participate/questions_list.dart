//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
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

class QuestionList extends StatefulWidget {
  @override
  final Quiz quiz;

  QuestionList({this.quiz});

  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  String category;
  Question question;

  int score = 0;
  int _radioValueCase2 = -1;
  int _radioValueCase3 = -1;
  int _radioValueCase4 = -1;
  int _radioValueCase5 = -1;
  List<int> correctAnswers = List<int>();
  List<int> answerSelections = List<int>();

  void setSelectedRadioCase2(int value, int correctAnswer) {
    setState(() {
      _radioValueCase2 = value;
      print('grp2val $_radioValueCase2');
      if (_radioValueCase2 == correctAnswer) {
        print('correct');
      } else {
        print('false');
      }
    });
  }

  void setSelectedRadioCase3(int value, int correctAnswer) {
    setState(() {
      _radioValueCase3 = value;

      if (_radioValueCase3 == correctAnswer) {
        print('correct');
      } else {
        print('false');
      }
    });
  }

  void setSelectedRadioCase4(int value, int correctAnswer) {
    setState(() {
      _radioValueCase4 = value;

      if (_radioValueCase4 == correctAnswer) {
        print('correct');
      } else {
        print('false');
      }
    });
  }

  void setSelectedRadioCase5(int value, int correctAnswer) {
    setState(() {
      _radioValueCase5 = value;

      if (_radioValueCase5 == correctAnswer) {
      } else {
        print('false');
      }
    });
  }

  void checkAnswers(List<int> answers, List<int> correctAnswers) {
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == correctAnswers[i]) {
        score++;
      }
    }
  }

  Widget build(BuildContext context) {
    final questions = Provider.of<List<Question>>(context);
    return questions == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    QuestionTile(question: questions[index]),
                    SizedBox(height: 2),
                    Column(children: [
                      RadioSet(questions[index]),
                    ]),
                    SizedBox(height: 10),
                  ]);
            },
          );
  }
}
