import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizigma/views/quiz/participate/question_timer.dart';
import 'package:quizigma/models/quiz.dart';

class StickyHeaderForQuiz extends StatefulWidget {
  final Quiz quiz;
  final int score;
  final List<String> selectionList;
  final List<String> correctList;
  final List<String> questionName;
  StickyHeaderForQuiz(
      {this.quiz,
      this.score,
      this.selectionList,
      this.correctList,
      this.questionName});

  _StickyHeaderForQuizState createState() => _StickyHeaderForQuizState();
}

class _StickyHeaderForQuizState extends State<StickyHeaderForQuiz> {
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.quiz.name}',
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
            ),
            Text(
              '${widget.quiz.category}',
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        // Card(
        //     margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        //     child: ListTile(
        //       title: Text('${widget.quiz.name}'),
        //       subtitle: Text('${widget.quiz.category}'),
        //       tileColor: Colors.white,
        //     )),
        Spacer(),
        QuestionTimer(
          quizTime: widget.quiz.timeInSeconds,
          quiz: widget.quiz,
          score: widget.score,
          selectionList: widget.selectionList,
          correctList: widget.correctList,
          questionName: widget.questionName,
        ),
      ],
    );
  }
}
