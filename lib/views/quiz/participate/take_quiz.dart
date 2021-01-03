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
  int totalScore = 0;

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return StickyHeader(
        header: Container(
          color: Colors.yellow,
          padding: EdgeInsets.only(left: 10),
          child: StickyHeaderForQuiz(
            quiz: widget.quiz,
          ),
        ),
        content: Column(
          children: [
            Container(
              //width and height fields manadatory so the questionlist can load into the screen
              //takes height of quiz with most questions
              //how to do this dynamically?
              width: width,
              height: height,
              color: Colors.white,
              child: QuestionList(
                quiz: widget.quiz,
                submit: (scoreFromList) {
                  setState(() {
                    // get the score
                    totalScore = scoreFromList;
                  });
                },
              ),
            ),
            Text('$totalScore'),
            Container(
              alignment: Alignment.bottomLeft,
              color: Colors.deepPurple,
              child: RaisedButton(
                onPressed: () {
                  // checkAnswers([0, 0, 0, 0], widget.quiz);
                  //      print('pushed button $totalScore');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Results(quiz: widget.quiz, score: totalScore)));
                  // how to get radio button values and check for final score
                  // pass score when timer hits 0?
                },
                child: Text('Submit'),
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
