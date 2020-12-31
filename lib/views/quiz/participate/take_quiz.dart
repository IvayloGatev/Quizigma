import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizigma/controllers/quiz_controller.dart';
import 'package:quizigma/models/question.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'questions_tile.dart';
import 'package:quizigma/services/firestore_database.dart';
import 'package:quizigma/models/quiz.dart';
import 'questions_list.dart';

class TakeQuiz extends StatefulWidget {
  @override
  final Quiz quiz;
  TakeQuiz({this.quiz});

  _TakeQuizState createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
            color: Colors.yellow,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.quiz.name}',
                  style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
                ),
                // clock in some stack or overlay so itll always be in a specific spot on screen
                QuestionTimer(
                  quizTime: widget.quiz.timeInSeconds,
                ),
              ],
            )),
        Container(
          //width and height fields manadatory so the questionlist can load into the screen
          //how to do this dynamically?
          width: width,
          height: height,
          color: Colors.green,
          child: QuestionList(
            quiz: widget.quiz,
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          color: Colors.red,
          child: RaisedButton(
            onPressed: () {
              // how to get radio button values and check for final score
            },
            child: Text('Submit'),
            color: Colors.deepPurple,
          ),
        )
      ],
    );
  }
}
