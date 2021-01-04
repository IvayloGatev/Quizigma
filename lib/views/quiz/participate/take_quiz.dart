import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'package:quizigma/views/quiz/participate/radio_buttons.dart';
import 'package:quizigma/views/quiz/participate/sticky_header.dart';
import 'package:quizigma/views/quiz/results/results.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'questions_list.dart';
import 'sticky_header.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TakeQuiz extends StatefulWidget {
  final Quiz quiz;

  TakeQuiz({this.quiz});

  _TakeQuizState createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  List<Question> questions = new List<Question>();

  getQuestions(String id) async {
    FirestoreDatabase firestoreDatabase = FirestoreDatabase();
    List<Question> val = await firestoreDatabase.getQuestions(id);
    setState(() {
      questions = val;
    });
  }

  int totalScore = 0;

  List<String> selectionString = new List<String>();
  List<String> answersString = new List<String>();
  List<String> questionNameString = new List<String>();

  Widget build(BuildContext context) {
    selectionString.length = widget.quiz.numofQuestions;
    answersString.length = widget.quiz.numofQuestions;
    questionNameString.length = widget.quiz.numofQuestions;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StickyHeader(
        header: Container(
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.only(left: 10),
          child: StickyHeaderForQuiz(
            quiz: widget.quiz,
            score: totalScore,
          ),
        ),
        content: Column(
          children: [
            Container(
              color: Colors.white,
              child: QuestionList(
                quiz: widget.quiz,
                submit: (scoreFromList, selectionsFromListString,
                    answersFromListString, questionNameList) {
                  setState(() {
                    // get the score
                    totalScore = scoreFromList;
                    selectionString = selectionsFromListString;
                    answersString = answersFromListString;
                    questionNameString = questionNameList;
                  });
                },
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  for (int i = 0; i < selectionString.length; i++) {
                    if (selectionString[i] == null) {
                      selectionString[i] = 'No answer selected';
                    }
                  }
                  getQuestions(widget.quiz.id);

                  Future.delayed(const Duration(milliseconds: 300), () {
                    for (int i = 0; i < answersString.length; i++) {
                      if (answersString[i] == null) {
                        answersString[i] =
                            questions[i].answers[questions[i].correctAnswer];
                      }
                    }
                    for (int i = 0; i < questionNameString.length; i++) {
                      if (questionNameString[i] == null) {
                        questionNameString[i] = questions[i].text;
                      }
                    }

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Results(
                                  quiz: widget.quiz,
                                  score: totalScore,
                                  selectionListString: selectionString,
                                  correctListString: answersString,
                                  questionName: questionNameString,
                                )));
                  });

                  // how to get radio button values and check for final score
                  // pass score when timer hits 0?
                },
                child: Text('Submit'),
                color: Colors.yellow,
              ),
            )
          ],
        ));
  }
}
